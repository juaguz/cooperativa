<?php

use Cocheria\Repositories\FacturasRepo;
use Cocheria\Managers\FacturasManager;
use Socios\Repositories\SociosRepo;
use Familiares\Repositories\FamiliaresRepo;

class FacturasController extends \BaseController {

    protected $facturasRepo,$sociosRepo,$familiaresRepo;

    public function __construct(FacturasRepo $facturasRepo,SociosRepo $sociosRepo,FamiliaresRepo $familiaresRepo){

        $this->facturasRepo = $facturasRepo;
        $this->sociosRepo   = $sociosRepo;
        $this->familiaresRepo = $familiaresRepo;
    }
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
        $facturas = $this->facturasRepo->paginate(15);
        return View::make("cocheria.facturas.listado",compact("facturas"));


	}

    public function exportarExcel(){

        $facturas= $this->facturasRepo->all();



        Excel::create('Filename', function($excel) use($facturas) {

            $excel->sheet('Sheetname', function($sheet) use($facturas) {

                $sheet->loadView('cocheria.facturas.listado_excel',compact("facturas"));




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

        $sociosCocheria = $this->sociosRepo->tieneCocheria();
        $form_data       = array('route' => array('cocheria.facturas.store'), 'method' => 'POST','id'=>'form_factura','novalidate'=>'novalidate');
        $action          = 'Cargar';
        return View::make("cocheria.create",compact("form_data","action","sociosCocheria"));


	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$data = Input::all();
        $factura = $this->facturasRepo->newFactura();
        $facturaManager = new FacturasManager($factura,$data);
        $facturaManager->save();
        return Redirect::route('cocheria.facturas.edit',$factura->id)->with('mensaje_exito',"Factura Creada Correctamente.");
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
        $sociosCocheria  = $this->sociosRepo->tieneCocheria();
        $factura        = $this->facturasRepo->find($id);
        $familiaresCombo = $this->familiaresRepo->getFamiliaresSocio($factura->id_socio)->lists("full_name","id");
        $form_data       = array('route' => array('cocheria.facturas.update',$id), 'method' => 'PATCH','id'=>'form_factura','novalidate'=>'novalidate');
        $action          = 'Cargar';
        return View::make("cocheria.create",compact("form_data","action","sociosCocheria","factura","familiaresCombo"));
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
        $factura = $this->facturasRepo->find($id);
        $facturaManager = new FacturasManager($factura,$data);
        $facturaManager->save();
        return Redirect::route('cocheria.facturas.edit',$factura->id)->with('mensaje_exito',"Factura Editada Correctamente.");
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
