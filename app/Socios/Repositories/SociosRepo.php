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

    public function getNroLegajo(){
        return $this->model->select(\DB::raw('concat (apellido," ",nombre," Nro Legajo: ",nro_legajo) as full_name,id'));
    }

    public function getComboNroLegajo(){
        return $this->getNroLegajo()->orderBy('apellido')->lists('full_name', 'id');
    }

    public function getComboNroLegajoInNotCircle($idsSocios){
        $socios = array();
        foreach($idsSocios as $idSocio){
            $socios[] = $idSocio['id_socio'];
        }

        return $this->getNroLegajo()->whereNotIn('id',$socios)->orderBy('apellido')->lists('full_name', 'id');
    }

    public function buscar($busqueda)
    {
		//die("ola");
        if (isset($busqueda['nro_legajo']) and !empty($busqueda['nro_legajo'])) {
            $nro_legajo = $busqueda["nro_legajo"];
            $datos = $this->model->where("nro_legajo", "LIKE", "%$nro_legajo%");
        }

        if (isset($datos)) {
            return $datos->paginate(20);
        }

        return $this->model->paginate(20);

    }


} 