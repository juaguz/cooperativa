
@if ( (isset($fotos) ) and (!empty($fotos)) )
<div class="panel panel-info">
    <div class="panel-heading">Fotografías Cargadas</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-10">
                @foreach ($fotos as $foto)
                    <img src="{{ URL::asset($foto->path)  }}" alt="..." class="img-thumbnail" width="120" height="120">
                @endforeach
            </div>
        </div>
        <div class="row" style="margin-top: 5px">
            <div class="col-md-10">
                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target=".myModal">
                    Ampliar Fotografias
                </a>
            </div>
        </div>
    </div>
</div>
<div class="modal fade modal fade bs-example-modal-lg myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 100%!important">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Fotografías</h4>
            </div>
            <div class="modal-body">

                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->


                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        @foreach ($fotos as $foto)
                            <div class="item-active">
                                <img src="{{ URL::asset($foto->path)  }}" alt="..." width="100%">

                            </div>
                        @endforeach

                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
@endif