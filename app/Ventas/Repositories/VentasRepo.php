<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 19:24
 */

namespace Ventas\Repositories;
use Ventas\Entities\Ventas;

class VentasRepo  extends BaseRepo{
    public function getModel()
    {
        return new Ventas();

    }





    public function newVenta(){

        $venta = $this->getModel();

        $venta->id_usuario = \Auth::user()->id;

        return $venta;



    }

} 