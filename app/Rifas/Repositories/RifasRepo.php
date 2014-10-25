<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Rifas\Repositories;

use Rifas\Entities\Rifas;


class RifasRepo extends BaseRepo
{

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Rifas();


    }

    public function newRifa()
    {

        $rifa = new Rifas();
        $rifa->id_usuario = \Auth::user()->id;



        return $rifa;

    }

       public function buscar($busqueda)
    {

        if (isset($busqueda['nombre']) and !empty($busqueda['nombre'])) {
            $nombre = $busqueda["nombre"];
            $datos = $this->model->where("nombre", "LIKE", "%$nombre%");
        }

        if (isset($datos)) return $datos->paginate(20);

        return $this->model->paginate(20);

    }


} 