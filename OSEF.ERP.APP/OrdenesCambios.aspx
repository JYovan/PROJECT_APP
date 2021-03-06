﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdenesCambios.aspx.cs" Inherits="OSEF.ERP.APP.OrdenesCambios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%Response.WriteFile("Header.htm");%>
    <script type='text/javascript' src="js/tableroOrdenesCambios.js"></script>
    <script type="text/javascript" src="js/libs/jquery-2.0.3.min.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
 
    <ext:ResourceManager ID="rmOrdenesEstimaciones" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpOrdenesEstimaciones"
            runat="server"
            Height="420"
            Width="1020"
            Title="ÓRDENES DE CAMBIO"
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
                        <ext:ComboBox
                            ID="cmbSucursal"
                            runat="server"
                            LabelWidth="70"
                            Width="360"
                            FieldLabel="SUCURSAL"
                            ValueField="ID"
                            Cls="spanCustomCombo xEspacioCmbxCustom"
                            PageSize="10"
                            DisplayField="Nombre"
                            StyleSpec="margin-right: 3px;"
                            Editable="true"
                            MatchFieldWidth="true"
                            ForceSelection="true"
                            QueryMode="Local"
                            TypeAhead="true"
                            EnforceMaxLength="true">
                            <ListConfig ID="lcPreciario" runat="server" Width="400" Cls="xEspacioCmbxCustom">
                                <ItemTpl ID="itPreciario" runat="server">
                                    <Html>
                                        <div class="search-item">
			                                <h3>{CR}</h3>
                                            <span>{Nombre}</span>
		                                </div>
                                    </Html>
                                </ItemTpl>
                            </ListConfig>
                            <SelectedItems>
                                <ext:ListItem Index="0" />
                            </SelectedItems>
                            <Store>
                                <ext:Store
                                    ID="sSucursal"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mSucursal" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Nombre" Type="String" />
                                                <ext:ModelField Name="CR" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                    <Sorters>
                                        <ext:DataSorter Property="CR" Direction="ASC" />
                                    </Sorters>
                                </ext:Store>
                            </Store>
                        </ext:ComboBox>
                        <ext:ToolbarSpacer ID="tbsOrdenesCambio" runat="server" Width="80">
                        </ext:ToolbarSpacer>
                         <ext:Container
                                ID="cCorreoEnviado"
                                runat="server">
                                 <Content>
                                 <asp:ImageButton 
                                        ID="imgbtnResExcel" 
                                        runat="server" 
                                        Height="50"
                                        Width="50"
                                        OnClick="ExportExcel"
                                        class="imgs" 
                                        ImageUrl="assets/img/controles/ExcelNormal.png"/>
                                     <asp:ImageButton 
                                        ID="imgbtnFin" 
                                        runat="server" 
                                        Height="50"
                                        Width="50"
                                        OnClick="ExportEt"
                                        class="imgs" 
                                        ImageUrl="assets/img/controles/pdfNormal.png"/>
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
                            EmptyText="Buscar..."
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
                    PageSize="100" 
                    RemoteSort="true"
                    OnReadData="OnReadData_sOrdenesEstimaciones">
                    <Model>
                        <ext:Model ID="mOrdenesEstimaciones" runat="server">
                            <Fields>
                                <ext:ModelField Name="Id" Type="Int" />
                                <ext:ModelField Name="Mov" Type="String" />
                                <ext:ModelField Name="MovID" Type="String" />
                                <ext:ModelField Name="Sucursal" Type="String" />
                                 <ext:ModelField Name="RSucursal" Type="Object" />
                                <ext:ModelField Name="FechaEmision" Type="Date" />
                                <ext:ModelField Name="Observaciones" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="Usuario" Type="String" />
                                <ext:ModelField Name="Reporte" Type="String" />
                                <ext:ModelField Name="Zona" Type="String" />
                                <ext:ModelField Name="Cuadrilla" Type="String" />
                                <ext:ModelField Name="RCuadrilla" Type="Object" />
                                <ext:ModelField Name="Observaciones" Type="String" />
                                <ext:ModelField Name="TrabajoRequerido" Type="String" />
                                 <ext:ModelField Name="NoOrden" Type="String" />
                                 <ext:ModelField Name="Cliente" Type="String" />
                                 <ext:ModelField Name="RCliente" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                      <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sOrdenesEstimaciones_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    
                    <ext:Column 
                        ID="cMovimiento"
                        runat="server"
                        Text="MOVIMIENTO"
                        Align="Center"
                        Width="170"
                        DataIndex="Mov">
                        <Renderer Fn="cMov_Renderer" />
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbMovimiento"
                                runat="server"
                                ForceSelection="true"
                                Editable="false">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                    <ext:ListItem Index="1" Text="Orden de Cambio" Value="Orden de Cambio"/>
                                    <ext:ListItem Index="2" Text="Orden de Compra" Value="Orden de Compra"/>
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbMovimientoFiltro_Select" />
                                </Listeners>
                            </ext:ComboBox>
                        </HeaderItems> 
                    </ext:Column>
                    <ext:Column
                        ID="cNoOrden"
                        runat="server"
                        Text="NO. ORDEN"
                        Align="Center"
                        Width="70"
                        DataIndex="NoOrden"> 
                        <Renderer Fn="cNoOrden_Renderer"></Renderer>
                        <HeaderItems> 
                        <ext:TextField
                                ID="txtReporte"
                                EmptyText="Buscar"
                                runat="server">
                                <Listeners>
                                    <Change Fn="txtNoOrdenFiltro_Change" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton1" runat="server" />
                                </Plugins>
                            </ext:TextField>
                        </HeaderItems>
                    </ext:Column>
                    <ext:Column
                        ID="cObservaciones"
                        runat="server"
                        Text="OBSERVACIONES"
                        Align="Center"
                        Width="245"
                        DataIndex="Observaciones">
                     </ext:Column>

                    <ext:Column
                        ID="cCliente"
                        runat="server"
                        Text="CLIENTE"
                        Align="Center"
                        Width="120"
                        Filterable="false"
                        DataIndex="Cliente">
                        <Renderer Fn="cCliente_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Center"
                        Width="250"
                        DataIndex="Sucursal">
                      <Renderer Fn="cSucursal_Renderer" />
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbSucursalFiltro"
                                runat="server"
                                DisplayField="Nombre"
                                ValueField="ID"
                                ForceSelection="true"
                                Editable="false">
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

                            </ext:ComboBox>
                        </HeaderItems>

                    </ext:Column>
                    <ext:DateColumn
                        ID="dcFechaEmision"
                        runat="server"
                        Text="FECHA EMISIÓN"
                        Align="Center"
                        Width="115"
                        DataIndex="FechaEmision"
                        Format="dd/MM/yyyy">
                        <HeaderItems>
                            <ext:DateField ID="fEmision" runat="server" Editable="false">
                                <Listeners>
                                   <Change Handler="applyFilter(App.gpOrdenesEstimaciones, App.fEmision.getValue(),'FechaEmision');" />
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
                        ID="cEstatus"
                        runat="server"
                        Text="ESTATUS"
                        Align="Center"
                        Width="125"
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
                              

                            </ext:ComboBox>
                        </HeaderItems>


                    </ext:Column> 
                    <ext:Column
                        ID="cUsuario"
                        runat="server"
                        Text="USUARIO"
                        Align="Center"
                        Width="120"
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
                            </ext:ComboBox>
                    
                        </HeaderItems> 
                    </ext:Column> 
                    
                </Columns>
            </ColumnModel>
            <Plugins>
                        <ext:FilterHeader ID="FilterHeader1" runat="server" Remote="true" />
                    </Plugins>
                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" HideRefresh="True">
                        <Items>
                            <ext:Label ID="Label1" runat="server" Text="Tamaño página:" />
                            <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
                            <ext:ComboBox ID="ComboBox2" runat="server" Width="80">
                                  <Items>
                                    <ext:ListItem Text="1" />
                                    <ext:ListItem Text="5" />
                                    <ext:ListItem Text="15" />
                                    <ext:ListItem Text="25" /> 
                                    <ext:ListItem Text="50" />
                                    <ext:ListItem Text="100" />
                                    <ext:ListItem Text="200" />
                                    <ext:ListItem Text="300" />
                                    <ext:ListItem Text="500" />
                                    <ext:ListItem Text="1000" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Value="100" />
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
<%--
            <FooterBar>
                <ext:StatusBar
                    ID="sbOrdenesEstimacion"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>--%>
        </ext:GridPanel>
    </form>
</body>
</html>
