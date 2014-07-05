<?php namespace Usuarios\Entities;

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends \Eloquent implements UserInterface, RemindableInterface {
	protected $fillable = array('nombre','username','apellido', 'email', 'fuerza', 'id_perfil', 'dni', 'password','testigo');
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'usuarios';

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

	public $errors;
 
	public function isValid($data) {
		$rules = array( 'id_perfil'=>'exists:perfiles,id',
                        'email'    => 'required|email',
						'nombre'   => 'required|max:40',
						'username' => 'required|max:40|unique:usuarios,username,'.$this->id,
						'apellido' => 'required|max:40',
						'dni'      => 'required|numeric|unique:usuarios,dni,'.$this->id);


		$validator = \Validator::make($data, $rules);

		if ($validator -> passes()) {
			return true;
		}

		$this -> errors = $validator -> errors();

		return false;
	}
	public function isValidClave($data){
		
		$rules = array(
			"clave_old"=>"required",
			"clave_nueva"=>"required|min:6",
			"clave_confirma"=>"required|same:clave_nueva"
		);
		$validator = Validator::make($data, $rules);

		if ($validator -> passes()) {
			return true;
		}

		$this -> errors = $validator -> errors();

		return false;
		
	}
    public function getNombreAttribute($value){
        return ucfirst($value);
    }
    public function getApellidoAttribute($value){
        return ucfirst($value);
    }

}
