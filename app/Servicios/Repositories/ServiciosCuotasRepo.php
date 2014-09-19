<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 19:24
 */

namespace Servicios\Repositories;

use Servicios\Entities\ServiciosCuotas;

class ServiciosCuotasRepo extends BaseRepo {

    public function getModel()
    {
        return new ServiciosCuotas();
    }

    public function newCuotas($idServicio){
        $cuotas = $this->getModel();

        $cuotas->id_servicio = $idServicio;

        $cuotas->id_usuario  = \Auth::user()->id;

        return $cuotas;


    }


}