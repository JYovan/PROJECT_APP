<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaColonia.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaColonias" %>

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
    <script type="text/javascript" src="js/colonias.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaProveedor" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sColonia"
            runat="server">
            <Model>
                <ext:Model ID="mFormacolonias" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                        <ext:ModelField Name="Estado" Type="String" />
                        <ext:ModelField Name="Municipio" Type="String" />
                       
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sColonia_Load" />
                <Add Fn="sColonia_Add" />
            </Listeners>
        </ext:Store>
    
        <ext:FormPanel 
            ID="fpColonias"
            runat="server"
            Height="230"
            Width="450"
            DefaultButton="imgbtnGuardar"
            BodyPadding="10"
            MonitorResize="true">
            <Items>
                <ext:FieldContainer
                    ID="ContenedorID" 
                    runat="server" 
                    FieldLabel="ID" 
                    AnchorHorizontal="100%" 
                    Layout="HBoxLayout">                                       
                    <Items>
                        <ext:TextField
                            ID="txtIDColonia" 
                            runat="server" 
                            Width="200" 
                            Disabled="true"
                            Margins="0 3 0 0"
                            >

                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>            
                <ext:FieldContainer 
                    ID="ContenedorColonia" 
                    runat="server" 
                    FieldLabel="Colonia" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField 
                            ID="txtfColonia" 
                            runat="server" 
                            Width="200"
                            AutoFocus="true"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            AllowBlank="false">
                            <Listeners>
                                <Blur Handler="App.txtfColonia.setValue(App.txtfColonia.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>                
                <ext:FieldContainer 
                    ID="fcEstado" 
                    runat="server" 
                    FieldLabel="Estado" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox 
                            ID="cmbEstados" 
                            runat="server" 
                            Width="200"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            DisplayField="Descripcion"
                            ValueField="ID"
                            AllowBlank="false"
                            Editable="true"
                            MatchFieldWidth="true"
                            ForceSelection="true"
                            QueryMode="Local"
                            TypeAhead="true">
                            <Store>
                                <ext:Store
                                    ID="sEstados"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mEstados" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Abreviacion" Type="String" />
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
                                <Change OnEvent="cmbEstado_Change">
                                    <ExtraParams>
                                        <ext:Parameter Name="valor" Value="App.cmbEstados.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Change>
                            </DirectEvents>
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>                
                <ext:FieldContainer 
                    ID="fcMunicipios" 
                    runat="server" 
                    FieldLabel="Municipios" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox 
                            ID="cbMunicipio" 
                            runat="server" 
                            Width="200"
                            MaxLength="50"
                            DisplayField="Descripcion"
                            ValueField="ID"
                            EnforceMaxLength="true"
                            AllowBlank="false"
                            Editable="true"
                            MatchFieldWidth="true"
                            ForceSelection="true"
                            QueryMode="Local"
                            TypeAhead="true">
                            <Store>
                                <ext:Store
                                    ID="sMunicipios"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mMunicipios" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                                <ext:ModelField Name="Estado" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                    <Sorters>
                                        <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                    </Sorters>
                                    <Listeners>
                                        <Load Fn="sMunicipios_Load" />
                                    </Listeners>
                                </ext:Store>
                            </Store>
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>       
            </Items>

            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>

            <BottomBar>
                <ext:StatusBar ID="sbProveedor" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
            </BottomBar>

            <Buttons>
                <ext:ImageButton
                    ID="imgbtnGuardar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Guardar.png" 
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Guardar" 
                    Height="50" 
                    Width="50"
                    Disabled="true">
                   <DirectEvents>
                        <Click OnEvent="imgbtnGuardar_Click">
                            <EventMask ShowMask="true" Msg="Registrando información..." />
                            <ExtraParams>
                                <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                            </ExtraParams>
                        </Click>
                    </DirectEvents>
                </ext:ImageButton>
                <ext:ImageButton 
                    ID="imgbtnCancelar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Cancelar.png" 
                    DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                    OverImageUrl="assets/img/controles/CancelarOver.png" 
                    PressedImageUrl="assets/img/controles/CancelarPressed.png" 
                    ToolTip="Cancelar" 
                    Height="50" 
                    Width="50">
                    <Listeners>
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
                </ext:ImageButton>
            </Buttons>
        </ext:FormPanel>
    </form>
</body>
</html>