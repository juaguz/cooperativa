<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 16:51
 */

namespace Ventas\Entities;


class Ventas extends \Eloquent{

    protected  $table     = "ventas";

    protected  $fillable  = ["id_socio","id_comercio","monto","interes","cantidad_cuotas","descripcion"];

    public function cuotas(){

        return $this->hasMany("Ventas\Entities\VentasCuotas","id_venta","id");

    }

    public function socio(){
        return $this->hasOne("Socios\Entities\Socios","id","id_socio");
    }

    public function comercio(){
        return $this->hasOne("Comercios\Entities\Comercios","id","id_comercios");
    }



} 