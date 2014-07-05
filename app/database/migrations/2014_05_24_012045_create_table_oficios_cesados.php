<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableOficiosCesados extends Migration {

    protected $table = 'oficios_cesados';
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


                $table -> date('fecha_cese');

                $table -> string('tipo_medida',40);

                $table -> string('persona_auto',1);

                $table -> string('valor');

                $table -> string('path')->nullable();

                $table -> integer('id_usuario')->unsigned();

                $table -> string('descripcion');




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
