<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 20/10/14
 * Time: 15:51
 */

namespace Rifas\Repositories;


use Rifas\Entities\RifasSocios;

class RifasSociosRepo extends BaseRepo {

    /**
     * @return RifasSocios
     */
    public function getModel()
    {
        return new RifasSocios();
    }

    public function getRifas($id){
        return $this->model
            ->with('numero')
            ->with('socio')
            ->where('id_rifa','=',$id)
            ->get();
    }


    public function newRifa($id){
        $model = $this->getModel();
        $model->id_rifa = $id;
        return $model;
    }

}