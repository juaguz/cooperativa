<?php


namespace Usuarios\Repositories;


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
    public function getCombos($option,$value){

        return $this->model->all()->lists($option,$value);

    }


} 