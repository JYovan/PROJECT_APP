<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCodigoPPTA.aspx.cs" Inherits="OSEF.ERP.APP.FormaCodigoPTTA" %>

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
    <script type="text/javascript" src="js/formaCodigoppta.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmCodigoPPTA" runat="server" HideInDesign="true" /> 
    
     <ext:Store ID="sCodigoPPTA" runat="server">
        <Model>
            <ext:Model ID="mCodigoPPTA" runat="server" IDProperty="CodigoMainSaver">
                <Fields>
                    <ext:ModelField Name="CodigoMainSaver" Type="String" />
                    <ext:ModelField Name="Dias" Type="String" />      
                </Fields>
            </ext:Model>
        </Model>
        <Listeners>
            <Load Fn="sCodigoPPTA_Load" />
            <Add Fn="sCodigoPPTA_Add" />
        </Listeners>
    </ext:Store>

        <ext:FormPanel 
            ID="fpCodigoPPTAs"
            runat="server" 
            MonitorResize="true"
            Height="150"
            Width="365" 
            DefaultButton="imgbtnGuardar" 
            Layout="HBoxLayout" >
        <Items>
            <ext:Panel ID="Panel1" runat="server">
                <Items> 
                     <ext:FieldContainer ID="FieldContainer5" runat="server" FieldLabel="Main Saver" AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items> 
                         <ext:TextField ID="txtCodigoMainSaver" runat="server" AllowBlank="false" Width="250" Disabled="false" Margins="0 0 0 0" MaxLength="49" MinLength="3"
                                EmptyText="Escriba un código main saver">  
                                <Listeners>
                                    <Change Fn="imgbtnGuardar_change" />
                                    <Blur Handler="App.txtCodigoMainSaver.setValue(App.txtCodigoMainSaver.getValue().toUpperCase());"/>
                                </Listeners>
                            </ext:TextField>
                       </Items>
                    </ext:FieldContainer> 
                    

                 
                    <ext:FieldContainer ID="FieldContainer7" runat="server" FieldLabel="Días" 
                        AnchorHorizontal="100%" Layout="HBoxLayout"  AllowBlank="false">
                        <Items>
                            <ext:NumberField ID="txtDias" runat="server" Width="250" MinValue="0" MaxValue="365" AllowExponential="false" MaxLength="3" Editable="false"  AllowBlank="false"> 
                            <Listeners>
                                <Change Fn="imgbtnGuardar_change" />
                            </Listeners>
                                </ext:NumberField>
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
                <ext:StatusBar ID="sbPPTA" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
            </BottomBar>
            </ext:FormPanel>
    </form>
</body>
</html>
