<?php namespace OrdenesPago\Entities;
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 18/10/14
 * Time: 16:55
 */

class OrdenPagoEntity extends \Eloquent {
    protected $table    = 'ordenes_pagos';
    protected $fillable = ["quien","a_quien","importe","fecha","concepto","updated_at"];

    public function setFechaAttribute($value){

        $this->attributes["fecha"] = \Time::FormatearToMysql($value);

    }
    public function getFechaAttribute($value){

        return \Time::FormatearToNormal($value);
    }


}