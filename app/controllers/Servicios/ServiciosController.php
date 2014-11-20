<?php

use Socios\Repositories\SociosRepo;
use Penias\Repositories\PeniasRepo;
use Servicios\Repositories\ServiciosCuotasRepo;
use Servicios\Repositories\ServiciosRepo;

use Servicios\Managers\ServiciosCuotasManager;
use Servicios\Managers\ServiciosManager;
use Servicios\Entities\Servicios;


class ServiciosController extends \BaseController {

    protected $sociosRepo,$serviciosRepo,$serviciosCuotasRepo,$peniasRepo;

    function __construct(SociosRepo $sociosRepo, ServiciosCuotasRepo $serviciosCuotasRepo, ServiciosRepo $serviciosRepo, PeniasRepo $peniasRepo)
    {
        // TODO: Implement __construct() method.
        $this->sociosRepo          = $sociosRepo;
        $this->peniasRepo          = $peniasRepo;
        $this->serviciosCuotasRepo = $serviciosCuotasRepo;
        $this->serviciosRepo       = $serviciosRepo;
    }


    /**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$servicios = $this->serviciosRepo->paginate(10);

        return View::make('servicios.listados',["servicios"=>$servicios]);

	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        $sociosCombo     = $this->sociosRepo->getComboNroLegajo();
        $peniasCombo     = $this->peniasRepo->getComboPenia();
        $action          = "Crear";
        $form_data = array('route' => array('servicios.store'), 'method' => 'POST', 'id' => 'prestamoForm');
		return View::make("servicios.create",compact("sociosCombo","peniasCombo","action","form_data"));
	}

    public function getTabla(){

        $monto      = Input::get("monto",false);
        $interes    = Input::get("interes",false);
        $cantCuotas = Input::get("cantidad_cuotas",false);

        $montoPorCuota = ($monto+($monto*$interes/100))/$cantCuotas;

        return View::make('servicios.tablaCuotas',compact("cantCuotas","montoPorCuota"));


    }

    public function getTablaServicio(){

        $idServicio = Input::get("id_servicio");
        $cuotas = $this->serviciosCuotasRepo->where("id_servicio",$idServicio);
        return View::make('servicios.tablaCuotasServicio',compact("cuotas"));


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
        $servicioRepo     = $this->serviciosRepo->newServicio();
        $servicioManager = new ServiciosManager($servicioRepo,$data);
        $servicioManager->save();
        $id = $servicioRepo->id;

        foreach($dataCuotas as $cuota){
            $cuotaRepo = $this->serviciosCuotasRepo->newCuotas($id);
            $cuotasManager = new ServiciosCuotasManager($cuotaRepo,$cuota);
            $cuotasManager->save();
    }

        return Redirect::route('servicios.edit',$id)->with('mensaje_exito','Servicio Creado Correctamente!');

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
        $sociosCombo     = $this->sociosRepo->getComboNroLegajo();
        $peniasCombo     = $this->peniasRepo->getComboPenia();
        $servicio        = $this->serviciosRepo->find($id);
        $action          = "Editar";
        $form_data = array('route' =>'servicios.actualizar', 'method' => 'PATCH','id' => 'prestamoForm');
        return View::make("servicios.create",compact("sociosCombo","peniasCombo","action","form_data","servicio"));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function actualizar()
	{

        $datos = Input::all();

        foreach($datos['cuota'] as  $dato ){
               $repo = $this->serviciosCuotasRepo->find($dato['id']);
               $manager = new ServiciosCuotasManager($repo,$dato);
               $manager->save();
        }

        return Redirect::back()->with('mensaje_exito','Servicio Editado Correctamente!');



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


}
