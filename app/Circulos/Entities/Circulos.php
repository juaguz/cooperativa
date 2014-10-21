<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:27
 */

namespace Circulos\Entities;

class Circulos extends \Eloquent{

    protected $table = "circulos";

    protected $fillable = array("nombre","importe","cantidad_socios","fecha_inicio","fecha_fin");

    public function setFechaInicioAttribute($value){

        $this->attributes["fecha_inicio"] = \Time::FormatearToMysql($value);

    }
    public function setFechaFinAttribute($value){

        $this->attributes["fecha_fin"] = \Time::FormatearToMysql($value);

    }
    public function getFechaInicioAttribute($value){

        return \Time::FormatearToNormal($value);
    }
    public function getFechaFinAttribute($value){

        return \Time::FormatearToNormal($value);
    }

    public function circulosSocios(){

        return $this->hasMany('Circulos\Entities\CirculosSocios','id_circulo','id');
    }


}