<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:27
 */

namespace Penias\Entities;

class Penias extends \Eloquent{

    protected $table = "penias";

    protected $fillable = array("nombre");

    public function getSiNo(){

        return $this->hasOne('Combos\Entities\SiNo','id','socio_coop');

    }











}