<?php namespace OrdenesPago\ServiceProvider;
use OrdenesPago\Managers\OrdenesPagosManager;
use OrdenesPago\Repositories\OrdenPagoRepo;

/**
 * Created by PhpStorm.
 * User: juan
 * Date: 18/10/14
 * Time: 17:05
 */

class OrdenPago {
    /**
     * @var OrdenPagoRepo
     */
    private $ordenPagoRepo;

    function __construct(OrdenPagoRepo $ordenPagoRepo)
    {
        $this->ordenPagoRepo = $ordenPagoRepo;
    }


    public function save($idOrden,$idTipo,$monto,$concepto,$fecha){

        $ordenPago = $this->ordenPagoRepo->newOrdenPago($idOrden,$idTipo);
        $ordenPago->importe = $monto;
        $ordenPago->concepto = $concepto;
        $ordenPago->fecha = $fecha;
        $ordenPagoManager = new OrdenesPagosManager($ordenPago,[]);
        $ordenPagoManager->save();
        return $ordenPago;

    }




    public function render($data){

        return \View::make('comprobante',$data);
    }



}