<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;


class CreatePerfilesTable extends Migration {

    protected $table = "perfiles";
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
                $table -> string('perfil');
                $table -> timestamps();
            });
            DB::table($this->table) -> insert(
                array(
                    array('perfil' => 'supervision')
                   ,array('perfil' => 'consulta')
                   ,array('perfil' => 'carga')

                )
            );
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
