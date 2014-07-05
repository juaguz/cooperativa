<?php
/**
 * Created by PhpStorm.
 * User: fran
 * Date: 24/06/14
 * Time: 11:28
 */

namespace Correos\Repositories;

use Correos\Entities\Correo;


class CorreoRepo extends BaseRepo {

    public function getModel()
    {
        return new Correo();
    }

    public function     getCorreo()
    {


    }

    public function newCorreo()
    {
        $Correo            = new Correo();
        return $Correo;
    }


}