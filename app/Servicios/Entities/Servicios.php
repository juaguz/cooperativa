<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 16:51
 */

namespace Servicios\Entities;


class Servicios extends \Eloquent{

    protected  $table     = "servicios";

    protected  $fillable  = ["id_socio","id_penia","monto","interes","cantidad_cuotas","descripcion"];

    public function cuotas(){

        return $this->hasMany("Servicios\Entities\ServiciosCuotas","id_servicio","id");

    }

    public function socio(){
        return $this->hasOne("Socios\Entities\Socios","id","id_socio");
    }

    public function penia(){
        return $this->hasOne("Penias\Entities\Penias","id","id_penia");
    }



} 