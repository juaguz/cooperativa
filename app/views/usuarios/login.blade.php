<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <!-- <link href="bootstrap/css/bootstrap.css" rel="stylesheet"> -->
    {{ HTML::style('bootstrap/bootstrap/css/bootstrap.css', array('media' => 'screen')) }}

    <!-- Font Awesome -->
    <!-- <link href="css/font-awesome.min.css" rel="stylesheet"> -->
    {{ HTML::style('bootstrap/css/font-awesome.min.css', array('media' => 'screen')) }}
    <!-- Endless -->
    <!-- <link href="css/endless.min.css" rel="stylesheet">-->
    {{ HTML::style('bootstrap/css/endless.min.css', array('media' => 'screen')) }}

    <style type="text/css">
        body {
            border-bottom: 1px solid #0d3f87;
            background: -webkit-gradient(linear, left top, left bottom, from(#4ca4d6), to(#0a4aa8)) fixed;
        }

        .text-success {
            color: #fff;
            font-size: 22px;
        }

        .pull-left {
            font-size: 20px;
        }

        .panel {
            width: 350px;
            padding: 10px 40px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 7px;
            -webkit-box-shadow: 1px 0px 10px 10px rgba(0, 0, 0, 0.1);
            -moz-box-shadow: 1px 0px 10px 10px rgba(0, 0, 0, 0.1);
            box-shadow: 1px 0px 10px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-sm, .btn-group-sm > .btn {
            padding: 5px 15px;
            font-size: 12px;
            line-height: 1.5;
            border-radius: 3px;
        }

        h2 {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        hr {
            margin: 10px 0;
        }

    </style>

</head>

<body>
<div class="login-wrapper">
    <div class="text-center">
        <img src="{{ URL::asset('bootstrap/images/login-logo_03.png')}}" class="fadeInUp animation-delay9">
    </div>
    <div class="text-center">
        <h2 class="fadeInUp animation-delay8" style="font-weight:bold">
            <span class="text-success">S.I.R.J</span>
            <br>
            <span class="text-success">Sistema Integrado De Requerimientos Judiciales</span>
        </h2>
    </div>
    <div class="login-widget animation-delay1">
        <div class="panel panel-default">
            <div class="panel-heading clearfix">
                <div class="pull-left">
                    <i class="fa fa-lock fa-lg"></i> Login
                </div>
            </div>
            <div class="panel-body">
                {{ Form::open(array('url' => '/login','class'=>'form-signin','role'=>'form')) }}
                <div class="form-group">
                    <label>Nombre de Usuario</label>
                    {{ Form::text('username', null, array('placeholder' => 'Usuario', 'class' =>
                    'form-control','required'=>'required','autocomplete'=>'off')) }}
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    {{ Form::password('password',array('placeholder' => 'Clave', 'class' => 'form-control','autocomplete'=>'off')) }}
                </div>

                <button class="btn btn-primary btn-sm bounceIn animation-delay5 pull-right"><i class="fa fa-sign-in"></i> Ingresar</button>
                <!-- @{{ Form::submit('Ingresar »',array("class"=>"btn btn-primary btn-sm bounceIn animation-delay5 login-link pull-right" )) }} -->

                {{ Form::close(); }}


            </div>
            @if(Session::has('mensaje_error'))
            {{ Session::get('mensaje_error') }}
            @endif
        </div>
        <!-- /panel -->
    </div>
    <!-- /login-widget -->
    <div class="text-center">
        <h2 class="fadeInUp animation-delay8" style="font-weight:bold">
            <span
                class="text-success">Secretaría de Cooperación con los Poderes Judiciales, Ministerios Públicos y Legislaturas</span>
        </h2>
    </div>
</div>
<!-- /login-wrapper -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- Jquery -->
<!-- <script src="js/jquery-1.10.2.min.js"></script> -->
{{ HTML::script('assets/js/jquery.js') }}

<!-- Bootstrap -->
<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
{{ HTML::script('bootstrap/bootstrap/js/bootstrap.min.js') }}
<!-- Modernizr -->
<!-- <script src='js/modernizr.min.js'></script> -->
{{ HTML::script('bootstrap/js/modernizr.min.js') }}

<!-- Pace -->
<!-- <script src='js/pace.min.js'></script> -->
{{ HTML::script('bootstrap/js/pace.min.js') }}
<!-- Popup Overlay -->
<!-- <script src='js/jquery.popupoverlay.min.js'></script> -->
{{ HTML::script('bootstrap/js/jquery.popupoverlay.min.js') }}
<!-- Slimscroll -->
<!-- <script src='js/jquery.slimscroll.min.js'></script>-->
{{ HTML::script('bootstrap/js/jquery.slimscroll.min.js') }}
<!-- Cookie -->
<!-- <script src='js/jquery.cookie.min.js'></script>-->
{{ HTML::script('bootstrap/js/jquery.cookie.min.js') }}
<!-- Endless -->
<!-- <script src="js/endless/endless.js"></script>-->
{{ HTML::script('bootstrap/js/endless/endless.js') }}

</body>
</html>
