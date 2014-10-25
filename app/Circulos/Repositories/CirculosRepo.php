<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Circulos\Repositories;

use Circulos\Entities\Circulos;


class CirculosRepo extends BaseRepo
{

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Circulos();


    }

    public function newCirculo()
    {

        $circulo = new Circulos();
        $circulo->id_usuario = \Auth::user()->id;



        return $circulo;

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