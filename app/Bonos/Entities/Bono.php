<?php namespace Bonos\Entities;
use Time;

/**
 * Created by PhpStorm.
 * User: juan
 * Date: 23/10/14
 * Time: 11:37
 */

class Bono extends \Eloquent {

    protected $table = 'bonos';
    protected $fillable = ["id_socio","id_comercio","importe","created_at","updated_at", "fecha_vencimiento"];


    public function socio(){
        return $this->belongsTo('Socios\Entities\Socios','id_socio','id');

    }
    public function comercio()
    {
        return  $this->belongsTo('Comercios\Entities\Comercios', 'id_comercio', 'id');
    }

    public function getCreatedAtAttribute($value){

        return Time::FormatearToNormal($value);

    }
    public function getFechaVencimientoAttribute($value){

        return Time::FormatearToNormal($value);

    }
    public function setFechaVencimientoAttribute($value){

        return $this->attributes["fecha_vencimiento"] = \Time::FormatearToMysql($value);

    }
} 