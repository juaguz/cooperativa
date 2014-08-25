<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Socios\Repositories;

use Socios\Entities\Socios;


class SociosRepo extends BaseRepo
{

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Socios();


    }

    public function newSocio()
    {

        $socio = new Socios();
        $socio->id_usuario = \Auth::user()->id;



        return $socio;

    }

    public function tieneCocheria(){

        return $this->model->select(\DB::raw('concat (apellido," ",nombre," Nro Legajo: ",nro_legajo) as full_name,id'))->where('socio_cocheria','=','2')->orderBy('apellido')->lists('full_name', 'id');

    }
    public function getComboNroLegajo(){

        return $this->model->select(\DB::raw('concat (apellido," ",nombre," Nro Legajo: ",nro_legajo) as full_name,id'))->orderBy('apellido')->lists('full_name', 'id');

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