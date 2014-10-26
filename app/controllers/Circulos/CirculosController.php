<?php

use Carbon\Carbon;
use Circulos\Managers\CirculosCuotasManager;
use Circulos\Managers\CirculosSociosManagers;
use Circulos\Repositories\CirculosCuotasRepo;
use Circulos\Repositories\CirculosRepo;
use Circulos\Repositories\CirculosSociosRepo;
use Circulos\Managers\CirculosManager;
use Socios\Repositories\SociosRepo;
use Socios\Managers\SociosManager;


class CirculosController extends \BaseController {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    protected $circulosRepo;
    protected $circulosSociosRepo;
    protected $sociosRepo;
    /**
     * @var CirculosCuotasRepo
     */
    private $circulosCuotasRepo;
    private $fechaDesde;


    public function __construct(CirculosRepo $circulosRepo, CirculosSociosRepo $circulosSociosRepo,SociosRepo $sociosRepo, CirculosCuotasRepo $circulosCuotasRepo){

        $this->circulosRepo       = $circulosRepo;
        $this->circulosSociosRepo = $circulosSociosRepo;
        $this->sociosRepo         = $sociosRepo;

        $this->circulosCuotasRepo = $circulosCuotasRepo;
    }

    /**
     * @param $fechaDesde
     * @param $fechaHasta
     * @return mixed
     */
    function diffFechas($fechaDesde, $fechaHasta)
    {
        $this->fechaDesde = $fechaDesde;
        $fechaDesde = $this->createFecha($fechaDesde);
        $fechaHasta = $this->createFecha($fechaHasta);
        $response = [
            "cantidadMeses" => $fechaDesde->diffInMonths($fechaHasta),
            "mes" => $fechaDesde->format('m')
        ];

        return $response;
    }


    public function index()
    {
        //

        $busqueda = Input::except('page');

        $circulos   = $this->circulosRepo->buscar($busqueda);

        return View::make('circulos.listados',compact("circulos","busqueda"));

    }


    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //

        $form_data       = array('route' => 'circulos.store', 'method' => 'POST','id'=>'circuloFrm');
        $action          = 'Nuevo';
        $socios          = $this->sociosRepo->getComboNroLegajo();

        return View::make("circulos.create",compact("form_data","action","socios"));

    }


    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store()
    {
        //

        $respuestas  = [];
        $data      = Input::all();
        $circulo = $this->circulosRepo->newCirculo();
        $circuloManager = new CirculosManager($circulo,$data);
        if($circuloManager->save()){
            $idCirculo = $this->saveSocios($data, $circulo);
            $respuestas  = [
                "success"=>true,
                "ruta"=>route('circulos.edit',$idCirculo),

            ];
            return Response::json($respuestas);
        }

        $respuestas  = ["response"=>false,"errores"=>$circuloManager->getErrors()];
        return Response::json($respuestas);


    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
        $form_data       = array('route' => ['circulos.update',$id], 'method' => 'PATCH','id'=>'circuloFrm');
        $action          = 'Modificar';
        $circulo         = $this->circulosRepo->find($id);
        $sociosCirculo   = $circulo->circulosSocios()->with('socios')->get();

        $socios          = $this->sociosRepo->getComboNroLegajoInNotCircle($circulo->circulosSocios()->get(['id_socio'])->toArray());

        return View::make("circulos.create",compact("form_data","action","circulo","socios","sociosCirculo"));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update($id)
    {
        $data  = Input::all();
        $circulo  = $this->circulosRepo->find($id);
        $circuloManager = new CirculosManager($circulo,$data);
        if($circuloManager->save()){
            $this->saveSocios($data,$circulo);
            return  ["success"=>true];
        }
        return ["success"=>false,"errores"=>$circuloManager->getErrors()];
    }

    public function getTablaCirculo(){

        $idCirculo = Input::get("id_circulo");
        $socios = $this->circulosSociosRepo->where("id_circulo",$idCirculo);
        return View::make('circulos.tablaSociosCirculo',compact("socios"));


    }

    public function getTabla(){

        $cantSocios = Input::get("cantidad_socios",false);
        $socios     = $this->sociosRepo->getComboNroLegajo();
        return View::make('circulos.tablaSocios',compact("cantSocios","socios"));


    }


    /**
     * Remove the specified resource from storage.
     *
     * @return Response
     */
    public function desHabilitar()
    {
        $idSocio = Input::get('id_socio',false);
        $idCirculo = Input::get('id_circulo',false);
        if($idSocio && $idCirculo){
            $circulosSocios = $this->circulosSociosRepo->getCirculoSocio($idCirculo,$idSocio);
            $circulosSocios->dado_baja = 1;
            $circuloManager = new CirculosSociosManagers($circulosSocios,[]);
            if($circuloManager->save()){
                return true;
            }

        }

    }

    public function exportarExcel(){

        $circulos  = $this->circulosRepo->all();

        Excel::create('Circulos', function($excel) use($circulos) {
            $excel->sheet('Sheetname', function($sheet) use($circulos) {
                $sheet->loadView('circulos.listado_excel',compact("circulos"));
            });
        })->export('xls');

    }

    /**
     * @param $fechaDesde
     * @return static
     */
    public function createFecha($fechaDesde)
    {
        return Time::CreateDate($fechaDesde);
    }

    /**
     * @param $cantidadCuotas
     * @param $idCirculoSoc
     */
    public function cuotasCirculos($cantidadCuotas, $idCirculoSoc)
    {
        $fechaDesde = $this->createFecha($this->fechaDesde);
        for ($i = 1; $i <= $cantidadCuotas['cantidadMeses']; $i++) {
            $mes = $fechaDesde->addMonth();
            $vencimiento = $mes->lastOfMonth();
            $repo = $this->circulosCuotasRepo->newCirculosCuotas($idCirculoSoc, $vencimiento);
            $manager = new CirculosCuotasManager($repo, []);
            $manager->save();
        }
    }

    /**
     * @param $idsSocios
     * @param $idCirculo
     * @param $cantidadCuotas
     */
    public function circuloSocios($idsSocios, $idCirculo, $cantidadCuotas)
    {
        foreach ($idsSocios as $idSocio) {
            $socioCirculo = $this->circulosSociosRepo->newCirculosSocios($idCirculo, $idSocio);
            $socioManager = new CirculosSociosManagers($socioCirculo, []);
            $socioManager->save();
            $idCirculoSoc = $socioCirculo->id;
            $this->cuotasCirculos($cantidadCuotas, $idCirculoSoc);
        }
    }

    /**
     * @param $data
     * @param $circulo
     * @return mixed
     */
    private function saveSocios($data, $circulo)
    {
        $idsSocios = explode(',', $data['socios']);
        $cantidadCuotas = $this->diffFechas($data['fecha_inicio'], $data['fecha_fin']);
        $idCirculo = $circulo->id;
        $this->circuloSocios($idsSocios, $idCirculo, $cantidadCuotas);
        return $idCirculo;
    }


}
