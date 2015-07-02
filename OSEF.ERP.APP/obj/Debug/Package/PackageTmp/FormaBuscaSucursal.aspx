<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaBuscaSucursal.aspx.cs" Inherits="OSEF.ERP.APP.FormaBuscaSucursal" %>

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
    <script type='text/javascript' src="js/buscaSucursales.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmSucursales" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpSucursales"
            runat="server"
            Height="320"
            Width="700"
            Title="SUCURSALES"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="false"
            TitleAlign="Left" >
            <TopBar>
                <ext:Toolbar ID="tbSucursales" runat="server">
                    <Items>
                        <ext:ToolbarSpacer ID="tbsSucursal" runat="server" Width="400">
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
                                <Click Handler="#{sSucursales}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <Listeners>
                                <Change Fn="txtBuscarSucursal_Change" />
                            </Listeners>
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnActualizarGrupoMenu"
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
                    ID="sBSucursales"
                    runat="server"
                    OnReadData="OnReadData_sSucursales">
                    <Model>
                        <ext:Model ID="mSucursales" runat="server" IDProperty="ID">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="CR" Type="String" />
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="Calle" Type="String" />
                                <ext:ModelField Name="NoExterior" Type="String" />
                                <ext:ModelField Name="Colonia" Type="String" />
                                <ext:ModelField Name="RColonia" Type="Object" />
                                <ext:ModelField Name="Gerente" Type="String">
                                    <Convert Fn="Gerente_Convert" />
                                </ext:ModelField>
                                <ext:ModelField Name="GerenteBBVANombre" Type="String" />
                                <ext:ModelField Name="GerenteBBVAAPaterno" Type="String" />
                                <ext:ModelField Name="GerenteBBVAAMaterno" Type="String" />
                                <ext:ModelField Name="InicioObra" Type="Date" />
                                <ext:ModelField Name="FinObra" Type="Date" />
                                <ext:ModelField Name="Estatus" Type="String" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sBSucursales_DataChanged" />
                    </Listeners>                  
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>                        
                    <ext:Column
                        ID="cCR"
                        runat="server"
                        Text="CR"
                        Align="Left"
                        Width="90"
                        DataIndex="CR" />
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Left"
                        Width="320"
                        DataIndex="Nombre" />
                    <ext:Column
                        ID="cDireccion"
                        runat="server"
                        Text="DIRECCIÓN"
                        Align="Center"
                        Width="260"
                        DataIndex="Calle" >
                        <Renderer Fn="cDireccion_Renderer" />
                    </ext:Column>
                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemDblClick Fn="gpBuscaSucursales_ItemDblClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmSucursales"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="stsbSucursales"
                    runat="server"
                    Text="*ELIJA UN REGISTRO DE LA TABLA"
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>

    </form>
</body>
</html>