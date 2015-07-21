<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaGenerador.aspx.cs" Inherits="OSEF.ERP.APP.FormaGenerador" %>

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
    <script type='text/javascript' src="js/formaGenerador.js"></script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return false;">
   
    <ext:ResourceManager ID="rmFormaGenerador" runat="server" HideInDesign="true" />

    <ext:Panel 
            ID="panelGenerador" 
            runat="server"
            Width="905"
            Height="270"
            DefaultButton="imgbtnGuardar"
            BodyPadding="5"
            DefaultAnchor="100%">
            <Items>
            <ext:GridPanel
                ID="gpFormaGenerador"
                runat="server"
                Width="890"
                 Cls="xCustomGridPanel"
                Height="260"
                AutoScroll="true"
                EnableColumnHide="false"
                EnableColumnMove="false">

                <TopBar>
                <ext:Toolbar ID="tbFormaGenerador" runat="server">
                    <Items>
                        <ext:ImageButton
                            ID="imgbtnAceptar"
                            runat="server"
                            ImageUrl="assets/img/controles/Guardar.png" 
                            DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                            OverImageUrl="assets/img/controles/GuardarOver.png" 
                            PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                            ToolTip="Guardar" 
                            Disabled="true"
                            Height="30"
                            Width="30">
                              <DirectEvents>
                                <Click OnEvent="imgbtnAceptar_Click" Success="imgbtnAceptar_Click">
                                    <EventMask ShowMask="true" Msg="Guardardo información..." />
                                    <ExtraParams>
                                       <ext:Parameter Name="DescripcionCorta" Value="App.txtDescripcionCorta.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="GeneradorD" Value="Ext.encode(#{sFormaGenerador}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="vPlano" Value="App.txtPlano.getValue().length > 0 ? App.txtPlano.getValue():''" Mode="Raw" />
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
                            Height="30" 
                            Width="30">
                            <Listeners>
                                <Click Handler="window.parent.App.wGenerador.hide();" />
                            </Listeners>
                        </ext:ImageButton>
                        
                        <ext:TextField
                        ID="txtDescripcionCorta" 
                        runat="server" 
                        AutoFocus="true"
                        Width="400"
                        EmptyText="Descripción Corta">
                            <Listeners>
                                <Blur Fn="txtDescripcion_Corta_Change"></Blur>
                            </Listeners>
                        </ext:TextField>


                        <ext:TextField
                        ID="txtPlano" 
                        runat="server"  
                        Width="300"
                        EmptyText="Descripción del plano" MaxLength="20" EnforceMaxLength="true" AllowBlank="false">
                            <Listeners>
                                 <SpecialKey Handler="if (e.keyCode == 10) {
                                 App.gpFormaGenerador.editingPlugin.startEdit(0, 0);

                                     }">
                                </SpecialKey>
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>

                 <Store>
                    <ext:Store
                        ID="sFormaGenerador"
                        runat="server">
                        <Model>
                            <ext:Model 
                                ID="mFormaGenerador"
                                runat="server">
                                <Fields>
                                    <ext:ModelField Name="MovID" Type="Int" />
                                    <ext:ModelField Name="ConceptoID" Type="String" />
                                    <ext:ModelField Name="Descripcion" Type="String" />
                                    <ext:ModelField Name="Eje" Type="String" />
                                    <ext:ModelField Name="EntreEje1" Type="String" />
                                    <ext:ModelField Name="EntreEje2" Type="String" />
                                    <ext:ModelField Name="Area" Type="String" />
                                    <ext:ModelField Name="Largo" Type="Float" />
                                    <ext:ModelField Name="Ancho" Type="Float" />
                                    <ext:ModelField Name="Alto" Type="Float" />
                                    <ext:ModelField Name="Cantidad" Type="Float" />
                                    <ext:ModelField Name="Total" Type="Float" />
                                    <ext:ModelField Name="RConcepto" Type="Object" />
                                    <ext:ModelField Name="Plano" Type="String" />
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Listeners>
                            <Load Fn="sFormaGenerador_Load"></Load>
                        </Listeners>
                    </ext:Store>
                </Store>
                <ColumnModel 
                    ID="cmFormaGenerador" 
                    runat="server">
                    <Columns>
                        <ext:CommandColumn
                            ID="ccAcciones"
                            runat="server" 
                            Width="25">
                            <PrepareToolbar Fn="ccAcciones_PrepareToolbar" />
                            <Commands>
                                <ext:GridCommand
                                    Icon="Delete"
                                    CommandName="Borrar">
                                    <ToolTip Text="Borrar" />
                                </ext:GridCommand>
                            </Commands>
                            <Listeners>
                                <Command Fn="ccAcciones_Command" />
                            </Listeners>
                        </ext:CommandColumn>
                        <ext:Column
                            ID="cArea"
                            runat="server"
                            Text="AREA"
                            Width="270"
                            DataIndex="Area">
                            <Editor>
                                <ext:TextField ID="txtfArea" runat="server">
                                      <Listeners>
                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                    </Listeners>             
                                </ext:TextField>
                            </Editor>
                        </ext:Column>
                        <ext:Column
                            ID="ncEje"
                            runat="server"
                            Align="Center"
                            Text="EJE"
                            DataIndex="Eje"
                            Width="70">
                            <Editor>
                                <ext:TextField 
                                    ID="nfEje"
                                    runat="server">
                                    <Listeners>
                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                    </Listeners>   
                                </ext:TextField>
                            </Editor>
                        </ext:Column>
                        <ext:Column ID="cColumnaContenedora" runat="server" Text="LOCALIZACIÓN">
                        <Columns>
                        <ext:Column
                            ID="ncEntreEje1"
                            runat="server"
                            Align="Center"
                            Text="EJE 1"
                            DataIndex="EntreEje1"
                            Width="70">
                            <Editor>
                                <ext:TextField 
                                    ID="nfEntreEje1"
                                    runat="server">
                                    <Listeners>
                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                    </Listeners> 
                                </ext:TextField>
                            </Editor>
                        </ext:Column>

                        <ext:Column
                            ID="ncEntreEje2"
                            runat="server"
                            Align="Center"
                            Text="EJE 2"
                            DataIndex="EntreEje2"
                            Width="70">
                            <Editor>
                                <ext:TextField 
                                    ID="nfEntreEje2"
                                    runat="server">
                                    <Listeners>
                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                    </Listeners> 
                                </ext:TextField>
                            </Editor>
                        </ext:Column>
                        </Columns>
                        
                      </ext:Column>


                        <ext:NumberColumn
                            ID="cLargo"
                            runat="server"
                            Align="Center"
                            Text="LARGO"
                            DataIndex="Largo"
                            Width="70">
                            <Renderer Fn="nfLargo_Renderer" />
                            <Editor>
                                <ext:NumberField 
                                    ID="nfLargo"
                                    runat="server"
                                    AllowDecimals="true"
                                    AllowExponential="false"
                                    DecimalPrecision="6"
                                    DecimalSeparator="."
                                    MaxLength="10"
                                    EnforceMaxLength="true"
                                    MaxValue="999999999"
                                    MinValue="-999999999"
                                    Step="1">
                                    <Listeners>
                                        <Change Fn="calcularTotalLargo_Change"></Change>
                                    </Listeners>
                                </ext:NumberField>
                            </Editor>
                        </ext:NumberColumn>

                        <ext:NumberColumn
                            ID="ncAncho"
                            runat="server"
                            Align="Center"
                            Text="ANCHO"
                            DataIndex="Ancho"
                            Width="70">
                            <Renderer Fn="nfAncho_Renderer" />
                            <Editor>
                                <ext:NumberField 
                                    ID="nfAncho"
                                    runat="server"
                                    AllowDecimals="true"
                                    AllowExponential="false"
                                    DecimalPrecision="6"
                                    DecimalSeparator="."
                                    MaxLength="10"
                                    EnforceMaxLength="true"
                                    MaxValue="999999999"
                                     MinValue="-999999999"
                                    Step="1">
                                    <Listeners>
                                        <Change Fn="calcularTotalAncho_Change"></Change>
                                    </Listeners>
                                </ext:NumberField>
                            </Editor>
                        </ext:NumberColumn>

                        <ext:NumberColumn
                            ID="ncAlto"
                            runat="server"
                            Align="Center"
                            Text="ALTO"
                            DataIndex="Alto"
                            Width="70">
                            <Renderer Fn="nfAlto_Renderer" />
                            <Editor>
                                <ext:NumberField 
                                    ID="nfAlto"
                                    runat="server"
                                    AllowDecimals="true"
                                    AllowExponential="false"
                                    DecimalPrecision="6"
                                    DecimalSeparator="."
                                    MaxLength="10"
                                    EnforceMaxLength="true"
                                    MaxValue="999999999"
                                    MinValue="-999999999"
                                    Step="1">
                                     <Listeners>
                                        <Change Fn="calcularTotalAlto_Change"></Change>
                                    </Listeners>
                                </ext:NumberField>
                            </Editor>
                        </ext:NumberColumn>
                         <ext:NumberColumn
                            ID="ncCantidad"
                            runat="server"
                            Align="Center"
                            Text="CANTIDAD"
                            DataIndex="Cantidad"
                            Width="70">
                            <Renderer Fn="nfCantidad_Renderer" />
                            <Editor>
                                <ext:NumberField 
                                    ID="nfCantidad"
                                    runat="server"
                                    AllowDecimals="true"
                                    AllowExponential="false"
                                    DecimalPrecision="6"
                                    Editable="true"
                                    DecimalSeparator="."
                                    MaxLength="10"
                                    EnforceMaxLength="true"
                                    MinValue="-999999999"
                                    Step="1">
                                    <Listeners>
                                        <Change Fn="calcularTotalCantidad_Change"></Change> 
                                        <Blur Fn="cantidad_Blur"></Blur>
                                    </Listeners>
                                </ext:NumberField>
                            </Editor>
                        </ext:NumberColumn>

                        <ext:NumberColumn
                            ID="ncTotal"
                            runat="server"
                            Align="Center"
                            Text="TOTAL"
                            DataIndex="Total"
                            Width="90">
                            <Renderer Fn="ncTotal_Renderer" />
                        </ext:NumberColumn>


                    </Columns>
                </ColumnModel>   
                <%--  <Listeners>
                    <ItemClick Fn="gpPreciarioConceptos_ItemClick" />
                </Listeners>--%>
                <SelectionModel>
                    <ext:CellSelectionModel
                        ID="csmGenerador" 
                        runat="server">
                       
                    </ext:CellSelectionModel>
                </SelectionModel>
                <Plugins>
                    <ext:CellEditing 
                        ID="ceGenerador" 
                        runat="server"
                        ClicksToEdit="1">
                        <Listeners>
                          <Edit Fn="ceGenerador_Edit" />

                          <BeforeEdit Fn="validaConcluidos" ></BeforeEdit>
                        </Listeners>
                    </ext:CellEditing>
                </Plugins>
                <View>
                    <ext:GridView
                        ID="gvOrdenEstimacion"
                        runat="server"
                        StripeRows="true">
                    </ext:GridView>
                </View>
                <BottomBar>
                <ext:Toolbar ID="tGenerador" runat="server">
                    <Items>
                        <ext:DisplayField
                            ID="dfTotal"
                            runat="server"
                            FieldLabel="Total"
                            Cls="total-field"
                            Margins="0 0px 0 620px"
                            Width="240"
                            Text="">
                        </ext:DisplayField>
                    </Items>
                </ext:Toolbar>
            </BottomBar>

                        <Listeners>
                        <Select Fn="obetenerRenglon_Select"></Select>
                        </Listeners>
            </ext:GridPanel>
          </Items>
      </ext:Panel>
    </form>
</body>
</html>