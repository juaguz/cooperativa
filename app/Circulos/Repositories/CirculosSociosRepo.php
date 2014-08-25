<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 19:24
 */

namespace Circulos\Repositories;

use Circulos\Entities\Circulos;

class CirculosSociosRepo extends BaseRepo {


    public function newSocios($idCirculo){
        $socios = $this->getModel();

        $socios->id_circulo = $idCirculo;

        $socios->id_usuario  = \Auth::user()->id;

        return $socios;


    }


    public function getModel()
    {
        // TODO: Implement getModel() method.
        return new Circulos();

    }
}