<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:27
 */

namespace Rifas\Entities;

class Rifas extends \Eloquent{

    protected $table = "rifas";

    protected $fillable = array("nombre","desde","hasta","precio","fecha_sorteo","fecha_desde","fecha_hasta","cuotas");

    public function setFechaSorteoAttribute($value){

        $this->attributes["fecha_sorteo"] = \Time::FormatearToMysql($value);

    }
    public function getFechaSorteoAttribute($value){

        return \Time::FormatearToNormal($value);
    }
    public function setFechaDesdeAttribute($value){

        $this->attributes["fecha_desde"] = \Time::FormatearToMysql($value);

    }
    public function getFechaDesdeAttribute($value){

        return \Time::FormatearToNormal($value);
    }
    public function setFechaHastaAttribute($value){

        $this->attributes["fecha_hasta"] = \Time::FormatearToMysql($value);

    }
    public function getFechaHastaAttribute($value){

        return \Time::FormatearToNormal($value);
    }

    public function rifasSocios(){
        return $this->hasMany("Rifas/Entities/RifasSocios","id_rifa","id");
    }





}