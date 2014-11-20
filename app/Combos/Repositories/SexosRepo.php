<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 10/06/14
 * Time: 08:31
 */

namespace Combos\Repositories;
use Combos\Entities\Sexo;

class SexosRepo extends BaseRepo{

    public function getModel()
    {
        return new Sexo();
    }

    public function getComboSexo(){

        return $this->getCombos("descripcion","id");

    }


} 