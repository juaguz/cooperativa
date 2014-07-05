<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableTiposOficios extends Migration
{


    protected $table = 'tipos_oficios';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function ($table) {
                $table->engine = 'InnoDB';

                $table->increments('id');

                $table->string('descripcion');

                $table->string('ruta');

                $table->timestamps();
            });

            DB::table($this->table)->insert(
                array(
                      array('descripcion' => 'Solicitud de Paradero','ruta'=>'solicitud_paradero')
                    , array('descripcion' => 'Pedido de Secuestro Vehicular','ruta'=>'secuestro_vehicular')
                    , array('descripcion' => 'Prohibición Salida del País','ruta'=>'prohibicion_salida')
                    , array('descripcion' => 'Pedidos de Captura','ruta'=>'pedidos_captura')
                    , array('descripcion' => 'Medidas Restrictivas','ruta'=>'medidas_restrictivas')
                    , array('descripcion' => 'Solicitud de Paradero Por Req Judicial','ruta'=>'solicitud_paradero_req_jud')
                    , array('descripcion' => 'Habeas Corpus','ruta'=>'habeas_corpus')
                    , array('descripcion' => 'Secuestro Elementos','ruta'=>'secuestro_elementos')

                )
            );
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop($this->table);
    }
}