<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 09/07/14
 * Time: 23:13
 */

namespace Usuarios\Managers;




class UsuariosManager extends BaseManager {

    public function getRules()
    {
        $rules = [
            "id_perfil"     =>"required",
            "nombre"        =>"required",
            "apellido"      =>"required",
            "nro_documento" =>"required",
            "usuario"       =>"required"

        ];
        return $rules;
    }
}