﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VolumetriasPreciario.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.VolumetriasPreciario" %>

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
    <script type='text/javascript' src="js/tablerovolumetrias.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmVolumetrias" runat="server" HideInDesign="true">
        </ext:ResourceManager>

        <ext:GridPanel
            ID="gpVolumetrias"
            runat="server"
            Height="450"
            Width="1100"
            Title="VOLUMETRIAS"
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


                       

                        <ext:ToolbarSpacer ID="tbsVolumetrias" runat="server" Width="600">
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
                                <Click Handler="#{sVolumetrias}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                                </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
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
                    ID="sVolumetrias"
                    runat="server"
                    PageSize="100" 
                    RemoteSort="true"
                    OnReadData="OnReadData_sVolumetrias">
                    <Model>
                        <ext:Model ID="mVolumetrias" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="Int" />
                                <ext:ModelField Name="Mov" Type="String" />
                                <ext:ModelField Name="MovID" Type="String" />
                                <ext:ModelField Name="Sucursal" Type="String" />
                                <ext:ModelField Name="FechaEmision" Type="Date" />
                                <ext:ModelField Name="Observaciones" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="Usuario" Type="String" />
                                <ext:ModelField Name="Preciario" Type="String" />
                                <ext:ModelField Name="Cliente" Type="String" />
                                <ext:ModelField Name="RCliente" Type="Object" />
                                <ext:ModelField Name="RSucursal" Type="Object" />
                                <ext:ModelField Name="RPreciario" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                      <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sVolumetrias_DataChanged" />
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
                        Width="130"
                        Filterable="false"
                        DataIndex="Mov">
                        <HeaderItems>
                            <ext:TextField
                                ID="txtNombreCliente"
                                runat="server"
                                EmptyText="Filtrar por cliente"
                                Editable="false">
                              <Listeners>
                                    <Change Fn="txtBuscar_Change" />
                                </Listeners>
                            </ext:TextField>
                        </HeaderItems>
                        <Renderer Fn="cMov_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cCliente"
                        runat="server"
                        Text="CLIENTE"
                        Filterable="false"
                        Align="Center"
                        Width="150"
                        DataIndex="Cliente">
                        <Renderer Fn="cCliente_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Center"
                        Filterable="false"
                        Width="230"
                        DataIndex="Sucursal">
                        <Renderer Fn="cSucursal_Renderer" />
                    </ext:Column>
                     <ext:DateColumn
                        ID="dcFechaEmision"
                        runat="server"
                        Text="FECHA EMISIÓN"
                        Align="Center"
                        Width="130"
                        DataIndex="FechaEmision"
                        Format="dd/MM/yyyy">
                        <HeaderItems>
                            <ext:DateField ID="fEmision" runat="server" Editable="false">
                                <Listeners>
                                   <Change Handler="applyFilter(App.gpVolumetrias, App.fEmision.getValue(),'FechaEmision');" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton4" runat="server" />
                                </Plugins> 
                                <PickerOptions 
                                    ID="poFechaEmision"
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
                        Width="120"
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
                        ID="cObservaciones"
                        runat="server"
                        Text="OBSERVACIONES"
                        Align="Center"
                        Width="170"
                        DataIndex="Observaciones">
                    </ext:Column>

                     <ext:Column
                        ID="cPreciario"
                        runat="server"
                        Text="PRECIARIO"
                        Align="Center"
                        Width="190"
                        DataIndex="Preciario">
                        <Renderer Fn="cPreciario_Renderer" />
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbPreciariosFiltro"
                                runat="server"
                                DisplayField="Descripcion"
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
                                    <Select Fn="cmbPreciarioFiltro_Select" />
                                </Listeners>
                                <Store>
                                    <ext:Store
                                        ID="sPreciarios"
                                        runat="server">
                                        <Model>
                                            <ext:Model ID="mPreciarios" runat="server" IDProperty="ID">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                    <ext:ModelField Name="Sucursal" Type="String" />
                                                    <ext:ModelField Name="Estatus" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>

                            </ext:ComboBox>
                        </HeaderItems>

                    </ext:Column> 
                    <ext:Column 
                        ID="cUsuario"
                        runat="server"
                        Text="USUARIO"
                        Align="Center"
                        Width="150"
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
                                    <ext:ListItem Text="10" />
                                    <ext:ListItem Text="20" />
                                    <ext:ListItem Text="40" />
                                    <ext:ListItem Text="80" />
                                    <ext:ListItem Text="100" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Value="100" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Handler="#{gpVolumetrias}.store.pageSize = parseInt(this.getValue(), 10); #{gpVolumetrias}.store.reload();" />
                                </Listeners>
                            </ext:ComboBox>
                        </Items>
                        </ext:PagingToolbar>
                    </BottomBar>
            <Listeners>
                <ItemClick Fn="gpVolumetrias_ItemClick" />
                 <ItemDblClick Fn="gpVolumetrias_ItemDblClick" />
            </Listeners>
            <View>
                <ext:GridView
                    ID="gvVolumetrias"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmVolumetrias"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <%--<FooterBar>
                <ext:StatusBar
                    ID="sbVolumetrias"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>--%>
        </ext:GridPanel>
    </form>
</body>
</html>
