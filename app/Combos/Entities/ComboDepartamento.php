<?php namespace Combos\Entities;

class ComboDepartamento extends \Eloquent {
    protected $table = 'departamentos';
    protected $fillable = array('id_provincia','descripcion');
} 