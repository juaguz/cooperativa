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

    protected $fillable = array("nombre","desde","hasta","precio","fecha_sorteo");

    public function setFechaSorteoAttribute($value){

        $this->attributes["fecha_sorteo"] = \Time::FormatearToMysql($value);

    }
    public function getFechaSorteoAttribute($value){

        return \Time::FormatearToNormal($value);
    }



}