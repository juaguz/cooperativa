<?php
namespace OrdenesCompras\Repositories;
use Illuminate\Support\Facades\Auth;
use OrdenesCompras\Entities\OrdenCompra;


/**
 * Created by PhpStorm.
 * User: juan
 * Date: 23/10/14
 * Time: 11:59
 */

class OrdenCompraRepo extends BaseRepo {

    /**
     * @return OrdenCompra
     */
    public function getModel()
    {
        return new OrdenCompra();
    }


    public function newOrden(){

        $model = $this->getModel();
        $model->id_usuario = Auth::user()->id;
        return $model;

    }


    public function getOrden($id){
       return $this->model
            ->with('socio')
            ->with('comercio')
            ->where('id','=',$id)->get();

    }

    public function buscar($busqueda)
    {
        $ordenes = $this->model;
        //por q campo queres filtrar? por el id
        $ordenes = (isset($busqueda['id'])) ? $ordenes->where('id','=',$busqueda['id']):$ordenes->orderBy('id','desc');

        return $ordenes;


    }
}