<?php

use Socios\Repositories\SociosRepo;
use Comercios\Repositories\ComerciosRepo;
use Ventas\Repositories\VentasCuotasRepo;
use Ventas\Repositories\VentasRepo;

use Ventas\Managers\VentasCuotasManager;
use Ventas\Managers\VentasManager;
use Ventas\Entities\Ventas;


class VentasController extends \BaseController {

    protected $sociosRepo,$ventasRepo,$ventasCuotasRepo,$comerciosRepo;

    function __construct(SociosRepo $sociosRepo, VentasCuotasRepo $ventasCuotasRepo, VentasRepo $ventasRepo, ComerciosRepo $comerciosRepo)
    {
        // TODO: Implement __construct() method.
        $this->sociosRepo          = $sociosRepo;
        $this->comerciosRepo       = $comerciosRepo;
        $this->ventasCuotasRepo    = $ventasCuotasRepo;
        $this->ventasRepo          = $ventasRepo;
    }


    /**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$ventas = $this->ventasRepo->paginate(10);

        return View::make('ventas.listados',["ventas"=>$ventas]);

	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        $sociosCombo     = $this->sociosRepo->getComboNroLegajo();
        $comerciosCombo  = $this->comerciosRepo->getComboComercio();
        $action          = "Crear";
        $form_data = array('route' => array('ventas.store'), 'method' => 'POST', 'id' => 'prestamoForm');
		return View::make("ventas.create",compact("sociosCombo","comerciosCombo","action","form_data"));
	}

    public function getTabla(){

        $monto      = Input::get("monto",false);
        $interes    = Input::get("interes",false);
        $cantCuotas = Input::get("cantidad_cuotas",false);

        $montoPorCuota = ($monto+($monto*$interes/100))/$cantCuotas;

        return View::make('ventas.tablaCuotas',compact("cantCuotas","montoPorCuota"));


    }

    public function getTablaVenta(){

        $idVenta = Input::get("id_venta");
        $cuotas = $this->ventasCuotasRepo->where("id_venta",$idVenta);
        return View::make('ventas.tablaCuotasVenta',compact("cuotas"));


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
        $ventaRepo     = $this->ventasRepo->newVenta();
        $ventaManager = new VentasManager($ventaRepo,$data);
        $ventaManager->save();
        $id = $ventaRepo->id;

        foreach($dataCuotas as $cuota){
            $cuotaRepo = $this->ventasCuotasRepo->newCuotas($id);
            $cuotasManager = new VentasCuotasManager($cuotaRepo,$cuota);
            $cuotasManager->save();
    }

        return Redirect::route('ventas.edit',$id)->with('mensaje_exito','Venta Creado Correctamente!');

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
        $comerciosCombo  = $this->comerciosRepo->getComboComercio();
        $venta           = $this->ventasRepo->find($id);
        $action          = "Editar";
        $form_data = array('route' =>'ventas.actualizar', 'method' => 'PATCH','id' => 'prestamoForm');
        return View::make("ventas.create",compact("sociosCombo","comerciosCombo","action","form_data","venta"));
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
               $repo = $this->ventasCuotasRepo->find($dato['id']);
               $manager = new VentasCuotasManager($repo,$dato);
               $manager->save();
        }

        return Redirect::back()->with('mensaje_exito','Venta Editado Correctamente!');



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
