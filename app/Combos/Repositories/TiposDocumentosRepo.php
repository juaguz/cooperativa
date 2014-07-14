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
//que queres hacer? quiero agregar el combo de tipo de socio vs me estas moviendo? nop
    public function getModel()
    {
        return new TipoDocumento();
    }

    public function getComboTiposDocumentos(){

        return $this->getCombos("descripcion","id");

    }


} 