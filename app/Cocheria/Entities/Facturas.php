<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 02/08/14
 * Time: 16:07
 */

namespace Cocheria\Entities;


class Facturas extends \Eloquent{

    protected $table = 'facturas_cocheria';
    protected $fillable = ["fecha","descripcion","id_socio","id_familiar","importe","porcentaje"];

    public function setFechaAttribute($value){

        $this->attributes["fecha"] = \Time::FormatearToMysql($value);

    }
    public function getFechaAttribute($value){

        return \Time::FormatearToNormal($value);
    }

    public function getFamiliares(){
        return $this->hasOne('Familiares\Entities\Familiares','id','id_familiar');

    }

    public function getSocios(){
        return $this->hasOne('Socios\Entities\Socios','id','id_socio');

    }



} 