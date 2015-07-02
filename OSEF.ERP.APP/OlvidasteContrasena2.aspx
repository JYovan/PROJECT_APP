<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OlvidasteContrasena2.aspx.cs" Inherits="OSEF.ERP.APP.OlvidasteContrasena2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>¿Olvidaste tu contraseña?</title>
    <link rel="shortcut icon" href="images/myApp.ico" />
    <link rel="stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
    <link rel="stylesheet" href="css/xMask.css" />
    <link rel="stylesheet" href="css/xDatePicker.css" />
    <link rel="stylesheet" href="css/xSplitButton.css" />
    <link rel="stylesheet" href="css/xGridPanel.css" />
    <link rel="stylesheet" href="css/xWindowPopup.css" />
    <link rel="stylesheet" href="css/xTabPanel.css"/>
    <link rel="stylesheet" href="css/xComboBox.css"/>
    <link rel="stylesheet" href="css/xCustomChart.css"/>
    <link rel="stylesheet" href="css/xIcons.css"/>
    <link rel="stylesheet" href="css/xToolbar.css"/>
    <link rel="stylesheet" href="css/xLabel.css"/>
    <link rel="stylesheet" href="css/xTreePanel.css"/>
    <link rel="stylesheet" href="css/xHiperlink.css"/>
    <link rel="stylesheet" href="css/xTextField.css"/>
    <link rel="stylesheet" href="css/xFieldSet.css"/>
    <link rel="stylesheet" href="css/xPanel.css"/>
    <link rel="stylesheet" href="css/xButton.css"/>
    <link rel="stylesheet" href="css/metroButtons.css"/>
    <link rel="stylesheet" href="css/xCustomFormPanel.css"/>
    <script type="text/javascript" src="js/olvidarContrasena.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmOlvidoContraseña" runat="server" HideInDesign="true" />
        
        <img src="images/logo-banco3.png" alt="logo" class="imgs logo-image" />

        <ext:Container
            ID="cCorreoEnviado"
            runat="server"
            Hidden="true"
            HideMode="Display">
            <Content>
                <div id="msg" style="margin-top:190px;">
                <center><p style="font-size:16px !important;">Se le ha enviado un correo eléctronico para recuperar su contraseña.</p></center>
                <br>
                <center><a href="Login.aspx" class="m-btn green">Regresar</a></center>
                </div>
            </Content>
        </ext:Container>

        <ext:Container
            ID="cTodo"
            runat="server"
            StyleSpec=" margin-top: 120px;">
            <Content>
                <%--Panel de Error--%>
                <ext:Container
                    ID="cErrorOlvidasteContrasena"
                    runat="server"
                    Hidden="true" 
                    StyleSpec="margin:0 auto;">
                    <Content>
                        <table>
                            <tr>
                                <td>
                                    <img src="images/btnLogin_Adv.png" alt="img-error" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <ext:Label ID="lblError" runat="server" Text="Error, nombre de usuario o dirección incorrecta" />
                                </td>
                            </tr>
                        </table>
                    </Content>
                </ext:Container>
                <%-- Fin panel de error --%>
                <ext:FormPanel
                    ID="fpOlvidarContrasena"
                    runat="server"
                    Title="Restablecer Contraseña"
                    Width="450"
                    Hidden="false"
                    StyleSpec="margin:0 auto; "
                    BodyPadding="10"
                    DefaultAnchor="100%"
                    HideMode="Display">
                    <Items>
                        <ext:FieldContainer 
                            ID="ContenedorNombre"
                            runat="server"
                            FieldLabel="¿Olvidaste tu contraseña?"
                            AnchorHorizontal="100%"
                            LabelWidth="180"
                            Layout="HBoxLayout">
                        </ext:FieldContainer>
                        <ext:FieldSet
                            ID="fsInstrucciones"
                            runat="server"
                            Title="Instrucciones"
                            Collapsible="False"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:FieldContainer
                                    ID="fcIngresaUsuario"
                                    runat="server"
                                    LabelWidth="380"
                                    FieldLabel="Ingresa tu usuario o dirección de correo para restablecer tu contraseña"
                                    Layout="HBoxLayout">                        
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    ID="fcCorreo"
                                    runat="server" 
                                    FieldLabel=" Puede que tengas que ver en tu carpeta de spam o desbloquear no-reply@osef.com.mx" 
                                    Layout="HBoxLayout"
                                    LabelWidth="380">
                                </ext:FieldContainer>
                            </Items>
                        </ext:FieldSet>
                        <ext:TextField 
                            ID="txtfEnviarCorreo"
                            runat="server"
                            EmptyText="Usuario/Dirección E-mail"
                            AutoFocus="true">
                            <Listeners>
                                <SpecialKey Fn="txtffEnviarCorreo_SpecialKey_Click" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                    <Buttons>
                        <ext:ImageButton 
                            ID="imbtnLogin" 
                            runat="server" 
                            ImageUrl="assets/img/controles/EnviarNormal.png"
                            OverImageUrl="assets/img/controles/EnviarOver.png" 
                            PressedImageUrl="assets/img/controles/EnviarPressed.png"
                            ToolTip="Enviar" 
                            Width="50"
                            Height="50">
                            <DirectEvents>
                                <Click
                                    OnEvent="imbtnLogin_Click"
                                    Success="txtfEnviarCorreo_SpecialKey_Success">
                                    <ExtraParams>
                                        <ext:Parameter Name="dato" Value="App.txtfEnviarCorreo.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                    <EventMask ShowMask="true" MinDelay="1000" Msg="Enviando correo..." />
                                </Click>
                            </DirectEvents>
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnCancelar" 
                            runat="server" 
                            ImageUrl="assets/img/controles/Cancelar.png" 
                            DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                            OverImageUrl="assets/img/controles/CancelarOver.png" 
                            PressedImageUrl="assets/img/controles/CancelarPressed.png" 
                            ToolTip="Cancelar" 
                            Href="Login.aspx"
                            Height="50" 
                            Width="50">
                        </ext:ImageButton>
                    </Buttons>
                </ext:FormPanel>
            </Content>
        </ext:Container>

        <div id="footer">
            <div id="creditos" class="creditos">
                <p>
                    © 2015 Osef Technology
                </p>               
                <div id="social-login">
                    <ul>
                        <li ><a href="#"><img src="images/fb.png" alt="Facebook" class="imgs" /></a></li>
                        <li><a href="#"><img src="images/twiter.png" alt="Twitter" class="imgs" /></a></li>
                        <li><a href="#"><img src="images/youtube.png" alt="YouTube" class="imgs" /></a></li>
                        <li><a href="#"><img src="images/linked.png" alt="LinkedIn" class="imgs" /></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
</body>
</html>