<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOficiosTable extends Migration {
    protected  $table = 'oficios';
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
        Schema::create($this->table, function($table) {
            $table -> engine = 'InnoDB';

            $table -> increments('id');

            $table -> integer('id_usuario')->unsigned();

            $table -> integer('tipo_oficio')->unsigned();

            $table -> integer('nro_oficio')->unsigned();

            $table -> integer('nro_causa')->unsigned();

            $table -> string('juzgado',25);

            $table -> string('secretaria',25);

            $table -> string('caratula_expediente',25);

            $table -> string('causa_medida',30);

            $table -> integer('estado')->default('1');

            $table -> string('expediente',50);

            $table -> date('fecha');

            $table -> text('observaciones');

            $table -> boolean('cesado');

            $table -> boolean('hora_denuncia');

            $table -> string('nombre_denunciante');

            $table -> string('fiscalia',40);

            $table -> string('caratula',40);

            $table -> date('fecha_denuncia',40);

            $table -> string('juzgado_secretaria',40);

            $table -> string('medida_restrictiva',40);

            $table -> string('tipo_medida',40);

            $table -> date('fecha_oficio');

            $table -> date('plazo_fecha');

            $table -> string('plazo_hr');

            $table -> timestamps();
        });
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
