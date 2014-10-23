<?php

use Socios\Repositories\SociosRepo;
use Prestamos\Repositories\PrestamosCuotasRepo;
use Prestamos\Repositories\PrestamosRepo;

use Prestamos\Managers\PrestamosCuotasManager;
use Prestamos\Managers\PrestamosManager;
use Prestamos\Entities\Prestamos;


class PrestamosController extends \BaseController {

    protected $sociosRepo,$prestamosRepo,$prestamosCuotasRepo;

    function __construct(SociosRepo $sociosRepo, PrestamosCuotasRepo $prestamosCuotasRepo, PrestamosRepo $prestamosRepo)
    {
        // TODO: Implement __construct() method.
        $this->sociosRepo          = $sociosRepo;
        $this->prestamosCuotasRepo = $prestamosCuotasRepo;
        $this->prestamosRepo       = $prestamosRepo;
    }


    /**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$prestamos = $this->prestamosRepo->paginate(10);

        return View::make('prestamos.listados',["prestamos"=>$prestamos]);

	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        $sociosCombo  = $this->sociosRepo->getComboNroLegajo();
        $action       = "Crear";
        $form_data = array('route' => array('prestamos.store'), 'method' => 'POST', 'id' => 'prestamoForm');
		return View::make("prestamos.create",compact("sociosCombo","action","form_data"));
	}

    public function getTabla(){

        $monto      = Input::get("monto",false);
        $interes    = Input::get("interes",false);
        $cantCuotas = Input::get("cantidad_cuotas",false);

        $montoPorCuota = ($monto+($monto*$interes/100))/$cantCuotas;

        return View::make('prestamos.tablaCuotas',compact("cantCuotas","montoPorCuota"));


    }

    public function getTablaPrestamo(){

        $idPrestamo = Input::get("id_prestamo");
        $cuotas = $this->prestamosCuotasRepo->where("id_prestamo",$idPrestamo);
        return View::make('prestamos.tablaCuotasPrestamo',compact("cuotas"));


    }


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
        $data = Input::all();
        $dataCuotas = $data['cuota'];
        $prestamoRepo     = $this->prestamosRepo->newPrestamo();
        $prestamoManager = new PrestamosManager($prestamoRepo,$data);
        $prestamoManager->save();

        $id = $prestamoRepo->id;

        $this->saveCuotas($dataCuotas, $id);

        OrdenesPago::save($id,1);

        return Redirect::route('prestamos.edit',$id)->with('mensaje_exito','Prestamo Creado Correctamente!');

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
        $sociosCombo  = $this->sociosRepo->getComboNroLegajo();
        $prestamo     = $this->prestamosRepo->find($id);
        $action       = "Editar";
        $form_data = array('route' =>'prestamos.actualizar', 'method' => 'PATCH','id' => 'prestamoForm');
        return View::make("prestamos.create",compact("sociosCombo","action","form_data","prestamo"));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @return Response
	 */
	public function actualizar()
	{

        $datos = Input::all();

        foreach($datos['cuota'] as  $dato ){
               $repo = $this->prestamosCuotasRepo->find($dato['id']);
               $manager = new PrestamosCuotasManager($repo,$dato);
               $manager->save();
        }

        return Redirect::back()->with('mensaje_exito','Prestamo Editado Correctamente!');



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

    public function getOrdenPago(){
        $idPrestamo = Input::get('id_prestamo');
        $prestamo = $this->prestamosRepo->getPrestamo($idPrestamo);
        $prestamo = $prestamo[0];
        //dd($prestamo['orden_pago']->id);
        $socio       = $prestamo->socio->nombre." ".$prestamo->socio->apellido;
        $socioLegajo = $prestamo->socio->nro_legajo;
        $monto       = $prestamo->monto;
        $cuotas      = $prestamo->cantidad_cuotas;
        $importe     = $prestamo->importe;

        $data = [   "tipo_comprobante"=>'Prestamo',
                    "idComprobante"=>$prestamo['orden_pago']->id,
                    "fecha"=>$prestamo->created_at,
                    "contenido"=>View::make('prestamos.orden_pago',
                        compact("socio","socioLegajo","monto","cuotas","importe")

                    )->render()
        ];
        return OrdenesPago::render($data);

    }

    /**
     * @param $dataCuotas
     * @param $id
     */
    private function saveCuotas($dataCuotas, $id)
    {
        foreach ($dataCuotas as $cuota) {
            $cuotaRepo = $this->prestamosCuotasRepo->newCuotas($id);
            $cuotasManager = new PrestamosCuotasManager($cuotaRepo, $cuota);
            $cuotasManager->save();
        }
    }

}
