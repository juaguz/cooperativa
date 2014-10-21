<?php namespace OrdenesPago\ServiceProvider;
use Illuminate\Support\Facades\Facade;


/**
 * Created by PhpStorm.
 * User: juan
 * Date: 18/10/14
 * Time: 17:03
 */

class OrdenPagoFacade extends Facade {

    protected static function getFacadeAccessor(){
        return 'OrdenPagoService';
    }

} 