<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableHoras extends Migration {

    protected $table = 'horas';

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
                    array('descripcion' => '1'),
                    array('descripcion' => '2'),
                    array('descripcion' => '3'),
                    array('descripcion' => '4'),
                    array('descripcion' => '5'),
                    array('descripcion' => '6'),
                    array('descripcion' => '7'),
                    array('descripcion' => '8'),
                    array('descripcion' => '9'),
                    array('descripcion' => '10'),
                    array('descripcion' => '11'),
                    array('descripcion' => '12'),
                    array('descripcion' => '13'),
                    array('descripcion' => '14'),
                    array('descripcion' => '15'),
                    array('descripcion' => '16'),
                    array('descripcion' => '17'),
                    array('descripcion' => '18'),
                    array('descripcion' => '19'),
                    array('descripcion' => '20'),
                    array('descripcion' => '21'),
                    array('descripcion' => '22'),
                    array('descripcion' => '23'),
                    array('descripcion' => '24')
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
        //Schema::drop($this->table);
    }

}
