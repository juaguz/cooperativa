<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 10/06/14
 * Time: 08:31
 */

namespace Combos\Repositories;

//entidad "partido"
use Combos\Entities\ComboDepartamento;

class PartidoRepo extends BaseRepo{

    public function getModel()
    {
        return new ComboDepartamento();
    }

    public function getPartido($idProvincia){

        return $this->getById("id_provincia",$idProvincia);

    }


} 