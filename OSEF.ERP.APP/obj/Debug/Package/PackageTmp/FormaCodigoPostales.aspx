<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCodigoPostales.aspx.cs"
    Inherits="OSEF.ERP.APP.FormaCodigosPostales" %>

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
    <script type="text/javascript" src="js/codigosPostales.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmFormaCodigosPostales" runat="server" HideInDesign="true" />
    <ext:FormPanel ID="fpCodigosPostales" runat="server" Height="170" DefaultButton="imgbtnGuardar"
        BodyStyle="padding:5px 5px 0;" Layout="HBoxLayout" MonitorResize="true">
        <Items>
            <ext:Panel ID="Panel1" runat="server">
                <Items>
                    <ext:FieldContainer ID="FieldContainer3" runat="server" FieldLabel="Estado" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            
                            <ext:ComboBox ID="cmbEstado" runat="server" AllowBlank="false" Width="210" Editable="true"
                                ValueField="ID" DisplayField="Descripcion" MatchFieldWidth="true" ForceSelection="true" StyleSpec="margin-right: 6px;"
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

                        </Items>
                    </ext:FieldContainer>
                </Items>
                <Items>
                    <ext:FieldContainer ID="FieldContainer2" runat="server" FieldLabel="Colonia" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
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
                        </Items>
                    </ext:FieldContainer>
                </Items>
            </ext:Panel>
            <ext:Panel ID="Panel2" runat="server">
                <Items>
                    <ext:FieldContainer ID="FieldContainer1" runat="server" FieldLabel="Municipio" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            
                            <ext:ComboBox ID="cmbMunicipio" runat="server" AllowBlank="false" Width="210" Editable="true"
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

                        </Items>
                    </ext:FieldContainer>
                </Items>
                <Items>
                    <ext:FieldContainer ID="ContenedorCP" runat="server" FieldLabel="Código postal" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            <ext:TextField ID="txtCP" runat="server" Width="210" Margins="0 3 0 0" Disabled="true"
                                EmptyText="Escriba un código postal">
                                <Plugins>
                                    <ext:InputMask ID="imCP" runat="server" Mask="ttttt">
                                        <MaskSymbols>
                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                        </MaskSymbols>
                                    </ext:InputMask>
                                </Plugins>
                                <Listeners>
                                    <Blur Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer>
                </Items>
            </ext:Panel>
        </Items>
        <Buttons>
            <ext:ImageButton ID="imgbtnGuardar" runat="server" ImageUrl="assets/img/controles/Guardar.png"
                DisabledImageUrl="assets/img/controles/GuardarDisabled.png" OverImageUrl="assets/img/controles/GuardarOver.png"
                PressedImageUrl="assets/img/controles/GuardarPressed.png" ToolTip="Guardar" Height="50"
                Width="50" Disabled="true">  
                            <DirectEvents>
                                <Click OnEvent="imgbtnGuardar_Click" Success="imgbtnGuardar_Click_Success">
                                    <EventMask ShowMask="true" Msg="Registrando información..." />
                                    <ExtraParams>
                                        <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))"
                                            Mode="Raw" />
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
            </ext:ImageButton>
            <ext:ImageButton ID="imgbtnCancelar" runat="server" ImageUrl="assets/img/controles/Cancelar.png"
                DisabledImageUrl="assets/img/controles/CancelarDisabled.png" OverImageUrl="assets/img/controles/CancelarOver.png"
                PressedImageUrl="assets/img/controles/CancelarPressed.png" ToolTip="Cancelar"
                Height="50" Width="50">
                <Listeners>
                    <Click Handler="window.parent.App.wEmergente.hide();" />
                </Listeners>
            </ext:ImageButton>
        </Buttons>
    </ext:FormPanel>
    </form>
</body>
</html>
