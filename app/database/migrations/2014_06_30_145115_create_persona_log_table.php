<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePersonaLogTable extends Migration {

    protected $table = "personas_log";
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function($table) {
                $table -> engine = 'InnoDB';
                $table -> increments("id");
                $table -> integer("id_persona")->unsigned();
                $table -> string("field");
                $table -> string("value");
                $table -> integer("id_usuario");
                $table -> foreign("id_persona") -> references("id") -> on("personas") -> onDelete('cascade');
                $table -> foreign("id_usuario") -> references("id")-> on("usuarios") -> onDelete('cascade');
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
        if (!Schema::hasTable($this->table)) {
            Schema::drop($this->table);
        }

    }

}
