<?php
/**
 * Created by PhpStorm.
 * User: Eri
 * Date: 12/07/14
 * Time: 19:29
 */

namespace Circulos\Managers;


class CirculosManager extends BaseManager {

    public function getRules()
    {
        // TODO: Implement getRules() method.
        $rules = [
            "nombre"=>"required"
        ];
        return $rules;
    }
}