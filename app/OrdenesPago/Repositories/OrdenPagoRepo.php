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

    public function newOrdenPago($idOrden=0,$idTipo=0){
        $orden = $this->getModel();
        $orden->id_orden_pago = $idOrden;
        $orden->id_tipo_comprobante = $idTipo;
        $orden->id_usuario = \Auth::user()->id;
        return $orden;
    }

    public function getOrder($paginate){

        return $this->model->orderBy('id','desc')->paginate($paginate);
    }

    public function buscar($busqueda)
    {
        $orden = $this->model;
        //por q campo queres filtrar? por el id
        $orden = (isset($busqueda['id'])) ? $orden->where('id','=',$busqueda['id']):$orden;

        return $orden;


    }
}