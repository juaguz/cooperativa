<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 26/10/14
 * Time: 00:48
 */

namespace Rifas\Repositories;


use Rifas\Entities\RifasCuotas;

class RifasCuotasRepo extends BaseRepo{

    public function getModel()
    {
        return new RifasCuotas();
    }

    public function newRifaCuota($fecha_vencimiento, $idRifaSocio, $importe){

        $rifa = $this->getModel();
        $rifa->fecha_vencimiento = $fecha_vencimiento;
        $rifa->id_rifa_socio = $idRifaSocio;
        $rifa->importe = $importe;
        return $rifa;

    }



}