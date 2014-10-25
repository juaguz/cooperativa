<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 10/06/14
 * Time: 08:31
 */

namespace Combos\Repositories;
use Combos\Entities\ComboLocalidad;

class LocalidadRepo extends BaseRepo{

    public function getModel()
    {
        return new ComboLocalidad();
    }

    public function getLocalidad($idPartido){

        return $this->getById("id_departamento",$idPartido);

    }


} 