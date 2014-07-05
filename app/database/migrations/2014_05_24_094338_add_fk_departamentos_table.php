<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFkDepartamentosTable extends Migration {

    protected $table = "departamentos";
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        if (!Schema::hasTable($this->table)) {

            Schema::table($this->table, function($table) {
                $table -> engine = 'InnoDB';

                $table -> foreign("id_provincia") -> references("id") -> on("provincias") -> onDelete('cascade');




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