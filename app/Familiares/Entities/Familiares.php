<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:27
 */

namespace Familiares\Entities;

class Familiares extends \Eloquent{

    protected $table = "familiares";

    protected $fillable = array("nombre","apellido","id_tipo_documento","nro_documento","id_sexo","id_estudio","id_parentezco","id_socio","direccion","localidad","socio_futbol","socio_pesca","tel_cel","tel_part","tel_lab","fecha_nac","socio_coop");

    public function getTipoDocumento(){

        return $this->hasOne('Combos\Entities\TipoDocumento','id','id_tipo_documento');

    }
    public function getSexo(){

        return $this->hasOne('Combos\Entities\Sexo','id','id_sexo');

    }
    public function getSiNoSocioCoop(){

        return $this->hasOne('Combos\Entities\SiNo','id','socio_coop');

    }
    public function getSiNoSocioFutbol(){

        return $this->hasOne('Combos\Entities\SiNo','id','socio_futbol');

    }public function getSiNoSocioPesca(){

        return $this->hasOne('Combos\Entities\SiNo','id','socio_pesca');

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

    public function getSocio(){

        return $this->belongsTo('Socios\Entities\Socios','id_socio','id');

    }
    public function getParentezco(){

        return $this->hasOne('Combos\Entities\Parentezco','id','id_parentezco');

    }

}