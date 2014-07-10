<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 09/07/14
 * Time: 22:06
 */

namespace Usuarios\Repositories;
use Usuarios\Entities\Perfiles;

class PerfilesRepo extends BaseRepo {

    public function getModel()
    {
        return new Perfiles();
    }

    public function  getCombosPerfil(){

       return $this->getCombos('descripcion','id');

    }


} 