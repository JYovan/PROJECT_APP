<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaReporteEstimacion.aspx.cs" Inherits="OSEF.ERP.APP.FormaReporteEstimacion" %>

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
    <script type='text/javascript' src="js/formaReporteMovimientoEstimacion.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaReporteOrdenCambioD" runat="server" HideInDesign="true" />
  
        <ext:FormPanel
            ID="fpEspecificarParametros" 
            runat="server"
            Width="580"
            Height="120"
            BodyPadding="10"
            DefaultAnchor="100%">
            <Items>
                <ext:FieldContainer
                    ID="fcFirmas"
                    runat="server"
                    AnchorHorizontal="100%"
                    LabelWidth="120"
                    Layout="HBoxLayout">
                    <Items>
                     <%-- <ext:TextField
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
                    </ext:TextField>--%>
                    </Items>
                </ext:FieldContainer>
            </Items>



         <Content>
                <div align="center">
                <br />
                   
                      <asp:ImageButton 
            ID="imgbtnPresupuesto" 
            runat="server" 
           OnClick="imgbtnPresupuesto_click"
            Height="30"
            Width="30"
            class="imgs" 
            ImageUrl="assets/img/controles/PRE.png"/>


                  <asp:ImageButton 
            ID="imgbtnResumen" 
            runat="server" 
           OnClick="imgbtnResumen_click"
            Height="30"
            Width="30"
            class="imgs" 
            ImageUrl="assets/img/controles/RES.png"/>

           
          <asp:ImageButton 
            ID="imgbtnEstimacion" 
            runat="server" 
            OnClick="imgbtnEstimacion_click"
            Height="30"
            Width="30"
            class="imgs" 
            ImageUrl="assets/img/controles/EST.png"/>


                <asp:ImageButton 
                ID="imgbtnGenerador" 
                runat="server" 
                Height="30"
                Width="30"
                                            
                OnClick="imgbtnExportarGenerador_Click"
                class="imgs" 
                ImageUrl="assets/img/controles/generador.png"/>

                <asp:ImageButton 
                ID="imgbtnCroquis" 
                runat="server" 
                class="imgs" 
                    Height="30"
                    Width="30"
                    OnClick="imgbtnExportarCroquis_Click"
                ImageUrl="assets/img/controles/croquis.png"/>


                 <asp:ImageButton 
                ID="imgbtnFotos" 
                runat="server" 
                class="imgs" 
                OnClick="imgbtnExportarFotos_Click"
                    Height="30"
                    Width="30"
                ImageUrl="assets/img/controles/imagenes.png"/>

                    <asp:ImageButton 
                ID="imgbtnFacturas" 
                runat="server"
                    Height="30"
                    Width="30"
                class="imgs"
                OnClick="imgbtnExportarFactura_Click" 
                ImageUrl="assets/img/controles/facturas.png"/>
                
               
                    </div>
                    <div align="right">
                <asp:ImageButton 
                ID="imgbtnTodos" 
                runat="server" 
                class="imgs" 
                OnClick="imgbtnTodo"
                    Height="30"
                    Width="30"
                ImageUrl="assets/img/controles/bajar.png"/>
                </div>
            </Content>
            <%--<Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Especifica el personal que firmará el documento', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });" />
            </Listeners>--%>
            <BottomBar>
                <ext:StatusBar ID="sbParametros1" 
                runat="server"
                Cls="x-colorToolbar" 
                Text="Selecciona reporte a imprimir" />
            </BottomBar>
       
        </ext:FormPanel>
    
    </form>
</body>
</html>
