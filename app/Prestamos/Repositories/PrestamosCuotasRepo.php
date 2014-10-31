<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 17/08/14
 * Time: 19:24
 */

namespace Prestamos\Repositories;

use Prestamos\Entities\PrestamosCuotas;

class PrestamosCuotasRepo extends BaseRepo {

    public function getModel()
    {
        return new PrestamosCuotas();
    }

    public function newCuotas($idPrestamo,$nro_cuota){
        $cuotas = $this->getModel();

        $cuotas->id_prestamo = $idPrestamo;
        $cuotas->nro_cuota   = $nro_cuota;

        $cuotas->id_usuario  = \Auth::user()->id;

        return $cuotas;


    }


}