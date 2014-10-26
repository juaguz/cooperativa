<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 02/08/14
 * Time: 16:07
 */

namespace Cocheria\Entities;


class Facturas extends \Eloquent{

    protected $table = 'facturas_cocheria';
    protected $fillable = ["fecha","descripcion","id_socio","id_familiar","importe","porcentaje","fecha_defuncion","difunto","importe_quincenal","importe_mensual","primer_vencimiento","segundo_vencimiento"];

    public function setFechaAttribute($value){

        $this->attributes["fecha"] = \Time::FormatearToMysql($value);

    }
    public function setPrimerVencimientoAttribute($value){

        $this->attributes["primer_vencimiento"] = \Time::FormatearToMysql($value);

    }
    public function setSegundoVencimientoAttribute($value){

        $this->attributes["segundo_vencimiento"] = \Time::FormatearToMysql($value);

    }
    public function setFechaDefuncionAttribute($value){

        $this->attributes["fecha_defuncion"] = \Time::FormatearToMysql($value);

    }
    public function getFechaAttribute($value){

        return \Time::FormatearToNormal($value);
    }
    public function getPrimerVencimientoAttribute($value){

        return \Time::FormatearToNormal($value);
    }
    public function getSegundoVencimientoAttribute($value){

        return \Time::FormatearToNormal($value);
    }
    public function getFechaDefuncionAttribute($value){

        return \Time::FormatearToNormal($value);
    }


    public function getFamiliares(){
        return $this->hasOne('Familiares\Entities\Familiares','id','id_familiar');

    }

    public function getSocios(){
        return $this->hasOne('Socios\Entities\Socios','id','id_socio');

    }



} 