<!-- Modal -->
<div class="modal fade " id="modalRecibo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Recibo</h4>
            </div>
            <div class="modal-body" id="cuerpoRecibo">

            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-success imprimir_comprobante" data-url="{{route('recibos.imprimir')}}"><i class="fa fa-print"></i> Imprimir</button>
            </div>
        </div>
    </div>
</div>