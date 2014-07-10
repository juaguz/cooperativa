<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 09/07/14
 * Time: 21:18
 */

namespace Usuarios\Entities;


class Usuarios extends \Eloquent {

    protected $table    = 'usuarios';
    protected $fillable = ['nombre','apellido','id_perfil','id_tipo_documento','nro_documento','usuario'];


    public function getPerfil(){

        return $this->hasOne('Usuarios\Entities\Perfiles','id','id_perfil');
    }


    public function getTipoDocumento(){

        return $this->hasOne('Combos\Entities\TipoDocumento','id','id_tipo_documento');

    }

} 