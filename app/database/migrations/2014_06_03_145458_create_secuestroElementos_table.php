<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSecuestroElementosTable extends Migration {

	 protected $table = "secuestro_elementos";
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function($table) {
                $table -> engine = 'InnoDB';
                $table -> increments('id');
              	$table ->integer('id_persona')->unsigned();

                $table -> string('tipo_elemento');
                //MODIFICACION 16/05
                $table -> string('identificacion');
                $table -> string('marca');
                $table -> string('modelo');
                $table -> timestamps();
            });           
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {

        Schema::drop($this->table);

    }

}
