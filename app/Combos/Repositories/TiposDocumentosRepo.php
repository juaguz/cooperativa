<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 10/06/14
 * Time: 08:31
 */

namespace Combos\Repositories;
use Combos\Entities\TipoDocumento;

class TiposDocumentosRepo extends BaseRepo{


    public function getModel()
    {
        return new TipoDocumento();
    }

    public function getComboTiposDocumentos(){

        return $this->getCombos("descripcion","id");

    }


} 