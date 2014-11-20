<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:27
 */

namespace Comercios\Entities;

class Comercios extends \Eloquent{

    protected $table = "comercios";

    protected $fillable = array("nombre","direccion","telefono","persona_contacto","observaciones");

    public function getSiNo(){

        return $this->hasOne('Combos\Entities\SiNo','id','socio_coop');

    }











}