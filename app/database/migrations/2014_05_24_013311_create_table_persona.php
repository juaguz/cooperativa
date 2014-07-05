<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTablePersona extends Migration {

    protected $table = 'personas';
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        if (!Schema::hasTable($this->table)) {

            Schema::create($this->table, function($table) {
                $table -> engine = 'InnoDB';

                $table -> increments('id');

                $table -> integer('id_oficio')->unsigned();

                $table -> integer('id_sexo')->unsigned();

                $table -> integer('id_nacionalidad')->unsigned();

                $table -> integer('id_tipo_documento')->unsigned();

                $table -> integer('id_tipo_persona')->unsigned();

                $table -> integer('id_ultimo_partido')->unsigned()->default(1);

                $table -> integer('id_provincia_laboral')->unsigned()->default(1);

                $table -> integer('id_partido_laboral')->unsigned()->default(1);

                $table -> integer('id_localidad_laboral')->unsigned()->default(1);

                $table -> integer('id_compania_celular')->unsigned();


                $table -> integer('numero_celular');

                $table -> string('nombre',25);

                $table -> string('apellido',25);
                //Agregado 16/06 NUEVO CAMPO DB
                $table -> string('apellido_materno',25);

                $table -> text('descripcion_persona');

                $table -> date('edad');

                $table -> integer('nro_documento');

                $table -> string('apodos');

                $table -> string('autoridad_documento',25);

                $table -> string('ultimo_calle',25);

                $table -> string('ultimo_numero',25);

                $table -> string('ultimo_piso',25);

                $table -> string('ultimo_departamento',25);

                $table -> string('nro_tarjeta_credito',25);

                $table -> string('bco_tarjeta_credito',25);

                $table -> string('ultima_localidad',25)->default(1);

                $table -> string('ultimo_codigo_postal',25);

                $table -> string('ultima_provincia',25)->default(1);

                $table -> string('ocupacion',25);

                $table -> string('empleador',25);

                $table -> string('cuit',50);

                $table -> string('domicilio_laboral',25);

                $table -> integer('telefono_laboral');



                $table -> string('calle_laboral',25);

                $table -> integer('numero_laboral');

                $table -> integer('piso_laboral');

                $table -> integer('codigo_postal_laboral');

                $table -> text('observaciones');

                $table -> integer('telefono');


                $table -> string('vinculo_victima',25);









                $table -> timestamps();
            });

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