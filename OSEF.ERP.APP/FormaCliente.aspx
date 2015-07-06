<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCliente.aspx.cs" Inherits="OSEF.ERP.APP.FormaCliente" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type='text/javascript' src="js/clientes.js"></script>
    <script type="text/javascript">
        window.onload = cargarEstilo;
    </script>
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
                        <ext:ModelField Name="RFC" Type="String" />
                        <ext:ModelField Name="CURP" Type="String" />
                        <ext:ModelField Name="FechaNacimiento" Type="Date" />
                        <ext:ModelField Name="Edad" Type="Int" />
                        <ext:ModelField Name="Sexo" Type="String" />
                        <ext:ModelField Name="EstadoCivil" Type="String" />
                        <ext:ModelField Name="Profesion" Type="String" />
                        <ext:ModelField Name="Correo" Type="String" />
                        <ext:ModelField Name="Telefono" Type="String" />
                        <ext:ModelField Name="TelefonoMovil" Type="String" />
                        <ext:ModelField Name="Calle" Type="String" />
                        <ext:ModelField Name="NoExterior" Type="String" />
                        <ext:ModelField Name="NoInterior" Type="String" />
                        <ext:ModelField Name="Colonia" Type="String" />
                        <ext:ModelField Name="CodigoPostal" Type="Int" />
                        <ext:ModelField Name="EntreCalles" Type="String" />
                        <ext:ModelField Name="Estado" Type="String" />
                        <ext:ModelField Name="Municipio" Type="String" />
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
                        Height="404"
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
                                                FieldLabel="Socio" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Listeners>
                                                    <BeforeRender Fn="fcIDRender" />
                                                </Listeners>
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
                                                    <%--<ext:Label ID="lblAnexos" runat="server" Text="Adjuntar Anexos: " StyleSpec="margin-right: 6px;" Cls="xLabelCustomizado">
                                                    </ext:Label>
                                                    <ext:ImageButton 
                                                        ID="imgbtnAnexos" 
                                                        runat="server"
                                                        StyleSpec="margin-top: -3px;"
                                                        ImageUrl="assets/img/controles/adjuntoNormal.png"
                                                        DisabledImageUrl="assets/img/controles/adjuntoDisabled.png" 
                                                        OverImageUrl="assets/img/controles/adjuntoOver.png"
                                                        PressedImageUrl="assets/img/controles/adjuntoPressed.png" 
                                                        ToolTip="Anexos"
                                                        Height="25" 
                                                        Width="25">
                                                    </ext:ImageButton>--%>
                                                     
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
                                                        <%--<ext:Image
                                                        runat="server"
                                                        AllowPan="true"
                                                        Height="128px"
                                                        Width="128px"
                                                        ImageUrl="images/smiley_add.png" > 
                                                        </ext:Image>--%>

                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer
                                                ID="fcNombre" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Nombre(s)">
                                                <Listeners>
                                                    <BeforeRender Fn="fcNombre_Render" />
                                                </Listeners>
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
                                                ID="fcRFC" 
                                                runat="server" 
                                                FieldLabel="RFC"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Listeners>
                                                    <BeforeRender Fn="fcRFCRender" />
                                                </Listeners>
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfRFC"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MaxLength="15"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfRFC.setValue(App.txtfRFC.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfCURP"
                                                        runat="server"
                                                        Width="402"
                                                        AllowBlank="true"
                                                        MaxLength="18"
                                                        EnforceMaxLength="true"
                                                        EmptyText="CURP">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfCURP.setValue(App.txtfCURP.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcFechaNac" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Fecha Nacimiento" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Listeners>
                                                    <BeforeRender Fn="fcFechaNac_Render" />
                                                </Listeners>
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfFechaNacimiento"
                                                        runat="server"
                                                        StyleSpec="margin-right: 6px;"
                                                        Width="250"
                                                        AllowBlank="false"
                                                        Vtype="daterange"
                                                        Note="Ejemplo: dd/mm/aaaa">
                                                        <PickerOptions 
                                                            ID="poFechaNacimiento"
                                                            runat="server"
                                                            Cls="my-date-picker">
                                                        </PickerOptions>
                                                        <Listeners>
                                                            <Select Fn="CalcularFechaNacimiento" />
                                                            <Blur Fn="CalcularFechaNacimiento" />
                                                        </Listeners>
                                                    </ext:DateField>
                                                    <ext:TextField
                                                        ID="txtfEdad"
                                                        runat="server"
                                                        Width="198"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        StyleSpec="margin-right: 6px;"
                                                        Disabled="true"
                                                        EmptyText="Edad">
                                                    </ext:TextField>
                                                    <ext:ComboBox
                                                        ID="cmbSexo"
                                                        runat="server"
                                                        AllowBlank="false"
                                                        Editable="false"
                                                        Width="198"
                                                        EmptyText="Sexo">
                                                        <ListConfig ID="lcSexo" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="MASCULINO" Value="MASCULINO" />
                                                            <ext:ListItem Index="1" Text="FEMENINO" Value="FEMENINO" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcCliente5" 
                                                runat="server" 
                                                HideMode="Display"
                                                FieldLabel="Estado Civil"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Listeners>
                                                    <BeforeRender Fn="fcEstadoCivilRender" />
                                                </Listeners>
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="cmbEstadoCivil"
                                                        runat="server"
                                                        AllowBlank="false"
                                                        Editable="false"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;">
                                                        <ListConfig ID="lcEstadoCivil" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="" Value="SOLTERO" />
                                                            <ext:ListItem Index="1" Text="" Value="CASADO" />
                                                            <ext:ListItem Index="2" Text="" Value="DIVORCIADO" />
                                                            <ext:ListItem Index="3" Text="" Value="VIUDO" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                    <ext:ComboBox
                                                        ID="cmbProfesion"
                                                        runat="server"
                                                        Width="402"
                                                        AllowBlank="false"
                                                        Editable="false"
                                                        ValueField="ID"
                                                        DisplayField="Descripcion"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true"
                                                        FieldLabel="Profesión">
                                                        <ListConfig ID="lcProfesion" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Store>
                                                            <ext:Store
                                                                ID="sProfesiones"
                                                                runat="server">
                                                                <Model>
                                                                    <ext:Model
                                                                        ID="mProfesiones"
                                                                        runat="server"
                                                                        IDProperty="ID">
                                                                        <Fields>
                                                                            <ext:ModelField Name="ID" Type="String" />
                                                                            <ext:ModelField Name="Descripcion" Type="String" />
                                                                        </Fields>
                                                                    </ext:Model>
                                                                </Model>
                                                            </ext:Store>
                                                        </Store>
                                                    </ext:ComboBox>
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
                                                        <ListConfig ID="lcEstatus" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                            <AfterRender Fn="cmbEstatus_AfterRender" />
                                                        </Listeners>
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
                                            <ext:FieldContainer 
                                                ID="fcDireccion3" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Código Postal"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfCodigoPostal"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="5"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false">
                                                        <Plugins>
                                                            <ext:InputMask ID="imCodigoPostal" runat="server" Mask="ttttt">
                                                                <MaskSymbols>
                                                                    <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                </MaskSymbols>
                                                            </ext:InputMask>
                                                        </Plugins>
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbEstado"
                                                        runat="server"
                                                        Width="402"
                                                        FieldLabel="Estado"
                                                        Editable="true"
                                                        AllowBlank="false"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <ListConfig ID="lcEstado" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
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
                                                            </ext:Store>
                                                        </Store>
                                                        <DirectEvents>
                                                            <Select OnEvent="cmbEstado_Select">
                                                                <ExtraParams>
                                                                    <ext:Parameter Name="valor" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                                                </ExtraParams>
                                                            </Select>
                                                        </DirectEvents>
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDireccion4" 
                                                runat="server"
                                                LabelWidth="120"
                                                FieldLabel="Municipio" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="cmbMunicipio"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        Editable="true"
                                                        AllowBlank="false"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <ListConfig ID="lcMunicipio" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
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
                                                            </ext:Store>
                                                        </Store>
                                                        <DirectEvents>
                                                            <Change OnEvent="cmbMunicipio_Select">
                                                                <ExtraParams>
                                                                    <ext:Parameter Name="valor" Value="App.cmbMunicipio.getValue()" Mode="Raw" />
                                                                </ExtraParams>
                                                            </Change>
                                                        </DirectEvents>
                                                    </ext:ComboBox>
                                                    <ext:ComboBox
                                                        ID="cmbColonia"
                                                        runat="server"
                                                        FieldLabel="Colonia"
                                                        Width="402"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        AllowBlank="true"
                                                        Editable="true"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="false"
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
                                                            </ext:Store>
                                                        </Store>
                                                    </ext:ComboBox>
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
                                            <ext:Parameter Name="edad" Value="App.txtfEdad.getValue()" Mode="Raw" />
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
                                    <Click Handler="window.parent.App.wEmergente.hide();" />
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