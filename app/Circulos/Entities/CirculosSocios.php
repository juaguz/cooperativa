<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 13/09/14
 * Time: 11:27
 */

namespace Circulos\Entities;


class CirculosSocios extends \Eloquent{

    protected $table = 'circulos_socios';

    public function socios(){
        return $this->hasOne('Socios\Entities\Socios','id','id_socio');
    }

} 