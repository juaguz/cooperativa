<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 20/10/14
 * Time: 16:03
 */

namespace Rifas\Repositories;


use Rifas\Entities\RifasNumeros;

class RifasNumerosRepo extends BaseRepo{

    public function getModel()
    {
        return new RifasNumeros();
    }

    public function getNumerosRifa($id){
        return $this->model->with(
            [
                'rifasSocios'=>function($q) use ($id){
                    $q->where('id_rifa','=',$id);
                }
            ])->get();

    }

    public function newRifasNumeros($idRifasSocio,$numero){

        $model = $this->getModel();
        $model->id_rifas_socios = $idRifasSocio;
        $model->numero = $numero;
        return $model;
    }






}