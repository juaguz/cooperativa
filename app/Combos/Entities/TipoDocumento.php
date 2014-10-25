<?php namespace Combos\Entities;

class TipoDocumento extends \Eloquent {
    protected $table = 'tipos_documentos';
    protected $fillable = array('descripcion');
} 