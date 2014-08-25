<?php

use Circulos\Repositories\CirculosRepo;
use Circulos\Repositories\CirculosSociosRepo;
use Circulos\Managers\CirculosManager;
use Socios\Repositories\SociosRepo;

class CirculosController extends \BaseController {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    protected $circulosRepo;
    protected $circulosSociosRepo;
    protected $sociosRepo;


    public function __construct(CirculosRepo $circulosRepo, CirculosSociosRepo $circulosSociosRepo,SociosRepo $sociosRepo){

        $this->circulosRepo       = $circulosRepo;
        $this->circulosSociosRepo = $circulosSociosRepo;
        $this->sociosRepo         = $sociosRepo;

    }


    public function index()
    {
        //

        $busqueda = Input::except('page');

        $circulos   = $this->circulosRepo->buscar($busqueda);

        return View::make('circulos.listados',compact("circulos","busqueda"));

    }


    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //

        $form_data       = array('route' => 'circulos.store', 'method' => 'POST','id'=>'circuloFrm');
        $action          = 'Nuevo';

        return View::make("circulos.create",compact("form_data","action"));

    }


    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store()
    {
        //

        $data  = Input::all();
        $circulo = $this->circulosRepo->newCirculo();
        $circuloManager = new CirculosManager($circulo,$data);
        if($circuloManager->save()){
            return Redirect::route('circulos.edit',$circulo->id)->with('mensaje_exito',"Circulo creado Correctamente.");

        }

        return Redirect::back()->withErrors($circuloManager->getErrors())->withInput();

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
        $form_data       = array('route' => ['circulos.update',$id], 'method' => 'PATCH','id'=>'circuloFrm');
        $action          = 'Modificar';
        $circulo         = $this->circulosRepo->find($id);
        return View::make("circulos.create",compact("form_data","action","circulo"));
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
        $circulo  = $this->circulosRepo->find($id);
        $circuloManager = new CirculosManager($circulo,$data);
        if($circuloManager->save()){
            return Redirect::route('circulos.edit',$circulo->id)->with('mensaje_exito',"Circulo actualizado Correctamente.");

        }

        return Redirect::back()->withErrors($circuloManager->getErrors())->withInput();

    }

    public function getTablaCirculo(){

        $idCirculo = Input::get("id_circulo");
        $socios = $this->circulosSociosRepo->where("id_circulo",$idCirculo);
        return View::make('circulos.tablaSociosCirculo',compact("socios"));


    }

    public function getTabla(){

       $cantSocios = Input::get("cantidad_socios",false);
       $socios     = $this->sociosRepo->getComboNroLegajo();
       return View::make('circulos.tablaSocios',compact("cantSocios","socios"));


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

    public function exportarExcel(){

        $circulos  = $this->circulosRepo->all();



        Excel::create('Circulos', function($excel) use($circulos) {

            $excel->sheet('Sheetname', function($sheet) use($circulos) {

                $sheet->loadView('circulos.listado_excel',compact("circulos"));




            });

        })->export('xls');

    }


}
