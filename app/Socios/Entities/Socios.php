<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:27
 */

namespace Socios\Entities;

class Socios extends \Eloquent{

    protected $table = "socios";

    protected $fillable = array("nombre","apellido","id_tipo_documento","nro_documento","id_sexo","id_estudio","id_tipo_socio","nro_legajo","direccion","localidad","socio_futbol","socio_pesca","tel_cel","tel_part","tel_lab","fecha_nac","socio_coop","socio_cocheria","se_liquida");

    public function getTipoDocumento(){

        return $this->hasOne('Combos\Entities\TipoDocumento','id','id_tipo_documento');

    }
    public function getSexo(){

        return $this->hasOne('Combos\Entities\Sexo','id','id_sexo');

    }
    public function getSiNo(){

        return $this->hasOne('Combos\Entities\SiNo','id','socio_coop');

    }
    public function getEstudio(){

        return $this->hasOne('Combos\Entities\Estudio','id','id_estudio');

    }
    public function getTipoSocio(){

        return $this->hasOne('Combos\Entities\TipoSocio','id','id_tipo_socio');

    }

    public function setFechaNacAttribute($value){

        $this->attributes["fecha_nac"] = \Time::FormatearToMysql($value);

    }
    public function getFechaNacAttribute($value){

        return \Time::FormatearToNormal($value);
    }

    public function getFamiliares(){
        return $this->hasMany('Familiares\Entities\Familiares','id_socio','id');

    }
    public function getPrestamos(){
        return $this->hasMany('Prestamos\Entities\Prestamos','id_socio','id');

    }
    public function getCirculos(){
        //return $this->hasMany('Circulos\Entities\Circulos','id_socio','id');

    }
    public function getVentas(){
        return $this->hasMany('Ventas\Entities\Ventas','id_socio','id');        
    }
    public function getPesca(){
        return $this->hasMany('Servicios\Entities\Servicios','id_socio','id')->where('id_penia','=',1);        
    }
    public function getFutbol(){
        return $this->hasMany('Servicios\Entities\Servicios','id_socio','id')->where('id_penia','=',2);        
    }

    public function getRifas(){
        return $this->hasMany('Rifas\Entities\RifasSocios','id_socio','id');
    }
    public function getOrdenes(){
        return $this->hasMany('OrdenesCompras\Entities\OrdenCompra','id_socio','id');
    }










}