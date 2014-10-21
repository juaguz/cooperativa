<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 09/07/14
 * Time: 23:10
 */

namespace Usuarios\Repositories;
use Usuarios\Entities\Usuarios;


class UsuariosRepo extends BaseRepo{
    public function getModel()
    {
        return new Usuarios();
    }

    public function newUsuariosRepo(){

        $usuarios = new Usuarios();
        $usuarios->clave = \Hash::make('123456');//clave por default
        return $usuarios;



    }

} 