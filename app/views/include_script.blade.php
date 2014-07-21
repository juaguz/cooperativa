

<!-- javascript
================================================== -->
{{ HTML::script('assets/js/jquery.js') }}

<!-- Bootstrap -->
<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
{{ HTML::script('bootstrap/bootstrap/js/bootstrap.min.js') }}
<!-- Modernizr -->
<!-- <script src='js/modernizr.min.js'></script> -->
{{ HTML::script('bootstrap/js/modernizr.min.js') }}

{{ HTML::script('bootstrap/js/bootstrap-datepicker.min.js') }}

{{ HTML::script('bootstrap/js/bootstrap-timepicker.min.js') }}

{{ HTML::script('bootstrap/js/jquery.gritter.min.js') }}

<!-- Gritter -->




{{ HTML::script('bootstrap/js/modernizr.min.js') }}

<!-- Pace -->
<!-- <script src='js/pace.min.js'></script> -->
{{ HTML::script('bootstrap/js/pace.min.js') }}
<!-- Popup Overlay -->
<!-- <script src='js/jquery.popupoverlay.min.js'></script> -->
{{ HTML::script('bootstrap/js/jquery.popupoverlay.min.js') }}
<!-- <script src='js/jquery.slimscroll.min.js'></script>-->
{{ HTML::script('bootstrap/js/jquery.slimscroll.min.js') }}
<!-- Cookie -->
<!-- <script src='js/jquery.cookie.min.js'></script>-->
{{ HTML::script('bootstrap/js/jquery.cookie.min.js') }}
<!-- Endless -->
<!-- <script src="js/endless/endless.js"></script>-->
{{ HTML::script('bootstrap/js/endless/endless.js') }}



<script>
    $('.fecha').datepicker({
        "language":'es'
    });
</script>




{{ HTML::script('assets/js/notificaciones.js') }}
<!-- Datepicker -->




@yield('scripts')