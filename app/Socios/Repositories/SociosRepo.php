<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Socios\Repositories;
use Socios\Entities\Socios;

class SociosRepo extends BaseRepo {

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Socios();


    }

    public function newSocio(){

        $socio = new Socios();
        //$socio->id_usuario = \Auth::user()->id;

        $socio->id_usuario = 1;

        return $socio;

    }


} 