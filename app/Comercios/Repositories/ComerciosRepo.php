<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Comercios\Repositories;

use Comercios\Entities\Comercios;


class ComerciosRepo extends BaseRepo
{

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Comercios();


    }

    public function newComercio()
    {

        $comercio = new Comercios();
        $comercio->id_usuario = \Auth::user()->id;



        return $comercio;

    }

    public function getComboComercio(){

        return $this->model->orderBy('nombre')->lists('nombre', 'id');

    }

      public function buscar($busqueda)
    {

        if (isset($busqueda['nombre']) and !empty($busqueda['nombre'])) {
            $nombre = $busqueda["nombre"];
            $datos = $this->model->where("nombre", "LIKE", "%$nombre%");
        }

        if (isset($datos)) {
            return $datos->paginate(20);
        }

        return $this->model->paginate(20);

    }


} 