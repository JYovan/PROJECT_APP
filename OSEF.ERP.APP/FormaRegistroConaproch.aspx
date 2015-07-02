<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaRegistroConaproch.aspx.cs" Inherits="OSEF.ERP.APP.FormaRegistroConaproch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="css/customeControls.css" />
    <link rel="Stylesheet" href="css/registro.css" />
    <script type="text/javascript" src="js/registro.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmPreguntas" runat="server" HideInDesign="true" />

        <div id="header_level1">
            <div id="header_level1_left">
            </div>
            <div id="header_level1_center">
                <div id="header_level1_center_first">
                    <p id="texto_registro">REGISTRO</p>
                </div>
                <div id="header_level1_center_second">
                </div>
            </div>
            <div id="header_level1_right">
            </div>
        </div>
        <div id="header_level2">
            <div id="header_level2_center">
            </div>
        </div>

            <div id="form_panel">
                <ext:FormPanel
                    ID="fpRegistro"
                    runat="server"
                    ButtonAlign="Right"
                    Width="650"
                    Header="false"
                    Cls="formPanelCustom"
                    StyleSpec="margin:0 auto;">
                    <Items>
                        <ext:Container
                            ID="cRegistro"
                            runat="server"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:Container
                                    ID="cIzquierdo1"
                                    runat="server"
                                    Width="150">
                                    <Items>
                                        <ext:Image
                                            ID="imgDatosPersonales"
                                            runat="server"
                                            ImageUrl="imagenes/agrupadores/datos-personales.png"
                                            Width="126"
                                            Height="37"
                                            MarginSpec="35px 0px 0px 0px">
                                        </ext:Image>
                                    </Items>
                                </ext:Container>
                                <ext:Container
                                    ID="cDerecho1"
                                    runat="server"
                                    Width="500">
                                    <Items>
                                        <ext:FieldContainer
                                            ID="fcNombre"
                                            runat="server"
                                            Layout="HBoxLayout"
                                            MarginSpec="30px 5px 5px 5px"
                                            Width="500">
                                            <Items>
                                                <ext:TextField
                                                    ID="txtfNombre"
                                                    runat="server"
                                                    Width="150"
                                                    AllowBlank="False"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    EmptyText="Nombre(s)"
                                                    Margin="5"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    AutoFocus="true">
                                                </ext:TextField>
                                                <ext:TextField
                                                    ID="txtfAPaterno"
                                                    runat="server"
                                                    Width="150"
                                                    AllowBlank="False"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    EmptyText="Apellido paterno"
                                                    Margin="5"
                                                    Cls="textFieldCustom"
                                                    Height="35">
                                                </ext:TextField>
                                                <ext:TextField
                                                    ID="txtfAMaterno"
                                                    runat="server"
                                                    Width="150"
                                                    AllowBlank="true"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    EmptyText="Apellido materno"
                                                    Margin="5"
                                                    Cls="textFieldCustom"
                                                    Height="35">
                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:ComboBox
                                            ID="cmbEstado"
                                            runat="server"
                                            Width="470"
                                            AllowBlank="False"
                                            QueryMode="Local"
                                            TypeAhead="True"
                                            ForceSelection="true"
                                            Cls="comboBoxCustom"
                                            MarginSpec="5px 0px 5px 10px"
                                            EmptyText="Estado">
                                            <ListConfig Cls="comboBoxCustom">
                                            </ListConfig>
                                            <Items>
                                                <ext:ListItem Text="AGUASCALIENTES" Value="AGUASCALIENTES" />
                                                <ext:ListItem Text="BAJA CALIFORNIA NORTE" Value="BAJA CALIFORNIA NORTE" />
                                                <ext:ListItem Text="BAJA CALIFORNIA SUR" Value="BAJA CALIFORNIA SUR" />
                                                <ext:ListItem Text="CAMPECHE" Value="CAMPECHE" />
                                                <ext:ListItem Text="CHIAPAS" Value="CHIAPAS" />
                                                <ext:ListItem Text="CHIHUAHUA" Value="CHIHUAHUA" />
                                                <ext:ListItem Text="COAHUILA" Value="COAHUILA" />
                                                <ext:ListItem Text="COLIMA" Value="COLIMA" />
                                                <ext:ListItem Text="DISTRITO FEDERAL" Value="DISTRITO FEDERAL" />
                                                <ext:ListItem Text="DURANGO" Value="DURANGO" />
                                                <ext:ListItem Text="ESTADO DE MEXICO" Value="ESTADO DE MEXICO" />
                                                <ext:ListItem Text="GUANAJUATO" Value="GUANAJUATO" />
                                                <ext:ListItem Text="GUERRERO" Value="GUERRERO" />
                                                <ext:ListItem Text="HIDALGO" Value="HIDALGO" />
                                                <ext:ListItem Text="JALISCO" Value="JALISCO" />
                                                <ext:ListItem Text="MICHOACAN" Value="MICHOACAN" />
                                                <ext:ListItem Text="MORELOS" Value="MORELOS" />
                                                <ext:ListItem Text="NAYARIT" Value="NAYARIT" />
                                                <ext:ListItem Text="NUEVO LEON" Value="NUEVO LEON" />
                                                <ext:ListItem Text="OAXACA" Value="OAXACA" />
                                                <ext:ListItem Text="PUEBLA" Value="PUEBLA" />
                                                <ext:ListItem Text="QUERETARO" Value="QUERETARO" />
                                                <ext:ListItem Text="QUINTANA ROO" Value="QUINTANA ROO" />
                                                <ext:ListItem Text="SAN LUIS POTOSI" Value="SAN LUIS POTOSI" />
                                                <ext:ListItem Text="SINALOA" Value="SINALOA" />
                                                <ext:ListItem Text="SONORA" Value="SONORA" />
                                                <ext:ListItem Text="TABASCO" Value="TABASCO" />
                                                <ext:ListItem Text="TAMAULIPAS" Value="TAMAULIPAS" />
                                                <ext:ListItem Text="TLAXCALA" Value="TLAXCALA" />
                                                <ext:ListItem Text="VERACRUZ" Value="VERACRUZ" />
                                                <ext:ListItem Text="YUCATAN" Value="YUCATAN" />
                                                <ext:ListItem Text="ZACATECAS" Value="ZACATECAS" />
                                            </Items>
                                        </ext:ComboBox>
                                        <ext:TextField
                                            ID="txtfCiudad"
                                            runat="server"
                                            Width="470"
                                            AllowBlank="true"
                                            MaxLength="50"
                                            EnforceMaxLength="True"
                                            Cls="textFieldCustom"
                                            MarginSpec="10px 0px 5px 10px"
                                            Height="35"
                                            EmptyText="Ciudad">
                                        </ext:TextField>
                                        <ext:Container
                                            ID="fcNacimiento"
                                            runat="server"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:DateField
                                                    ID="dfFechaNacimiento"
                                                    runat="server"
                                                    LabelWidth="50"
                                                    Width="317"
                                                    AllowBlank="False"
                                                    Editable="true"
                                                    EmptyText="Fecha de nacimiento"
                                                    Cls="dateFieldCustom"
                                                    MarginSpec="5px 0px 5px 10px"
                                                    Vtype="daterange"
                                                    Note="Formato dd/mm/aaaa"
                                                    NoteCls="textFieldCustomNote">
                                                    <Listeners>
                                                        <Select Fn="CalcularFechaNacimiento" />
                                                        <Blur Fn="CalcularFechaNacimiento" />
                                                    </Listeners>
                                                </ext:DateField>
                                                <ext:TextField
                                                    ID="txtfEdad"
                                                    runat="server"
                                                    Width="149"
                                                    Height="35"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    Selectable="False"
                                                    AllowBlank="false"
                                                    EmptyText="Edad"
                                                    Cls="textFieldCustom"
                                                    MarginSpec="5px 0px 5px 5px">
                                                </ext:TextField>
                                            </Items>
                                        </ext:Container>
                                    </Items>
                                </ext:Container>
                                <ext:Container
                                    ID="cIzquierdo2"
                                    runat="server"
                                    Width="150">
                                    <Items>
                                        <ext:Image
                                            ID="Image1"
                                            runat="server"
                                            ImageUrl="imagenes/agrupadores/datos-de-contacto.png"
                                            Width="126"
                                            Height="37"
                                            MarginSpec="35px 0px 0px 0px">
                                        </ext:Image>
                                    </Items>
                                </ext:Container>
                                <ext:Container
                                    ID="cDerecho2"
                                    runat="server"
                                    Width="500">
                                    <Items>
                                        <ext:FieldContainer
                                            ID="fcDatosContacto"
                                            runat="server"
                                            Layout="HBoxLayout"
                                            MarginSpec="30px 5px 5px 5px"
                                            Width="500">
                                            <Items>
                                                <ext:TextField
                                                    ID="txtfTelefono"
                                                    runat="server"
                                                    Width="230"
                                                    Note="LADA (449) 994-01-32"
                                                    AllowBlank="true"
                                                    EmptyText="Teléfono local"
                                                    Margin="5"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    NoteCls="textFieldCustomNote">
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
                                                    Width="230"
                                                    Note="LADA (044-449) 173-09-78"
                                                    AllowBlank="true"
                                                    EmptyText="Teléfono móvil"
                                                    Margin="5"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    NoteCls="textFieldCustomNote">
                                                    <Plugins>
                                                        <ext:InputMask
                                                            ID="InputMask1"
                                                            runat="server"
                                                            Mask="(999-999) 999-99-99"
                                                            AllowInvalid="true" />
                                                    </Plugins>
                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:TextField
                                            ID="txtfCorreo"
                                            runat="server"
                                            Width="470"
                                            MaxLength="50"
                                            EnforceMaxLength="true"
                                            AllowBlank="true"
                                            Vtype="email"
                                            EmptyText="Correo eléctronico"
                                            Cls="textFieldCustom"
                                            Height="35"
                                            MarginSpec="5px 0px 5px 10px">
                                        </ext:TextField>

                                        <ext:ComboBox
                                            ID="cmbSexo"
                                            runat="server"
                                            Width="470"
                                            AllowBlank="False"
                                            QueryMode="Local"
                                            TypeAhead="True"
                                            ForceSelection="true"
                                            Editable="False"
                                            Cls="comboBoxCustom"
                                            MarginSpec="10px 0px 0px 10px"
                                            EmptyText="Sexo">
                                            <ListConfig Cls="comboBoxCustom">
                                            </ListConfig>
                                            <Items>
                                                <ext:ListItem Text="MASCULINO" Value="M" />
                                                <ext:ListItem Text="FEMENINO" Value="F" />
                                            </Items>
                                        </ext:ComboBox>
                                        <ext:ComboBox
                                            ID="cmbTipoParticipante"
                                            runat="server"
                                            Width="470"
                                            AllowBlank="False"
                                            QueryMode="Local"
                                            TypeAhead="True"
                                            ForceSelection="true"
                                            Cls="comboBoxCustom"
                                            MarginSpec="10px 0px 0px 10px"
                                            EmptyText="Tipo participante"
                                            Editable="False">
                                            <ListConfig Cls="comboBoxCustom">
                                            </ListConfig>
                                            <Listeners>
                                                <Select Fn="cmbTipoParticipante_Select" />
                                            </Listeners>
                                            <Items>
                                                <ext:ListItem Text="PRODUCTOR" Value="1" />
                                                <ext:ListItem Text="EXPOSITOR" Value="2" />
                                                <ext:ListItem Text="PATROCINADOR" Value="3" />
                                                <ext:ListItem Text="CONFERENCISTA" Value="4" />
                                                <ext:ListItem Text="ASISTENTE POR PARTE DE UNA EMPRESA" Value="5" />
                                                <ext:ListItem Text="INVESTIGADOR" Value="6" />
                                                <ext:ListItem Text="OTRO" Value="7" />
                                            </Items>
                                        </ext:ComboBox>
                                        <ext:TextField
                                            ID="txtOtro"
                                            runat="server"
                                            Width="470"
                                            MaxLength="50"
                                            EnforceMaxLength="true"
                                            AllowBlank="false"
                                            EmptyText="Escribir el tipo de participante"
                                            Cls="textFieldCustom"
                                            Height="35"
                                            MarginSpec="5px 0px 5px 10px"
                                            Hidden="true"
                                            Disabled="true">
                                        </ext:TextField>
                                        <ext:FieldContainer
                                            ID="fcDatosLaborales"
                                            runat="server"
                                            LabelAlign="Top"
                                            LabelSeparator=""
                                            FieldLabel="Datos laborales"
                                            Layout="VBoxLayout"
                                            Cls="fieldContainerCustom"
                                            Margin="5"
                                            Hidden="true">
                                            <Items>
                                                <ext:TextField
                                                    ID="txtNombreEmpresa"
                                                    runat="server"
                                                    Width="470"
                                                    AllowBlank="false"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    EmptyText="Empresa"
                                                    Margin="5"
                                                    Disabled="true">
                                                </ext:TextField>
                                                <ext:TextField
                                                    ID="txtPuesto"
                                                    runat="server"
                                                    Width="470"
                                                    AllowBlank="true"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    EmptyText="Puesto"
                                                    Margin="5"
                                                    Disabled="true">
                                                </ext:TextField>
                                                <ext:TextField
                                                    ID="txtArea"
                                                    runat="server"
                                                    EmptyText="Área"
                                                    Width="470"
                                                    AllowBlank="true"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    Margin="5"
                                                    Disabled="true">
                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:ComboBox
                                            ID="cmbRequiereFactura"
                                            runat="server"
                                            Width="470"
                                            AllowBlank="false"
                                            QueryMode="Local"
                                            ForceSelection="true"
                                            Cls="comboBoxCustom"
                                            MarginSpec="5px 0px 5px 10px"
                                            EmptyText="Elegir Si/No"
                                            Editable="False"
                                            FieldLabel="¿Requiere factura?"
                                            LabelSeparator=""
                                            LabelAlign="Top">
                                            <ListConfig Cls="comboBoxCustom">
                                            </ListConfig>
                                            <Listeners>
                                                <Select Fn="cmbRequiereFactura_Select" />
                                            </Listeners>
                                            <Items>
                                                <ext:ListItem Text="Si" Value="1" />
                                                <ext:ListItem Text="No" Value="0" />
                                            </Items>
                                        </ext:ComboBox>
                                    </Items>
                                </ext:Container>
                                <ext:Container
                                    ID="cIzquierdo3"
                                    runat="server"
                                    Width="150"
                                    Hidden="true">
                                    <Items>
                                        <ext:Image
                                            ID="Image2"
                                            runat="server"
                                            ImageUrl="imagenes/agrupadores/datos-de-facturacion.png"
                                            Width="126"
                                            Height="37"
                                            MarginSpec="35px 0px 0px 0px">
                                        </ext:Image>
                                    </Items>
                                </ext:Container>
                                <ext:Container
                                    ID="cDerecho3"
                                    runat="server"
                                    Width="500"
                                    Hidden="true">
                                    <Items>
                                        <ext:FieldContainer
                                            ID="fcDatosFacturacion"
                                            runat="server"
                                            MarginSpec="30px 5px 5px 5px"
                                            Width="500"
                                            Layout="VBoxLayout"
                                            Hidden="true">
                                            <Items>
                                                <ext:TextField
                                                    ID="txtEmpresa"
                                                    runat="server"
                                                    EmptyText="Razón social"
                                                    Width="470"
                                                    AllowBlank="false"
                                                    Disabled="true"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    Margin="5">
                                                </ext:TextField>
                                                <ext:TextField
                                                    ID="txtfRFC"
                                                    runat="server"
                                                    EmptyText="RFC"
                                                    Width="470"
                                                    AllowBlank="false"
                                                    Disabled="true"
                                                    MaxLength="50"
                                                    EnforceMaxLength="True"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    Margin="5">
                                                </ext:TextField>
                                                <ext:Container
                                                    ID="cDireccion"
                                                    runat="server"
                                                    Layout="HBoxLayout">
                                                    <Items>
                                                        <ext:TextField
                                                            ID="txtfCalle"
                                                            runat="server"
                                                            EmptyText="Calle"
                                                            Width="285"
                                                            AllowBlank="false"
                                                            Disabled="true"
                                                            MaxLength="50"
                                                            EnforceMaxLength="True"
                                                            Cls="textFieldCustom"
                                                            Height="35"
                                                            Margin="5">
                                                        </ext:TextField>
                                                        <ext:TextField
                                                            ID="txtfNoExt"
                                                            runat="server"
                                                            EmptyText="No. exterior"
                                                            Width="82"
                                                            AllowBlank="false"
                                                            Disabled="true"
                                                            MaxLength="50"
                                                            EnforceMaxLength="True"
                                                            Cls="textFieldCustom"
                                                            Height="35"
                                                            Margin="5">
                                                        </ext:TextField>
                                                        <ext:TextField
                                                            ID="txtNoInt"
                                                            runat="server"
                                                            EmptyText="No. interior"
                                                            Width="82"
                                                            AllowBlank="true"
                                                            Disabled="true"
                                                            MaxLength="50"
                                                            EnforceMaxLength="True"
                                                            Cls="textFieldCustom"
                                                            Height="35"
                                                            Margin="5">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:Container>
                                                <ext:Container
                                                    ID="cDireccion2"
                                                    runat="server"
                                                    Layout="HBoxLayout">
                                                    <Items>
                                                        <ext:TextField
                                                            ID="txtfColonia"
                                                            runat="server"
                                                            EmptyText="Colonia"
                                                            Width="380"
                                                            AllowBlank="false"
                                                            Disabled="true"
                                                            MaxLength="50"
                                                            EnforceMaxLength="True"
                                                            Cls="textFieldCustom"
                                                            Height="35"
                                                            Margin="5">
                                                        </ext:TextField>
                                                        <ext:TextField
                                                            ID="txtfCP"
                                                            runat="server"
                                                            EmptyText="C.P."
                                                            Width="80"
                                                            AllowBlank="false"
                                                            Disabled="true"
                                                            MaxLength="50"
                                                            EnforceMaxLength="True"
                                                            Cls="textFieldCustom"
                                                            Height="35"
                                                            Margin="5">
                                                            <Plugins>
                                                                <ext:InputMask ID="imCP" runat="server" Mask="ttttt">
                                                                    <MaskSymbols>
                                                                        <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                    </MaskSymbols>
                                                                </ext:InputMask>
                                                            </Plugins>
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:Container>
                                                <ext:Container
                                                    ID="cEstadoCiudad"
                                                    runat="server"
                                                    Layout="HBoxLayout">
                                                    <Items>
                                                        <ext:ComboBox
                                                            ID="cmbEstadoEmpresa"
                                                            runat="server"
                                                            Width="230"
                                                            AllowBlank="false"
                                                            Disabled="true"
                                                            QueryMode="Local"
                                                            TypeAhead="True"
                                                            ForceSelection="true"
                                                            Cls="comboBoxCustom"
                                                            MarginSpec="5px 0px 5px 5px"
                                                            EmptyText="Estado">
                                                            <ListConfig Cls="comboBoxCustom">
                                                            </ListConfig>
                                                            <Items>
                                                                <ext:ListItem Text="AGUASCALIENTES" Value="AGUASCALIENTES" />
                                                                <ext:ListItem Text="BAJA CALIFORNIA NORTE" Value="BAJA CALIFORNIA NORTE" />
                                                                <ext:ListItem Text="BAJA CALIFORNIA SUR" Value="BAJA CALIFORNIA SUR" />
                                                                <ext:ListItem Text="CAMPECHE" Value="CAMPECHE" />
                                                                <ext:ListItem Text="CHIAPAS" Value="CHIAPAS" />
                                                                <ext:ListItem Text="CHIHUAHUA" Value="CHIHUAHUA" />
                                                                <ext:ListItem Text="COAHUILA" Value="COAHUILA" />
                                                                <ext:ListItem Text="COLIMA" Value="COLIMA" />
                                                                <ext:ListItem Text="DISTRITO FEDERAL" Value="DISTRITO FEDERAL" />
                                                                <ext:ListItem Text="DURANGO" Value="DURANGO" />
                                                                <ext:ListItem Text="ESTADO DE MEXICO" Value="ESTADO DE MEXICO" />
                                                                <ext:ListItem Text="GUANAJUATO" Value="GUANAJUATO" />
                                                                <ext:ListItem Text="GUERRERO" Value="GUERRERO" />
                                                                <ext:ListItem Text="HIDALGO" Value="HIDALGO" />
                                                                <ext:ListItem Text="JALISCO" Value="JALISCO" />
                                                                <ext:ListItem Text="MICHOACAN" Value="MICHOACAN" />
                                                                <ext:ListItem Text="MORELOS" Value="MORELOS" />
                                                                <ext:ListItem Text="NAYARIT" Value="NAYARIT" />
                                                                <ext:ListItem Text="NUEVO LEON" Value="NUEVO LEON" />
                                                                <ext:ListItem Text="OAXACA" Value="OAXACA" />
                                                                <ext:ListItem Text="PUEBLA" Value="PUEBLA" />
                                                                <ext:ListItem Text="QUERETARO" Value="QUERETARO" />
                                                                <ext:ListItem Text="QUINTANA ROO" Value="QUINTANA ROO" />
                                                                <ext:ListItem Text="SAN LUIS POTOSI" Value="SAN LUIS POTOSI" />
                                                                <ext:ListItem Text="SINALOA" Value="SINALOA" />
                                                                <ext:ListItem Text="SONORA" Value="SONORA" />
                                                                <ext:ListItem Text="TABASCO" Value="TABASCO" />
                                                                <ext:ListItem Text="TAMAULIPAS" Value="TAMAULIPAS" />
                                                                <ext:ListItem Text="TLAXCALA" Value="TLAXCALA" />
                                                                <ext:ListItem Text="VERACRUZ" Value="VERACRUZ" />
                                                                <ext:ListItem Text="YUCATAN" Value="YUCATAN" />
                                                                <ext:ListItem Text="ZACATECAS" Value="ZACATECAS" />
                                                            </Items>
                                                        </ext:ComboBox>
                                                        <ext:TextField
                                                            ID="txtfCiudadEmpresa"
                                                            runat="server"
                                                            Width="230"
                                                            AllowBlank="true"
                                                            Disabled="true"
                                                            MaxLength="50"
                                                            EnforceMaxLength="True"
                                                            Cls="textFieldCustom"
                                                            MarginSpec="5px 0px 5px 10px"
                                                            Height="35"
                                                            EmptyText="Ciudad">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:Container>
                                                <ext:TextField
                                                    ID="txtfTelefonoEmpresa"
                                                    runat="server"
                                                    Width="230"
                                                    Note="LADA (449) 994-01-32"
                                                    AllowBlank="true"
                                                    EmptyText="Teléfono local"
                                                    MarginSpec="5px 5px 15px 5px"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    NoteCls="textFieldCustomNote"
                                                    Disabled="true">
                                                    <Plugins>
                                                        <ext:InputMask
                                                            ID="InputMask2"
                                                            runat="server"
                                                            Mask="(999) 999-99-99"
                                                            AllowInvalid="true" />
                                                    </Plugins>
                                                </ext:TextField>
                                                <ext:TextField
                                                    ID="txtfCorreoEmpresa"
                                                    runat="server"
                                                    Width="470"
                                                    MaxLength="50"
                                                    EnforceMaxLength="true"
                                                    AllowBlank="true"
                                                    Disabled="true"
                                                    Vtype="email"
                                                    EmptyText="Correo eléctronico"
                                                    Cls="textFieldCustom"
                                                    Height="35"
                                                    MarginSpec="5px 0px 0px 5px">
                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer>
                                    </Items>
                                </ext:Container>
                                <ext:Container
                                    ID="cIzquierdo4"
                                    runat="server"
                                    Width="150"
                                    Hidden="true">
                                    <Items>
                                        <ext:Image
                                            ID="Image3"
                                            runat="server"
                                            ImageUrl="imagenes/agrupadores/cuestionario.png"
                                            Width="126"
                                            Height="37"
                                            MarginSpec="35px 0px 0px 0px">
                                        </ext:Image>
                                    </Items>
                                </ext:Container>
                                <ext:Container
                                    ID="cDerecho4"
                                    runat="server"
                                    Width="500"
                                    Hidden="true">
                                    <Items>
                                        <ext:FieldContainer
                                            ID="fcPreguntas"
                                            runat="server"
                                            MarginSpec="30px 5px 5px 5px"
                                            Width="500"
                                            Layout="VBoxLayout"
                                            Hidden="true">
                                            <Items>
                                                <ext:TextField
                                                    ID="txtfPregunta01"
                                                    runat="server"
                                                    FieldLabel="¿Qué varidades siembra?"
                                                    LabelWidth="130"
                                                    Width="470"
                                                    MaxLength="200"
                                                    EnforceMaxLength="true"
                                                    AllowBlank="false"
                                                    LabelSeparator=""
                                                    Cls="textFieldCustom"
                                                    Height="55"
                                                    LabelAlign="Top"
                                                    LabelClsExtra="textFieldCustomLabel"
                                                    MarginSpec="5px 0px 0px 5px"
                                                    Hidden="true"
                                                    Disabled="true">
                                                </ext:TextField>
                                                <ext:ComboBox
                                                    ID="cmbPregunta02"
                                                    runat="server"
                                                    Width="470"
                                                    LabelWidth="305"
                                                    LabelAlign="Top"
                                                    FieldLabel="¿Se encuentra afiliado al comité estatal que le pertenece?"
                                                    AllowBlank="false"
                                                    Editable="false"
                                                    ForceSelection="true"
                                                    Cls="comboBoxCustom"
                                                    MarginSpec="5px 0px 5px 5px"
                                                    LabelSeparator=""
                                                    Hidden="true"
                                                    Disabled="true"
                                                    EmptyText="Elegir Si/No">
                                                    <ListConfig Cls="comboBoxCustom">
                                                    </ListConfig>
                                                    <Items>
                                                        <ext:ListItem Text="Si" Value="1" />
                                                        <ext:ListItem Text="No" Value="0" />
                                                    </Items>
                                                </ext:ComboBox>
                                                <ext:ComboBox
                                                    ID="cmbPregunta03"
                                                    runat="server"
                                                    Width="470"
                                                    LabelWidth="305"
                                                    FieldLabel="¿Asiste a la convención con apoyo económico de FIRA?"
                                                    AllowBlank="false"
                                                    Editable="false"
                                                    ForceSelection="true"
                                                    Cls="comboBoxCustom"
                                                    MarginSpec="5px 0px 5px 5px"
                                                    LabelSeparator=""
                                                    Hidden="true"
                                                    Disabled="true"
                                                    LabelAlign="Top"
                                                    EmptyText="Elegir Si/No">
                                                    <ListConfig Cls="comboBoxCustom">
                                                    </ListConfig>
                                                    <Items>
                                                        <ext:ListItem Text="Si" Value="1" />
                                                        <ext:ListItem Text="No" Value="0" />
                                                    </Items>
                                                </ext:ComboBox>
                                                <ext:TextField
                                                    ID="txtfPregunta04"
                                                    runat="server"
                                                    FieldLabel="¿Cómo se enteró de la convención mundial de chile?"
                                                    LabelWidth="280"
                                                    Width="470"
                                                    MaxLength="200"
                                                    EnforceMaxLength="true"
                                                    AllowBlank="false"
                                                    LabelSeparator=""
                                                    Cls="textFieldCustom"
                                                    Height="55"
                                                    LabelAlign="Top"
                                                    LabelClsExtra="textFieldCustomLabel"
                                                    MarginSpec="5px 0px 0px 5px"
                                                    Hidden="true"
                                                    Disabled="true">
                                                </ext:TextField>
                                                <ext:ComboBox
                                                    ID="cmbPregunta05"
                                                    runat="server"
                                                    FieldLabel="¿A cuántas Convenciones Mundiales de Chile ha asistido?"
                                                    LabelWidth="305"
                                                    Width="470"
                                                    AllowBlank="false"
                                                    ForceSelection="true"
                                                    Editable="false"
                                                    Cls="comboBoxCustom"
                                                    MarginSpec="5px 0px 5px 5px"
                                                    LabelSeparator=""
                                                    Hidden="true"
                                                    Disabled="true"
                                                    LabelAlign="Top">
                                                    <ListConfig Cls="comboBoxCustom">
                                                    </ListConfig>
                                                    <Items>
                                                        <ext:ListItem Text="1" Value="1" />
                                                        <ext:ListItem Text="2" Value="2" />
                                                        <ext:ListItem Text="3" Value="3" />
                                                        <ext:ListItem Text="4" Value="4" />
                                                        <ext:ListItem Text="5" Value="5" />
                                                        <ext:ListItem Text="6" Value="6" />
                                                        <ext:ListItem Text="7" Value="7" />
                                                        <ext:ListItem Text="8" Value="8" />
                                                        <ext:ListItem Text="9" Value="9" />
                                                        <ext:ListItem Text="10" Value="10" />
                                                        <ext:ListItem Text="11" Value="11" />
                                                    </Items>
                                                </ext:ComboBox>
                                            </Items>
                                        </ext:FieldContainer>
                                    </Items>
                                </ext:Container>
                            </Items>
                        </ext:Container>
                    </Items>
                    <Listeners>
                        <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                        text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                        iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                    });
                                                    #{imgbtnRegistrar}.setDisabled(!valid);" />
                    </Listeners>
                    <BottomBar>
                        <ext:StatusBar ID="sbRegistro" runat="server" />
                    </BottomBar>
                    <Buttons>
                        <ext:ImageButton
                            ID="imgbtnRegistrar"
                            runat="server"
                            Disabled="true"
                            ImageUrl="imagenes/buttons/registrar-normal.png"
                            DisabledImageUrl="imagenes/buttons/registrar-deshabilitado.png"
                            OverImageUrl="imagenes/buttons/registrar-sobre.png"
                            PressedImageUrl="imagenes/buttons/registrar-clic.png"
                            Height="22"
                            Width="73">
                            <DirectEvents>
                                <Click Before="App.txtfEdad.selectable = true;" OnEvent="imgbtnRegistrar_Click">
                                    <EventMask ShowMask="true" Msg="Registrando información..." />
                                    <ExtraParams>
                                        <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <ext:Parameter Name="edad" Value="Ext.encode(App.txtfEdad.getValue())" Mode="Raw" />
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
                        </ext:ImageButton>
                    </Buttons>
                </ext:FormPanel>
            </div>

            <div id="pie">
            </div>
    </form>
</body>
</html>
