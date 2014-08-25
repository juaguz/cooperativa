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

} 