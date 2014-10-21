<html>
<head>
<style>
#imagen_bono{
	background-image:url({{URL::to('bootstrap/images/bonos.jpg')}});
	width:847px;
	height:293px;
}
#texto{
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
	margin-left:330px;
	margin-top:20px;
}

</style>

</head>

<body>
<div id="imagen_bono">
	<div id="texto">
	<br /><br />
		{{$tipo_comprobante}}:N°{{$idComprobante}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;{{$fecha}}<br>
		{{$contenido}}
	</div>
</div>
</body>
</html>
