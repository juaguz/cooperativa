<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFkOficiosPersonaTable extends Migration {


    protected $table = "personas";
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        if (!Schema::hasTable($this->table)) {

            Schema::table($this->table, function($table) {
                $table -> engine = 'InnoDB';

                $table -> foreign("id_oficio") -> references("id") -> on("oficios") -> onDelete('cascade');

                $table -> foreign("id_sexo") -> references("id") -> on("sexo") -> onDelete('cascade');

                $table -> foreign("id_nacionalodad") -> references("id") -> on("nacionalidades") -> onDelete('cascade');

                $table -> foreign("id_tipo_documento") -> references("id") -> on("tipo_documento") -> onDelete('cascade');

                $table -> foreign("id_tipo_persona") -> references("id") -> on("tipo_persona") -> onDelete('cascade');




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