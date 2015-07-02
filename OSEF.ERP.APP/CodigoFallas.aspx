<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CodigoFallas.aspx.cs" Inherits="OSEF.ERP.APP.CodigoFallas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title><link rel="stylesheet" href="css/login.css" />
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
    <script type="text/javascript" src="js/codigosfallas.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmCodigoPPTA" runat="server" HideInDesign="true" />
    <ext:GridPanel ID="gpCodigoPPTA" runat="server" Height="400" Width="960" Title="CÓDIGOS PPTA"
        EnableColumnHide="false" EnableColumnMove="false" Header="true" TitleAlign="Left"
        Scroll="Both" AutoScroll="true" StyleSpec="margin:0 auto; margin-top: 20px;"
        Cls="x-CustomTreePanel"> 
        <TopBar>
            <ext:Toolbar ID="tbCodigoPPTA" runat="server">
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
                                <EventMask ShowMask="true" CustomTarget="App.gpCodigoPPTA.body" Target="CustomTarget"
                                    Msg="Eliminando registro">
                                </EventMask>
                                <ExtraParams>
                                    <ext:Parameter Name="ID" Value="App.gpCodigoPPTA.getSelectionModel().getSelection()[0].get('CodigoMainSaver').trim()"
                                        Mode="Raw">
                                    </ext:Parameter>
                                </ExtraParams>
                            </Click>
                        </DirectEvents>
                    </ext:ImageButton>
                    <ext:ToolbarSpacer ID="tbsCodigoPPTA" runat="server" Width="440">
                    </ext:ToolbarSpacer>
                    <ext:ImageButton ID="imgbtnActualizar" runat="server" ImageUrl="assets/img/controles/update-normal.png"
                        DisabledImageUrl="assets/img/controles/update-disable.png" OverImageUrl="assets/img/controles/update-hover.png"
                        PressedImageUrl="assets/img/controles/update-pressed.png" ToolTip="Actualizar códigos postales"
                        Height="50" Width="50">
                        <Listeners>
                            <Click Handler="getData(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                        </Listeners>
                    </ext:ImageButton>
                 <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar código"
                            Width="260">
                            <Listeners>
                                <Change Fn="txtBuscarCodigoFalla_Change" />
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
            <ext:Store ID="sCodigoPPTA" runat="server" OnReadData="OnReadData_sCodigosPPTA">
                <Model>
                    <ext:Model ID="mCodigoPPTA" runat="server" IDProperty="ID">
                        <Fields>
                         <%--   <ext:ModelField Name="ID" Type="String" />
                            <ext:ModelField Name="Especialidad" Type="String" /> 
                            <ext:ModelField Name="Familia" Type="String" /> 
                            <ext:ModelField Name="SubEspecialidad" Type="String" />--%> 
                            <ext:ModelField Name="CodigoMainSaver" Type="String" />
                        <%--    <ext:ModelField Name="Descripcion" Type="String" />--%> 
                            <ext:ModelField Name="Dias" Type="String" /> 
                            <%--<ext:ModelField Name="Prioridad" Type="String" /> 
                            <ext:ModelField Name="TiempoEstimado" Type="String" /> 
                            <ext:ModelField Name="REspecialidad" Type="Object" />
                            <ext:ModelField Name="RFamilias" Type="Object" />
                            <ext:ModelField Name="RSubespecialidad" Type="Object" />--%>
                        </Fields>
                    </ext:Model>
                </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sCodigoPPTA_DataChanged" />
                    </Listeners>
            </ext:Store>
        </Store>
        <ColumnModel>
            <Columns> 
                <ext:Column ID="cMainSaver" runat="server" Text="CÓDIGO MAINSAVER" Align="Left" Width="375"
                    DataIndex="CodigoMainSaver">  
                </ext:Column>
                <ext:Column ID="cDias" runat="server" Text="DIAS" Align="Left" Width="565"
                    DataIndex="Dias">  
                    <Renderer Fn="cvDias_Renderer"></Renderer>
                </ext:Column>
            </Columns>
        </ColumnModel> 
        <Listeners>
            <ItemClick Fn="tpCodigoPPTA_Select" />
            <ItemDblClick Fn="imgbtnEditar_Click" />
        </Listeners>
        <SelectionModel>
            <ext:RowSelectionModel ID="rsmCodigoPPTA" runat="server">
            </ext:RowSelectionModel>
        </SelectionModel>
        <FooterBar>
            <ext:StatusBar ID="sbCodigoPPTA" runat="server" Text="ESTATUS" StatusAlign="Left">
            </ext:StatusBar>
        </FooterBar>
    </ext:GridPanel>
    </form>
</body>
</html>
