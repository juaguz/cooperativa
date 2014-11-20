<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 10/06/14
 * Time: 08:31
 */

namespace Combos\Repositories;
use Combos\Entities\Parentezco;

class ParentezcosRepo extends BaseRepo{

    public function getModel()
    {
        return new Parentezco();
    }

    public function getComboParentezco(){

        return $this->getCombos("descripcion","id");

    }


} 