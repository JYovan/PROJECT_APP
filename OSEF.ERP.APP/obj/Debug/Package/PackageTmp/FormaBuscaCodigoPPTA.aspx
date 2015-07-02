<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaBuscaCodigoPPTA.aspx.cs" Inherits="OSEF.ERP.APP.FormaBuscaCodigoPPTA" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
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
    <script type='text/javascript' src="js/buscaCodigoPPTA.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmBuscaPPTA" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpCodigosPPTA"
            runat="server"
            Height="320"
            Width="595"
            Title="CÓDIGOS PPTA"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="false"
            TitleAlign="Left" >
            <TopBar>
                <ext:Toolbar ID="tbCodigos" runat="server">
                    <Items>
                        <ext:ToolbarSpacer ID="tbsCodigos" runat="server" Width="300">
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
                                <Click Handler="#{sCodigosPPTA}.reload(); App.imgbtnEditar.setDisabled(true);" />
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
                    ID="sCodigosPPTA"
                    runat="server"
                     OnReadData="OnReadData_sCodigosPPTA">
                    <Model>
                        <ext:Model ID="mCodigosPPTA" runat="server" IDProperty="CodigoMainSaver">
                            <Fields>
                                <ext:ModelField Name="CodigoMainSaver" Type="String" />
                                <ext:ModelField Name="Dias" Type="String" /> 
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="CodigoMainSaver" Direction="ASC" />
                    </Sorters>
                  
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>                        
                    <ext:Column
                        ID="cCodigo"
                        runat="server"
                        Text="CÓDIGO"
                        Align="Left"
                        Width="270"
                        DataIndex="CodigoMainSaver" />
                    <ext:Column
                        ID="cDescripcion"
                        runat="server"
                        Text="DIAS"
                        Align="Left"
                        Width="300"
                        DataIndex="Dias" />
                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemDblClick Fn="gpBuscaCodigos_ItemDblClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmCodigos"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="stsCodigos"
                    runat="server"
                    Text="*ELIJA UN REGISTRO DE LA TABLA"
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>

    </form>
</body>
</html>