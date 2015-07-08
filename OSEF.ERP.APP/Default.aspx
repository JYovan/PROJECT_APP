<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OSEF.ERP.APP.Default" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width" />
    <title>Revisiones de obra</title>
    <link rel="shortcut icon" href="images/myApp.ico" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/demo.css" /> 
    <%Response.WriteFile("Header.htm");%>
    <script type="text/javascript" src="js/libs/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="js/default.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmDefault" runat="server" HideInDesign="true" />
        <ext:Store ID="sUsuario" runat="server">
            <Model>
                <ext:Model ID="mUsuario" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Correo" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="APaterno" Type="String" />
                        <ext:ModelField Name="AMaterno" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="Bloqueado" Type="Boolean" />
                        <ext:ModelField Name="EnLinea" Type="Boolean" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="FechaBloqueo" Type="Date" />
                        <ext:ModelField Name="UltimoAcceso" Type="Date" />
                        <ext:ModelField Name="CambioContrasena" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>
            <DirectEvents>
                <Load OnEvent="sUsuario_Load" Success="sUsuario_Load_Success" />
            </DirectEvents>
        </ext:Store>

        <div id="wrap">
            <!-- Header -->
            <div id="nav-bar" class="">
                <div class="pull-left">
                    <div id="header-container">
                        <a href="Default.aspx"><img src="images/Ibuho.png" class="imgs" alt="logo" /></a>
                    </div>
                </div>
                <div class="pull-right">
                    <div id="top-info" class="pull-right">
                        <a id="settings" href="#" class="win-command pull-right">
                            <span></span>
                        </a>
                        <a id="logged-user" href="#" class="win-command pull-right">
                            <span></span>
                        </a>
                        <div class="pull-left">
                            <ext:Button 
                                ID="btnUsuario"
                                runat="server"
                                Width="290"
                                Text=""
                                Cls="xBtnCustomDesplegable">
                                <Menu>
                                    <ext:Menu ID="mOpciones" runat="server">
                                        <Items>
                                            <ext:MenuItem ID="miConfiguracion" runat="server" Text="Configuración">
                                            </ext:MenuItem>
                                            <ext:MenuItem ID="miCambiarContrasena" runat="server" Text="Cambiar contraseña">
                                                <Listeners>
                                                    <Click Fn="miCambiarContrasena_Click" />
                                                </Listeners>
                                            </ext:MenuItem>
                                             <ext:MenuItem ID="miReportarProblema" runat="server" Text="Reportar un problema">
                                              <Listeners>
                                                <Click Handler=" window.open('http://200.57.115.237:81/support/open.php/','_blank');"></Click>
                                              </Listeners>
                                            </ext:MenuItem>
                                            <ext:MenuItem ID="miCerrarSesion" runat="server" Text="Cerrar sesión">
                                                   <Listeners>
                                                    <Click Fn="onLogOut"></Click>
                                                   </Listeners>
                                                   <DirectEvents>
                                                        <Click OnEvent="miCerrarSesionClick"></Click> 
                                                   </DirectEvents> 
                                            </ext:MenuItem> 
                                        </Items>
                                    </ext:Menu>
                                </Menu>
                            </ext:Button>
                        </div>
                    </div>
                </div>
                <!--Boton Regresar-->
                <ext:ImageButton
                    ID="imgbtnRegresar"
                    runat="server"
                    ImageUrl="assets/img/controles/btnRegresar.png"
                    OverImageUrl="assets/img/controles/btnRegresarOver.png"
                    PressedImageUrl="assets/img/controles/btnRegresarPressed.png" ToolTip="Regresar"
                    Height="50"
                    Width="50"
                    Hidden="true" 
                    StyleSpec="margin-left: 900px; margin-right: auto; margin-top:20px;">
                    <Listeners>
                        <Click Handler="
                            App.imgbtnRegresar.hide();
                            parent.App.pCentro.getLoader().load('Menu.aspx');">
                        </Click>
                    </Listeners>
                </ext:ImageButton>
                <!--Fin Boton Regresar-->               
            </div>

            <ext:Panel 
                ID="pCentro"
                runat="server"
                Height="480"
                Width="1280"
                Region="Center"
                StyleSpec="margin-left: 30px; margin-right: auto; margin-top:20px;"
                BodyStyle="background-color:transparent;"
                AutoRender="true"
                Cls="visible">
                <Loader
                    ID="lCentro"
                    runat="server"
                    Mode="Frame"
                    AutoLoad="true"
                    Scripts="true"
                    Url="Menu.aspx">
                    <LoadMask ShowMask="True" Msg="Cargando...">
                    </LoadMask>
                </Loader>
            </ext:Panel>
        </div>
        <%-- Footer--%>
        <div id="footer-menu">
            <div id="creditos" class="creditos-menu" >
                <p id="pcreditos">© 2014</p> 
            </div>
        </div>
        <%-- Footer--%>

        <ext:Window 
            ID="wEmergente"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="lEmergente" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>

        <ext:Window 
            ID="wAyudaConcepto"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="lAyudaConcepto" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>

        <ext:Window
            ID="wEmergenteGraficas"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader1" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>  

        <ext:Window 
            ID="wGenerador"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="0"
            Resizable="False"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader2" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
        </ext:Window>

        <ext:Window 
            ID="wNew"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="False"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader3" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
        </ext:Window>

        <ext:Window 
            ID="wUpdate"
            runat="server"
            Icon="ArrowRefresh"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="False"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader4" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
        </ext:Window>
        <ext:Window 
            ID="wReporte"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="False"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader5" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
        </ext:Window>
        
        <ext:Window 
            ID="wPrincipal"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader6" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader> 
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>
        
        <ext:Window 
            ID="wModulo"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader7" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader> 
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window> 
        
        <ext:Window 
            ID="wSubModulo"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader8" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader> 
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>
        
        <ext:Window 
            ID="wSubSubModulo"
            runat="server"
            Icon="ApplicationDouble"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader9" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader> 
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>
        
        <ext:Window 
            ID="wSubSubSubModulo"
            runat="server"
            Icon="ApplicationCascade"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader10" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader> 
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>

        
        <ext:Window 
            ID="wSubSubSubSubModulo"
            runat="server"
            Icon="ApplicationCascade"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader11" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader> 
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>

    </form>
</body>
</html>