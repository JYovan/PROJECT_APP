<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="OSEF.ERP.APP.Clientes" %>

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
    <script type='text/javascript' src="js/clientes.js"></script>
 
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmClientes" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpClientes"
            runat="server"
            Height="420"
            Width="960"
            Title="CLIENTES"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
       
            <TopBar>
                <ext:Toolbar ID="tbClientes" runat="server">
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
                            <Listeners>
                                <Click Fn="imgbtn_EliminarCliente" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsConceptos" runat="server" Width="500">
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
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
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
                    ID="sClientes"
                    runat="server"
                    RemoteSort="true"
                    OnReadData="OnReadData_sClientes">
                    <Model>
                        <ext:Model ID="mClientes" runat="server" IDProperty="ID">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="NombreCompleto" Type="String">
                                    <Convert Fn="NombreCompleto_Convert" />
                                </ext:ModelField>
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="APaterno" Type="String" />
                                <ext:ModelField Name="AMaterno" Type="String" />
                                <ext:ModelField Name="FechaNacimiento" Type="Date" />
                                <ext:ModelField Name="Correo" Type="String" />
                                <ext:ModelField Name="Telefono" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="RCodigoPostal" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sClientes_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cID"
                        runat="server"
                        Text="ID"
                        Align="Center"
                        Width="90"
                        DataIndex="ID" />
                    <ext:Column 
                        ID="cSocio"
                        runat="server"
                        Text="CLIENTE"
                        Align="Left"
                        Width="280"
                        DataIndex="NombreCompleto" > 
                        <HeaderItems>
                            <ext:TextField
                                ID="txtNombreCliente"
                                runat="server"
                                EmptyText="Filtrar por nombre"
                                Editable="false">
                              <Listeners>
                                    <Change Fn="txtBuscar_Cliente" />
                                </Listeners>
                            </ext:TextField>
                        </HeaderItems>
                        </ext:Column>
                    <%--<ext:DateColumn
                        ID="dcFechaNacimiento"
                        runat="server"
                        Text="NACIMIENTO"
                        Align="Center"
                        Width="100"
                        DataIndex="FechaNacimiento"
                        Format="dd/MM/yyyy" />--%>
                    <ext:Column
                        ID="cCorreo"
                        runat="server"
                        Text="CORREO"
                        Align="Left"
                        Width="250"
                        DataIndex="Correo" />
                      <ext:Column
                        ID="cTelefono"
                        runat="server"
                        Text="TELÉFONO"
                        Align="Center"
                        Width="115"
                        DataIndex="Telefono"/>
                      <ext:Column
                        ID="cCodigoPostal"
                        runat="server"
                        Text="CÓDIGO POSTAL"
                        Align="Center"
                        Width="115"
                        DataIndex="RCodigoPostal">
                        <Renderer Fn="cCodigoPostal_Renderer" />
                      </ext:Column>
                      <ext:Column
                        ID="cEstatus"
                        runat="server"
                        Text="ESTATUS"
                        Align="Center"
                        Width="110"
                        DataIndex="Estatus" />                   
                </Columns>
            </ColumnModel>

                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" HideRefresh="True">
                        <Items>
                            <ext:Label ID="Label1" runat="server" Text="TAMAÑO DE PÁGINA:" />
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
                                    <Select Handler="#{gpClientes}.store.pageSize = parseInt(this.getValue(), 10); #{gpClientes}.store.reload();" />
                                </Listeners>
                            </ext:ComboBox>
                            <ext:Label ID="lblPagingTool" runat="server" Text="" />
                        </Items>
                        </ext:PagingToolbar>
                    </BottomBar>

            <Listeners>
                <ItemClick Fn="gpClientes_ItemClick" />
                <ItemDblClick Fn="imgbtnEditar_Click"></ItemDblClick>
               <%-- <BeforeRender Fn="gpEstilo_Renderer" ></BeforeRender>--%>
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmClientes"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <%--<FooterBar>
                <ext:StatusBar
                    ID="sbClientes"
                    runat="server"
                    Text="" 
                    StatusAlign="Left"> 
                </ext:StatusBar>
            </FooterBar>--%>
        </ext:GridPanel>
    </form>
</body>
</html>
