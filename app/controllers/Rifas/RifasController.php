<?php

use Rifas\Repositories\RifasRepo;
use Rifas\Managers\RifasManager;

class RifasController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
    protected $rifasRepo;


    public function __construct(RifasRepo $rifasRepo){

        $this->rifasRepo  = $rifasRepo;

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

    public function vender($id){
        $rifa = $this->rifasRepo->find($id);
        return View::make('rifas.venta',compact("rifa"));
    }


}
