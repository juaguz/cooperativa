<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableSecuestroVehicular extends Migration {


    protected $table = 'secuestro_vehicular';
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function($table) {
                $table -> engine = 'InnoDB';

                $table -> increments('id');

                $table -> integer('id_oficio')->unsigned();

                $table -> integer('id_persona')->unsigned();

                $table -> string('dominio');

                $table -> string('marca_vehiculo',25);

                $table -> string('modelo_vehiculo',25);

                $table -> integer('nro_chasis');

                $table -> integer('nro_motor');

                $table -> string('radicacion',25);

                $table -> string('juzgado_secretaria');

                $table -> integer('anio_vehiculo');




                $table -> timestamps();
            });

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