<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 19:24
 */

namespace Servicios\Repositories;
use Servicios\Entities\Servicios;

class ServiciosRepo  extends BaseRepo{
    public function getModel()
    {
        return new Servicios();

    }





    public function newServicio(){

        $servicio = $this->getModel();

        $servicio->id_usuario = \Auth::user()->id;

        return $servicio;



    }

} 