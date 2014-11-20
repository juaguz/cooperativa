<?php
use OrdenesPago\Managers\OrdenesPagosManager;
use OrdenesPago\Repositories\OrdenPagoRepo;

/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 26/10/14
 * Time: 22:22
 */


class OrdenesPagosController extends BaseController{


    /**
     * @var OrdenesPago\Repositories\OrdenPagoRepo
     */
    private $ordenPagoRepo;

    function __construct(OrdenPagoRepo $ordenPagoRepo)
    {
        $this->ordenPagoRepo = $ordenPagoRepo;
    }


    public function index(){

        $ordenes = $this->ordenPagoRepo->getOrder(30);

        return View::make('ordenes_pagos.index',compact("ordenes"));


    }




    public function create(){

        $form_data = array('route' => 'ordenes.pagos.store', 'method' => 'POST');
        return View::make('ordenes_pagos.create',compact("form_data"));

    }


    public function store(){
        $data = Input::all();
        $ordenPago = $this->ordenPagoRepo->newOrdenPago();
        $ordenPagoManager = new OrdenesPagosManager($ordenPago,$data);
        if($ordenPagoManager->save()){

            return Redirect::route('ordenes.pagos.edit',$ordenPago->id)->with('mensaje_exito',"Orden Pago Creada Correctamente.");

        }

        return Redirect::back()->withErrors($ordenPagoManager->getErrors())->withInput();
    }

    public function edit($id){

        $form_data = array('route' => 'ordenes.pagos.update', 'method' => 'PUT');
        $orden_pago  = $this->ordenPagoRepo->find($id);
        return View::make('ordenes_pagos.create',compact("form_data","orden_pago"));

    }


    public function update($id){

        $data = Input::all();
        $ordenPago = $this->ordenPagoRepo->find($id);
        $ordenPagoManager = new OrdenesPagosManager($ordenPago,$data);
        if($ordenPagoManager->save()){
            return Redirect::route('ordenes.pagos.edit',$id)->with('mensaje_exito',"Orden Pago Editada Correctamente.");

        }
        return Redirect::back()->withErrors($ordenPagoManager->getErrors())->withInput();

    }


    public function generarComprobante($id){

        $ordenPago = $this->ordenPagoRepo->find($id);
        $data = [
            "tipo_comprobante"=>"Orden de Pago",
            "idComprobante"=>$ordenPago->id,
            "fecha"=>$ordenPago->created_at,
            "contenido"=>View::make('ordenes_pagos.orden_pago',compact("ordenPago"))->render()
        ];
        return OrdenesPago::render($data);


    }

}