<?php namespace OrdenesCompras\Entities;
use Time;

/**
 * Created by PhpStorm.
 * User: juan
 * Date: 23/10/14
 * Time: 11:37
 */

class OrdenCompra extends \Eloquent {

    protected $table = 'ordenes_compras';
    protected $fillable = ["id_socio","id_comercio","importe","created_at","updated_at"];


    public function socio(){
        return $this->belongsTo('Socios\Entities\Socios','id_socio','id');

    }
    public function comercio()
    {
        return  $this->belongsTo('Comercios\Entities\Comercios', 'id_comercio', 'id');
    }

    public function getCreatedAtAttribute($value){

        return Time::FormatearToNormal($value);

    }
} 