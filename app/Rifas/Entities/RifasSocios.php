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

    public function numero(){
        return $this->hasOne('Rifas\Entities\RifasNumeros','id_rifas_socios','id');
    }
}