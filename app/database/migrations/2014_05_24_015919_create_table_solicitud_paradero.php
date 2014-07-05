<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableSolicitudParadero extends Migration {



    protected $table = 'solicitud_paradero';
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

                $table ->integer('id_persona')->unsigned();

                $table -> boolean('primera_desaparece')->unsigned();

                $table -> boolean('enfermedad')->unsigned();

                $table ->boolean('drogadiccion')->unsigned();

                $table ->boolean('internado_institucion')->unsigned();

                $table ->text('descripcion_caso');

                $table ->text('novedades');

                $table ->text('enfermedades');

                $table ->text('concurrencia');

                $table ->text('descipcion_persona');

                $table ->text('lugar_visto');

                $table ->date('fecha_visto');

                $table ->time('hora_visto');

                $table ->string('medicacion');

                $table ->string('vinculo_desaparecido');

                $table ->string('pertenencia_referencia');

                $table ->string('vestimenta');

                $table ->string('descripcion_fisica');






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