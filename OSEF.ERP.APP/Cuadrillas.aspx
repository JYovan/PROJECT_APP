<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuadrillas.aspx.cs" Inherits="OSEF.ERP.APP.Cuadrillas" %>

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
    <script type="text/javascript" src="js/cuadrillas.js"></script>
</head>
<body class="xCustomBody">

    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmCuadrillas" runat="server" HideInDesign="true" />
    <ext:GridPanel ID="gpCuadrillas" runat="server" Height="400" Width="960" Title="CUADRILLAS"
        EnableColumnHide="false" EnableColumnMove="false" Header="true" TitleAlign="Left"
        Scroll="Both" AutoScroll="true" StyleSpec="margin:0 auto; margin-top: 20px;"
        Cls="x-CustomTreePanel"> 
         <TopBar>
            <ext:Toolbar ID="tbCuadrillas" runat="server">
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
                            <Click Fn="imgbtnNuevo_Click">
                            </Click>
                        </Listeners>
                    </ext:ImageButton>
                    <ext:ImageButton ID="imgbtnEditar" runat="server" ImageUrl="assets/img/controles/edit-normal.png"
                        DisabledImageUrl="assets/img/controles/edit-disable.png" OverImageUrl="assets/img/controles/edit-over.png"
                        PressedImageUrl="assets/img/controles/edit-pressed.png" Height="50" Width="50"
                        Disabled="true">
                        <Listeners>
                            <Click Fn="imgbtnEditar_Click">
                            </Click>
                        </Listeners>
                    </ext:ImageButton>
                    <ext:ImageButton ID="imgbtnBorrar" runat="server" ImageUrl="assets/img/controles/delete-normal.png"
                        DisabledImageUrl="assets/img/controles/delete-disable.png" OverImageUrl="assets/img/controles/delete-over.png"
                        PressedImageUrl="assets/img/controles/delete-pressed.png" Height="50" Width="50"
                        Disabled="true">
                        <DirectEvents>
                            <Click OnEvent="imgbtnBorrar_Click" Success="imgbtnBorrar_Click_Success">
                                <Confirmation ConfirmRequest="true" Title="Eliminar" Message="¿Deseas eliminar el registro?">
                                </Confirmation>
                                <EventMask ShowMask="true" CustomTarget="App.gpCuadrillas.body" Target="CustomTarget"
                                    Msg="Eliminando registro">
                                </EventMask>
                                <ExtraParams>
                                    <ext:Parameter Name="ID" Value="App.gpCuadrillas.getSelectionModel().getSelection()[0].get('ID')"
                                        Mode="Raw">
                                    </ext:Parameter>
                                </ExtraParams>
                            </Click>
                        </DirectEvents>
                    </ext:ImageButton>
                    <ext:ToolbarSpacer ID="tbsCuadrillas" runat="server" Width="500">
                    </ext:ToolbarSpacer>
                    <ext:ImageButton ID="imgbtnActualizar" runat="server" ImageUrl="assets/img/controles/update-normal.png"
                        DisabledImageUrl="assets/img/controles/update-disable.png" OverImageUrl="assets/img/controles/update-hover.png"
                        PressedImageUrl="assets/img/controles/update-pressed.png" ToolTip="Actualizar Cuadrillas"
                        Height="50" Width="50">
                        <Listeners>
                            <Click Handler="getData(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                        </Listeners>
                    </ext:ImageButton> 
                    
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <Listeners>
                                <Change Fn="txtBuscarCuadrilla_Change" />
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
            <ext:Store ID="sCuadrillas" runat="server"
                    PageSize="10" 
                    RemoteSort="true" OnReadData="OnReadData_sCuadrillas">
                <Model>
                    <ext:Model ID="mCuadrillas" runat="server" IDProperty="ID">
                        <Fields>
                            <ext:ModelField Name="ID" Type="String" />
                            <ext:ModelField Name="Nombre" Type="String" />
                            <ext:ModelField Name="Descripcion" Type="String" />
                        </Fields>
                    </ext:Model>
                </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sCuadrillas_DataChanged" />
                    </Listeners>
            </ext:Store>
        </Store>
        <ColumnModel>
            <Columns> 
                <ext:Column ID="cID" runat="server" Text="ID" Align="Center" Width="175" Filterable="false"
                    DataIndex="ID"> 
                </ext:Column> 
                <ext:Column ID="cNombre" runat="server" Text="NOMBRE" Align="Center" Width="275" Filterable="false"
                    DataIndex="Nombre"> 
                </ext:Column> 
                <ext:Column ID="cDescripcion" runat="server" Text="DESCRIPCIÓN" Align="Center" Width="500" Filterable="false"
                    DataIndex="Descripcion"> 
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
                                    <Select Handler="#{gpCuadrillas}.store.pageSize = parseInt(this.getValue(), 10); #{gpCuadrillas}.store.reload();" />
                                </Listeners>
                            </ext:ComboBox>
                        </Items>
                        </ext:PagingToolbar>
                    </BottomBar>
        <Listeners>
            <ItemClick Fn="gpCuadrillas_Select" />
            <ItemDblClick Fn="imgbtnEditar_Click"></ItemDblClick>
        </Listeners>

        <SelectionModel>
            <ext:RowSelectionModel ID="rsmCuadrillas" runat="server">
            </ext:RowSelectionModel>
        </SelectionModel> 
        </ext:GridPanel>
    </form>
</body>
</html>
