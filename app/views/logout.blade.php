<!-- Logout confirmation -->
<div class="custom-popup width-100" id="logoutConfirm">
    <div class="padding-md" style="margin-top:20px;">
        <h4 class="m-top-none" style="color: white">¿Desea cerrar la sesión?</h4>
    </div>
    <div class="text-center" style="padding-bottom:40px;">
        <a class="btn btn-success m-right-sm" href="{{ URL::to('logout') }}" style="width:90px">Salir</a>
        <a class="btn btn-danger logoutConfirm_close" style="width:90px">Cancelar</a> </div>
</div>
<!-- /Logout confirmation -->