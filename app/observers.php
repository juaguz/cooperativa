<?php

use Oficios\Entities\Oficios;
use Oficios\Entities\Personas;
use Oficios\Entities\SecuestroElementos;
use Oficios\Entities\PedidosSecuestroVehicular;
use Oficios\Entities\SolicitudParadero;

use Oficios\Observers\OficiosObserver;

use Oficios\Observers\PersonasObserver;

use Oficios\Observers\SecuestroElementosObserver;

use Oficios\Observers\SecuestroVehicularObserver;

use Oficios\Observers\SolicitudParaderoObserver;

Oficios::observe(new OficiosObserver($app->make('updating')));

Personas::observe(new PersonasObserver($app->make('updating')));

SecuestroElementos::observe(new SecuestroElementosObserver($app->make('updating')));

SolicitudParadero::observe(new SolicitudParaderoObserver($app->make('updating')));

PedidosSecuestroVehicular::observe(new SecuestroVehicularObserver($app->make('updating')));


?>