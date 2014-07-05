<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableMinutos extends Migration {

    protected $table = 'minutos';

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
                    array('descripcion' => '00'),
                    array('descripcion' => '01'),
                    array('descripcion' => '02'),
                    array('descripcion' => '03'),
                    array('descripcion' => '04'),
                    array('descripcion' => '05'),
                    array('descripcion' => '06'),
                    array('descripcion' => '07'),
                    array('descripcion' => '08'),
                    array('descripcion' => '09'),
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
                    array('descripcion' => '24'),
                    array('descripcion' => '25'),
                    array('descripcion' => '26'),
                    array('descripcion' => '27'),
                    array('descripcion' => '28'),
                    array('descripcion' => '29'),
                    array('descripcion' => '30'),
                    array('descripcion' => '31'),
                    array('descripcion' => '32'),
                    array('descripcion' => '33'),
                    array('descripcion' => '34'),
                    array('descripcion' => '35'),
                    array('descripcion' => '36'),
                    array('descripcion' => '37'),
                    array('descripcion' => '38'),
                    array('descripcion' => '39'),
                    array('descripcion' => '40'),
                    array('descripcion' => '41'),
                    array('descripcion' => '42'),
                    array('descripcion' => '43'),
                    array('descripcion' => '44'),
                    array('descripcion' => '45'),
                    array('descripcion' => '46'),
                    array('descripcion' => '47'),
                    array('descripcion' => '48'),
                    array('descripcion' => '49'),
                    array('descripcion' => '50'),
                    array('descripcion' => '51'),
                    array('descripcion' => '52'),
                    array('descripcion' => '53'),
                    array('descripcion' => '54'),
                    array('descripcion' => '55'),
                    array('descripcion' => '56'),
                    array('descripcion' => '57'),
                    array('descripcion' => '58'),
                    array('descripcion' => '59'),

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
