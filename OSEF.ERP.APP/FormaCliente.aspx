<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCliente.aspx.cs" Inherits="OSEF.ERP.APP.FormaCliente" %>

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
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmFormaCliente" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sCliente"
            runat="server">
            <Model>
                <ext:Model
                    ID="mCliente"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="APaterno" Type="String" />
                        <ext:ModelField Name="AMaterno" Type="String" />
                        <ext:ModelField Name="Correo" Type="String" />
                        <ext:ModelField Name="Telefono" Type="String" />
                        <ext:ModelField Name="TelefonoMovil" Type="String" />
                        <ext:ModelField Name="Calle" Type="String" />
                        <ext:ModelField Name="NoExterior" Type="String" />
                        <ext:ModelField Name="NoInterior" Type="String" /> 
                        
                        <ext:ModelField Name="RCodigoPostal" Type="Object" />
                        <ext:ModelField Name="RColonia" Type="Object" />
                        <ext:ModelField Name="REstado" Type="Object" />
                        <ext:ModelField Name="RMunicipio" Type="Object" />

                        <ext:ModelField Name="EntreCalles" Type="String" /> 
                        <ext:ModelField Name="Usuario" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="RutaLogo" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sCliente_Load" />
                <Add Fn="sCliente_Add" />
            </Listeners>
        </ext:Store>

        <div>
            <ext:Panel
                ID="pFormaCliente" 
                runat="server" 
                Width="810"
                BodyStyle="background-color:transparent;"> 
                <Items>
                    <ext:FormPanel 
                        ID="fpCliente" 
                        runat="server" 
                        Height="464"
                        DefaultButton="imgbtnGuardar"
                        MonitorResize="true">
                        <Items>
                            <ext:TabPanel 
                                ID="tpCliente" 
                                runat="server" 
                                ActiveTabIndex="0" 
                                Width="810"
                                Plain="true"
                                AutoScroll="true"
                                Cls="custotabpanel xchris">
                                <Items>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatoGenerales" 
                                        runat="server" 
                                        Title="Datos Generales" 
                                        BodyPadding="10"
                                        MonitorResize="true">
                                        <Items>
                                            <ext:FieldContainer
                                                ID="fcID" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Cliente" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfID"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        AutoFocus="false"
                                                        Disabled="true"
                                                        MaxLength="8"
                                                        EnforceMaxLength="true">
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
                                                     
                                                    <ext:FileUploadField 
                                                        ID="fuImagenCliente" 
                                                        runat="server" 
                                                        EmptyText="Selecciona una imagen"
                                                        FieldLabel="Logo"
                                                        ButtonText=""
                                                        Icon="ImageAdd">
                                                        <Listeners>
                                                            <Change Fn="onFUCliente"></Change>
                                                        </Listeners>  
                                                        </ext:FileUploadField>

                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer
                                                ID="fcNombre" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Nombre(s)">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfNombre"
                                                        runat="server"
                                                        EmptyText="Nombre"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        AutoFocus="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfNombre.setValue(App.txtfNombre.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfAPaterno"
                                                        runat="server"
                                                        Width="198"
                                                        EmptyText="Apellido paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfAPaterno.setValue(App.txtfAPaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfAMaterno"
                                                        runat="server"
                                                        EmptyText="Apellido materno"
                                                        Width="198"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfAMaterno.setValue(App.txtfAMaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer
                                                ID="fcCliente6" 
                                                runat="server" 
                                                FieldLabel="Teléfono"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfTelefono"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        Editable="true"
                                                        MaxLength="15"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="true"
                                                        Note="Ejemplo: (449) 999-00-00">
                                                        <Plugins>
                                                            <ext:InputMask
                                                                ID="imTelefono"
                                                                runat="server"
                                                                Mask="(999) 999-99-99"
                                                                AllowInvalid="true" />
                                                        </Plugins>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfTelefonoMovil"
                                                        runat="server"
                                                        Width="402"
                                                        FieldLabel="Teléfono móvil"
                                                        ForceSelection="true"
                                                        Editable="true"
                                                        AllowBlank="true"
                                                        Note="Ejemplo: (044-449) 999-00-00"
                                                        MaxLength="19"
                                                        EnforceMaxLength="true">
                                                        <Plugins>
                                                            <ext:InputMask
                                                                ID="imTelefonoMovil"
                                                                runat="server"
                                                                Mask="(999-999) 999-99-99"
                                                                AllowInvalid="true" />
                                                        </Plugins>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcCliente7" 
                                                runat="server" 
                                                FieldLabel="Correo"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfCorreo"
                                                        runat="server"
                                                        Width="250"
                                                        Editable="true"
                                                        Vtype="email"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="true"
                                                        StyleSpec="margin-right: 6px;">
                                                    </ext:TextField>
                                                    <ext:ComboBox
                                                        ID="cmbEstatus"
                                                        runat="server"
                                                        AllowBlank="false"
                                                        Editable="false"
                                                        Width="402"
                                                        FieldLabel="Estatus"
                                                        ValueField="ID"
                                                        DisplayField="Descripcion">
                                                     
                                                        <Store>
                                                            <ext:Store ID="sEstatus" runat="server">
                                                                <Model>
                                                                    <ext:Model ID="mEstatus" runat="server" IDProperty="ID">
                                                                        <Fields>
                                                                            <ext:ModelField Name="ID" Type="String" />
                                                                            <ext:ModelField Name="Descripcion" Type="String" />
                                                                        </Fields>
                                                                    </ext:Model>
                                                                </Model>
                                                            </ext:Store>
                                                        </Store>
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="ALTA" Value="ALTA" />
                                                            <ext:ListItem Index="1" Text="BLOQUEADO" Value="BLOQUEADO" />
                                                            <ext:ListItem Index="2" Text="BAJA" Value="BAJA" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcCliente8" 
                                                runat="server" 
                                                FieldLabel="Fecha alta"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                Disabled="true">
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfFechaAlta"
                                                        runat="server"
                                                        StyleSpec="margin-right: 6px;"
                                                        Width="250"
                                                        AllowBlank="true"
                                                        Vtype="daterange">
                                                    </ext:DateField>
                                                    <ext:TextField
                                                        ID="txtfUsuario"
                                                        runat="server"
                                                        Width="402"
                                                        Editable="false"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        FieldLabel="Usuario">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer> 
                                            
                                            <ext:FieldContainer 
                                                ID="fbtnBuscarSucursal" 
                                                runat="server" 
                                                FieldLabel="Sucursales"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                Disabled="false">
                                                <Items>  
                                                    <ext:LinkButton ID="btnBuscarSucursal" runat="server" Icon="Add" Text="Agregar Sucursal" ToggleGroup="Group1" >
                                                        <Listeners>
                                                            <Click Fn="btnBuscarSucursal_Click"></Click>
                                                        </Listeners>
                                                    </ext:LinkButton>
                                                </Items>
                                            </ext:FieldContainer>

                                            <ext:FieldContainer 
                                                ID="fcImagen" 
                                                runat="server" 
                                                FieldLabel="Logo Actual"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                Disabled="false">
                                                <Items>  
                                                    <ext:Image 
                                                    ID="imgNormal"
                                                    runat="server"
                                                    StyleSpec="margin-right: 3px;"
                                                    Height="90"
                                                    Cls="img-resize"
                                                    Width="200">
                                                </ext:Image>
                                                
                                                </Items>
                                              </ext:FieldContainer>


                                              
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDireccion" 
                                        runat="server" 
                                        Title="Dirección" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer
                                                ID="fcDireccion1" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Calle" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfCalle" 
                                                        runat="server" 
                                                        Width="250" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true"
                                                        AutoFocus="true"
                                                        AllowBlank="false">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfCalle.setValue(App.txtfCalle.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfEntreCalles" 
                                                        FieldLabel="Entre Calles" 
                                                        runat="server" 
                                                        Width="402"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfEntreCalles.setValue(App.txtfEntreCalles.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDireccion2" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="N° Exterior"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfNoExterior"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfNoExterior.setValue(App.txtfNoExterior.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfNoInterior"
                                                        FieldLabel="N° Interior"
                                                        runat="server"
                                                        Width="402"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfNoInterior.setValue(App.txtfNoInterior.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer> 
                                            
                                        <ext:FieldContainer ID="fCodigoPostalEstado" runat="server" LabelWidth="120" FieldLabel="Código Postal"
                                            AnchorHorizontal="100%" Layout="ColumnLayout">
                                            <Items>
                                                <ext:TextField ID="txtfCodigoPostal" runat="server" 
                                                        Width="250" MaxLength="100" StyleSpec="margin-right: 6px;"  
                                                        EnforceMaxLength="true" AllowBlank="false" ReadOnly="true"> 
                                                    <RightButtons>
                                                        <ext:Button ID="Button1" runat="server" Icon="Find" StandOut="true">
                                                            <Listeners>
                                                                <Click Fn="imgbtnBuscar_Click" />
                                                            </Listeners>
                                                        </ext:Button>
                                                    </RightButtons> 

                                                </ext:TextField>
                                                  <ext:TextField ID="txtEstado" runat="server" Width="402" StyleSpec="margin-right: 6px;"
                                                    MaxLength="50" EnforceMaxLength="true" AllowBlank="true"  Disabled="true" FieldLabel="Estado"> 
                                                    <Plugins>
                                                        <ext:InputMask ID="InputMask1" runat="server" Mask="ttttt">
                                                            <MaskSymbols>
                                                                <ext:MaskSymbol Name="t" Regex="[a-zA-Z\s]" />
                                                            </MaskSymbols>
                                                        </ext:InputMask>
                                                    </Plugins>

                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer> 
                                        <ext:FieldContainer ID="fMunicipioColonia" runat="server" LabelWidth="120" FieldLabel="Municipio"
                                            AnchorHorizontal="100%" Layout="ColumnLayout">
                                            <Items> 
                                                  <ext:TextField ID="txtMunicipio" runat="server" Width="250" StyleSpec="margin-right: 6px;"
                                                    MaxLength="50" EnforceMaxLength="true" AllowBlank="true"  Disabled="true"> 
                                                    <Plugins>
                                                        <ext:InputMask ID="InputMask2" runat="server" Mask="ttttt">
                                                            <MaskSymbols>
                                                                <ext:MaskSymbol Name="t" Regex="[a-zA-Z\s0-9]" />
                                                            </MaskSymbols>
                                                        </ext:InputMask>
                                                    </Plugins>

                                                </ext:TextField>
                                                  <ext:TextField ID="txtColonia" runat="server" Width="402" StyleSpec="margin-right: 6px;"
                                                    MaxLength="50" EnforceMaxLength="true" AllowBlank="true" FieldLabel="Colonia"  Disabled="true"> 
                                                    <Plugins>
                                                        <ext:InputMask ID="InputMask3" runat="server" Mask="ttttt">
                                                            <MaskSymbols>
                                                                <ext:MaskSymbol Name="t" Regex="[a-zA-Z0-9\s]" />
                                                            </MaskSymbols>
                                                        </ext:InputMask>
                                                    </Plugins> 
                                                </ext:TextField> 
                                            </Items>
                                        </ext:FieldContainer>
                                        

                                        </Items>
                                    </ext:Panel>
                                </Items>
                            </ext:TabPanel>
                        </Items>
                        <Listeners>
                            <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                            text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                            iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                        });
                                                        #{imgbtnGuardar}.setDisabled(!valid);" />
                        </Listeners>
                        <BottomBar>
                            <ext:StatusBar ID="sbSocios" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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
                                    <Click OnEvent="imgbtnGuardar_Click" Success="imgbtnGuardar_Click_Success">
                                        <EventMask ShowMask="true" Msg="Guardardo información..." MinDelay="1000" />
                                        <ExtraParams>
                                            <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                            <ext:Parameter Name="logo" Value="App.txtFileName.getValue()" Mode="Raw" />
                                            <ext:Parameter Name="usuario" Value="Ext.encode(window.parent.App.sUsuario.getRecordsValues())" Mode="Raw" />
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
                                    <Click Handler="window.parent.App.wSubModulo.hide();" />
                                </Listeners>
                            </ext:ImageButton>
                        </Buttons>
                    </ext:FormPanel>

                     <ext:Window 
                        ID="wFormaAnexos" 
                        runat="server" 
                        Icon="Application" 
                        Hidden="true" 
                        Modal="true"
                        Padding="5" 
                        Resizable="False" 
                        Region="Center" 
                        XOnEsc="Ext.emptyFn">
                        <Loader 
                            ID="Loader1" 
                            runat="server" 
                            Mode="Frame" 
                            AutoLoad="false">
                            <LoadMask 
                                ShowMask="true" 
                                Msg="Cargando..." />
                        </Loader>
                    </ext:Window>
                </Items>
            </ext:Panel>
        </div>
    </form>
</body>
</html>