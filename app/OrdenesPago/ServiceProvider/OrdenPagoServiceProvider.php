<?php
namespace OrdenesPago\ServiceProvider;
use Illuminate\Support\Facades\App;
use Illuminate\Support\ServiceProvider;


/**
 * Created by PhpStorm.
 * User: juan
 * Date: 18/10/14
 * Time: 17:03
 */

class OrdenPagoServiceProvider extends ServiceProvider {

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('OrdenPagoService',function(){
           return new OrdenPago(
               App::make('OrdenesPago\Repositories\OrdenPagoRepo')
           );
        });
    }
}