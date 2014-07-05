<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFkFotosTable extends Migration {

    protected $table = "fotos";
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        if (!Schema::hasTable($this->table)) {

            Schema::table($this->table, function($table) {
                $table -> engine = 'InnoDB';

                $table -> foreign("id_usuario") -> references("id") -> on("usuarios") -> onDelete('cascade');

                $table -> foreign("id_persona") -> references("id") -> on("personas") -> onDelete('cascade');


            });

        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        if (!Schema::hasTable($this->table)) {
            Schema::drop($this->table);
        }

    }

}