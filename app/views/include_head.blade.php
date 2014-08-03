<!-- Head
================================================== -->
<!-- <link rel="shortcut icon" href="favicon.png"> -->
<!-- Bootstrap core CSS -->


<style>
    input[type="checkbox"]{
        opacity: 100 !important;
        margin-left:15px !important;
    }
</style>


{{ HTML::style('bootstrap/bootstrap/css/bootstrap.css', array('media' => 'screen')) }}
<!-- Font Awesome -->
{{ HTML::style('bootstrap/css/font-awesome.min.css', array('media' => 'screen')) }}
<!-- Pace -->
<!-- <link type="text/css" href="css/pace.css" rel="stylesheet"> -->
{{ HTML::style('bootstrap/css/pace.css', array('media' => 'screen')) }}
<!-- Endless -->
{{ HTML::style('bootstrap/css/endless.min.css', array('media' => 'screen')) }}
<!-- <link type="text/css" href="css/endless-skin.css" rel="stylesheet">-->
{{ HTML::style('bootstrap/css/endless-skin.css', array('media' => 'screen')) }}
<!-- minseg -->
<!-- <link type="text/css" href="css/style-minseg.css" rel="stylesheet"/> -->
{{ HTML::style('bootstrap/css/style-minseg.css', array('media' => 'screen')) }}{{ HTML::style('bootstrap/css/style-minseg.css', array('media' => 'screen')) }}
<!-- ./Head -->

<!-- Datepicker -->
<!-- <link href="css/datepicker.css" rel="stylesheet"/>-->

{{ HTML::style('bootstrap/css/datepicker.css', array('media' => 'screen')) }}

<!-- Timepicker -->
{{ HTML::style('bootstrap/css/bootstrap-timepicker.min.css', array('media' => 'screen')) }}

{{ HTML::style('bootstrap/css/gritter/jquery.gritter.css', array('media' => 'screen')) }}
{{ HTML::style('assets/css/select2.css', array('media' => 'screen')) }}
{{ HTML::style('assets/css/select2-bootstrap.css', array('media' => 'screen')) }}
{{ HTML::style('assets/css/style.css', array('media' => 'screen')) }}




<!-- Font Awesome -->
<!-- <link href="css/font-awesome.min.css" rel="stylesheet"> -->

<!-- Endless -->
<!-- <link href="css/endless.min.css" rel="stylesheet">-->




@yield('style')