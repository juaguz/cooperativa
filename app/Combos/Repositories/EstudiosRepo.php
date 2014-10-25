<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 10/06/14
 * Time: 08:31
 */

namespace Combos\Repositories;
use Combos\Entities\Estudio;

class EstudiosRepo extends BaseRepo{

    public function getModel()
    {
        return new Estudio();
    }

    public function getComboEstudio(){

        return $this->getCombos("descripcion","id");

    }


} 