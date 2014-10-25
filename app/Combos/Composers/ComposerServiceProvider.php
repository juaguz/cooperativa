<?php namespace Combos\Composers;

use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider {

    public function register(){

        $this->app->view->composer('listados.oficios', 'Combos\Composers\CombosComposer');
        $this->app->view->composer('formularios.*', 'Combos\Composers\CombosComposer');

    }

} 