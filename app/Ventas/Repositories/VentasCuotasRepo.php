<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 19:24
 */

namespace Ventas\Repositories;

use Ventas\Entities\VentasCuotas;

class VentasCuotasRepo extends BaseRepo {

    public function getModel()
    {
        return new VentasCuotas();
    }

    public function newCuotas($idVenta){
        $cuotas = $this->getModel();

        $cuotas->id_venta = $idVenta;

        $cuotas->id_usuario  = \Auth::user()->id;

        return $cuotas;


    }


}