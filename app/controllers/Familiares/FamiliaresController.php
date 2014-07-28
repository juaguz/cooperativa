<?php

use Combos\Repositories\TiposDocumentosRepo;
use Combos\Repositories\TiposSociosRepo;

use Combos\Repositories\SexosRepo;
use Combos\Repositories\SiNoRepo;
use Combos\Repositories\EstudiosRepo;
use Combos\Repositories\ParentezcosRepo;

use Familiares\Repositories\FamiliaresRepo;
use Familiares\Managers\FamiliaresManager;

use Socios\Repositories\SociosRepo;


class FamiliaresController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */

    protected $sociosRepo,$documentosRepo,$tiposSociosRepo,$sexosRepo,$siNoRepo,$estudiosRepo,$parentezcosRepo,$familiaresRepo;
    public function __construct(SociosRepo $sociosRepo,FamiliaresRepo $familiaresRepo,TiposDocumentosRepo $documentosRepo,TiposSociosRepo $tiposSociosRepo,SexosRepo $sexosRepo, SiNoRepo $siNoRepo,EstudiosRepo $estudiosRepo,ParentezcosRepo $parentezcosRepo){

        $this->familiaresRepo  = $familiaresRepo;
        $this->documentosRepo  = $documentosRepo;
        $this->tiposSociosRepo = $tiposSociosRepo;
        $this->sexosRepo = $sexosRepo;
        $this->siNoRepo = $siNoRepo;
        $this->estudiosRepo = $estudiosRepo;
        $this->parentezcosRepo = $parentezcosRepo;
        $this->sociosRepo = $sociosRepo;
    }



	public function index()
	{
		//

        $busqueda = Input::except('page');

        $familiares   = $this->familiaresRepo->buscar($busqueda);

        return View::make('familiares.listados',compact("familiares","busqueda"));

	}

    public function combos(){

        $tiposDocumentos = $this->documentosRepo->getComboTiposDocumentos();
        $tiposSocios     = $this->tiposSociosRepo->getComboTipoSocio();
        $sexos           = $this->sexosRepo->getComboSexo();
        $sino            = $this->siNoRepo->getComboSiNo();
        $estudios        = $this->estudiosRepo->getComboEstudio();
        $parentezcos     = $this->parentezcosRepo->getComboParentezco();

        return compact("tiposDocumentos","tiposSocios","sexos","sino","estudios","parentezcos");
    }


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create($idSocio)
	{
		//
        $form_data       = array('route' => array('familiares.store',$idSocio), 'method' => 'POST');
        $action          = 'Nuevo';
        $combos          = $this->combos();
        $socio           = $this->sociosRepo->find($idSocio);
        $nombre_socio    = $socio->nombre;
        $apellido_socio  = $socio->apellido;
        $id_socio         = $socio->id;
        return View::make("familiares.create",compact("form_data","action","nombre_socio","apellido_socio","id_socio")+$combos);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store($idSocio)
	{
		//

        $data  = Input::all();
        $familiar = $this->familiaresRepo->newFamiliar($idSocio);
        $familiarManager = new FamiliaresManager($familiar,$data);
        if($familiarManager->save()){
            return Redirect::route('familiares.edit',$familiar->id)->with('mensaje_exito',"Familiar Creado Correctamente.");

        }

        return Redirect::back()->withErrors($familiarManager->getErrors())->withInput();
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
        $form_data       = array('route' => ['familiares.update',$id], 'method' => 'PATCH');
        $action          = 'Editar';
        $combos          = $this->combos();
        $familiar        = $this->familiaresRepo->find($id);
        $socio           = $familiar->getSocio;
        $nombre_socio    = $socio->nombre;
        $apellido_socio  = $socio->apellido;
        $id_socio         = $socio->id;
        return View::make("familiares.create",compact("form_data","action","familiar","nombre_socio","apellido_socio","id_socio")+$combos);


	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
        $data  = Input::all();
        $familiar = $this->familiaresRepo->find($id);
        $familiarManager = new FamiliaresManager($familiar,$data);
        if($familiarManager->save()){
            return Redirect::route('familiares.edit',$familiar->id)->with('mensaje_exito',"Familiar Actualizado Correctamente.");

        }

        return Redirect::back()->withErrors($familiarManager->getErrors())->withInput();


	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}


}
