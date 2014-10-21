<?php


namespace Circulos\Repositories;


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



    public function paginate($cant=5){

        return $this->model->paginate($cant);
    }

    public function all()
    {

        return $this->model->all();

    }

    public function whereLike($campo,$valor){

        return $this->model->where($campo,'LIKE',"%$valor%");
    }




    public function getCombos($option,$value){

        return $this->model->all()->lists($option,$value);

    }


} 