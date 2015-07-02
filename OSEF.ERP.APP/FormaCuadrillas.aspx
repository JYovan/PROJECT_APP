<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCuadrillas.aspx.cs"
    Inherits="OSEF.ERP.APP.FormaCuadrillas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <link rel="stylesheet" href="css/xMask.css" />
    <link rel="stylesheet" href="css/xDatePicker.css" />
    <link rel="stylesheet" href="css/xSplitButton.css" />
    <link rel="stylesheet" href="css/xGridPanel.css" />
    <link rel="stylesheet" href="css/xWindowPopup.css" />
    <link rel="stylesheet" href="css/xTabPanel.css" />
    <link rel="stylesheet" href="css/xComboBox.css" />
    <link rel="stylesheet" href="css/xCustomChart.css" />
    <link rel="stylesheet" href="css/xIcons.css" />
    <link rel="stylesheet" href="css/xToolbar.css" />
    <link rel="stylesheet" href="css/xLabel.css" />
    <link rel="stylesheet" href="css/xTreePanel.css" />
    <link rel="stylesheet" href="css/xHiperlink.css" />
    <link rel="stylesheet" href="css/xTextField.css" />
    <link rel="stylesheet" href="css/xFieldSet.css" />
    <link rel="stylesheet" href="css/xPanel.css" />
    <link rel="stylesheet" href="css/xButton.css" />
    <script type="text/javascript" src="js/formacuadrilla.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmCuadrilla" runat="server" HideInDesign="true" />
    <ext:FormPanel ID="fpCuadrillas" runat="server" Height="260" DefaultButton="imgbtnGuardar"
        BodyStyle="padding:5px 5px 0;" Layout="HBoxLayout" MonitorResize="true">
        <Items>
            <ext:Panel ID="Panel1" runat="server">
                <Items> 
                    <ext:FieldContainer ID="FieldContainer2" runat="server" FieldLabel="ID" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            <ext:TextField ID="txtID" runat="server" Width="530" Margins="0 3 0 0" Disabled="false" ReadOnly="true"
                                EmptyText="" MaxLength="99">  
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer>

                    <ext:FieldContainer ID="FieldContainer3" runat="server" FieldLabel="Nombre" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            <ext:TextField ID="txtNombre" runat="server" Width="530" Margins="0 3 0 0" Disabled="false" AllowBlank="false"
                                EmptyText="Escriba nombre para la cuadrilla" MaxLength="99">  
                                <Listeners>
                                    <Blur Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer>
                    
                    <ext:FieldContainer ID="FieldContainer1" runat="server" FieldLabel="Integrantes"
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                            <ext:TextArea ID="txtDescripcion" runat="server" Height="100" Width="530" Margins="0 3 0 0" Disabled="false" AllowBlank="false"
                                EmptyText="Escriba los nombres de los intregantes separados por coma. Ej: Pedro, Pedrito, etc. " MaxLength="499"> 
                                <Listeners>
                                    <Blur Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:TextArea>
                        </Items>
                    </ext:FieldContainer>
                </Items>
        <Buttons>
            <ext:ImageButton ID="imgbtnGuardar" runat="server" ImageUrl="assets/img/controles/Guardar.png"
                DisabledImageUrl="assets/img/controles/GuardarDisabled.png" OverImageUrl="assets/img/controles/GuardarOver.png"
                PressedImageUrl="assets/img/controles/GuardarPressed.png" ToolTip="Guardar" Height="50"
                Width="50" Disabled="true">  
                            <DirectEvents>
                                <Click OnEvent="imgbtnGuardar_Click" Success="imgbtnGuardar_Click_Success">
                                    <EventMask ShowMask="true" Msg="Registrando información..." />
                                    <ExtraParams>
                                            <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))"
                                            Mode="Raw" />
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
            </ext:ImageButton>
            <ext:ImageButton ID="imgbtnCancelar" runat="server" ImageUrl="assets/img/controles/Cancelar.png"
                DisabledImageUrl="assets/img/controles/CancelarDisabled.png" OverImageUrl="assets/img/controles/CancelarOver.png"
                PressedImageUrl="assets/img/controles/CancelarPressed.png" ToolTip="Cancelar"
                Height="50" Width="50">
                <Listeners>
                    <Click Handler="window.parent.App.wEmergente.hide();" />
                </Listeners>
            </ext:ImageButton>
        </Buttons>
            </ext:Panel>
        </Items> 
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
            <BottomBar>
                <ext:StatusBar ID="sbProveedor" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
            </BottomBar>
    </ext:FormPanel>
    </form>
</body>
</html>
