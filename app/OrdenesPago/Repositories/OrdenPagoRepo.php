<?php namespace OrdenesPago\Repositories;
use OrdenesPago\Entities\OrdenPagoEntity;
use Rifas\Repositories\BaseRepo;

/**
 * Created by PhpStorm.
 * User: juan
 * Date: 18/10/14
 * Time: 16:58
 */

class OrdenPagoRepo extends BaseRepo {

    public function getModel()
    {
        return new OrdenPagoEntity();
    }

    public function newOrdenPago($idOrden,$idTipo){
        $orden = $this->getModel();
        $orden->id_orden_pago = $idOrden;
        $orden->id_tipo_comprobante = $idTipo;
        return $orden;
    }
}