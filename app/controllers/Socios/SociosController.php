<?php

use Combos\Repositories\TiposDocumentosRepo;
use Combos\Repositories\TiposSociosRepo;

use Socios\Repositories\SociosRepo;
use Socios\Managers\SociosManager;

use Combos\Repositories\SexosRepo;
use Combos\Repositories\SiNoRepo;
use Combos\Repositories\EstudiosRepo;

class SociosController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
    protected $documentosRepo,$sociosRepo,$tiposSociosRepo,$sexosRepo,$siNoRepo,$estudiosRepo;
    public function __construct(TiposDocumentosRepo $documentosRepo,SociosRepo $sociosRepo,TiposSociosRepo $tiposSociosRepo,SexosRepo $sexosRepo, SiNoRepo $siNoRepo,EstudiosRepo $estudiosRepo){

        $this->documentosRepo  = $documentosRepo;
        $this->sociosRepo      = $sociosRepo;
        $this->tiposSociosRepo = $tiposSociosRepo;
        $this->sexosRepo = $sexosRepo;
        $this->siNoRepo = $siNoRepo;
        $this->estudiosRepo = $estudiosRepo;
    }


	public function index()
	{

        $busqueda = Input::except('page');

        $socios   = $this->sociosRepo->buscar($busqueda);

        return View::make('socios.listados',compact("socios","busqueda"));

	}



	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
     *
	 */

    public function combos(){

        $tiposDocumentos = $this->documentosRepo->getComboTiposDocumentos();
        $tiposSocios     = $this->tiposSociosRepo->getComboTipoSocio();
        $sexos           = $this->sexosRepo->getComboSexo();
        $sino            = $this->siNoRepo->getComboSiNo();
        $estudios        = $this->estudiosRepo->getComboEstudio();

        return compact("tiposDocumentos","tiposSocios","sexos","sino","estudios");
    }

	public function create()
	{
        $form_data       = array('route' => 'socios.store', 'method' => 'POST');
        $action          = 'Nuevo';
        $combos          = $this->combos();

        return View::make("socios.create",compact("form_data","action")+$combos);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{

        $data  = Input::all();
        $socio = $this->sociosRepo->newSocio();
        $socioManager = new SociosManager($socio,$data);
        if($socioManager->save()){
            return Redirect::route('socios.edit',$socio->id)->with('mensaje_exito',"Socio Creado Correctamente.");

        }

        return Redirect::back()->withErrors($socioManager->getErrors())->withInput();

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
        $form_data       = array('route' => ['socios.update',$id], 'method' => 'PATCH');
        $action          = 'Modificar';
        $combos          = $this->combos();
        $socio           = $this->sociosRepo->find($id);
        return View::make("socios.socio",compact("form_data","action","socio")+$combos);
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

        $data  = Input::all();
        $socio = $this->sociosRepo->find($id);
        $socioManager = new SociosManager($socio,$data);
        if($socioManager->save()){
            return Redirect::route('socios.edit',$socio->id)->with('mensaje_exito',"Socio Actualizado Correctamente.");

        }

        return Redirect::back()->withErrors($socioManager->getErrors())->withInput();





	}

    public function exportarExcel(){

        $socios  = $this->sociosRepo->all();



        Excel::create('Socios', function($excel) use($socios) {

            $excel->sheet('Sheetname', function($sheet) use($socios) {

                $sheet->loadView('socios.listado_excel',compact("socios"));




            });

        })->export('xls');

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
