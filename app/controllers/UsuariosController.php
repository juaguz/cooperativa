<?php

use Usuarios\Entities\User;
use Usuarios\Entities\Perfiles;


class UsuariosController extends BaseController {




	function index() {

		//echo "hola";
		
		$user = DB::table("usuarios")->join("perfiles","perfiles.id","=","usuarios.id_perfil")->select("usuarios.id","usuarios.id_perfil","nombre","dni","perfiles.perfil as perfil","apellido","email")->get();
		
		return View::make("usuarios.listados", array('users' => $user));
	}

	function create() {

		$user = new User;

		$perfiles = Perfiles::all() -> lists('perfil', 'id');
		return View::make("usuarios.create", array('user' => $user,  'perfiles' => $perfiles));
	}

	public function show($id) {
		$user = User::find($id);
		if (is_null($user)) {
			App::abort(404);
		}

		$perfiles = Perfiles::all() -> lists('perfil', 'id');

		return View::make("usuarios.create", array('user' => $user,  'perfiles' => $perfiles));

	}

	public function update($id) {
		$user = User::find($id);
		if (is_null($user)) {
			App::abort(404);
		}

		// Obtenemos la data enviada por el usuario
		$data = Input::all();

		// Revisamos si la data es válido
		if ($user -> isValid($data)) {
			// Si la data es valida se la asignamos al usuario
			$user -> fill($data);
			// Guardamos el usuario
			$user -> save();
			// Y Devolvemos una redirección a la acción show para mostrar el usuario
			return Redirect::route('usuarios.show', array($user -> id));
		} else {
			// En caso de error regresa a la acción edit con los datos y los errores encontrados
			return Redirect::route('usuarios.show', $user -> id) -> withInput() -> withErrors($user -> errors);
		}

	}

	public function validarDni() {
		if (Request::ajax()) {// it's an ajax request

			$input = Input::all();
			$usuarios = DB::table('usuarios') -> where('dni', '=', $input['dni']) -> get();

			if (count($usuarios)) {
				$response['respuesta'] = true;
			} else {
				$response['respuesta'] = false;
			}
			return json_encode((object)$response);
		}
	}
	function store() {

		$user = new User;

		$data = Input::all();

		// Revisamos si la data es válido
		if ($user -> isValid($data)) {
			$data['password'] = Hash::make('admin');
			// Si la data es valida se la asignamos al usuario
			$user -> fill($data);
			// Guardamos el usuario
			$user -> save();
			// Y Devolvemos una redirección a la acción show para mostrar el usuario
			return Redirect::route('usuarios.index');
		} else {
			// En caso de error regresa a la acción create con los datos y los errores encontrados
			return Redirect::route('usuarios.create') -> with('user', $user) -> withInput() -> withErrors($user -> errors);
		}

	}


	function comprobarUsuario() {
		if (Request::ajax()) {// it's an ajax request
			echo Auth::user() -> testigo;
		}
	}

	function getCambiarClave() {

		return View::Make("usuarios.cambiar_clave") -> with("clave", null);
	}

	function postCambiarClave() {
		$user = new User;
		$data = Input::all();
		// Revisamos si la data es válido
		if ($user -> isValidClave($data)) {
			$user = $user -> find(Auth::user() -> id);
			$clave_old = $data['clave_old'];
			$clave_nueva = $data['clave_nueva'];
			if (Hash::check($clave_old, $user -> getAuthPassword())) {
				$user -> password = Hash::make($clave_nueva);
				if ($user -> save()) {
					return Redirect::to('custodias/custodias') -> with('global', 'Se cambio tu clave');
				}
			} else {

				return View::Make("usuarios.cambiar_clave") -> with("clave", null) -> with("mensa", "La Clave No Es Correcta");
			}
		} else {
			// En caso de error regresa a la acción create con los datos y los errores encontrados

			return Redirect::to('usuarios/clave') -> with('user', $user) -> withInput() -> withErrors($user -> errors);
		}

	}

	

}
?>