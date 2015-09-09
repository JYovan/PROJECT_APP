<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaProveedor.aspx.cs" Inherits="OSEF.ERP.APP.FormaProveedor" %>

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
	<script type="text/javascript" src="fancylibs/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="js/proveedores.js"></script>
    <script type="text/javascript">
        var uploadError = function (item, file, errorCode, message) {
            alert("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
        };

        var fileSelectionError = function (item, file, errorCode, message) {
            alert("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
        };
        $(document).ready(function () {
            $("#fuImagenProveedor").on('change', function () {
                if (typeof (FileReader) != "undefined") {

                    var image_holder = $("#image-holder");
                    image_holder.empty();

                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("<img />", {
                            "src": e.target.result,
                            "class": "thumb-image",
                            "heigth":96,
                            "width":96
                        }).appendTo(image_holder);

                    }
                    image_holder.show();
                    reader.readAsDataURL($(this)[0].files[0]); 
                } else {
                    alert("Este navegador no soporta FileReader.");
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaProveedor" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sProveedor"
            runat="server">
            <Model>
                <ext:Model ID="mProveedor" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="RFC" Type="String" />
                        <ext:ModelField Name="ContactoNombre" Type="String" />
                        <ext:ModelField Name="ContactoAPaterno" Type="String" />
                        <ext:ModelField Name="ContactoAMaterno" Type="String" />
                        <ext:ModelField Name="Correo" Type="String" />
                        <ext:ModelField Name="Calle" Type="String" />
                        <ext:ModelField Name="EntreCalles" Type="String" />
                        <ext:ModelField Name="NoExterior" Type="String" />
                        <ext:ModelField Name="NoInterior" Type="String" />
                        <ext:ModelField Name="CodigoPostal" Type="Int" />
                        <ext:ModelField Name="Colonia" Type="String" />
                        <ext:ModelField Name="Estado" Type="String" />
                        <ext:ModelField Name="Municipio" Type="String" />
                        <ext:ModelField Name="Rutalogo" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sProveedor_Load" />
                <Add Fn="sProveedor_Add" />
            </Listeners>
        </ext:Store> 
        <ext:FormPanel 
            ID="PanelProveedores"
            runat="server"
            Height="480"
            Width="650"
            DefaultButton="imgbtnGuardar"
            BodyPadding="10"
            MonitorResize="true">
            <Items> 
               <ext:Panel 
                ID="Panel2"
                runat="server" 
                Height="145"
                Width="350"  
                StyleSpec="margin-left: 270px; margin-bottom:3px;"
                BodyPadding="5">
                <Items>
                        <ext:Image 
                        ID="imgLogo"
                        runat="server" 
                        Height="108" 
                        Width="108" 
                        StyleSpec="margin-bottom:3px;"
                        Align="Middle"
                        >
                    </ext:Image>
                    <ext:FileUploadField 
                        ID="fuImagenProveedor" 
                        runat="server" 
                        EmptyText="Selecciona una imagen" 
                        ButtonText=""
                        Width="108" 
                        Icon="ImageAdd"> 
                        <Listeners>
                            <Change Handler="App.txtFileName.setValue(App.fuImagenProveedor.getValue());"></Change>
                        </Listeners>  
                    </ext:FileUploadField>
                </Items>
                </ext:Panel>

                <ext:FieldContainer
                    ID="ContenedorID" 
                    runat="server" 
                    FieldLabel="ID" 
                    AnchorHorizontal="100%"  
                    Layout="HBoxLayout">                                       
                    <Items>
                        <ext:TextField
                            ID="txtID" 
                            runat="server" 
                            Width="503"  
                            Disabled="true">
                        </ext:TextField>  
                        <ext:TextField
                            ID="txtFileName"
                            runat="server"
                            Width="250"
                            StyleSpec="margin-right: 6px;"
                            AutoFocus="false"
                            Disabled="true"
                            MaxLength="8"
                            Hidden="true"
                            EnforceMaxLength="true">
                        </ext:TextField>
                        <%--<ext:Panel ID="Panel1" runat="server" FormGroup="true" Height="200">
                        <Content>
                            <div align="center">       
                            <input id="fileUpload" type="file" class="" /><br />
                            <div id="image-holder" width="96" heigth="96" ></div>
                         </div>
                        </Content>
                        </ext:Panel>--%>
                    </Items>
                </ext:FieldContainer>        
                <ext:FieldContainer 
                    ID="ContenedorNombre" 
                    runat="server" 
                    FieldLabel="Nombre" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField 
                            ID="txtfNombre" 
                            runat="server" 
                            Width="200"
                            MaxLength="50"
                            EnforceMaxLength="true" 
                            StyleSpec="margin-right: 3px;"
                            AutoFocus="true"
                            AllowBlank="false">
                            <Listeners>
                                <Blur Handler="App.txtfNombre.setValue(App.txtfNombre.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfRFC"
                            runat="server"
                            Width="300"
                            MaxLength="15"
                            FieldLabel="RFC"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfRFC.setValue(App.txtfRFC.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>                       
                <ext:FieldContainer
                    ID="FieldContainerContactos"
                    runat="server"
                    FieldLabel="Contacto"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfContactoNombre"
                            Width="200"
                            runat="server"
                            Margins="0 4 0 0"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfContactoNombre.setValue(App.txtfContactoNombre.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfContactoAPaterno"
                            Width="147"
                            runat="server"
                            Margins="0 4 0 0"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfContactoAPaterno.setValue(App.txtfContactoAPaterno.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfContactoAMaterno" 
                            Width="147" 
                            runat="server"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfContactoAMaterno.setValue(App.txtfContactoAMaterno.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="ContenedorCorreo"
                    runat="server"
                    FieldLabel="Correo"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfCorreo"
                            runat="server"
                            Vtype="email"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="100"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfCorreo.setValue(App.txtfCorreo.getValue().toLowerCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer 
                    ID="FieldContainerCalles" 
                    runat="server" 
                    FieldLabel="Calle" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfCalle"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="100"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfCalle.setValue(App.txtfCalle.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfEntreCalles"
                            FieldLabel="Entre Calles"
                            runat="server"
                            Width="300"
                            MaxLength="100"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfEntreCalles.setValue(App.txtfEntreCalles.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="FieldContainerNumInt"
                    runat="server"
                    FieldLabel="N° Exterior"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfNoExterior"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="10"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfNoExterior.setValue(App.txtfNoExterior.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfNoInterior"
                            FieldLabel="N° Interior"
                            runat="server"
                            Width="300"
                            MaxLength="10"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfNoInterior.setValue(App.txtfNoInterior.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="FieldContainerCPCol"
                    runat="server"
                    FieldLabel="Código Postal"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfCodigoPostal"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="5"
                            EnforceMaxLength="true"
                            AllowBlank="false">
                            <Plugins>
                                <ext:InputMask ID="imCP" runat="server" Mask="ttttt">
                                    <MaskSymbols>
                                        <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                    </MaskSymbols>
                                </ext:InputMask>
                            </Plugins>
                        </ext:TextField>
                  
                         
                        <ext:ComboBox 
                            ID="cmbEstado"
                            runat="server"
                            Width="300"
                            FieldLabel="Estado"
                            DisplayField="Descripcion"
                            ValueField="ID"
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
                                        <ext:Parameter Name="valor" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Change>
                            </DirectEvents>
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="FieldContainer5"
                    runat="server"
                    FieldLabel="Municipio"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox
                            ID="cmbMunicipio"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            DisplayField="Descripcion"
                            ValueField="ID"
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
                                        <ext:Model ID="mMunicipios" runat="server">
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
                            <DirectEvents>
                                <Change OnEvent="cmbMunicipio_Select">
                                    <ExtraParams>
                                        <ext:Parameter Name="valorMunicipio" Value="App.cmbMunicipio.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Change>
                            </DirectEvents>
                        </ext:ComboBox>
                         <ext:ComboBox
                            ID="cmbColonia"
                            runat="server"
                            FieldLabel="Colonia"
                            Width="300"
                            DisplayField="Descripcion"
                            ValueField="ID"
                             Editable="true"
                            MatchFieldWidth="true"
                        ForceSelection="true"
                        QueryMode="Local"
                        TypeAhead="true">
                            <Store>
                                <ext:Store
                                    ID="sColonias"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mColonias" runat="server">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                                <ext:ModelField Name="Estado" Type="String" />
                                                <ext:ModelField Name="Municipio" Type="String" />
                                                <ext:ModelField Name="REstado" Type="String" />
                                                <ext:ModelField Name="RMunicipio" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                     <Sorters>
                                        <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                    </Sorters>
                                    <Listeners>
                                        <Load Fn="sColonias_Load" />
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
                                <ext:Parameter Name="logo" Value="App.txtFileName.getValue()" Mode="Raw" />
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