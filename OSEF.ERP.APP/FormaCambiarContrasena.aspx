<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCambiarContrasena.aspx.cs" Inherits="OSEF.ERP.APP.FormaCambiarContrasena" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
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
    <script type="text/javascript" src="js/cambiarContrasena.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaCambiarContrasena" runat="server" HideInDesign="true" />

        <ext:FormPanel 
            ID="fpCambiarContrasena" 
            runat="server"
            BodyPadding="0"
            Width="400">
            <Items>
                <ext:FieldSet
                    ID="fsDivisorDatos" 
                    runat="server"
                    Title="Cambiar Contraseña">
                    <Items>
                        <ext:TextField
                            ID="txtfContrasenaActual"
                            runat="server"
                            LabelWidth="130"
                            Width="350"
                            FieldLabel="Contraseña actual"
                            AllowBlank="false"
                            AutoFocus="true"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Plugins>
                                <ext:PasswordMask ID="pmContrasenaActual" runat="server">
                                </ext:PasswordMask>
                                <ext:CapsLockDetector ID="cldContrasenaActual" runat="server">
                                    <Listeners>
                                        <CapsLockOn Handler="#{txtfContrasenaActual}.showIndicator({iconCls : '#Error', tip : 'BloqMayús esta activado'});" />
                                        <CapsLockOff Handler="#{txtfContrasenaActual}.hideIndicator();" />
                                    </Listeners>
                                </ext:CapsLockDetector>
                            </Plugins>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfContrasena"
                            runat="server"
                            LabelWidth="130"
                            Width="350"
                            FieldLabel="Contraseña"
                            AllowBlank="false"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Validator Fn="txtfContrasena_Validator" />
                            <Plugins>
                                <ext:PasswordMask ID="pmContrasena" runat="server">
                                </ext:PasswordMask>
                                <ext:CapsLockDetector ID="cldContrasena" runat="server">
                                    <Listeners>
                                        <CapsLockOn Handler="#{txtfContrasena}.showIndicator({iconCls : '#Error', tip : 'BloqMayús esta activado'});" />
                                        <CapsLockOff Handler="#{txtfContrasena}.hideIndicator();" />
                                    </Listeners>
                                </ext:CapsLockDetector>
                            </Plugins>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfConfirmarContrasena"
                            runat="server"
                            LabelWidth="130"
                            Width="350"
                            FieldLabel="Confirmar contraseña"
                            AllowBlank="false"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Validator Fn="txtfConfirmarContrasena_Validator" />
                            <Plugins>
                                <ext:PasswordMask ID="pmConfirmarContrasena" runat="server">
                                </ext:PasswordMask>
                                <ext:CapsLockDetector ID="cldConfirmarContrasena" runat="server">
                                    <Listeners>
                                        <CapsLockOn Handler="#{txtfConfirmarContrasena}.showIndicator({iconCls : '#Error', tip : 'BloqMayús esta activado'});" />
                                        <CapsLockOff Handler="#{txtfConfirmarContrasena}.hideIndicator();" />
                                    </Listeners>
                                </ext:CapsLockDetector>
                            </Plugins>
                        </ext:TextField>
                    </Items>
                </ext:FieldSet> 
            </Items>
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
            <Buttons>
                <ext:ImageButton
                    ID="imgbtnGuardar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Guardar.png" 
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Guardar" 
                    Height="50" 
                    Width="50"
                    Disabled="true">
                    <DirectEvents>
                        <Click OnEvent="imgbtnGuardar_Click" Success="imgbtnGuardar_Click_Success">
                            <EventMask ShowMask="true" Msg="Cambiando contraseña..." />
                            <ExtraParams>
                                <ext:Parameter Name="registro" Value="sendData()" Mode="Raw" />
                                <ext:Parameter Name="contrasenaActual" Value="App.txtfContrasenaActual.getValue()" Mode="Raw" />
                                <ext:Parameter Name="contrasena" Value="App.txtfContrasena.getValue()" Mode="Raw" />
                                <ext:Parameter Name="usuario" Value="window.parent.App.sUsuario.getAt(0).get('ID')" Mode="Raw" />
                            </ExtraParams>
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
                    Height="50" 
                    Width="50">
                    <Listeners>
                        <Click Fn="imgbtnCancelar_Click" />
                    </Listeners>
                </ext:ImageButton>
            </Buttons>
            <BottomBar>
                <ext:StatusBar
                    ID="sbCambiarContrasena" 
                    runat="server" 
                    Cls="x-colorToolbar"
                    Text="Sin validar información" />
            </BottomBar>
        </ext:FormPanel>
    </form>
</body>
</html>