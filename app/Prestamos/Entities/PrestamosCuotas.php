<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 16:51
 */

namespace Prestamos\Entities;


class PrestamosCuotas extends \Eloquent{

    protected $table = "cuotas_prestamo";

    protected $fillable = ["importe","fecha_vencimiento","nro_recibo"];


    public function setFechaVencimientoAttribute($value){

        $this->attributes["fecha_vencimiento"] = \Time::FormatearToMysql($value);

    }
    public function getFechaVencimientoAttribute($value){

        return  \Time::FormatearToNormal($value);

    }




} 