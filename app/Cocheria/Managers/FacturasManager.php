<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:29
 */

namespace Cocheria\Managers;


class FacturasManager extends BaseManager {

    public function getRules()
    {
        // TODO: Implement getRules() method.
        $rules = [
            "fecha"=>"required"
        ];
        return $rules;
    }
}