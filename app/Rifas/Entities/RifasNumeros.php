<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 20/10/14
 * Time: 11:58
 */

namespace Rifas\Entities;


class RifasNumeros extends \Eloquent {

    protected $table = 'rifas_numeros';

    protected $fillable = ['numero'];

    public function rifasSocios(){
        return $this->belongsTo('Rifas\Entities\RifasSocios','id_rifas_socios','id');
    }

} 