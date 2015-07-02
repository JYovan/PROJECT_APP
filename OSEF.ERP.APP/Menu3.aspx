<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu3.aspx.cs" Inherits="OSEF.ERP.APP.Menu3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-responsive.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-icons.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-ui-light.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/demo.css" />
    <script type="text/javascript" src="js/libs/jquery-2.0.3.min.js"></script>
    <script type='text/javascript' src="js/menu-usuario.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <div id="wrap">
                <!-- Header -->
                <div class="metro panorama">
                    <div class="panorama-sections">
                        <!-- Primer pagina  Procesos -->
                        <div class="panorama-section">
                            <h2>Procesos</h2>
                            <div class="tile-column-span-2">
                                <a class="tile widepeek" href="#" id="eRegistro">
                                    <div class="tile wide image">
                                        <img src="assets/img/revisiones.png" alt="revisiones" />
                                        <div class="text-header">Explorador de registro</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- Fin Primer pagina Procesos -->

                        <!-- Segunda página Configuración -->
                        <div class="panorama-section tile-span-4">
                            <h2>Configuración</h2>
                            <div class="tile-column-span-1">
                                <a class="tile squarepeek bg-color-purple" href="#" id="usuarios">
                                    <img src="assets/img/usuarios.png" alt="Usuarios" />
                                    <div class="text-inner">
                                        <div class="text4">Usuarios</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- Fin Segunda pagina Configuración -->
                    </div>
                </div>
                <a id="panorama-scroll-prev" href="#"> <img src="assets/img/controles/left-nav.png" height="22px" width="22px" class="scrollhr" alt="Next" /></a>
                <a id="panorama-scroll-next" href="#"> <img src="assets/img/controles/right-nav.png" height="22px" width="22px" class="scrollhr" alt="Next" /></a>
            </div>
        </div>
        <script type="text/javascript" src='assets/js/jquery-1.10.0.js'></script>
        <script type="text/javascript" src="assets/js/bootmetro-panorama.js"></script>
        <script type="text/javascript" src="assets/js/bootmetro-pivot.js"></script>
        <script type="text/javascript" src="assets/js/bootmetro-charms.js"></script>
        <script type="text/javascript" src="assets/js/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.touchSwipe.min.js"></script>
        <script type="text/javascript">
            $('.panorama').panorama({
                //nicescroll: false,
                showscrollbuttons: true,
                keyboard: true,
                parallax: true
            });

            //      $(".panorama").perfectScrollbar();

            $('#pivot').pivot();
        </script>
    </form>
</body>
</html>
