<?php namespace Combos\Entities;

class ComboLocalidad extends \Eloquent {
    protected $table = 'localidades';
    protected $fillable = array('id_departamento','descripcion');
} 