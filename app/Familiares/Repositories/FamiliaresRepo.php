<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Familiares\Repositories;

use Familiares\Entities\Familiares;


class FamiliaresRepo extends BaseRepo
{

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Familiares();


    }

    public function newFamiliar($idSocio)
    {

        $familiar = new Familiares();
        $familiar->id_usuario = \Auth::user()->id;
        $familiar->id_socio = $idSocio;
        return $familiar;

    }

    public function excel(){
        //$familiares = $this->model->with('getTipoDocumento','getSocio','getParentezco')
        $familiares   = $this->model->whereHas('getTipoDocumento',function($q){
                $q->select('descripcion');
        })->get();
        //->get(['getTipoDocumento']);


        dd($familiares);
        return $familiares;

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

    public function  getFamiliaresSocio($idSocio){

        return $this->model->select(\DB::raw('concat (apellido," ",nombre) as full_name,id'))->where('id_socio','=',$idSocio)->get();
    }


} 