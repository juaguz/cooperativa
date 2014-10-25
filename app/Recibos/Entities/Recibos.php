<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 02/08/14
 * Time: 16:07
 */

namespace Recibos\Entities;


class Recibos extends \Eloquent{

    protected $table = 'recibos';
    protected $fillable = ["fecha","responsable","monto","concepto","quien"];

    public function setFechaAttribute($value){

        $this->attributes["fecha"] = \Time::FormatearToMysql($value);

    }
    public function getFechaAttribute($value){

        return \Time::FormatearToNormal($value);
    }
}