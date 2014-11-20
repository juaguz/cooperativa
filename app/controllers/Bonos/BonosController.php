<?php
use Comercios\Repositories\ComerciosRepo;
use Bonos\Managers\BonoManager;
use Bonos\Repositories\BonoRepo;
use Socios\Repositories\SociosRepo;

class BonosController extends BaseController {


    /**
     * @var SociosRepo
     */
    private $sociosRepo;
    /**
     * @var ComerciosRepo
     */
    private $comerciosRepo;
    /**
     * @var BonoRepo
     */
    private $bonoRepo;

    function __construct(SociosRepo $sociosRepo, ComerciosRepo $comerciosRepo, BonoRepo $bonoRepo)
    {
        $this->sociosRepo = $sociosRepo;
        $this->comerciosRepo = $comerciosRepo;
        $this->bonoRepo = $bonoRepo;
    }

    public function  index(){

        $busqueda = Input::except('page');

        //$bonos = $this->bonoRepo->all();
        $bonos   = $this->bonoRepo->buscar($busqueda)->paginate(15);
        return View::make('bonos.index',compact("bonos","busqueda"));
    }

    public function create(){

        $form_data = array('route' => 'bonos.store', 'method' => 'POST');

        list($socios, $comercios) = $this->getCombos();

        return View::make('bonos.create',compact("form_data","socios","comercios"));

    }


    public function store(){

        $data = Input::all();
        $bonoRepo = $this->bonoRepo->newBono();
        $bonoManager = new  BonoManager($bonoRepo,$data);
        $bonoManager->save();
        return Redirect::route('bonos.edit',$bonoRepo->id)->with('mensaje_exito',"Bono Creada Correctamente.");

    }


    public function edit($id){
        $bono = $this->bonoRepo->find($id);
        $form_data = array('route' => ['bonos.update',$id], 'method' => 'PUT');//bueno, gracias!teamo
        list($socios, $comercios) = $this->getCombos();
        return View::make('bonos.create',compact("form_data","socios","comercios","bono"));

    }

    /**
     * @return array
     */
    public function getCombos()
    {
        $socios = $this->sociosRepo->getComboNroLegajo();

        $comercios = $this->comerciosRepo->getComboComercio();
        return array($socios, $comercios);
    }


    public function getBono(){
        $idBono = Input::get('id_bono');
        $bono = $this->bonoRepo->getBono($idBono);
        $bono = $bono[0];
        $data = [
            "tipo_comprobante"=>'Bono',
            "idComprobante"=>$bono->id,
            "fecha"=>$bono->created_at,
            "contenido"=>View::make('bonos.bono',
                compact("bono")

            )->render()
        ];
        return OrdenesPago::render($data); //ordenes de pago sirve para hacer el render de todos los comprobantes se deberia llamar Comprobante

    }

    public function editsfsdf($id)
    {

        $bono            = $this->bonoRepo->find($id);
        $form_data       = array('route' => array('bonos.update',$id), 'method' => 'PATCH','id'=>'form_factura','novalidate'=>'novalidate');
        $action          = 'Cargar';
        return View::make("recibos.create",compact("form_data","action","bono"));
    }


    public function update($id)
    {
        $data = Input::all();
        $bono = $this->bonoRepo->find($id);

        $bonoManager = new BonoManager($bono,$data);
        $bonoManager->save();
        return Redirect::route('bonos.edit',$bono->id)->with('mensaje_exito',"Bono Editado Correctamente.");
    }

} 