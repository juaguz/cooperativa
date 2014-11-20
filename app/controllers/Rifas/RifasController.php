<?php

use Rifas\Managers\RifasCuotasManager;
use Rifas\Managers\RifasNumerosManager;
use Rifas\Managers\RifasSociosManager;
use Rifas\Repositories\RifasCuotasRepo;
use Rifas\Repositories\RifasNumerosRepo;
use Rifas\Repositories\RifasRepo;
use Rifas\Managers\RifasManager;
use Rifas\Repositories\RifasSociosRepo;
use Socios\Repositories\SociosRepo;

class RifasController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
    protected $rifasRepo;
    /**
     * @var SociosRepo
     */
    private $sociosRepo;
    /**
     * @var RifasSociosRepo
     */
    private $rifasSociosRepo;
    /**
     * @var RifasNumerosRepo
     */
    private $numerosRepo;
    /**
     * @var RifasCuotasRepo
     */
    private $rifasCuotasRepo;


    public function __construct(RifasRepo $rifasRepo,SociosRepo $sociosRepo, RifasSociosRepo $rifasSociosRepo, RifasNumerosRepo $numerosRepo, RifasCuotasRepo $rifasCuotasRepo){

        $this->rifasRepo  = $rifasRepo;

        $this->sociosRepo = $sociosRepo;
        $this->rifasSociosRepo = $rifasSociosRepo;
        $this->numerosRepo = $numerosRepo;
        $this->rifasCuotasRepo = $rifasCuotasRepo;
    }


	public function index()
	{
		//

        $busqueda = Input::except('page');

        $rifas   = $this->rifasRepo->buscar($busqueda);

        return View::make('rifas.listados',compact("rifas","busqueda"));

	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//

        $form_data       = array('route' => 'rifas.store', 'method' => 'POST');
        $action          = 'Nueva';

        return View::make("rifas.create",compact("form_data","action"));

	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//

        $data  = Input::all();
        $rifa = $this->rifasRepo->newRifa();
        $rifaManager = new RifasManager($rifa,$data);
        if($rifaManager->save()){
            return Redirect::route('rifas.edit',$rifa->id)->with('mensaje_exito',"Rifa creada Correctamente.");

        }

        return Redirect::back()->withErrors($rifaManager->getErrors())->withInput();

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
        $form_data       = array('route' => ['rifas.update',$id], 'method' => 'PATCH');
        $action          = 'Modificar';
        $rifa            = $this->rifasRepo->find($id);
        return View::make("rifas.create",compact("form_data","action","rifa"));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
        $data  = Input::all();
        $rifa  = $this->rifasRepo->find($id);
        $rifaManager = new RifasManager($rifa,$data);
        if($rifaManager->save()){
            return Redirect::route('rifas.edit',$rifa->id)->with('mensaje_exito',"Rifa actualizada Correctamente.");

        }

        return Redirect::back()->withErrors($rifaManager->getErrors())->withInput();

	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

    public function exportarExcel(){

        $rifas  = $this->rifasRepo->all();
        Excel::create('Rifas', function($excel) use($rifas) {
            $excel->sheet('Sheetname', function($sheet) use($rifas) {
                $sheet->loadView('rifas.listado_excel',compact("rifas"));

            });

        })->export('xls');

    }


    public function saveVender($id){
        $data = Input::all();

        DB::transaction(function() use($data,$id){
            $rifasSocio = $this->rifasSociosRepo->newRifa($id);
            $rifasSocioManager = new RifasSociosManager($rifasSocio,$data);
            $rifasSocioManager->save();
            $idRifaSocio = $rifasSocio->id;
            $this->saveNumeros($data, $idRifaSocio);
            $this->saveCuotas($id,$data['id_socio'],$idRifaSocio);
        });

        return Redirect::back()->with('mensaje_exito','Rifas Vendidas Correctamente');

    }


    public function vender($idRifa){
        $rifa = $this->rifasRepo->find($idRifa);
        $socios = $this->sociosRepo->getComboNroLegajo();
        $rifasNumeros = $this->numerosRepo->getNumerosRifa($idRifa);
        $rangoRifas = $this->rangos($rifa, $rifasNumeros);
        $rifasSocios =$this->rifasSociosRepo->getRifas($idRifa);
        return View::make('rifas.venta',compact("rifa","socios","rangoRifas","idRifa","rifasSocios"));
    }

    /**
     * @param $data
     * @param $idRifaSocio
     */
    private function saveNumeros($data, $idRifaSocio)
    {
        foreach ($data['numero'] as $numero) {
            $rifasNumero = $this->numerosRepo->newRifasNumeros($idRifaSocio, $numero);
            $rifasNumeroManager = new RifasNumerosManager($rifasNumero,[]);
            $rifasNumeroManager->save();

        }
    }

    /**
     * @param $rifa
     * @param $rifasNumeros
     * @return array
     */
    private function rangos($rifa, $rifasNumeros)
    {
        $rango = range($rifa->desde, $rifa->hasta);

        $rangoRifas = array_combine($rango, $rango);
        foreach ($rifasNumeros as $key => $value) {
            unset($rangoRifas[$value->numero]);
        }
        return $rangoRifas;
    }

    private function saveCuotas($idRifa,$idSocio,$idRifaSocio)
    {
        $datosRifas = $this->rifasRepo->find($idRifa);
        $datoSocio  = $this->sociosRepo->find($idSocio);
        $fecha =  Carbon::now();
        for ($i = 1; $i <= $datosRifas->cuotas; $i++) {
                $importe = $datosRifas->precio;
                $fecha->addMonth();
                $fechaFormat = $fecha->format('m/Y');
                if($datoSocio->id_tipo_socio == 2){
                    $importe = $importe/2;
                    $this->saveRifaCuotaSocio($idRifaSocio, $fechaFormat, $importe,"15");
                }
                $this->saveRifaCuotaSocio($idRifaSocio, $fechaFormat, $importe,"20");

        }



    }
    /**
     * @param $idRifaSocio
     * @param $fechaFormat
     * @param $importe
     * @param $dia
     * @internal param $datosRifas
     */
    private function saveRifaCuotaSocio($idRifaSocio, $fechaFormat, $importe,$dia)
    {
        $fecha_vencimiento = "$dia/$fechaFormat";
        $rifaRepo = $this->rifasCuotasRepo->newRifaCuota($fecha_vencimiento, $idRifaSocio, $importe);
        $rifasManager = new RifasCuotasManager($rifaRepo, []);
        $rifasManager->save();
    }

    public function getRifasCuotasTable(){
        $idRifaSocio = Input::get("id_rifa_socio",false);
        if($idRifaSocio){
            $cuotas = $this->rifasCuotasRepo->where("id_rifa_socio",$idRifaSocio);
            return View::make('rifas.tabla_cuotas',compact("cuotas"));
        }

    }


    public function updateRifasCuotasSocio(){

        $cuotas = Input::get('cuota',false);
        if($cuotas){
            foreach ($cuotas as $key => $cuota) {
                $id = $cuota['id'];
                $cuotaRepo = $this->rifasCuotasRepo->find($id);
                $cuotaManager = new RifasCuotasManager($cuotaRepo,$cuota);
                $cuotaManager->save();
            }

            return ["success"=>true,"mensaje"=>"Cuotas Editadas"];
        }


    }

}
