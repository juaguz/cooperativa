<?php
use Comercios\Repositories\ComerciosRepo;
use OrdenesCompras\Managers\OrdenCompraManager;
use OrdenesCompras\Repositories\OrdenCompraRepo;
use Socios\Repositories\SociosRepo;

class OrdenesComprasController extends BaseController {


    /**
     * @var SociosRepo
     */
    private $sociosRepo;
    /**
     * @var ComerciosRepo
     */
    private $comerciosRepo;
    /**
     * @var OrdenCompraRepo
     */
    private $ordenCompraRepo;

    function __construct(SociosRepo $sociosRepo, ComerciosRepo $comerciosRepo, OrdenCompraRepo $ordenCompraRepo)
    {
        $this->sociosRepo = $sociosRepo;
        $this->comerciosRepo = $comerciosRepo;
        $this->ordenCompraRepo = $ordenCompraRepo;
    }

    public function  index(){
        $ordenes = $this->ordenCompraRepo->all();
        return View::make('ordenes_compras.index',compact("ordenes"));
    }

    public function create(){

        $form_data = array('route' => 'ordenes.compras.store', 'method' => 'POST');

        list($socios, $comercios) = $this->getCombos();

        return View::make('ordenes_compras.create',compact("form_data","socios","comercios"));

    }


    public function store(){

        $data = Input::all();
        $ordenRepo = $this->ordenCompraRepo->newOrden();
        $ordenManager = new  OrdenCompraManager($ordenRepo,$data);
        $ordenManager->save();
        return Redirect::route('ordenes.compras.edit',$ordenRepo->id)->with('mensaje_exito',"Venta Creada Correctamente.");

    }


    public function edit($id){
        $orden = $this->ordenCompraRepo->find($id);
        $form_data = array('route' => 'ordenes.compras.update', 'method' => 'PUT');
        list($socios, $comercios) = $this->getCombos();
        return View::make('ordenes_compras.create',compact("form_data","socios","comercios","orden"));

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


    public function getOrdenCompra(){
        $idOrden = Input::get('id_orden');
        $orden = $this->ordenCompraRepo->getOrden($idOrden);
        $orden = $orden[0];
        $data = [
            "tipo_comprobante"=>'Orden de Compra',
            "idComprobante"=>$orden->id,
            "fecha"=>$orden->created_at,
            "contenido"=>View::make('ordenes_compras.orden_compra',
                compact("orden")

            )->render()
        ];
        return OrdenesPago::render($data);

    }

} 