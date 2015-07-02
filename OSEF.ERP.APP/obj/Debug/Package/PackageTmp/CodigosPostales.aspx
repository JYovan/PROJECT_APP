<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CodigosPostales.aspx.cs"
    Inherits="OSEF.AVANCES.SUCURSALES.CodigosPostales" %>

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
    <script type="text/javascript" src="js/reportes.js"></script>
    <script type="text/javascript" src="js/codigosPostales.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmCodigosPostales" runat="server" HideInDesign="true" />
    <ext:GridPanel ID="gpCodigosPostales" runat="server" Height="400" Width="960" Title="CÓDIGOS POSTALES"
        EnableColumnHide="false" EnableColumnMove="false" Header="true" TitleAlign="Left"
        Scroll="Both" AutoScroll="true" StyleSpec="margin:0 auto; margin-top: 20px;"
        Cls="x-CustomTreePanel">
        <LeftBar>
            <ext:Toolbar ID="Toolbar1" runat="server">
                <Items>
                    <ext:TreePanel ID="tpCodigosPostales" runat="server" Width="270" Height="265" Icon="BookOpen"
                        AutoScroll="true" Header="false" Cls="x-CustomTreePanel">
                        <Listeners>
                            <BeforeLoad Fn="tpCodigosPostales_BeforeLoad" />
                        </Listeners>
                        <SelectionModel>
                            <ext:TreeSelectionModel ID="tsmCodigosPostales" runat="server">
                                <Listeners>
                                    <Select Fn="tpCodigosPostales_SelectionChange">
                                    </Select>
                                </Listeners>
                            </ext:TreeSelectionModel>
                        </SelectionModel>
                    </ext:TreePanel>
                </Items>
            </ext:Toolbar>
        </LeftBar>
        <TopBar>
            <ext:Toolbar ID="tbCodigosPostales" runat="server">
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
                                <EventMask ShowMask="true" CustomTarget="App.gpCodigosPostales.body" Target="CustomTarget"
                                    Msg="Eliminando registro">
                                </EventMask>
                                <ExtraParams>
                                    <ext:Parameter Name="ID" Value="App.gpCodigosPostales.getSelectionModel().getSelection()[0].get('Id')"
                                        Mode="Raw">
                                    </ext:Parameter>
                                </ExtraParams>
                            </Click>
                        </DirectEvents>
                    </ext:ImageButton>
                    <ext:ToolbarSpacer ID="tbsCodigosPostales" runat="server" Width="500">
                    </ext:ToolbarSpacer>
                    <ext:ImageButton ID="imgbtnActualizar" runat="server" ImageUrl="assets/img/controles/update-normal.png"
                        DisabledImageUrl="assets/img/controles/update-disable.png" OverImageUrl="assets/img/controles/update-hover.png"
                        PressedImageUrl="assets/img/controles/update-pressed.png" ToolTip="Actualizar códigos postales"
                        Height="50" Width="50">
                        <Listeners>
                            <Click Handler="tpCodigosPostales_SelectionChange(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                        </Listeners>
                    </ext:ImageButton>
                  <ext:NumberField 
                    ID="nfBuscar" 
                    runat="server" 
                    AutoFocus="true" 
                    EmptyText="Buscar"
                    AllowDecimals="false"
                     AllowExponential="false"
                     DecimalPrecision="0"
                     MaxLength="5"
                     Width="200"
                     EnforceMaxLength="true"
                     MaxValue="99999"
                     MinValue="0"
                     Step="1"
                   Margins="0 10px 0 0"> 
                    <DirectEvents>
                        <Change OnEvent="txtCP_Change">
                            <ExtraParams>
                                <ext:Parameter Name="vNumero" Value="App.nfBuscar.getValue()" Mode="Raw" />
                            </ExtraParams>
                        </Change>
                    </DirectEvents>   
                    </ext:NumberField>
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Store>
            <ext:Store ID="sCodigosPostales" runat="server">
                <Model>
                    <ext:Model ID="mCodigosPostales" runat="server" IDProperty="ID">
                        <Fields>
                            <ext:ModelField Name="Id" Type="String" />
                            <ext:ModelField Name="Estado" Type="String" />
                            <ext:ModelField Name="Municipio" Type="String" />
                            <ext:ModelField Name="Colonia" Type="String" />
                            <ext:ModelField Name="Numero" Type="Int" />
                            <ext:ModelField Name="REstado" Type="Object" />
                            <ext:ModelField Name="RMunicipio" Type="Object" />
                            <ext:ModelField Name="RColonia" Type="Object" />
                            <ext:ModelField Name="RNumero" Type="Int" />
                        </Fields>
                    </ext:Model>
                </Model>
            </ext:Store>
        </Store>
        <ColumnModel>
            <Columns>
                <ext:NumberColumn ID="ncCodigoPostal" runat="server" Text="C.P." Align="Left" Width="90"
                    DataIndex="Numero">
                    <Renderer Fn="rfCP" />
                    <Editor>
                        <ext:TextField ID="txtNumero" runat="server" MaxLength="5" EnforceMaxLength="true"
                            ReadOnly="false">
                            <Listeners>
                                <SpecialKey Handler="if (e.getKey() === e.ENTER) {
                                                             this.up('gridpanel').enterWasPressed = true; 
                                                         }">
                                </SpecialKey>
                            </Listeners>
                        </ext:TextField>
                    </Editor>
                </ext:NumberColumn>
                <ext:Column runat="server" Text="ESTADO" Align="Left" Width="160" DataIndex="Estado">
                    <Renderer Fn="cEstado_Renderer" />
                    <Editor>
                        <ext:ComboBox ID="cmbEstado" runat="server" AllowBlank="false" Width="210" Editable="true"
                            ValueField="ID" DisplayField="Descripcion" MatchFieldWidth="true" ForceSelection="true"
                            EmptyText="Estado" QueryMode="Local" TypeAhead="true">
                            <Store>
                                <ext:Store ID="sEstados" runat="server">
                                    <Model>
                                        <ext:Model ID="mEstados" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                    <Sorters>
                                        <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                    </Sorters>
                                </ext:Store>
                            </Store>
                            <DirectEvents>
                                <Change OnEvent="cmbEstado_Select">
                                    <ExtraParams>
                                        <ext:Parameter Name="vEstado" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Change>
                            </DirectEvents>
                        </ext:ComboBox>
                    </Editor>
                </ext:Column>
                <ext:Column ID="cMunicipio" runat="server" Text="MUNICIPIO" Align="Center" Width="175"
                    DataIndex="Municipio">
                    <Renderer Fn="cMunicipio_Renderer" />
                    <Editor>
                        <ext:ComboBox ID="cmbMunicipio" runat="server" AllowBlank="false" Width="240" Editable="true"
                            ValueField="ID" DisplayField="Descripcion" MatchFieldWidth="true" ForceSelection="true"
                            EmptyText="Municipio" QueryMode="Local" TypeAhead="true">
                            <Store>
                                <ext:Store ID="sMunicipios" runat="server">
                                    <Model>
                                        <ext:Model ID="mMunicipio" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                    <Sorters>
                                        <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                    </Sorters>
                                </ext:Store>
                            </Store>
                            <DirectEvents>
                                <Change OnEvent="cmbMunicipio_Select">
                                    <ExtraParams>
                                        <ext:Parameter Name="vMunicipio" Value="App.cmbMunicipio.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Change>
                            </DirectEvents>
                        </ext:ComboBox>
                    </Editor>
                </ext:Column>
                <ext:Column ID="cColonia" runat="server" Text="COLONIA" Align="Left" Width="255"
                    DataIndex="Colonia">
                    <Renderer Fn="cColonia_Renderer" />
                    <Editor>
                        <ext:ComboBox ID="cmbColonia" runat="server" AllowBlank="false" Width="210" Editable="true"
                            EmptyText="Colonia" ValueField="ID" DisplayField="Descripcion" MatchFieldWidth="true"
                            ForceSelection="true" QueryMode="Local" TypeAhead="true">
                            <Store>
                                <ext:Store ID="sColonias" runat="server">
                                    <Model>
                                        <ext:Model ID="mColonia" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                    <Sorters>
                                        <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                    </Sorters>
                                </ext:Store>
                            </Store>
                            <DirectEvents>
                                <Change OnEvent="txtCP_Change">
                                </Change>
                            </DirectEvents>
                        </ext:ComboBox>
                    </Editor>
                </ext:Column>
            </Columns>
        </ColumnModel>
        <Plugins>
            <ext:CellEditing ID="CellEditing1" runat="server" ClicksToEdit="1">
                <Listeners>
                    <Edit Fn="ceCodigoPostal_Edit" />
                </Listeners>
            </ext:CellEditing>
        </Plugins>
        <Listeners>
            <ItemClick Fn="tpCodigosPostales_Select" />
        </Listeners>
        <SelectionModel>
            <ext:RowSelectionModel ID="rsmCodigosPostales" runat="server">
            </ext:RowSelectionModel>
        </SelectionModel>
        <FooterBar>
            <ext:StatusBar ID="sbCodigosPostales" runat="server" Text="ESTATUS" StatusAlign="Left">
            </ext:StatusBar>
        </FooterBar>
    </ext:GridPanel>
    </form>
</body>
</html>
