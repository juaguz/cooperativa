<?php
namespace Bonos\Repositories;
use Illuminate\Support\Facades\Auth;
use Bonos\Entities\Bono;


/**
 * Created by PhpStorm.
 * User: juan
 * Date: 23/10/14
 * Time: 11:59
 */

class BonoRepo extends BaseRepo {

    /**
     * @return Bono
     */
    public function getModel()
    {
        return new Bono();
    }


    public function newBono(){

        $model = $this->getModel();
        $model->id_usuario = Auth::user()->id;
        return $model;

    }


    public function getBono($id){
       return $this->model
            ->with('socio')
            ->with('comercio')
            ->where('id','=',$id)->get();

    }
    public function buscar($busqueda)
    {
        $bono = $this->model;
        //por q campo queres filtrar? por el id
        $bono = (isset($busqueda['id'])) ? $bono->where('id','=',$busqueda['id']):$bono->orderBy('id','desc');

        return $bono;


    }
}