<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdenesEstimaciones.aspx.cs" Inherits="OSEF.ERP.APP.OrdenesCambio" %>

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
    <script type='text/javascript' src="js/tableroOrdenesEstimaciones.js"></script>

    
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
 
     <ext:ResourceManager ID="rmOrdenesEstimaciones" runat="server" HideInDesign="true">
        </ext:ResourceManager>

        <ext:GridPanel
            ID="gpOrdenesEstimaciones"
            runat="server"
            Height="450"
            Width="1120"
            Resizable="true"
            Title="REPORTES & ESTIMACIONES"
            EnableColumnHide="true"
            EnableColumnMove="true"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbVolumetrias" runat="server">
                    <Items>
                        <ext:ImageButton
                            ID="imgbtnNuevo"
                            runat="server"
                            ImageUrl="assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="assets/img/controles/nuevo-disable.png"
                            OverImageUrl="assets/img/controles/nuevo-over.png"
                            PressedImageUrl="assets/img/controles/nuevo-pressed.png"
                            Height="50"
                            Width="50">
                            <Listeners>
                                <Click Fn="imgbtnNuevo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnEditar"
                            runat="server"
                            ImageUrl="assets/img/controles/edit-normal.png"
                            DisabledImageUrl="assets/img/controles/edit-disable.png"
                            OverImageUrl="assets/img/controles/edit-over.png"
                            PressedImageUrl="assets/img/controles/edit-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                            <Listeners>
                                <Click Fn="imgbtnEditar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnBorrar"
                            runat="server"
                            ImageUrl="assets/img/controles/delete-normal.png"
                            DisabledImageUrl="assets/img/controles/delete-disable.png"
                            OverImageUrl="assets/img/controles/delete-over.png"
                            PressedImageUrl="assets/img/controles/delete-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsOrdenesCambio" runat="server" Width="370">
                        </ext:ToolbarSpacer>
                        <ext:Checkbox
                            ID="chkHistorial" 
                            runat="server"
                            Name="chkHistorial"
                            FieldLabel="Historial" 
                            Checked="false">
                            <Listeners>
                                <Change Fn="chkHistorial_Change"></Change>
                            </Listeners>
                        </ext:Checkbox> 
                        <ext:ImageButton
                            ID="imgbtnFirmas"
                            runat="server"
                            ImageUrl="assets/img/controles/AutorizarNormal.png"
                            DisabledImageUrl="assets/img/controles/AutorizarDisabled.png"
                            OverImageUrl="assets/img/controles/AutorizarOver.png"
                            PressedImageUrl="assets/img/controles/AutorizarPressed.png"
                            Height="50"
                            Width="50">
                             <Listeners>
                                <Click Fn="imgbtnFirmas_Click" />
                            </Listeners>
                        </ext:ImageButton>

                         <ext:Container
                                ID="cCorreoEnviado"
                                runat="server">
                                 <Content>
                                     <asp:ImageButton 
                                        ID="imgbtnGenerador" 
                                        runat="server" 
                                        Height="50"
                                        Width="50"
                                        OnClick="ExportEt"
                                        class="imgs" 
                                        ImageUrl="assets/img/controles/ExcelNormal.png"/>
                                </Content>
                            </ext:Container>
                        <ext:ImageButton
                            ID="imgbtnActualizar"
                            runat="server"
                            ImageUrl="assets/img/controles/update-normal.png"
                            DisabledImageUrl="assets/img/controles/update-disable.png"
                            OverImageUrl="assets/img/controles/update-hover.png"
                            PressedImageUrl="assets/img/controles/update-pressed.png"
                            Height="50"
                            Width="50">
                              <Listeners>
                                <Click Handler="#{sOrdenesEstimaciones}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                                </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar por MovID"
                            Width="200">
                            <Listeners>
                                <Change Fn="txtBuscar_Change" />
                            </Listeners>
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnBuscar"
                                    runat="server"
                                    ImageUrl="assets/img/controles/search.png"
                                    OverImageUrl=""
                                    PressedImageUrl=""
                                    Height="22px"
                                    Width="22px">                                              
                                </ext:ImageButton>
                            </RightButtons>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <Store>
                <ext:Store
                    ID="sOrdenesEstimaciones"
                    runat="server"
                    PageSize="10" 
                    RemoteSort="true"
                    OnReadData="OnReadData_sOrdenesEstimaciones">
                    <Model>
                        <ext:Model ID="mOrdenesEstimaciones" runat="server">
                            <Fields>
                                <ext:ModelField Name="Id" Type="Int" />
                                <ext:ModelField Name="Mov" Type="String" />
                                <ext:ModelField Name="MovID" Type="String" />
                                <ext:ModelField Name="FechaEmision" Type="Date" />
                                <ext:ModelField Name="Observaciones" Type="String" />
                                <ext:ModelField Name="Usuario" Type="String" />
                                <ext:ModelField Name="Observaciones" Type="String" /> 
                                <ext:ModelField Name="TrabajoRequerido" Type="String" />
                                <ext:ModelField Name="FechaOrigen" Type="Date" />
                                <ext:ModelField Name="FechaMaximaAtencion" Type="Date" />
                                <ext:ModelField Name="Reporto" Type="String" />
                                <ext:ModelField Name="HoraOrigen" Type="Date" /> 
                                 <ext:ModelField Name="Reporte" Type="String" />
                                 <ext:ModelField Name="Sucursal" Type="String" />
                                 <ext:ModelField Name="Cr" Type="Int" />
                                 <%--<ext:ModelField Name="RSucursal" Type="Object" />--%>
                                 <ext:ModelField Name="FechaOrigen" Type="Date" />
                                 <ext:ModelField Name="Reporto" Type="String" />
                                 <ext:ModelField Name="TrabajoRealizado" Type="String" />
                                 <ext:ModelField Name="FechaMaximaAtencion" Type="Date" />
                                 <ext:ModelField Name="Estatus" Type="String" />
                                 <ext:ModelField Name="Zona" Type="String" />
                                 <ext:ModelField Name="Cuadrilla" Type="String" />
                                 <%--<ext:ModelField Name="RCuadrilla" Type="Object" /> --%>
                                 <ext:ModelField Name="RutaImagen" Type="String" />
                                 <ext:ModelField Name="Atendido" Type="String" />
                                 <ext:ModelField Name="NoOrden" Type="String" />
                                 <ext:ModelField Name="Cliente" Type="String" />
                                <%-- <ext:ModelField Name="RCliente" Type="Object" />--%>
                                 <ext:ModelField Name="Clasificacion" Type="String" />
                            </Fields>
                        </ext:Model>
                    </Model>
                      <Sorters>
                        <ext:DataSorter Property="Reporte" Direction="DESC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sOrdenesEstimaciones_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column
                        ID="cReporte"
                        runat="server"
                        Text="REPORTE"
                        Align="Center"
                        Width="110"
                        DataIndex="Reporte">
                        <Renderer Fn="cReporte_Renderer" />
                        <HeaderItems>
                            <ext:TextField
                                ID="txtReporte"
                                EmptyText="Busca"
                                runat="server">
                                <Listeners>
                                    <Change Fn="txtReporteFiltro_Change" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton9" runat="server" />
                                </Plugins>
                            </ext:TextField>
                        </HeaderItems>
                    </ext:Column>
                    
                    <ext:Column
                        ID="cTieneReporte"
                        runat="server"
                        Text="¿REPORTE?"
                        Align="Center"
                        Width="70"
                        Filterable="false"
                        DataIndex="RutaImagen">
                         <Renderer Fn="cTieneReporte_Renderer" />
                    </ext:Column>

                    <ext:Column 
                    ID="cAtendido"
                    runat="server"
                    Text="ATENDIDO"
                    Filterable="false"
                    Align="Center"
                    Width="70"
                    DataIndex="Atendido">
                         <Renderer Fn="cAtendido_Renderer" />
                    </ext:Column>
                     <ext:Column
                        ID="cCliente"
                        runat="server"
                        Text="CLIENTE"
                        Align="Center"
                        Width="150"
                        Filterable="false"
                        DataIndex="Cliente">
                        <Renderer Fn="cCliente_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Left"
                        Width="225"
                        DataIndex="Sucursal"> 
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbSucursalFiltro"
                                runat="server"
                                DisplayField="Nombre"
                                ValueField="ID" 
                                ForceSelection="true"
                                Editable="true"
                                 MatchFieldWidth="true"
                            QueryMode="Local"
                            TypeAhead="true"
                                >
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbSucursalFiltro_Select" />
                                </Listeners>
                                <Store>
                                    <ext:Store
                                        ID="sSucursales"
                                        runat="server">
                                        <Model>
                                            <ext:Model ID="mSucursales" runat="server" IDProperty="ID">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store> 
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton1" runat="server" />
                                </Plugins>
                            </ext:ComboBox>
                        </HeaderItems>
                    </ext:Column>
                    
                    <ext:Column
                        ID="clasificacion"
                        runat="server"
                        Text="CLASIFICACIÓN"
                        Align="Center"
                        Width="120" 
                        DataIndex="Clasificacion">
                        <Renderer Fn="cClasificacion_Renderer" />
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbFClasificacion"
                                runat="server"
                                Width="200"
                                Editable="false">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" /> 
                                    <ext:ListItem Index="1" Text="MOBILIARIO" Value="MOBILIARIO" />
                                    <ext:ListItem Index="2" Text="CERRAJERIA" Value="CERRAJERIA" />
                                    <ext:ListItem Index="3" Text="INMUEBLE" Value="INMUEBLE" /> 
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbClasificacionFiltro_Select" />
                                </Listeners> 
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton2" runat="server" />
                                </Plugins>
                            </ext:ComboBox>
                        </HeaderItems>
                    </ext:Column> 
    
                    <ext:Column
                        ID="cReporta"
                        runat="server"
                        Text="REPORTA"
                        Align="Center"
                        Filterable="false"
                        Width="110"
                        DataIndex="Reporto">
                    </ext:Column> 
                    
                    <ext:Column
                        ID="cTrabajoRequerido"
                        runat="server"
                        Text="TRABAJO REQUERIDO"
                        Align="Center"
                        Width="170"
                        Filterable="false"
                        DataIndex="TrabajoRequerido">
                    </ext:Column> 

                    <ext:DateColumn
                        ID="dcFechaOrigen"
                        runat="server"
                        Text="FECHA ORIGEN"
                        Align="Center"
                        Width="100"
                        DataIndex="FechaOrigen"
                        Format="dd/MM/yyyy">
                        <HeaderItems>
                            <ext:DateField ID="fOrigen" runat="server" Editable="false">
                                <Listeners>
                                    <Change Handler="applyFilter(App.fOrigen.getValue(),'FechaOrigen');" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton3" runat="server" />
                                </Plugins>
                                <PickerOptions 
                                    ID="poFechaEmision"
                                    runat="server"
                                    Cls="my-date-picker">
                                </PickerOptions>
                            </ext:DateField>
                        </HeaderItems>
                    </ext:DateColumn>

                    <ext:DateColumn
                        ID="dcHoraOrigen"
                        runat="server"
                        Text="HORA ORIGEN"
                        Align="Center"
                        Width="80"
                        Filterable="false"
                        Format="H:mm"
                        DataIndex="HoraOrigen">
                    </ext:DateColumn> 

                    <ext:DateColumn
                        ID="dcFechaMaxima"
                        runat="server"
                        Text="FECHA MÁXIMA"
                        Align="Center"
                        Width="100"
                        DataIndex="FechaMaximaAtencion"
                        Format="dd/MM/yyyy"> 
                        <HeaderItems>
                            <ext:DateField ID="fMaxima" runat="server" Editable="false">
                                <Listeners>
                                   <Change Handler="applyFilter(App.fMaxima.getValue(),'FechaMaximaAtencion');" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton4" runat="server" />
                                </Plugins>
                                <PickerOptions 
                                    ID="PickerOptions1"
                                    runat="server"
                                    Cls="my-date-picker">
                                </PickerOptions>
                            </ext:DateField>
                        </HeaderItems>
                    </ext:DateColumn>
                    
                    <ext:Column
                        ID="cObservaciones"
                        runat="server"
                        Text="ASUNTO"
                        Align="Center"
                        Filterable="false"
                        Width="210"
                        DataIndex="Observaciones">
                    </ext:Column> 
                    
                    <ext:Column
                        ID="cZona"
                        runat="server"
                        Text="ZONA"
                        Filterable="false"
                        Align="Center"
                        Width="110"
                        DataIndex="Zona"> 
                    </ext:Column> 
                    
                    <ext:Column
                        ID="cCuadrilla"
                        runat="server"
                        Text="CUADRILLA"
                        Align="Center"
                        Width="110"
                        DataIndex="Cuadrilla">
                             <HeaderItems>
                             <ext:ComboBox
                                ID="cmbCuadrillas"
                                runat="server"
                                Editable="false"
                                DisplayField="Nombre"
                                ValueField="ID">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Store>
                                <ext:Store ID="sCuadrilla" runat="server">
                                    <Model>
                                        <ext:Model ID="mCuadrillas" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Nombre" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                                </Store>
                                 <Listeners>
                                    <Select Fn="cmbCuadrillasFiltro_Select" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton5" runat="server" />
                                </Plugins>
                            </ext:ComboBox>
                    
                        </HeaderItems>
                    </ext:Column>

                    <ext:Column 
                        ID="cMovimiento"
                        runat="server"
                        Text="MOVIMIENTO"
                        Align="Center"
                        Width="140"
                        DataIndex="Mov">
                         <HeaderItems>
                            <ext:ComboBox
                                ID="cmbMovimiento"
                                runat="server"
                                ForceSelection="true"
                                Editable="false">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                    <ext:ListItem Index="1" Text="Mesa de reporte" Value="Mesa de reporte"/>
                                    <ext:ListItem Index="3" Text="Estimación" Value="Estimacion"/>
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbMovimientoFiltro_Select" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton6" runat="server" />
                                </Plugins>
                            </ext:ComboBox>
                        </HeaderItems>
                        <Renderer Fn="cMov_Renderer" />
                    </ext:Column>
                    
                    <ext:Column
                        ID="cUsuario"
                        runat="server"
                        Text="USUARIO"
                        Align="Center"
                        Width="125"
                        DataIndex="Usuario">
                        <HeaderItems>
                             <ext:ComboBox
                                ID="cmbUsuario"
                                runat="server"
                                Editable="false"
                                DisplayField="Nombre"
                                ValueField="ID">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Store>
                                <ext:Store ID="sUsuarios" runat="server">
                                    <Model>
                                        <ext:Model ID="mUsuarios" runat="server" IDProperty="ID">
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
                                </ext:Store>
                                </Store>
                                 <Listeners>
                                    <Select Fn="cmbUsuarioFiltro_Select" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton7" runat="server" />
                                </Plugins>
                            </ext:ComboBox>
                    
                        </HeaderItems>
                            
                    </ext:Column>
                    
                    <ext:Column
                        ID="cEstatus"
                        runat="server"
                        Text="ESTATUS"
                        Align="Center"
                        Width="90"
                        DataIndex="Estatus">
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbFiltroEstatus"
                                runat="server"
                                ForceSelection="true"
                                Editable="false">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                    <ext:ListItem Index="1" Text="PENDIENTE" />
                                    <ext:ListItem Index="2" Text="BORRADOR" />
                                    <ext:ListItem Index="3" Text="CONCLUIDO" />
                                    <ext:ListItem Index="4" Text="CANCELADO" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbEstatusFiltro_Select" />
                                </Listeners> 
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton8" runat="server" />
                                </Plugins>
                            </ext:ComboBox>
                        </HeaderItems> 
                    </ext:Column> 
               
                </Columns>
            </ColumnModel> 
                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" HideRefresh="True">
                        <Items>
                            <ext:Label ID="Label1" runat="server" Text="Tamaño página:" />
                            <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
                            <ext:ComboBox ID="ComboBox2" runat="server" Width="80">
                                <Items>
                                    <ext:ListItem Text="1" />
                                    <ext:ListItem Text="5" />
                                    <ext:ListItem Text="10" />
                                    <ext:ListItem Text="25" />
                                    <ext:ListItem Text="50" />
                                    <ext:ListItem Text="100" />
                                    <ext:ListItem Text="250" />
                                    <ext:ListItem Text="500" />
                                    <ext:ListItem Text="1000" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Value="10" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Handler="#{gpOrdenesEstimaciones}.store.pageSize = parseInt(this.getValue(), 10); #{gpOrdenesEstimaciones}.store.reload();" />
                                </Listeners>
                            </ext:ComboBox>
                        </Items>
                        </ext:PagingToolbar>
                    </BottomBar>
            <Listeners>
                <ItemClick Fn="gpOrdenesEstimaciones_ItemClick" />
                  <ItemDblClick Fn="gpOrdenEstimacion_ItemDblClick" />
            </Listeners>
            <View>
                <ext:GridView
                    ID="gvOrdenesEstimaciones"
                    runat="server"
                    StripeRows="true"> 
                </ext:GridView>
            </View>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmOrdenesEstimaciones"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel> 
        </ext:GridPanel> 
    </form>
</body>
</html> 