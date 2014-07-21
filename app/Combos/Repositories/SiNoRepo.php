<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 10/06/14
 * Time: 08:31
 */

namespace Combos\Repositories;
use Combos\Entities\SiNo;

class SiNoRepo extends BaseRepo{

    public function getModel()
    {
        return new SiNo();
    }

    public function getComboSiNo(){

        return $this->getCombos("descripcion","id");

    }


} 