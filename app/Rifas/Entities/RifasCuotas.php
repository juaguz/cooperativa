<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 26/10/14
 * Time: 00:42
 */

namespace Rifas\Entities;


class RifasCuotas extends \Eloquent{

    protected $table = 'rifas_cuotas';
    protected $fillable = ["id_rifa_socio","fecha_vencimiento","liquidada","nro_recibo","importe"];

    public function getFechaVencimientoAttribute($value){
        return \Time::FormatearToNormal($value);
    }
    public function setFechaVencimientoAttribute($value){
        $this->attributes["fecha_vencimiento"] = \Time::FormatearToMysql($value);
    }
    public function getLiquidadaAttribute($value){
        return \Time::FormatearToNormal($value);
    }
    public function setLiquidadaAttribute($value){
        $this->attributes["liquidada"] = \Time::FormatearToMysql($value);
    }

} 