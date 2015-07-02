<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaPreciarioGeneralExplorador.aspx.cs" Inherits="OSEF.ERP.APP.FormaPreciarioGeneralExplorador" %>

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


    <script type='text/javascript' src="js/exploradorConceptoPreciarioGeneral.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
     <ext:ResourceManager ID="rmFormaPreciarioExplorador" runat="server" />

       

        <ext:FormPanel 
        ID="fpEspecificarParametros" 
        runat="server"
        Width="580"
        DefaultButton="imgbtnGuardar"
        Height="200"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
             
             <ext:FieldContainer
                ID="fcFirmas"
                runat="server"
                FieldLabel="Firmas"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                      <ext:TextField
                        ID="txtElaboro"
                        runat="server"
                        Width="140"
                        EmptyText="Firma Elaboró"
                        Margins="0 3 0 0"
                        AutoFocus="true"
                         AllowBlank="false">
                         <Listeners>
                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                            </Listeners>
                    </ext:TextField>
                    <ext:TextField
                        ID="txtReviso"
                        runat="server"
                        Width="140"
                        EmptyText="Firma Revisó"
                        Margins="0 3 0 0"
                         AllowBlank="false">
                       <Listeners>
                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                            </Listeners>
                    </ext:TextField>
                      <ext:TextField
                        ID="txtAutorizo"
                        runat="server"
                        Width="140"
                        EmptyText="Firma Autorizó"
                        Margins="0 3 0 0"
                        AllowBlank="false">
                       <Listeners>
                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                            </Listeners>
                    </ext:TextField>
                </Items>
            </ext:FieldContainer>    

             <ext:FieldContainer
                ID="fcReportes"
                runat="server"
                FieldLabel="Reportes"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                     
                    <ext:FieldSet ID="fsReportes" 
                        runat="server"  
                        Width="425"
                        Layout="HBoxLayout"> 
                        <Items>
                         <ext:CheckboxGroup 
                            ID="chkgpReportes" 
                            runat="server" 
                            AllowBlank="false"
                            Width="415">
                            <Items>
                                <ext:Checkbox ID="chkGenerador" runat="server" BoxLabel="Generador" />
                                <ext:Checkbox ID="chkFotos" runat="server" BoxLabel="Fotos" />
                                <ext:Checkbox ID="chkCroquis" runat="server" BoxLabel="Croquis" />
                                <ext:Checkbox ID="chkFacturas" runat="server" BoxLabel="Factura/Notas"/>
                            </Items>
                         </ext:CheckboxGroup>
                         </Items>
                     </ext:FieldSet>
                </Items>
            </ext:FieldContainer>  
             <ext:FieldContainer
                ID="FieldContainer1"
                runat="server"
                AnchorHorizontal="100%"
                Layout="HBoxLayout">
                <Items>
                   <ext:Checkbox ID="chkSeleccionarTodo" runat="server" BoxLabel="Seleccionar/Deseleccionar Todo">
                   <DirectEvents>
                   
                        <Change OnEvent="chkSeleccionarTodo_Click"></Change>
                   </DirectEvents>
                   </ext:Checkbox>

                </Items>
            </ext:FieldContainer>
        </Items>
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Completa todos los campos para imprimir reporte', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
            <BottomBar>
                <ext:StatusBar ID="sbParametros1" 
                runat="server"
                Cls="x-colorToolbar" 
                Text="Completa todos los campos para imprimir reporte" />
            </BottomBar>
        <Buttons>
                <ext:ImageButton
                    ID="imgbtnGuardar"
                    runat="server"
                    ImageUrl="assets/img/controles/Guardar.png"
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Ver Reporte" 
                    Height="50" 
                    Width="50"
                    Disabled="true">
                    <DirectEvents>
                        <Click OnEvent="imgbtnExportar_Click" Success="window.open('PreviaOrdenEstimacion.aspx', '_blank');">
                            <EventMask ShowMask="true" Msg="Cargando Reporte..." />
                             <ExtraParams>
                                <ext:Parameter Name="elaboro" Value="App.txtElaboro.getValue()" Mode="Raw" />
                                <ext:Parameter Name="reviso" Value="App.txtReviso.getValue()" Mode="Raw" />
                                <ext:Parameter Name="autorizo" Value="App.txtAutorizo.getValue()" Mode="Raw" />
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
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
                </ext:ImageButton>
            </Buttons>
        </ext:FormPanel>



    </form>
</body>
</html>
