<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Penias\Repositories;

use Penias\Entities\Penias;


class PeniasRepo extends BaseRepo
{

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Penias();


    }

    public function newPenia()
    {

        $penia = new Penias();
        $penia->id_usuario = \Auth::user()->id;



        return $penia;

    }

    public function getComboPenia(){

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