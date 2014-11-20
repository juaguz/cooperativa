<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 19:24
 */

namespace Prestamos\Repositories;
use Prestamos\Entities\Prestamos;

class PrestamosRepo  extends BaseRepo{
    public function getModel()
    {
        return new Prestamos();

    }





    public function newPrestamo(){

        $prestamo = $this->getModel();

        $prestamo->id_usuario = \Auth::user()->id;

        return $prestamo;



    }

    public function getPrestamo($id)
    {
        return $this->model->with('ordenPago')->with('socio')->where('id',$id)->get();
    }

    public function buscar($busqueda)
    {

        if (isset($busqueda['id']) and !empty($busqueda['id'])) {
            $nombre = $busqueda["id"];
            $datos = $this->model->where("id", "=", $nombre);
        }

        if (isset($datos)) return $datos->paginate(20);

        return $this->model->paginate(20);

    }


} 