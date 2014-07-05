<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFkSolicitudParaderoTable extends Migration {

    protected $table = "solicitud_paradero";





    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        if (!Schema::hasTable($this->table)) {

            Schema::table($this->table, function($table) {
                $table -> engine = 'InnoDB';

                $table -> foreign("primera_desaparece") -> references("id") -> on("combo_si_no") -> onDelete('cascade');
                $table -> foreign("enfermedad") -> references("id") -> on("combo_si_no") -> onDelete('cascade');
                $table -> foreign("drogadiccion") -> references("id") -> on("combo_si_no") -> onDelete('cascade');
                $table -> foreign("internado_institucion") -> references("id") -> on("combo_si_no") -> onDelete('cascade');

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