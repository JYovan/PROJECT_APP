<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaPreciario.aspx.cs"
    Inherits="OSEF.AVANCES.SUCURSALES.FormaPreciario" %>

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
    <script type='text/javascript' src="js/preciarios.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmFormaPreciario" runat="server" HideInDesign="true" />
    <ext:Store ID="sPreciario" runat="server">
        <Model>
            <ext:Model ID="mPreciario" runat="server" IDProperty="ID">
                <Fields>
                    <ext:ModelField Name="ID" Type="String" />
                    <ext:ModelField Name="Descripcion" Type="String" />
                    <ext:ModelField Name="Sucursal" Type="String" />
                    <ext:ModelField Name="Archivo" Type="String" />
                    <ext:ModelField Name="Estatus" Type="String" />
                    <ext:ModelField Name="Usuario" Type="String" />
                    <ext:ModelField Name="FechaAlta" Type="Date" />
                    <ext:ModelField Name="RSucursal" Type="Object" />
                </Fields>
            </ext:Model>
        </Model>
        <DirectEvents>
            <Load OnEvent="sPreciario_Load" Success="sPreciario_Load_Success">
                <EventMask ShowMask="true" Msg="Cargando información..." />
            </Load>
        </DirectEvents>
        <Listeners>
            <%--      <Load Fn="sPreciario_Load" />--%>
            <Add Fn="sPreciario_Add" />
        </Listeners>
    </ext:Store>
    <ext:FormPanel ID="fpPreciario" runat="server" MonitorResize="true" Height="530"
        Width="910" BodyStyle="background-color:#fff;">
        <TopBar>
            <ext:Toolbar ID="tbFormaAvance" runat="server" Height="40">
                <Items>
                    <ext:ImageButton ID="imgbtnGuardar" runat="server" ImageUrl="assets/img/controles/SaveNormal.png"
                        DisabledImageUrl="assets/img/controles/SaveDisabled.png" OverImageUrl="assets/img/controles/SaveOver.png"
                        PressedImageUrl="assets/img/controles/SavePressed.png" ToolTip="Guardar" Height="30"
                        Width="30" Disabled="true">
                        <DirectEvents>
                            <Click OnEvent="imgbtnGuardar_Click">
                                <EventMask ShowMask="true" Msg="Registrando información..." />
                                <ExtraParams>
                                    <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))"
                                        Mode="Raw" />
                                    <ext:Parameter Name="estatus" Value="App.cmbEstatus.getValue()" Mode="Raw" />
                                    
                                    <ext:Parameter Name="archivo" Value="App.txfArchivoActual.getValue()" Mode="Raw" />
                                    <ext:Parameter Name="DetallePreciario" Value="Ext.encode(#{sCarga}.getRecordsValues())"
                                        Mode="Raw" />
                                    <ext:Parameter Name="sucursal" Value="App.txtfSucursalID.getValue()" Mode="Raw" />
                                </ExtraParams>
                            </Click>
                        </DirectEvents>
                    </ext:ImageButton>
                    <ext:ImageButton ID="imgbtnCancelar" runat="server" ImageUrl="assets/img/controles/Cancelar.png"
                        DisabledImageUrl="assets/img/controles/CancelarDisabled.png" OverImageUrl="assets/img/controles/CancelarOver.png"
                        PressedImageUrl="assets/img/controles/CancelarPressed.png" ToolTip="Cancelar Movimiento"
                        Height="30" Width="30">
                        <Listeners>
                            <Click Handler="window.parent.App.wEmergente.hide();" />
                        </Listeners>
                    </ext:ImageButton>
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Items>
            <ext:Panel ID="pDatosGenerales" runat="server" BodyPadding="10" Width="900" Height="157"
                AutoScroll="false">
                <Items>
                    <ext:FieldContainer ID="fcID" runat="server" FieldLabel="ID" LabelWidth="120" AnchorHorizontal="100%"
                        Layout="ColumnLayout">
                        <Items>
                            <ext:TextField ID="txtfID" runat="server" Width="200" StyleSpec="margin-right: 6px;"
                                Disabled="true">
                                <Listeners>
                                    <Blur Handler="App.txtfID.setValue(App.txtfID.getValue().toUpperCase());" />
                                </Listeners>
                            </ext:TextField>
                            <ext:TextField ID="txtfDescripcion" runat="server" EmptyText="Nombre Preciario" Width="360"
                                AllowBlank="false" AutoFocus="true">
                                <Listeners>
                                    <Change Fn="txtfDescripcion_Change" />
                                    <Blur Handler="App.txtfDescripcion.setValue(App.txtfDescripcion.getValue().toUpperCase());" />
                                </Listeners>
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer ID="FieldContainerCPCol" runat="server" LabelWidth="120" FieldLabel="Sucursal"
                        AnchorHorizontal="100%" Layout="ColumnLayout">
                        <Items>
                            <ext:TextField ID="txtfSucursalCR" runat="server" Width="200" StyleSpec="margin-right: 6px;"
                                MaxLength="50" EnforceMaxLength="true" AllowBlank="true" ReadOnly="true">
                                <RightButtons>
                                    <ext:Button ID="btnBuscaSucursal" runat="server" Icon="Find" StandOut="true">
                                        <Listeners>
                                            <Click Fn="btnBuscarSucursal_Click" />
                                        </Listeners>
                                    </ext:Button>
                                </RightButtons>
                            </ext:TextField>
                            <ext:TextField ID="txtfSucursalNombre" runat="server" Width="360" StyleSpec="margin-right: 6px;"
                                MaxLength="50" EnforceMaxLength="true" AllowBlank="true" ReadOnly="true"> 
                            </ext:TextField>

                             <ext:TextField ID="txtfSucursalID" runat="server"  
                                 Hidden="true"> 
                                 <Listeners>
                                 <Change Fn="txtfSucursalID_Change"></Change>
                                 </Listeners>
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer ID="fcFechaEmision" runat="server" LabelWidth="120" FieldLabel="Fecha de Emisión"
                        AnchorHorizontal="100%" Layout="ColumnLayout">
                        <Items>
                            <ext:DateField ID="dfFechaEmision" runat="server" Width="200" StyleSpec="margin-right: 6px;"
                                Disabled="true">
                                <PickerOptions ID="pOFechaEmision" runat="server" Cls="my-date-picker">
                                </PickerOptions>
                            </ext:DateField>
                            <ext:ComboBox ID="cmbEstatus" runat="server" Width="200" Disabled="true">
                                <SelectedItems>
                                    <ext:ListItem Index="0">
                                    </ext:ListItem>
                                </SelectedItems>
                                <Items>
                                    <ext:ListItem Index="0" Text="ACTIVO" Value="ACTIVO" />
                                    <ext:ListItem Index="1" Text="INACTIVO" Value="INACTIVO" />
                                    <ext:ListItem Index="2" Text="BORRADOR" Value="BORRADOR" />
                                </Items>
                            </ext:ComboBox>
                        </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer ID="fcSeleccionar" runat="server" FieldLabel="Seleccionar Archivo"
                        AnchorHorizontal="100%" LabelWidth="120" Layout="ColumnLayout">
                        <Items>
                            <ext:FileUploadField ID="fufArchivoExcel" runat="server" Icon="Attach" EmptyText="No haz seleccionado un archivo"
                                AllowBlank="false" Width="304" StyleSpec="margin-right: 6px;" Text="">
                                <Listeners>
                                    <Change Fn="CheckExtension" />
                                </Listeners>
                            </ext:FileUploadField>
                            <ext:NumberField ID="nfHoja" runat="server" Width="207" MaxLength="1" EnforceMaxLength="true"
                                MinValue="0" Text="0" StyleSpec="margin-right: 6px;" FieldLabel="Excel Hoja N°"
                                MaxValue="8" AllowDecimals="false" Step="1" LabelWidth="120" AllowBlank="false">
                            </ext:NumberField>
                            <ext:ImageButton ID="btnCargar" runat="server" StyleSpec="margin-right: 6px;" ImageUrl="assets/img/controles/Guardar.png"
                                DisabledImageUrl="assets/img/controles/GuardarDisabled.png" OverImageUrl="assets/img/controles/GuardarOver.png"
                                PressedImageUrl="assets/img/controles/GuardarPressed.png" ToolTip="Cargar Archivo"
                                Height="23" Width="23">
                                <DirectEvents>
                                    <Click OnEvent="btnImportar_Click" Success="btnImportar_Click_Success">
                                        <EventMask ShowMask="true" Msg="Importando datos..." />
                                    </Click>
                                </DirectEvents>
                            </ext:ImageButton>
                            <ext:ImageButton ID="imgbtnBorrarCarga" runat="server" StyleSpec="margin-right: 6px;"
                                ImageUrl="assets/img/controles/CleanNormal.png" DisabledImageUrl="assets/img/controles/CleanDisabled.png"
                                OverImageUrl="assets/img/controles/CleanHover.png" PressedImageUrl="assets/img/controles/CleanPressed.png"
                                ToolTip="Limpiar" Height="23" Width="23">
                                <Listeners>
                                    <Click Fn="BorrarDetallePreciario">
                                    </Click>
                                </Listeners>
                            </ext:ImageButton>
                        </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer ID="fcSeleccionado" runat="server" FieldLabel="Archivo Actual"
                        AnchorHorizontal="100%" LabelWidth="120" Layout="ColumnLayout">
                        <Items>
                            <ext:TextField ID="txfArchivoActual" runat="server" Width="406" Disabled="true">
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer>
                </Items>
            </ext:Panel>
            <%--  DETALLE PRECIARIO--%>
            <ext:Panel ID="pPreciario" runat="server" BodyPadding="5" Width="900" AutoScroll="True">
                <Items>
                    <ext:FieldSet ID="fsPreciario" runat="server" Height="295" Title="Preciario" DefaultAnchor="100%">
                        <Items>
                            <ext:GridPanel ID="gpPreciario" runat="server" Width="850" Height="270">
                                <Store>
                                    <ext:Store ID="sCarga" runat="server">
                                        <Model>
                                            <ext:Model ID="mCarga" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Clave" Type="String" />
                                                    <ext:ModelField Name="Preciario" Type="String" />
                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                    <ext:ModelField Name="Unidad" Type="String" />
                                                    <ext:ModelField Name="Cantidad" Type="Float" />
                                                    <ext:ModelField Name="Utilizada" Type="Float" />
                                                    <ext:ModelField Name="Costo" Type="Float" />
                                                    <ext:ModelField Name="Importe" Type="Float" />
                                                    <ext:ModelField Name="Importefinal" Type="Float" />
                                                    <ext:ModelField Name="Categoria" Type="String" />
                                                    <ext:ModelField Name="SubCategoria" Type="String" />
                                                    <ext:ModelField Name="SubSubCategoria" Type="String" />
                                                    <ext:ModelField Name="FechaAlta" Type="Date" />
                                                    <ext:ModelField Name="Estatus" Type="String" />
                                                    <ext:ModelField Name="Tipo" Type="String" />
                                                    <ext:ModelField Name="RCategoria" Type="Object" />
                                                    <ext:ModelField Name="RSubcategoria" Type="Object" />
                                                    <ext:ModelField Name="RSubsubcategoria" Type="Object" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                        <Listeners>
                                            <Load Fn="sCarga_Load">
                                            </Load>
                                        </Listeners>
                                    </ext:Store>
                                </Store>
                                <ColumnModel ID="cmPreciario" runat="server">
                                    <Columns>
                                        <ext:Column ID="cIDPreciario" runat="server" Text="ID" Width="80" DataIndex="Clave">
                                        </ext:Column>
                                        <ext:Column ID="cConcepto" runat="server" Text="Concepto" Width="260" DataIndex="Descripcion">
                                        </ext:Column>
                                        <ext:Column ID="cCantidad" runat="server" Align="Center" Text="Cantidad" DataIndex="Cantidad"
                                            Width="100">
                                        </ext:Column>
                                        <ext:Column ID="cUtilizada" runat="server" Align="Center" Text="Utilizada" DataIndex="Utilizada"
                                            Width="100">
                                            <Renderer Fn="renderCantidadUtilizada" />
                                        </ext:Column>
                                        <ext:Column ID="cUnidad" runat="server" Text="Unidad" Width="60" DataIndex="Unidad">
                                        </ext:Column>
                                        <ext:Column ID="cPrecio" runat="server" Align="Center" Text="Precio" DataIndex="Costo"
                                            Width="110">
                                            <Renderer Fn="rendererCosto">
                                            </Renderer>
                                        </ext:Column>
                                        <ext:Column ID="cImporte" runat="server" Align="Center" Text="Importe Preciario"
                                            DataIndex="Importe" Width="130">
                                            <Renderer Fn="renderImporte" />
                                        </ext:Column>
                                        <ext:Column ID="cImporteUtilizado" runat="server" Align="Center" Text="Importe Final"
                                            Width="130" DataIndex="Importefinal">
                                            <Renderer Fn="renderImporteUtilizado" />
                                        </ext:Column>
                                        <ext:Column ID="cCategoria" runat="server" Align="Center" Text="Categoría" DataIndex="Categoria"
                                            Width="90">
                                            <Renderer Fn="cCategoria_Renderer" />
                                        </ext:Column>
                                        <ext:Column ID="cSubCategoria" runat="server" Align="Center" Text="SubCategoría"
                                            DataIndex="SubCategoria" Width="90">
                                            <Renderer Fn="cSubcategoria_Renderer" />
                                        </ext:Column>
                                        <ext:Column ID="cSubCubCategoria" runat="server" Align="Center" Text="SubSubCategoria"
                                            DataIndex="SubSubCategoria" Width="90">
                                            <Renderer Fn="cSubsubcategoria_Renderer" />
                                        </ext:Column>
                                    </Columns>
                                </ColumnModel>
                                <SelectionModel>
                                    <ext:CellSelectionModel ID="csmPreciario" runat="server">
                                    </ext:CellSelectionModel>
                                </SelectionModel>
                                <View>
                                    <ext:GridView ID="gvPreciario" runat="server" StripeRows="true">
                                    </ext:GridView>
                                </View>
                                <BottomBar>
                                    <ext:Toolbar ID="tPreciarioConcepto" runat="server">
                                        <Items>
                                            <ext:DisplayField ID="dfTotalInicial" runat="server" FieldLabel="Total Cargado" Cls="total-field"
                                                Margins="0 0 0 340px" Width="240" Text="$">
                                            </ext:DisplayField>
                                            <ext:DisplayField ID="dfTotalFinal" runat="server" FieldLabel="Total Final" Cls="total-field"
                                                Width="240" Text="$">
                                            </ext:DisplayField>
                                        </Items>
                                    </ext:Toolbar>
                                </BottomBar>
                            </ext:GridPanel>
                            <%--Fin Detalle PRECIARIO--%>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:Panel>
        </Items>
        <BottomBar>
            <ext:StatusBar ID="sbFormaPreciario" runat="server" Cls="x-colorToolbar" Text="BORRADOR">
            </ext:StatusBar>
        </BottomBar>
    </ext:FormPanel>
    </form>
</body>
</html>
