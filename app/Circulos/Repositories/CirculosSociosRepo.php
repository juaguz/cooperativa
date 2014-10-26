<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 19:24
 */

namespace Circulos\Repositories;

use Circulos\Entities\CirculosSocios;

class CirculosSociosRepo extends BaseRepo {


    public function newCirculosSocios($idCirculo,$idSocio){
        $socios = $this->getModel();

        $socios->id_circulo = $idCirculo;

        $socios->id_socio   = $idSocio;

        return $socios;


    }

    public function getCirculoSocio($idCirculo,$IdSocio){
        return $this->model
                            ->where('id_circulo','=',$idCirculo)
                            ->where('id_socio','=',$IdSocio)
                            ->get();

    }

    public function getModel()
    {
        // TODO: Implement getModel() method.
        return new CirculosSocios();

    }
}