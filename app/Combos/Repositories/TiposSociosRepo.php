<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 10/06/14
 * Time: 08:31
 */

namespace Combos\Repositories;
use Combos\Entities\TipoSocio;

class TiposSociosRepo extends BaseRepo{

    public function getModel()
    {
        return new TipoSocio();
    }

    public function getComboTipoSocio(){

        return $this->getCombos("descripcion","id");

    }


} 