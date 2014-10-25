<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 16:51
 */

namespace Ventas\Entities;


class VentasCuotas extends \Eloquent{

    protected $table = "cuotas_ventas";

    protected $fillable = ["importe","fecha_vencimiento"];


    public function setFechaVencimientoAttribute($value){

        $this->attributes["fecha_vencimiento"] = \Time::FormatearToMysql($value);

    }
    public function getFechaVencimientoAttribute($value){

        return  \Time::FormatearToNormal($value);

    }




} 