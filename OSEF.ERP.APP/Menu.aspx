<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Menu" %>

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

                        <!-- Primer pagina  Programa -->
                        <div class="panorama-section">
                            <h2>Programa</h2>

                            <div class="tile-column-span-2">
                            
                            <div id="Avances">
                                 <a class="tile widepeek" id="avances" href="#">
                                    <div class="tile wide image">
                                        <img src="assets/img/revisiones.png" alt="Revisiones" />
                                        <div class="text-header">Avances</div>
                                    </div>
                                </a>
                             </div>

                             <div id="pObra">
                                 <a class="tile square image bg-color-yellow" id="gantt" href="#">
                                        <img src="assets/img/menu-gantt.png" alt="Gantt" />
                                        <div class="textover-wrapper transparent">
                                            <div class="text2">Programa Obra</div>
                                        </div>
                                  </a>
                              </div>
                              <div id="Monitor">
                                 <a class="tile square image bg-color-green" id="lPlantas" 
                                 href="" target="_blank">
                                    <img src="assets/img/menu-preciariosG.png" alt="Gantt" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Monitor</div>
                                    </div>
                                </a>
                               </div>
                            </div>  
                        </div>
                        <!-- Fin Primer pagina  -->

                        <!-- segunda pagina  Procesos -->
                        <div class="panorama-section">
                            <h2>Procesos</h2>
                            <div class="tile-column-span-2">
                              

                                <a class="tile wide imagetext wideimage bg-color-fucsia" id="volumetrias" href="#">
                                    <img src="assets/img/menu-volumetria.png" alt="Volumetrías" class="img-large" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Volumetrías Preciario</div>
                                    </div>
                                </a>
                                 <a class="tile wide imagetext wideimage bg-color-darken" id="ordenesCambio" href="#">
                                    <img src="assets/img/menu-cambio.png" alt="Gantt" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Ordenes de Cambio</div>
                                    </div>
                                </a>

                               <%-- tile square square bg-color-purple--%>
                                 <a class="tile wide imagetext wideimage bg-color-purple" href="#" id="OrdenesEstimaciones">
                                    <img src="assets/img/menu-mnto.png" alt="Ordenes & Estimaciones" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text4">Mantenimiento</div>
                                    </div>
                                </a>

                            </div>
                       

                            <div class="tile-column-span-2">
                                <a class="tile wide imagetext wideimage bg-color-green" id="exploradorPreciarioConcepto" href="#">
                                    <img src="assets/img/Search.png" alt="Explorador" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Explorador Preciario Concepto Voumetrias</div>
                                    </div>
                                </a>
                                
                                <a class="tile wide imagetext wideimage bg-color-red" id="exploradorPreciarioConceptosGenerales" href="#">
                                    <img src="assets/img/Search.png" alt="Explorador Ordenes Estimaciones" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Explorador Ordenes de Cambio</div>
                                    </div>
                                </a>
                                
                                  <a class="tile wide imagetext wideimage bg-color-orange" id="MesaDeReporte" href="#">
                                    <img src="assets/img/Search.png" alt="Explorador" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Explorador de Mantenimiento</div>
                                    </div>
                                </a> 
                              

                            </div>
                            
                            <%--<div class="tile-column-span-1">
                                <a class="tile wide imagetext wideimage bg-color-orange" id="MesaDeReporte" href="#">
                                    <img src="assets/img/Search.png" alt="Explorador" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Explorador Mesa de Reporte</div>
                                    </div>
                                </a> 
                            </div>--%>
                        </div>
                        <!-- Fin segunda pagina Procesos -->

                        <!-- tercera pagina Catálogos -->
                        <div class="panorama-section">
                            <h2>Catálogos</h2>
                            <div class="tile-column-span-2">                            
                                <a class="tile wide imagetext wideimage bg-color-blue" id="categorias" href="#">
                                    <img src="assets/img/categorias.png" alt="Categorías" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Categorías</div>
                                    </div>
                                </a>
                            
                                <a class="tile wide imagetext wideimage bg-color-green" id="subcategorias" href="#">
                                    <img src="assets/img/subcategorias.png" alt="Sub Categorías" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Subcategorías</div>
                                    </div>
                                </a>

                              
                                
                                 <a class="tile square bg-color-purple" href="#" id="clientes">
                                    <img src="assets/img/Menu-Clientes.png" alt="Clientes" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Clientes</div>
                                    </div>
                                </a>
                            </div>
                            <div class="tile-column-span-1">
                                <a class="tile squarepeek bg-color-orange" href="#" id="conceptos">
                                   <img src="assets/img/conceptos.png" alt="Conceptos" />
                                    <div class="text-inner">
                                        <div class="text4">Conceptos</div>
                                    </div>
                                </a>
                            </div>
                            <%--  Division Extra--%>
                            <div class="tile-column-span-2">
                               
                                <a class="tile square image" id="estados" href="#">
                                    <img src="assets/img/edos.png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Estados</div>
                                    </div>
                                </a>

                                 <a class="tile square image bg-color-red" id="municipios" href="#">
                                    <img src="assets/img/municipio.png" alt="Municipios" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Municipios</div>
                                    </div>
                                </a>

                                 <a class="tile wide imagetext wideimage bg-color-darkgreen" id="preciarios" href="#">
                                    <img src="assets/img/menu-preciarios.png" alt="Preciarios" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Preciarios Sucursales</div>
                                    </div>
                                </a>


                                <a class="tile square image bg-color-blueDark" id="cuadrillas" href="#">
                                    <img src="assets/img/menu-cuadrillas.png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Cuadrillas</div>
                                    </div>
                                </a>

                                 <a class="tile square image bg-color-darken" id="CodigoFallas" href="#">
                                    <img src="assets/img/menu-codigofalla.png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Codigos PPTA</div>
                                    </div>
                                </a>

                            </div>
                            <div class="tile-column-span-1">
                                
                                <a class="tile square image bg-color-fucsia" id="colonias" href="#">
                                    <img src="assets/img/menu-colonias.png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Colonias</div>
                                    </div>
                                </a> 
                                
                                
                                   <a class="tile square imagetext image bg-color-green" id="preciariosGenerales" href="#">
                                    <img src="assets/img/menu-preciariosG.png" alt="Preciarios" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Preciarios Generales</div>
                                    </div>
                                </a>

                               

                            </div>


                            <div class="tile-column-span-1">
                                <a class="tile square image bg-color-yellow" id="codigospostales" href="#">
                                    <img src="assets/img/postal.png" alt="Códigos Postales" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Códigos Postales</div>
                                    </div>
                                </a>

                            
                            </div>


                        </div>
                        <!-- Fin tercera pagina Catálogos -->

                        <!-- 4ta pagina Reportes -->
                        <div class="panorama-section tile-span-4">
                            <h2>Configuración</h2>

                           <%-- <div class="tile-column-span-2">
                                <a class="tile wide imagetext wideimage bg-color-red"  id="gruposMenu" href="#">
                                    <img src="assets/img/groupsMenu.png" alt="Grupos Menú" />
                                    <div class="textover-wrapper  transparent">
                                        <div class="text2">Grupos Menú</div>
                                    </div>
                                </a>
                        
                                <a class="tile wide imagetext wideimage bg-color-green" id="menus" href="#">
                                    <img src="assets/img/Menus.png" alt="Menú" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Menú</div>
                                    </div>
                                </a> 
                                                     
                            </div>--%>

                          


                            <div class="tile-column-span-1">
                                 <a class="tile squarepeek bg-color-purple" href="#" id="usuarios">
                                    <img src="assets/img/usuarios.png" alt="Usuarios" />
                                    <div class="text-inner">
                                        <div class="text4">Usuarios</div>
                                    </div>
                                </a>
                                  <a class="tile square bg-color-red" id="proveedores" href="#">
                                    <img src="assets/img/provedores.png" alt="proveedores" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Proveedor</div>
                                    </div>
                                </a>
                            </div>


                        </div>
                        <!-- Fin 4ta pagina Reportes -->
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