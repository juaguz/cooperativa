<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 14/10/14
 * Time: 16:59
 */

namespace Circulos\Repositories;
use Circulos\Entities\CirculosCuotas;

class CirculosCuotasRepo extends BaseRepo{

    public function getModel()
    {
        return new CirculosCuotas();
    }

    public function newCirculosCuotas($idCirculoSocio,$fechaVencimiento){
        $cuotas = $this->getModel();
        $cuotas->id_circulo_socio = $idCirculoSocio;
        $cuotas->fecha_vencimiento = $fechaVencimiento;
        return $cuotas;
    }
}