<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComboSiNoTable extends Migration {


    protected $table = 'combo_si_no';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function ($table) {
                $table->engine = 'InnoDB';

                $table->increments('id');

                $table->string('descripcion');

                $table->timestamps();
            });

            DB::table($this->table)->insert(
                array(
                    array('descripcion' => 'Sin Definir')
                , array('descripcion' => 'Si')
                , array('descripcion' => 'No')

                )
            );
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