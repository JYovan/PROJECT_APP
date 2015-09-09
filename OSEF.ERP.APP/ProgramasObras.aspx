<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgramasObras.aspx.cs" Inherits="OSEF.ERP.APP.ProgramasObras" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%Response.WriteFile("Header.htm");%>
    <script type='text/javascript' src="js/tProgramasObras.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">

        <ext:ResourceManager ID="rmProgramasObras" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpProgramasObras"
            runat="server"
            Height="420"
            Width="1020"
            Title="PROGRAMA DE OBRAS"
            EnableColumnHide="true"
            EnableColumnMove="true"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbProgramasObras" runat="server">
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
                            <DirectEvents>
                                <Click OnEvent="imgbtnBorrar_Click" Success="imgbtnBorrar_Click_Success">
                                    <Confirmation ConfirmRequest="true" Title="Eliminar" Message="¿Deseas eliminar el registro?">
                                    </Confirmation>
                                    <EventMask ShowMask="true" CustomTarget="App.gpProgramasObras.body" Target="CustomTarget" Msg="Eliminando registro">
                                    </EventMask>
                                    <ExtraParams>
                                        <ext:Parameter Name="Id" Value="App.gpProgramasObras.getSelectionModel().getSelection()[0].get('Id')" Mode="Raw"></ext:Parameter>
                                        <ext:Parameter Name="Sucursal" Value="App.gpProgramasObras.getSelectionModel().getSelection()[0].get('SucursalId')" Mode="Raw"></ext:Parameter>
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsProgramasObras" runat="server" Width="500">
                        </ext:ToolbarSpacer>
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
                                <Click Handler="#{sProgramasObras}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar por obra"
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
                    ID="sProgramasObras"
                    runat="server"
                    PageSize="10" 
                    RemoteSort="true"
                    OnReadData="OnReadData_sProgramasObras">
                    <Model>
                        <ext:Model ID="mProgramasObras" runat="server">
                            <Fields>
                                <ext:ModelField Name="Id" Type="Int" />
                                <ext:ModelField Name="SucursalId" Type="String" />
                                <ext:ModelField Name="UsuarioId" Type="String" />
                                <ext:ModelField Name="FechaEmision" Type="Date" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="RSucursal" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="Id" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sProgramasObras_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column
                        ID="cId"
                        runat="server"
                        Text="ID"
                        Align="Center"
                        Width="100"
                        DataIndex="Id">
                    </ext:Column>
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Center"
                        Width="450"
                        DataIndex="SucursalId">
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
                        Width="135"
                        DataIndex="FechaEmision"
                        Format="dd/MM/yyyy">
                        <HeaderItems>
                            <ext:DateField ID="fEmision" runat="server" Editable="false">
                                <Listeners>
                                    <Change Handler="applyFilter(App.gpProgramasObras, App.fEmision.getValue(),'FechaEmision');" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton4" runat="server" />
                                </Plugins>
                            </ext:DateField>
                        </HeaderItems>
                    </ext:DateColumn>
                    <ext:Column
                        ID="cEstatus"
                        runat="server"
                        Text="ESTATUS"
                        Align="Center"
                        Width="135"
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
                        Width="200"
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
            <Listeners>
                <ItemClick Fn="gpProgramasObras_ItemClick" />
                <ItemDblClick Fn="gpProgramasObras_ItemDblClick" />
            </Listeners>
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
                            <ext:ListItem Value="100" />
                        </SelectedItems>
                        <Listeners>
                            <Select Handler="#{gpProgramasObras}.store.pageSize = parseInt(this.getValue(), 10); #{gpProgramasObras}.store.reload();" />
                        </Listeners>
                    </ext:ComboBox>
                </Items>
                </ext:PagingToolbar>
            </BottomBar>
        </ext:GridPanel>

    </form>
</body>
</html>
