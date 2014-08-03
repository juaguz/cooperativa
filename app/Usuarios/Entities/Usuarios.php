<?php
/**
 * Created by PhpStorm.
 * User: juan
 * Date: 09/07/14
 * Time: 21:18
 */

namespace Usuarios\Entities;

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class Usuarios extends \Eloquent implements UserInterface, RemindableInterface {

    protected $table    = 'usuarios';
    protected $fillable = ['nombre','apellido','id_perfil','id_tipo_documento','nro_documento','usuario'];


    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = array('password');

    /**
     * Get the unique identifier for the user.
     *
     * @return mixed
     */
    public function getAuthIdentifier() {
        return $this -> getKey();
    }

    /**
     * Get the password for the user.
     *
     * @return string
     */
    public function getAuthPassword() {
        return $this -> password;
    }

    /**
     * Get the e-mail address where password reminders are sent.
     *
     * @return string
     */
    public function getReminderEmail() {
        return $this -> email;
    }

    public function getRememberToken() {
        return $this -> remember_token;
    }

    public function setRememberToken($value) {
        $this -> remember_token = $value;
    }

    public function getRememberTokenName() {
        return 'remember_token';
    }



    public function getPerfil(){

        return $this->hasOne('Usuarios\Entities\Perfiles','id','id_perfil');
    }


    public function getTipoDocumento(){

        return $this->hasOne('Combos\Entities\TipoDocumento','id','id_tipo_documento');

    }

} 