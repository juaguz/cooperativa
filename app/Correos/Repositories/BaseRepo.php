<?php


namespace Correos\Repositories;


abstract class BaseRepo {

    protected $model;


    abstract public function getModel();

    function __construct(){

        $this->model = $this->getModel();

    }


    public function find($id)
    {

        return $this->model->find($id);
    }

    public function all()
    {

        return $this->model->all();

    }

    public function getPersona($idOficio,$idTipoPersona){

        return $this->model->where('id_oficio','=',$idOficio)->where('id_tipo_persona','=',$idTipoPersona)->firstOrFail();


    }



    public function getSolicitudParadero($idPersona){

        return $this->model->where('id_persona','=',$idPersona)->firstOrFail();
    }

} 