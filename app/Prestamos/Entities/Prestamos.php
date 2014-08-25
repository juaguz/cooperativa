<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 16:51
 */

namespace Prestamos\Entities;


class Prestamos extends \Eloquent{

    protected  $table     = "prestamos";

    protected  $fillable  = ["id_socio","monto","interes","cantidad_cuotas"];

    public function cuotas(){

        return $this->hasMany("Prestamos\Entities\PrestamosCuotas","id_prestamo","id");

    }

    public function socio(){
        return $this->hasOne("Socios\Entities\Socios","id","id_socio");
    }



} 