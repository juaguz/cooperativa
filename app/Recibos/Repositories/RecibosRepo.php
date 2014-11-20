<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:31
 */

namespace Recibos\Repositories;

use Recibos\Entities\Recibos;


class RecibosRepo extends BaseRepo
{

    public function getModel()
    {
        // TODO: Implement getModel() method.

        return new Recibos();


    }

    public function newRecibo()
    {

        $recibo = new Recibos();
        $recibo->id_usuario = \Auth::user()->id;
        return $recibo;

    }
    //aca tenes que escribir la busqueda
    public function buscar($busqueda)
    {
        $recibo = $this->model;
        //por q campo queres filtrar? por el id
        $recibo = (isset($busqueda['id'])) ? $recibo->where('id','=',$busqueda['id'])->orderBy('id','desc'):$recibo->orderBy('id','desc');

        return $recibo;


    }

    public function getRecibo($idRecibo)
    {
        return $this->model->where('id','=',$idRecibo)->get()->first();
    }


} 