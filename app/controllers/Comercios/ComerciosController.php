<?php

use Comercios\Repositories\ComerciosRepo;
use Comercios\Managers\ComerciosManager;


class ComerciosController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */

    protected $comerciosRepo;

    public function __construct(ComerciosRepo $comerciosRepo){

        $this->comerciosRepo  = $comerciosRepo;

    }


	public function index()
	{
		//
        $busqueda = Input::except('page');

        $comercios   = $this->comerciosRepo->buscar($busqueda);

        return View::make('comercios.listados',compact("comercios","busqueda"));
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//

        $form_data       = array('route' => 'comercios.store', 'method' => 'POST');
        $action          = 'Nuevo';

        return View::make("comercios.create",compact("form_data","action"));


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
        $comercio = $this->comerciosRepo->newComercio();
        $comercioManager = new ComerciosManager($comercio,$data);
        if($comercioManager->save()){
            return Redirect::route('comercios.edit',$comercio->id)->with('mensaje_exito',"Comercio Creado Correctamente.");

        }

        return Redirect::back()->withErrors($comercioManager->getErrors())->withInput();


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
        $form_data       = array('route' => ['comercios.update',$id], 'method' => 'PATCH');
        $action          = 'Modificar';
        $comercio        = $this->comerciosRepo->find($id);
        return View::make("comercios.create",compact("form_data","action","comercio"));

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
        $comercio = $this->comerciosRepo->find($id);
        $comercioManager = new ComerciosManager($comercio,$data);
        if($comercioManager->save()){
            return Redirect::route('comercios.edit',$comercio->id)->with('mensaje_exito',"Comercio Actualizado Correctamente.");

        }

        return Redirect::back()->withErrors($comercioManager->getErrors())->withInput();



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

        $comercios  = $this->comerciosRepo->all();



        Excel::create('Comercios', function($excel) use($comercios) {

            $excel->sheet('Sheetname', function($sheet) use($comercios) {

                $sheet->loadView('comercios.listado_excel',compact("comercios"));




            });

        })->export('xls');

    }


}
