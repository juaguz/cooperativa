<?php

use Usuarios\Managers\UsuariosManager;


use Usuarios\Repositories\PerfilesRepo;
use Usuarios\Repositories\UsuariosRepo;
use Combos\Repositories\TiposDocumentosRepo;


/*<?php
    if ($user->exists):
        $form_data = array('route' => array('usuarios.update', $user->id), 'method' => 'PATCH');
        $action    = 'Editar';
    else:

    endif;

?>
*/
class UsuariosController extends BaseController {

    protected $perfilesRepo,$documentosRepo,$usuariosRepo;

    function  __construct(PerfilesRepo $perfilesRepo,TiposDocumentosRepo $documentosRepo,UsuariosRepo $usuariosRepo){

        $this->perfilesRepo   = $perfilesRepo;
        $this->documentosRepo = $documentosRepo;
        $this->usuariosRepo   = $usuariosRepo;

    }


	function index() {

        $users = $this->usuariosRepo->all();

		return View::make("usuarios.listados",compact("users"));
	}

	function create() {

        $form_data       = array('route' => 'usuarios.store', 'method' => 'POST');
        $action          = 'Crear';
        $perfiles        = $this->perfilesRepo->getCombosPerfil();
        $tiposDocumentos = $this->documentosRepo->getComboTiposDocumentos();

		return View::make("usuarios.create",compact("form_data","action","perfiles","tiposDocumentos"));
	}

	public function show($id) {

        $user            = $this->usuariosRepo->find($id);
        $form_data       = array('route' => array('usuarios.update', $user->id), 'method' => 'PATCH');
        $action          = 'Crear';
        $perfiles        = $this->perfilesRepo->getCombosPerfil();
        $tiposDocumentos = $this->documentosRepo->getComboTiposDocumentos();

        return View::make("usuarios.create",compact("form_data","action","perfiles","tiposDocumentos","user"));

	}

	public function update($id) {
        $data                = Input::all();
        $usuarios            = $this->usuariosRepo->find($id);
        $usuariosManager     = new UsuariosManager($usuarios,$data);

        if($usuariosManager->save()){
            return Redirect::route('usuarios.create');
        }

        return Redirect::back()->withErrors($usuariosManager->getErrors())->withInput();


	}


	function store() {

        $data     = Input::all();
        $usuarios = $this->usuariosRepo->newUsuariosRepo();
        $usuariosManager = new UsuariosManager($usuarios,$data);

        if($usuariosManager->save()){
           return Redirect::route('usuarios.create');
        }

        return Redirect::back()->withErrors($usuariosManager->getErrors())->withInput();




	}




	function getCambiarClave() {


	}

	function postCambiarClave() {


	}

	

}
?>