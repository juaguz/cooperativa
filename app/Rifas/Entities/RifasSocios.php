<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 20/10/14
 * Time: 11:57
 */

namespace Rifas\Entities;


class RifasSocios extends \Eloquent{

    protected $table = 'rifas_socios';
    protected $fillable = ['id_socio'];
    public $timestamps = false;

    public function numero(){
        return $this->hasMany('Rifas\Entities\RifasNumeros','id_rifas_socios','id');
    }

    public function rifa(){
        return $this->belongsTo('Rifas\Entities\Rifas','id_rifa','id');
    }

    public function socio(){

        return $this->belongsTo('Socios\Entities\Socios','id_socio','id');
    }


}