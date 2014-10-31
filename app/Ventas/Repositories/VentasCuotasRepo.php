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

    public function newCuotas($idVenta,$nro_cuota){
        $cuotas = $this->getModel();

        $cuotas->id_venta = $idVenta;

        $cuotas->nro_cuota = $nro_cuota;

        $cuotas->id_usuario  = \Auth::user()->id;

        return $cuotas;


    }


}