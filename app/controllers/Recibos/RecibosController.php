<?php


use Recibos\Managers\RecibosManager;
use Recibos\Repositories\RecibosRepo;

class RecibosController extends \BaseController {

    protected $recibosRepo;

    public function __construct(RecibosRepo $recibosRepo){

        $this->recibosRepo = $recibosRepo;

    }
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
        //$recibos = $this->recibosRepo->paginate(15);
        $busqueda = Input::except('page');

        $recibos   = $this->recibosRepo->buscar($busqueda)->paginate(15);
        return View::make("recibos.listado",compact("recibos","busqueda"));


	}

    public function exportarExcel(){

        $recibos= $this->recibosRepo->all();



        Excel::create('Filename', function($excel) use($recibos) {

            $excel->sheet('Sheetname', function($sheet) use($recibos) {

                $sheet->loadView('recibos.listado_excel',compact("recibos"));




            });

        })->export('xls');

    }


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{

        $form_data       = array('route' => array('recibos.store'), 'method' => 'POST','id'=>'form_factura','novalidate'=>'novalidate');
        $action          = 'Cargar';
        return View::make("recibos.create",compact("form_data","action"));


	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$data = Input::all();
        $recibo = $this->recibosRepo->newRecibo();
        $reciboManager = new RecibosManager($recibo,$data);
        $reciboManager->save();
        return Redirect::route('recibos.edit',$recibo->id)->with('mensaje_exito',"Recibo Creado Correctamente.");
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

    $recibo        = $this->recibosRepo->find($id);
    $form_data       = array('route' => array('recibos.update',$id), 'method' => 'PATCH','id'=>'form_factura','novalidate'=>'novalidate');
    $action          = 'Cargar';
    return View::make("recibos.create",compact("form_data","action","recibo"));
}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
        $data = Input::all();
        $recibo = $this->recibosRepo->find($id);
        $reciboManager = new RecibosManager($recibo,$data);
        $reciboManager->save();
        return Redirect::route('recibos.edit',$recibo->id)->with('mensaje_exito',"Recibo Editado Correctamente.");
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
