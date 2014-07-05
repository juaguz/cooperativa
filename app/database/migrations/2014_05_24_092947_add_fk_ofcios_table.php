<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFkOfciosTable extends Migration {

    protected $table = "oficios";
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

                $table -> foreign("tipo_oficio") -> references("id") -> on("tipos_oficios") -> onDelete('cascade');

                $table -> foreign("cesado") -> references("id") -> on("combo_si_no") -> onDelete('cascade');


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
            Schema::table($this->table, function($table) {
                $table -> dropForeign('oficios_id_usuario_foreign');
                $table -> dropForeign('oficios_tipo_oficio_foreign');
                $table -> dropForeign('oficios_cesado   _foreign');
            });
         }

    }

}