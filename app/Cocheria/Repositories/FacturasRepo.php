<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Cocheria\Repositories;

use Cocheria\Entities\Facturas;


class FacturasRepo extends BaseRepo
{

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Facturas();


    }

    public function newFactura()
    {

        $factura = new Facturas();
        $factura->id_usuario = \Auth::user()->id;
        return $factura;

    }


} 