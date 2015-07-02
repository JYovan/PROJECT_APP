<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaSolicitudPrestamo.aspx.cs" Inherits="OSEF.ERP.APP.FormaSolicitudPrestamo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type='text/javascript' src="js/solicitudesPrestamos.js"></script>
    <script type="text/javascript">
        window.onload = cargarEstilo;
    </script>
</head>
<body class="xCustomBody">
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmSolicitudPrestamo" runat="server" HideInDesign="true" />

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

        <ext:Store
            ID="Store1"
            runat="server">
            <Model>
                <ext:Model ID="Model1" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>

        <ext:Store
            ID="sSolicitudPrestamo"
            runat="server">
            <Model>
                <ext:Model
                    ID="mSolicitudPrestamo"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <%--Primer TabPanel--%>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Cliente" Type="String" />
                        <ext:ModelField Name="Nacionalidad" Type="String" />
                        <ext:ModelField Name="RegistroMatrimonial" Type="String" />
                        <ext:ModelField Name="NumeroDependientes" Type="Int" UseNull="true" />
                        <ext:ModelField Name="Edades" Type="String" />
                        <ext:ModelField Name="TipoCasa" Type="String" />
                        <ext:ModelField Name="AniosDomicilio" Type="Int" UseNull="true" />
                        <%--Segundo TabPanel--%>
                        <ext:ModelField Name="CalleAnterior" Type="String" />
                        <ext:ModelField Name="NoExteriorAnterior" Type="String" />
                        <ext:ModelField Name="NoInteriorAnterior" Type="String" />
                        <ext:ModelField Name="ColoniaAnterior" Type="String" />
                        <ext:ModelField Name="CodigoPostalAnterior" Type="Int" UseNull="true" />
                        <ext:ModelField Name="EntreCallesAnterior" Type="String" />
                        <ext:ModelField Name="EstadoAnterior" Type="String" />
                        <ext:ModelField Name="MunicipioAnterior" Type="String" />
                        <%--Tercer TabPanel--%>
                        <ext:ModelField Name="Antiguedad" Type="Int" UseNull="true" />
                        <ext:ModelField Name="Ingresos" Type="Int" UseNull="true" />
                        <ext:ModelField Name="OtrosIngresos" Type="Int" UseNull="true" />
                        <ext:ModelField Name="Concepto" Type="String" />
                        <ext:ModelField Name="JefeNombre" Type="String" />
                        <ext:ModelField Name="JefeAPAterno" Type="String" />
                        <ext:ModelField Name="JefeAMaterno" Type="String" />
                        <ext:ModelField Name="EmpresaAnterior" Type="String" />
                        <%--Cuarto TabPanel--%>
                        <ext:ModelField Name="ConyugeNombre" Type="String" />
                        <ext:ModelField Name="ConyugeAPaterno" Type="String" />
                        <ext:ModelField Name="ConyugeAMaterno" Type="String" />
                        <ext:ModelField Name="ConyugeFechaNacimiento" Type="Date" />
                        <ext:ModelField Name="ConyugeEdad" Type="Int" UseNull="true" />
                        <ext:ModelField Name="ConyugeRFC" Type="String" />
                        <ext:ModelField Name="ConyugeTelefono" Type="String" />
                        <ext:ModelField Name="ConyugeTelefonoMovil" Type="String" />
                        <ext:ModelField Name="ConyugeCalle" Type="String" />
                        <ext:ModelField Name="ConyugeNoExterior" Type="String" />
                        <ext:ModelField Name="ConyugeNoInterior" Type="String" />
                        <ext:ModelField Name="ConyugeColonia" Type="String" />
                        <ext:ModelField Name="ConyugeCodigoPostal" Type="Int" UseNull="true" />
                        <ext:ModelField Name="ConyugeEntreCalles" Type="String" />
                        <ext:ModelField Name="ConyugeEstado" Type="String" />
                        <ext:ModelField Name="ConyugeMunicipio" Type="String" />
                        <ext:ModelField Name="ConyugeIngresos" Type="Int" UseNull="true" />
                        <ext:ModelField Name="ConyugeAntiguedad" Type="Int" UseNull="true" />
                        <ext:ModelField Name="ConyugeOtrosIngresos" Type="Int" UseNull="true" />
                        <ext:ModelField Name="ConyugeConcepto" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresa" Type="String" />
                        <ext:ModelField Name="ConyugePuesto" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaCalle" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaNoExterior" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaNoInterior" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaColonia" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaCodigoPostal" Type="Int" UseNull="true" />
                        <ext:ModelField Name="ConyugeEmpresaEntreCalles" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaEstado" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaMunicipio" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaJefeNombre" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaJefeAPaterno" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaJefeAMaterno" Type="String" />
                        <%--Quinto TabPanel--%>
                        <ext:ModelField Name="AvalNombre" Type="String" />
                        <ext:ModelField Name="AvalAPaterno" Type="String" />
                        <ext:ModelField Name="AvalAMaterno" Type="String" />
                        <ext:ModelField Name="AvalSocio" Type="Boolean" />
                        <ext:ModelField Name="AvalEstadoCivil" Type="String" />
                        <ext:ModelField Name="AvalRegistroMatrimonial" Type="String" />
                        <ext:ModelField Name="AvalTelefono" Type="String" />
                        <ext:ModelField Name="AvalTelefonoMovil" Type="String" />
                        <ext:ModelField Name="AvalCalle" Type="String" />
                        <ext:ModelField Name="AvalNoExterior" Type="String" />
                        <ext:ModelField Name="AvalNoInterior" Type="String" />
                        <ext:ModelField Name="AvalColonia" Type="String" />
                        <ext:ModelField Name="AvalCodigoPostal" Type="Int" UseNull="true" />
                        <ext:ModelField Name="AvalEntreCalles" Type="String" />
                        <ext:ModelField Name="AvalEstado" Type="String" />
                        <ext:ModelField Name="AvalMunicipio" Type="String" />
                        <ext:ModelField Name="AvalAntiguedad" Type="Int" UseNull="true" />
                        <ext:ModelField Name="AvalTipoCasa" Type="String" />
                        <%--Sexto TabPanel--%>
                        <ext:ModelField Name="AvalEmpresa" Type="String" />
                        <ext:ModelField Name="AvalEmpresaPuesto" Type="String" />
                        <ext:ModelField Name="AvalEmpresaJefeNombre" Type="String" />
                        <ext:ModelField Name="AvalEmpresaJefeAPaterno" Type="String" />
                        <ext:ModelField Name="AvalEmpresaJefeAMaterno" Type="String" />
                        <ext:ModelField Name="AvalEmpresaAntiguedad" Type="Int" UseNull="true" />
                        <ext:ModelField Name="AvalEmpresaIngresos" Type="Int" UseNull="true" />
                        <ext:ModelField Name="AvalEmpresaOtrosIngresos" Type="Int" UseNull="true" />
                        <ext:ModelField Name="AvalEmpresaConcepto" Type="String" />
                        <ext:ModelField Name="AvalEmpresaPropietario" Type="Boolean" />
                        <ext:ModelField Name="AvalEmpresaTipo" Type="String" />
                        <ext:ModelField Name="AvalEmpresaTelefono" Type="String" />
                        <ext:ModelField Name="AvalEmpresaTelefonoExt" Type="Int" UseNull="true" />
                        <ext:ModelField Name="AvalEmpresaAnterior" Type="String" />
                        <%--Septimo TabPanel--%>
                        <ext:ModelField Name="Cantidad" Type="Int" />
                        <ext:ModelField Name="Plazo" Type="Int" />
                        <ext:ModelField Name="FormaPago" Type="String" />
                        <ext:ModelField Name="DestinoPrestamo" Type="String" />
                        <ext:ModelField Name="Tipo" Type="String" />
                        <ext:ModelField Name="TablaAmortizacion" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="UsuarioAlta" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="UsuarioModificacion" Type="String" />
                        <ext:ModelField Name="FechaModificacion" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sSolicitudPrestamo_Load" />
                <Add Fn="sSolicitudPrestamo_Add" />
            </Listeners>
        </ext:Store>

        <div>
            <ext:Panel
                ID="pSolicitudPrestamo" 
                runat="server" 
                Width="805"
                BodyStyle="background-color:transparent;">
                <Items>
                    <ext:FormPanel 
                        ID="fpSolicitudPrestamo" 
                        runat="server" 
                        Height="525"
                        MonitorResize="true"
                        AutoScroll="true">
                        <Items>
                            <ext:TabPanel 
                                ID="tbSolicitudPrestamo" 
                                runat="server" 
                                ActiveTabIndex="0" 
                                Width="785"
                                Plain="true"
                                AutoScroll="true"
                                Cls="custotabpanel xchris">
                                <Items>
                                    <%--Datos generales--%>
                                    <ext:Panel
                                        ID="pDatosSocio" 
                                        runat="server" 
                                        Title="Datos Socio" 
                                        BodyPadding="10"
                                        MonitorResize="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsDivisorDatos" 
                                                runat="server" 
                                                Title="Datos Generales"
                                                AutoScroll="false">
                                                <Items>
                                                    <ext:Container
                                                        ID="cDatosSocio11"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfID" 
                                                                runat="server"
                                                                FieldLabel="ID"
                                                                Disabled="false"
                                                                MaxLength="8"
                                                                AutoFocus="true"
                                                                EnforceMaxLength="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDatosSocioC1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbCliente" 
                                                                runat="server" 
                                                                Disabled="false"
                                                                ValueField="ID"
                                                                DisplayField="ID"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                MatchFieldWidth="false"
                                                                AllowBlank="false"
                                                                PageSize="10"
                                                                ValueNotFoundText="Elemento no encontrado"
                                                                ForceSelection="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Socio">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sCliente"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model
                                                                                ID="mCliente"
                                                                                runat="server"
                                                                                IDProperty="ID">
                                                                                <Fields>
                                                                                    <%--Primer TabPanel--%>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                                                    <ext:ModelField Name="APaterno" Type="String" />
                                                                                    <ext:ModelField Name="AMaterno" Type="String" />
                                                                                    <ext:ModelField Name="NombreCompleto" Type="String">
                                                                                        <Convert Fn="NombreCompleto_Convert" />
                                                                                    </ext:ModelField>
                                                                                    <ext:ModelField Name="RFC" Type="String" />
                                                                                    <ext:ModelField Name="EstadoCivil" Type="String" />
                                                                                    <ext:ModelField Name="Correo" Type="String" />
                                                                                    <ext:ModelField Name="Telefono" Type="String" />
                                                                                    <ext:ModelField Name="TelefonoMovil" Type="String" />
                                                                                    <%--Segundo TabPanel--%>
                                                                                    <ext:ModelField Name="Calle" Type="String" />
                                                                                    <ext:ModelField Name="NoExterior" Type="String" />
                                                                                    <ext:ModelField Name="NoInterior" Type="String" />
                                                                                    <ext:ModelField Name="Colonia" Type="String" />
                                                                                    <ext:ModelField Name="CodigoPostal" Type="Int" />
                                                                                    <ext:ModelField Name="EntreCalles" Type="String" />
                                                                                    <ext:ModelField Name="Estado" Type="String" />
                                                                                    <ext:ModelField Name="Municipio" Type="String" />
                                                                                    <ext:ModelField Name="Empresa" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaCalle" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaNoExterior" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaNoInterior" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaColonia" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaCodigoPostal" Type="Int" NullConvert="true" />
                                                                                    <ext:ModelField Name="EmpresaEntreCalles" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaEstado" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaMunicipio" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaTelefono" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaTelefonoExt" Type="Int" NullConvert="true" />
                                                                                    <ext:ModelField Name="Puesto" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <ListConfig ID="lcCliente" runat="server" Width="330">
                                                                    <ItemTpl ID="itCliente" runat="server">
                                                                        <Html>
                                                                            <div class="search-item">
							                                                    <h3>{ID}</h3>
                                                                                <span>{NombreCompleto}</span>
						                                                    </div>
                                                                        </Html>
                                                                    </ItemTpl>
                                                                </ListConfig>
                                                                <Listeners>
                                                                    <Select Fn="cmbCliente_Select" />
                                                                    <Change Fn="cmbCliente_Change" />
                                                                </Listeners>
                                                            </ext:ComboBox>
                                                            <ext:TextField
                                                                ID="txtfNombreCompleto" 
                                                                runat="server"
                                                                Disabled="true">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDatosSocioC2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfRFC"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowBlank="true"
                                                                MaxLength="15"
                                                                EnforceMaxLength="true"
                                                                Disabled="false"
                                                                FieldLabel="RFC">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfRFC.setValue(App.txtfRFC.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:ComboBox
                                                                ID="cmbEstadoCivil"
                                                                runat="server"
                                                                Editable="false"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false"
                                                                FieldLabel="Estado civil">
                                                                <Items>
                                                                    <ext:ListItem Index="0" Text="SOLTERO" Value="SOLTERO" />
                                                                    <ext:ListItem Index="1" Text="CASADO" Value="CASADO" />
                                                                    <ext:ListItem Index="2" Text="UNIÓN LIBRE" Value="UNIÓN LIBRE" />
                                                                    <ext:ListItem Index="3" Text="OTRO" Value="OTRO" />
                                                                </Items>
                                                                <Listeners>
                                                                    <Change Fn="cmbEstadoCivil_Change" />
                                                                </Listeners>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDatosSocioC3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfTelefono"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                Note="Ejemplo: (449) 999-00-00"
                                                                Disabled="false"
                                                                FieldLabel="Teléfono">
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
                                                                FieldLabel="Teléfono móvil"
                                                                Editable="true"
                                                                Note="Ejemplo: (044-449) 999-00-00"
                                                                MaxLength="19"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="imTelefonoMovil"
                                                                        runat="server"
                                                                        Mask="(999-999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDatosSocioC4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCorreo"
                                                                runat="server"
                                                                Editable="true"
                                                                Vtype="email"
                                                                MaxLength="100"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false"
                                                                FieldLabel="Correo">
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfNacionalidad"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="20"
                                                                AllowBlank="true"
                                                                FieldLabel="Nacionalidad">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNacionalidad.setValue(App.txtfNacionalidad.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosSocioC5"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfNumeroDependientes"
                                                                runat="server"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="false"
                                                                AllowExponential="false"
                                                                Step="1"
                                                                FieldLabel="Dependientes">
                                                            </ext:NumberField>
                                                            <ext:TextField
                                                                ID="txtfEdades"
                                                                runat="server"
                                                                FieldLabel="Edades"
                                                                MaxLength="20"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosSocioC6" 
                                                        runat="server"
                                                        AnchorHorizontal="100%" 
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgRegistroMatrimonial"
                                                                runat="server"
                                                                Width="680"
                                                                LabelWidth="126"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Registro matrimonial"
                                                                ColumnsNumber="2"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rBienesSeparados" runat="server" BoxLabel="Bienes separados" Checked="true" />
                                                                    <ext:Radio ID="rBienesMancomunados" runat="server" BoxLabel="Bienes mancomunados"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosSocioC7"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgTipoCasa"
                                                                runat="server"
                                                                Width="680"
                                                                LabelWidth="126"  
                                                                FieldLabel="Tipo de casa"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                ColumnsNumber="4"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rPropia" runat="server" BoxLabel="Propia" Checked="true" />
                                                                    <ext:Radio ID="rRentada" runat="server" BoxLabel="Rentada"  />
                                                                    <ext:Radio ID="rFamilia" runat="server" BoxLabel="Familia"  />
                                                                    <ext:Radio ID="rHipoteca" runat="server" BoxLabel="Hipoteca"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosSocioC8"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nAniosDomicilio"
                                                                runat="server"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="false"
                                                                Step="1"
                                                                FieldLabel="Antigüedad"
                                                                EmptyText="Domicilio">
                                                                <Listeners>
                                                                    <Change Fn="nAniosDomicilio_Change" />
                                                                </Listeners>
                                                            </ext:NumberField>
                                                            <ext:ComboBox
                                                                ID="cmbEstatus"
                                                                runat="server"
                                                                Editable="false"
                                                                FieldLabel="Estatus"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true"
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
                                                                <SelectedItems>
                                                                    <ext:ListItem Index="0" Value="ALTA" />
                                                                </SelectedItems>
                                                                <Items>
                                                                    <ext:ListItem Index="0" Text="ALTA" Value="ALTA" />
                                                                    <ext:ListItem Index="1" Text="BLOQUEADO" Value="BLOQUEADO" />
                                                                    <ext:ListItem Index="2" Text="BAJA" Value="BAJA" />
                                                                </Items>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsControl"
                                                runat="server"
                                                Title="Control de Datos">
                                                <Items>
                                                    <ext:Container
                                                        ID="cAlta"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfUsuarioAlta"
                                                                runat="server"
                                                                Editable="false"
                                                                MaxLength="50"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true"
                                                                FieldLabel="Usuario alta">
                                                            </ext:TextField>
                                                            <ext:DateField
                                                                ID="dfFechaAlta"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Fecha alta"
                                                                Disabled="true"
                                                                Vtype="daterange">
                                                            </ext:DateField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cModificacion"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfUsuarioModificacion"
                                                                runat="server"
                                                                Editable="false"
                                                                MaxLength="50"
                                                                FieldLabel="Usuario modificar"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true">
                                                            </ext:TextField>
                                                            <ext:DateField
                                                                ID="dfFechaModificacion"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true"
                                                                FieldLabel="Fecha modificación"
                                                                Vtype="daterange">
                                                            </ext:DateField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                    <%-- Terminado --%>
                                    <ext:Panel
                                        ID="pDomicilioSocio"
                                        runat="server"
                                        Title="Domicilio Socio"
                                        BodyPadding="10"
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsDomicilio"
                                                runat="server"
                                                Title="Domicilio"
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                <Items>
                                                    <ext:Container
                                                        ID="cDomicilioC1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfCalle" 
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false"
                                                                AutoFocus="true">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfCalle.setValue(App.txtfCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEntreCalles"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEntreCalles.setValue(App.txtfEntreCalles.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDomicilioC2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfNoExterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoExterior.setValue(App.txtfNoExterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfNoInterior"
                                                                runat="server"
                                                                FieldLabel="N° Interior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoInterior.setValue(App.txtfNoInterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDomicilioC3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCodigoPostal"
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask ID="imCodigoPostal" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:ComboBox 
                                                                ID="cmbEstado"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                StoreID="sEstados">
                                                                <ListConfig Width="200" MaxHeight="195">
                                                                </ListConfig>
                                                                <DirectEvents>
                                                                    <Change OnEvent="cmbEstado_Change">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Change>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDomicilioC4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false">
                                                                <ListConfig Width="200" MaxHeight="195">
                                                                </ListConfig>
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
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Change OnEvent="cmbMunicipio_Change">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbMunicipio.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Change>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbColonia"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Colonia"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion">
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
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsDomicilioAnterior" 
                                                runat="server" 
                                                Title="Domicilio Anterior" 
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                <Items>
                                                    <ext:Container 
                                                        ID="cDomicilioAnteriorC1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfCalleAnterior" 
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfCalleAnterior.setValue(App.txtfCalleAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEntreCallesAnterior"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEntreCallesAnterior.setValue(App.txtfEntreCallesAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDomicilioAnteriorC2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfNoExteriorAnterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoExteriorAnterior.setValue(App.txtfNoExteriorAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfNoInteriorAnterior"
                                                                FieldLabel="N° Interior"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoInteriorAnterior.setValue(App.txtfNoInteriorAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDomicilioAnteriorC3" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCodigoPostalAnterior"
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask ID="InputMask1" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:ComboBox 
                                                                ID="cmbEstadoAnterior"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sEstadosAnterior"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mEstadosAnterior" runat="server" IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbEstadoAnterior_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEstadoAnterior.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDomicilioAnteriorC4" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbMunicipioAnterior"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sMunicipiosAnterior"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mMunicipiosAnterior" runat="server" IDProperty="ID">
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
                                                                    <Select OnEvent="cmbMunicipioAnterior_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbMunicipioAnterior.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbColoniaAnterior"
                                                                runat="server"
                                                                FieldLabel="Colonia"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sColoniasAnterior"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mColoniasAnterior" runat="server">
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
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pOcupacionActual" 
                                        runat="server" 
                                        Title="Ocupación actual" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsEmpresaDatos"
                                                runat="server"
                                                Title="Empresa datos"
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="cEmpresaC1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresa" 
                                                                runat="server"
                                                                FieldLabel="Empresa"
                                                                Width="735"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="50"
                                                                EnforceMaxLength="true"
                                                                AutoFocus="true">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresa.setValue(App.txtfEmpresa.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaCalle" 
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaCalle.setValue(App.txtfEmpresaCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaEntreCalles" 
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaEntreCalles.setValue(App.txtfEmpresaEntreCalles.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="10" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaNoExterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaNoExterior.setValue(App.txtfEmpresaNoExterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaNoInterior"
                                                                runat="server"
                                                                FieldLabel="N° Interior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaNoInterior.setValue(App.txtfEmpresaNoInterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfEmpresaCodigoPostal"
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask ID="InputMask2" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:ComboBox 
                                                                ID="cmbEmpresaEstado"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                StoreID="sEstados"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                EnforceMaxLength="false">
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbEmpresaEstado_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEmpresaEstado.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC5"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="ForceSelection" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="QueryMode" Value="Local" Mode="Value" />
                                                            <ext:Parameter Name="TypeAhead" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbEmpresaMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                Disabled="false">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sEmpresaMunicipios"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mEmpresaMunicipios" runat="server" IDProperty="ID">
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
                                                                    <Select OnEvent="cmbEmpresaMunicipio_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEmpresaMunicipio.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbEmpresaColonia"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Colonia"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                Disabled="false"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sEmpresaColonia"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mEmpresaColonia" runat="server">
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
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC6"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfEmpresaTelefono"
                                                                runat="server"
                                                                FieldLabel="Teléfono"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                Note="Ejemplo: (449) 999-00-00">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="imEmpresaTelefono"
                                                                        runat="server"
                                                                        Mask="(999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:NumberField
                                                                ID="nfEmpresaTelefonoExt"
                                                                runat="server"
                                                                FieldLabel="Extensión"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                MinValue="0"
                                                                MaxValue="99999"
                                                                AllowDecimals="false"
                                                                AllowExponential="false"
                                                                Step="1"
                                                                Note="Ejemplo: 44889">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsEmpresaSocio"
                                                runat="server"
                                                Title="Empresa Socio"
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="cEmpresaSocioC1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowExponential" Value="false" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Step" Value="1" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfAntiguedad"
                                                                runat="server"
                                                                AllowDecimals="false"
                                                                AllowBlank="true"
                                                                FieldLabel="Antigüedad"
                                                                Width="325"
                                                                LabelWidth="120"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfIngresos"
                                                                runat="server"
                                                                AllowBlank="true"
                                                                AllowDecimals="true"
                                                                EmptyText="Ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Fn="nfIngresos_Blur" />
                                                                </Listeners>
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfOtrosIngresos"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Otros ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Fn="nfOtrosIngresos_Blur" />
                                                                </Listeners>
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cEmpresaSocioC2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="737" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfOtrosIngresos" 
                                                                runat="server"
                                                                FieldLabel="Otros ingresos"
                                                                EmptyText="Concepto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfOtrosIngresos.setValue(App.txtfOtrosIngresos.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cEmpresaSocioC4" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="361" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaAnterior" 
                                                                runat="server" 
                                                                Width="370"
                                                                LabelWidth="120"
                                                                FieldLabel="Empresa anterior" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaAnterior.setValue(App.txtfEmpresaAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfPuesto" 
                                                                runat="server"
                                                                EmptyText="Puesto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfPuesto.setValue(App.txtfPuesto.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaSocioC3" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="50" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfJefeNombre"
                                                                runat="server"
                                                                EmptyText="Nombres"
                                                                Width="325"
                                                                FieldLabel="Jefe Inmediato"
                                                                LabelWidth="120"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfJefeNombre.setValue(App.txtfJefeNombre.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfJefeAPaterno"
                                                                runat="server"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfJefeAPaterno.setValue(App.txtfJefeAPaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfJefeAMaterno"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfJefeAMaterno.setValue(App.txtfJefeAMaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosConyugue" 
                                        runat="server" 
                                        Title="Datos Conyugue" 
                                        BodyPadding="10" 
                                        AutoScroll="true"
                                        CloseAction="Hide">
                                        <Items>
                                            <ext:FieldSet 
                                                ID="fsConyugeDatosGenerales" 
                                                runat="server" 
                                                Title="Datos Generales" 
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="cConyugeC1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="50" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfConyugeNombre"
                                                                runat="server"
                                                                AutoFocus="true"
                                                                EmptyText="Nombres"
                                                                FieldLabel="Nombre"
                                                                LabelWidth="120"
                                                                Width="325"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeNombre.setValue(App.txtfConyugeNombre.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfConyugeAPaterno"
                                                                runat="server"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeAPaterno.setValue(App.txtfConyugeAPaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfConyugeAMaterno"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeAMaterno.setValue(App.txtfConyugeAMaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cConyugeC2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:DateField
                                                                ID="dfConyugeFechaNacimiento"
                                                                runat="server"
                                                                LabelWidth="120"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Width="325"
                                                                FieldLabel="Fecha Nacimiento"
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
                                                                ID="txtfConyugeEdad"
                                                                runat="server"
                                                                MaxLength="50"
                                                                EnforceMaxLength="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true"
                                                                EmptyText="Edad">
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfConyugeRFC"
                                                                runat="server"
                                                                EmptyText="RFC"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="15"
                                                                EnforceMaxLength="true">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeRFC.setValue(App.txtfConyugeRFC.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cConyugeDomicilioC5" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfConyugeTelefono"
                                                                runat="server"
                                                                FieldLabel="Teléfono"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                EnforceMaxLength="true"
                                                                Note="Ejemplo: (449) 999-00-00">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="InputMask3"
                                                                        runat="server"
                                                                        Mask="(999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfConyugeTelefonoMovil"
                                                                runat="server"
                                                                FieldLabel="Teléfono móvil"
                                                                ForceSelection="true"
                                                                Editable="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowBlank="true"
                                                                Note="Ejemplo: (044-449) 999-00-00"
                                                                MaxLength="19"
                                                                EnforceMaxLength="true">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="InputMask4"
                                                                        runat="server"
                                                                        Mask="(999-999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet 
                                                ID="fsConyugeDomicilio" 
                                                runat="server" 
                                                Title="Domicilio" 
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                <Items>
                                                    <ext:Container 
                                                        ID="cConyugeDomicilioC1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeCalle"
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeCalle.setValue(App.txtfConyugeCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEntreCalles" 
                                                                FieldLabel="Entre Calles" 
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEntreCalles.setValue(App.txtfConyugeEntreCalles.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cConyugeDomicilioC2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="10" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeNoExterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeNoExterior.setValue(App.txtfConyugeNoExterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugeNoInterior"
                                                                runat="server"
                                                                FieldLabel="N° Interior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeNoInterior.setValue(App.txtfConyugeNoInterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cConyugeDomicilioC3" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox 
                                                                ID="cmbConyugeEstado"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                Editable="true"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sConyugeEstado"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mConyugeEstado" runat="server" IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbConyugeEstado_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbConyugeEstado.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbConyugeMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                ForceSelection="true"
                                                                Editable="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                MatchFieldWidth="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sConyugeMunicipio"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mConyugeMunicipio" runat="server" IDProperty="ID">
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
                                                                    <Change OnEvent="cmbConyugeMunicipio_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbConyugeMunicipio.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Change>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cConyugeDomicilioC4" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbConyugeColonia"
                                                                runat="server"
                                                                FieldLabel="Colonia"
                                                                Editable="true"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sConyugeColonia"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mConyugeColonia" runat="server">
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
                                                            <ext:TextField
                                                                ID="txtfConyugeCodigoPostal"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                FieldLabel="Código Postal">
                                                                <Plugins>
                                                                    <ext:InputMask ID="imConyugeCodigoPostal" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet 
                                                ID="fsConyugeEmpresa" 
                                                runat="server" 
                                                Title="Empresa" 
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container 
                                                        ID="FieldContainer9" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="AllowExponential" Value="false" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfConyugeAntiguedad"
                                                                runat="server"
                                                                AllowDecimals="false"
                                                                FieldLabel="Antigüedad"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                Width="325"
                                                                LabelWidth="120"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfConyugeIngresos"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Fn="nfConyugeIngresos_Blur" />
                                                                </Listeners>
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfConyugeOtrosIngresos"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Otros ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Fn="nfConyugeOtrosIngresos_Blur" />
                                                                </Listeners>
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="Container1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="737" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaConceptoOtrosIngresos" 
                                                                runat="server"
                                                                FieldLabel="Otros ingresos"
                                                                EmptyText="Concepto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresaConceptoOtrosIngresos.setValue(App.txtfConyugeEmpresaConceptoOtrosIngresos.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer8" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="361" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresa" 
                                                                runat="server" 
                                                                Width="370"
                                                                LabelWidth="120"
                                                                FieldLabel="Empresa" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresa.setValue(App.txtfConyugeEmpresa.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugePuesto" 
                                                                runat="server"
                                                                EmptyText="Puesto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugePuesto.setValue(App.txtfConyugePuesto.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="FieldContainer11" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfConyugeEmpresaJefeNombre"
                                                                runat="server"
                                                                EmptyText="Nombres"
                                                                Width="325"
                                                                FieldLabel="Jefe Inmediato"
                                                                LabelWidth="120"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresaJefeNombre.setValue(App.txtfConyugeEmpresaJefeNombre.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfConyugeEmpresaJefeAPAterno"
                                                                runat="server"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresaJefeAPAterno.setValue(App.txtfConyugeEmpresaJefeAPAterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfConyugeEmpresaJefeAMAterno"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresaJefeAMAterno.setValue(App.txtfConyugeEmpresaJefeAMAterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer12" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaCalle"
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresaCalle.setValue(App.txtfConyugeEmpresaCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaEntreCalles"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresaEntreCalles.setValue(App.txtfConyugeEmpresaEntreCalles.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer13"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="10" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaNoExterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresaNoExterior.setValue(App.txtfConyugeEmpresaNoExterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaNoInterior"
                                                                runat="server"
                                                                FieldLabel="N° Interior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEmpresaNoInterior.setValue(App.txtfConyugeEmpresaNoInterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer15" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox 
                                                                ID="cmbConyugeEmpresaEstado"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                Editable="true"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sConyugeEmpresaEstado"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mConyugeEmpresaEstado" runat="server" IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbConyugeEmpresaEstado_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbConyugeEmpresaEstado.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbConyugeEmpresaMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                ForceSelection="true"
                                                                Editable="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                MatchFieldWidth="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sConyugeEmpresaMunicipio"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mConyugeEmpresaMunicipio" runat="server" IDProperty="ID">
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
                                                                    <Change OnEvent="cmbConyugeEmpresaMunicipio_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbConyugeEmpresaMunicipio.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Change>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer14" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbConyugeEmpresaColonia"
                                                                runat="server"
                                                                FieldLabel="Colonia"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sConyugeEmpresaColonia"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mConyugeEmpresaColonia" runat="server">
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
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaCodigoPostal" 
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true">
                                                                <Plugins>
                                                                    <ext:InputMask ID="imConyugeEmpresaCodigoPostal" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pReferencias" 
                                        runat="server" 
                                        Title="Referencias" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsTipoReferencia"
                                                runat="server"
                                                Title="Tipo de referencia">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgTipoReferencia"
                                                        runat="server"
                                                        Width="680"
                                                        LabelWidth="126"  
                                                        FieldLabel="Tipo"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        ColumnsNumber="2"
                                                        ColumnWidth=".91">
                                                        <Items>
                                                            <ext:Radio ID="rPersona" runat="server" BoxLabel="Persona" Checked="true" />
                                                            <ext:Radio ID="rInstitucion" runat="server" BoxLabel="Institución"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                    <ext:Button
                                                        ID="btnAgregarReferencia"
                                                        runat="server"
                                                        Text="Agregar"
                                                        Margin="5">
                                                        <Listeners>
                                                            <Click Fn="btnAgregarReferencia_Click" />
                                                        </Listeners>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FieldSet>
                                            <%--<ext:Container 
                                                ID="fcReferencia1"
                                                runat="server"
                                                Layout="ColumnLayout">
                                                <Defaults>
                                                    <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                    <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                    <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                </Defaults>
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfInsitucion" 
                                                        runat="server"
                                                        FieldLabel="Nombre Insitución"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoCuenta" 
                                                        runat="server"
                                                        FieldLabel="Tipo Cuenta"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:Container>--%>
                                            <%--<ext:Container 
                                                ID="fcReferencia2" 
                                                runat="server"
                                                Layout="ColumnLayout">
                                                <Defaults>
                                                    <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                    <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                    <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                </Defaults>
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfNoCuenta" 
                                                        runat="server"
                                                        FieldLabel="No. Cuenta"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:Container>--%>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pBienes" 
                                        runat="server" 
                                        Title="Bienes" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsTipoBienesSocio"
                                                runat="server"
                                                Title="Tipo de bienes">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgTipoBienesSocio"
                                                        runat="server"
                                                        Width="680"
                                                        LabelWidth="126"  
                                                        FieldLabel="Tipo"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        ColumnsNumber="2"
                                                        ColumnWidth=".91">
                                                        <Items>
                                                            <ext:Radio ID="rBienesMuebles" runat="server" BoxLabel="Bienes Muebles" Checked="true" />
                                                            <ext:Radio ID="rBienesInmuebles" runat="server" BoxLabel="Bienes Inmuebles"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                    <ext:Button
                                                        ID="btnAgregarBienesSocio"
                                                        runat="server"
                                                        Text="Agregar"
                                                        Margin="5">
                                                        <Listeners>
                                                            <Click Fn="btnAgregarBienesSocio_Click" />
                                                        </Listeners>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FieldSet>
<%--                                            <ext:Container 
                                                ID="fcBienes1"
                                                runat="server"
                                                Layout="ColumnLayout">
                                                <Defaults>
                                                    <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                    <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                    <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                </Defaults>
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfUbicacion" 
                                                        runat="server"
                                                        FieldLabel="Ubicación"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoInmueble" 
                                                        runat="server"
                                                        FieldLabel="Tipo Inmueble"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:Container>
                                            <ext:Container 
                                                ID="fcBienes2"
                                                runat="server"
                                                Layout="ColumnLayout">
                                                <Defaults>
                                                    <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                    <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                    <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                </Defaults>
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtInscripción"
                                                        runat="server"
                                                        FieldLabel="Inscripción"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                     <ext:NumberField 
                                                        ID="nfValorInmueble" 
                                                        runat="server"
                                                        FieldLabel="Valor"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="9"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:Container>--%>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosGeneralesAval" 
                                        runat="server" 
                                        Title="Datos Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet 
                                                ID="fsAvalDatosGenerales" 
                                                runat="server" 
                                                Title="Datos Generales" 
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="fcAvalDatosGenerales1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="50" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfAvalNombre"
                                                                runat="server"
                                                                LabelWidth="120"
                                                                AllowBlank="true"
                                                                EmptyText="Nombres"
                                                                FieldLabel="Nombre"
                                                                AutoFocus="true"
                                                                Width="325"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalNombre.setValue(App.txtfAvalNombre.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfAvalApellidoPaterno"
                                                                runat="server"
                                                                AllowBlank="true"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalApellidoPaterno.setValue(App.txtfAvalApellidoPaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfAvalApellidoMaterno"
                                                                runat="server"
                                                                AllowBlank="true"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalApellidoMaterno.setValue(App.txtfAvalApellidoMaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcAvalDatosGenerales2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgSocioCooperativa"
                                                                runat="server"
                                                                LabelWidth="126"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                ColumnsNumber="2"
                                                                ColumnWidth="1"
                                                                FieldLabel="Es socio">
                                                                <Items>
                                                                    <ext:Radio ID="rSocioSi" runat="server" BoxLabel="Si" Checked="true" />
                                                                    <ext:Radio ID="rSocioNo" runat="server" BoxLabel="No"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                            <ext:ComboBox
                                                                ID="cmbAvalEstadoCivil"
                                                                runat="server"
                                                                AllowBlank="true"
                                                                Editable="false"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false"
                                                                FieldLabel="Estado civil">
                                                                <Items>
                                                                    <ext:ListItem Index="0" Text="" Value="SOLTERO" />
                                                                    <ext:ListItem Index="1" Text="" Value="CASADO" />
                                                                    <ext:ListItem Index="2" Text="" Value="DIVORCIADO" />
                                                                    <ext:ListItem Index="3" Text="" Value="VIUDO" />
                                                                </Items>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcAvalDatosGenerales3" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgAvalRegistroMatrimonial"
                                                                runat="server"
                                                                Width="680"
                                                                LabelWidth="126"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Registro matrimonial"
                                                                ColumnsNumber="2"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rAvalBienesSeparados" runat="server" BoxLabel="Bienes separados" Checked="true" />
                                                                    <ext:Radio ID="rAvalBienesMancomunados" runat="server" BoxLabel="Bienes mancomunados"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcAvalDatosGenerales5" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfAvalTelefono"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                Note="Ejemplo: (449) 999-00-00"
                                                                Disabled="false"
                                                                FieldLabel="Teléfono">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="imAvalTelefono"
                                                                        runat="server"
                                                                        Mask="(999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfAvalTelefonoMovil"
                                                                runat="server"
                                                                FieldLabel="Teléfono móvil"
                                                                Editable="true"
                                                                Note="Ejemplo: (044-449) 999-00-00"
                                                                MaxLength="19"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="imAvalTelefonoMovil"
                                                                        runat="server"
                                                                        Mask="(999-999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsAvalDomicilio"
                                                runat="server"
                                                Title="Domicilio"
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container 
                                                        ID="fcAvalDomicilio1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfAvalCalle" 
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalCalle.setValue(App.txtfAvalCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfAvalEntreCalles"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalEntreCalles.setValue(App.txtfAvalEntreCalles.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcAvalDomicilio2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfAvalNoExterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalNoExterior.setValue(App.txtfAvalNoExterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfAvalNoInterior"
                                                                runat="server"
                                                                FieldLabel="N° Interior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalNoInterior.setValue(App.txtfAvalNoInterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcAvalDomicilio4" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox 
                                                                ID="cmbAvalEstado"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false">
                                                                <ListConfig Width="200" MaxHeight="195">
                                                                </ListConfig>
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sAvalEstado"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mAvalEstado" runat="server" IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbAvalEstado_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbAvalEstado.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbAvalMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false">
                                                                <ListConfig Width="200" MaxHeight="195">
                                                                </ListConfig>
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sAvalMunicipio"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mAvalMunicipio" runat="server" IDProperty="ID">
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
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbAvalMunicipio_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbAvalMunicipio.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcAvalDomicilio3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbAvalColonia"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Colonia"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sAvalColonia"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mAvalColonia" runat="server">
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
                                                            <ext:TextField 
                                                                ID="txtfAvalCodigoPostal" 
                                                                runat="server" 
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask ID="imAvalCodigoPostal" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsAvalOtrosDatos"
                                                runat="server"
                                                Title="Otros Datos">
                                                <Items>
                                                    <ext:Container 
                                                        ID="fcDatosAval10" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgAvalTipoCasa"
                                                                runat="server"
                                                                Width="680"
                                                                LabelWidth="126"  
                                                                FieldLabel="Tipo de casa"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                ColumnsNumber="4"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rAvalPropia" runat="server" BoxLabel="Propia" Checked="true" />
                                                                    <ext:Radio ID="rAvalRentada" runat="server" BoxLabel="Rentada"  />
                                                                    <ext:Radio ID="rAvalFamilia" runat="server" BoxLabel="Familia"  />
                                                                    <ext:Radio ID="rAvalHipoteca" runat="server" BoxLabel="Hipoteca"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval11" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfAntiguedadDocmicilioAval"
                                                                runat="server"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="false"
                                                                Step="1"
                                                                FieldLabel="Antigüedad"
                                                                EmptyText="Domicilio">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pOcupacionAval" 
                                        runat="server" 
                                        Title="Ocupación Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsOcupacionAval"
                                                runat="server"
                                                Title="Empresa">
                                                <Items>
                                                    <ext:Container
                                                        ID="fcOcupacionAval" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfAvalEmpresa" 
                                                                runat="server"
                                                                FieldLabel="Empresa"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalEmpresa.setValue(App.txtfAvalEmpresa.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfAvalEmpresaPuesto" 
                                                                runat="server"
                                                                FieldLabel="Puesto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalEmpresaPuesto.setValue(App.txtfAvalEmpresaPuesto.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="fcOcupacionAval1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfAvalEmpresaJefeNombre"
                                                                runat="server"
                                                                EmptyText="Nombres"
                                                                FieldLabel="Jefe Inmediato"
                                                                Width="325"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalEmpresaJefeNombre.setValue(App.txtfAvalEmpresaJefeNombre.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfAvalEmpresaJefeAPaterno"
                                                                runat="server"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalEmpresaJefeAPaterno.setValue(App.txtfAvalEmpresaJefeAPaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfAvalEmpresaJefeAMaterno"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalEmpresaJefeAMaterno.setValue(App.txtfAvalEmpresaJefeAMaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcOcupacionAval2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="AllowExponential" Value="false" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfAvalEmpresaAntiguedad"
                                                                runat="server"
                                                                AllowDecimals="false"
                                                                FieldLabel="Antigüedad"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                Width="325"
                                                                AllowBlank="true"
                                                                LabelWidth="120"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfAvalEmpresaIngresos"
                                                                runat="server"
                                                                AllowBlank="true"
                                                                AllowDecimals="true"
                                                                EmptyText="Ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfAvalEmpresaOtrosIngresos"
                                                                runat="server"
                                                                AllowBlank="true"
                                                                AllowDecimals="true"
                                                                EmptyText="Otros ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcOcupacionAval3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="737" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfAvalEmpresaConcepto"
                                                                runat="server"
                                                                FieldLabel="Otros ingresos"
                                                                EmptyText="Concepto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalEmpresaConcepto.setValue(App.txtfAvalEmpresaConcepto.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>                                         
                                                    <ext:Container 
                                                        ID="fcOcupacionAval4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgAvalEmpresaPropietario"
                                                                runat="server"
                                                                Width="737"
                                                                LabelWidth="120" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Propietario"
                                                                ColumnsNumber="2"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rAvalEmpresaPropietarioSi" runat="server" BoxLabel="Si" Checked="true" />
                                                                    <ext:Radio ID="rAvalEmpresaPropietarioNo" runat="server" BoxLabel="No"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcOcupacionAval5"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="737" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="20" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtAvalEmpresaGiroComercial" 
                                                                runat="server"
                                                                FieldLabel="Giro comercial"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtAvalEmpresaGiroComercial.setValue(App.txtAvalEmpresaGiroComercial.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
<%--                                                            <ext:RadioGroup
                                                                ID="rgAvalEmpresaTipo"
                                                                runat="server"
                                                                Width="737"
                                                                LabelWidth="120" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Tipo"
                                                                ColumnsNumber="2"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rAvalEmpresaTipoEmpleado" runat="server" BoxLabel="Empleado" Checked="true" />
                                                                    <ext:Radio ID="rAvalEmpresaTipoGiroComercial" runat="server" BoxLabel="Giro comercial"  />
                                                                </Items>
                                                            </ext:RadioGroup>--%>
                                                        </Items>
                                                    </ext:Container> 
                                                    <ext:Container 
                                                        ID="fcOcupacionAval6" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                             <ext:TextField 
                                                                ID="txtfAvalEmpresaTelefono" 
                                                                runat="server"
                                                                FieldLabel="Teléfono"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Note="Ejemplo: (449) 999-00-00">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="imAvalEmpresaTelefono"
                                                                        runat="server"
                                                                        Mask="(999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:NumberField
                                                                ID="nfAvalEmpresaTelefonoExt"
                                                                runat="server"
                                                                FieldLabel="Extensión"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                MinValue="0"
                                                                MaxValue="99999"
                                                                AllowDecimals="false"
                                                                AllowExponential="false"
                                                                Step="1"
                                                                Note="Ejemplo: 44889">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="fcOcupacionAval7" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="737" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="50" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfAvalEmpresaAnterior" 
                                                                runat="server"
                                                                FieldLabel="Empresa Anterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfAvalEmpresaAnterior.setValue(App.txtfAvalEmpresaAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pBienesAval" 
                                        runat="server" 
                                        Title="Bienes del Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsBienesAval"
                                                runat="server"
                                                Title="Tipo de bienes">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgBienesAval"
                                                        runat="server"
                                                        Width="680"
                                                        LabelWidth="126"  
                                                        FieldLabel="Tipo"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        ColumnsNumber="2"
                                                        ColumnWidth=".91">
                                                        <Items>
                                                            <ext:Radio ID="rBienesMueblesAval" runat="server" BoxLabel="Bienes Muebles" Checked="true" />
                                                            <ext:Radio ID="rBienesInmueblesAval" runat="server" BoxLabel="Bienes Inmuebles"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                    <ext:Button
                                                        ID="btnAgregarBienesAval"
                                                        runat="server"
                                                        Text="Agregar"
                                                        Margin="5">
                                                        <Listeners>
                                                            <Click Fn="btnAgregarBienesAval_Click" />
                                                        </Listeners>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FieldSet>
<%--                                            <ext:FieldSet
                                                ID="fsBienes"
                                                runat="server"
                                                Title="Bienes">
                                                <Items>
                                                    <ext:Container 
                                                        ID="fcBienesAval1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfUbicacionAval"
                                                                runat="server"
                                                                FieldLabel="Ubicación"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                            <ext:ComboBox 
                                                                ID="cmbTipoInmuebleAval"
                                                                runat="server"
                                                                FieldLabel="Tipo inmueble"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcBienesAval2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfInscripcionAval" 
                                                                runat="server"
                                                                FieldLabel="Inscripción"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100">
                                                            </ext:TextField>
                                                             <ext:NumberField 
                                                                ID="nfValorInmuebleAval" 
                                                                runat="server"
                                                                FieldLabel="Valor"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="9"
                                                                MinValue="0"
                                                                MaxValue="999999999"
                                                                AllowDecimals="true"
                                                                AllowExponential="true"
                                                                Step="1">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>--%>
                                        </Items>
                                    </ext:Panel>
                                    <%--Terminado--%>
                                    <ext:Panel
                                        ID="pCapacidadPago"
                                        runat="server"
                                        Title="Capacidad Pago" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsCapacidadPago"
                                                runat="server"
                                                Title="Conceptos">
                                                <Items>
                                                    <ext:Container
                                                        ID="cCapacidadPago1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:GridPanel
                                                                ID="gpCapacidadPagoIngresos"
                                                                runat="server"
                                                                Height="300"
                                                                Width="360"
                                                                EnableColumnHide="false"
                                                                EnableColumnMove="false"
                                                                Header="false"
                                                                Border="true"
                                                                Margin="5"
                                                                Reorderable="false"
                                                                Resizable="false"
                                                                SortableColumns="false">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sCapacidadPagoIngresos"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mCapacidadPagoIngresos" runat="server">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="Int" />
                                                                                    <ext:ModelField Name="SolicitudPrestamo" Type="String" />
                                                                                    <ext:ModelField Name="Renglon" Type="Int" />
                                                                                    <ext:ModelField Name="Tipo" Type="String" />
                                                                                    <ext:ModelField Name="Concepto" Type="String" />
                                                                                    <ext:ModelField Name="Importe" Type="Float" UseNull="true" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                        <Sorters>
                                                                            <ext:DataSorter Property="ID" Direction="ASC" />
                                                                        </Sorters>
                                                                        <Listeners>
                                                                            <Load Fn="sCapacidadPagoIngresos_Load" />
                                                                        </Listeners>
                                                                    </ext:Store>
                                                                </Store>
                                                                <ColumnModel>
                                                                    <Columns>
                                                                        <ext:Column 
                                                                            ID="cConceptoIngresos"
                                                                            runat="server"
                                                                            Text="INGRESO"
                                                                            Align="Left"
                                                                            Width="200"
                                                                            DataIndex="Concepto"
                                                                            SummaryType="Count">
                                                                            <SummaryRenderer Handler="return 'TOTAL';" />
                                                                        </ext:Column>
                                                                        <ext:NumberColumn
                                                                            ID="ncImporteIngresos"
                                                                            runat="server"
                                                                            Text="IMPORTE"
                                                                            Align="Center"
                                                                            Width="157"
                                                                            DataIndex="Importe"
                                                                            SummaryType="Sum">
                                                                            <Renderer Fn="ncImporte_Renderer" />
                                                                        </ext:NumberColumn>
                                                                    </Columns>
                                                                </ColumnModel>
                                                                <Features>
                                                                    <ext:Summary ID="summaryCapacidadPagoIngresos" runat="server" />
                                                                </Features>
                                                            </ext:GridPanel>
                                                            <ext:GridPanel
                                                                ID="gpCapacidadPagoEgresos"
                                                                runat="server"
                                                                Height="300"
                                                                Width="360"
                                                                EnableColumnHide="false"
                                                                EnableColumnMove="false"
                                                                Header="false"
                                                                Border="true"
                                                                Margin="5"
                                                                Reorderable="false"
                                                                Resizable="false"
                                                                SortableColumns="false"
                                                                RowLines="true">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sCapacidadPagoEgresos"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mCapacidadPagoEgresos" runat="server">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="Int" />
                                                                                    <ext:ModelField Name="SolicitudPrestamo" Type="String" />
                                                                                    <ext:ModelField Name="Renglon" Type="Int" />
                                                                                    <ext:ModelField Name="Tipo" Type="String" />
                                                                                    <ext:ModelField Name="Concepto" Type="String" />
                                                                                    <ext:ModelField Name="Importe" Type="Float" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                        <Sorters>
                                                                            <ext:DataSorter Property="ID" Direction="ASC" />
                                                                        </Sorters>
                                                                        <Listeners>
                                                                            <Load Fn="sCapacidadPagoEgresos_Load" />
                                                                        </Listeners>
                                                                    </ext:Store>
                                                                </Store>
                                                                <ColumnModel>
                                                                    <Columns>
                                                                        <ext:Column 
                                                                            ID="cConceptoEgresos"
                                                                            runat="server"
                                                                            Text="EGRESO"
                                                                            Align="Left"
                                                                            Width="200"
                                                                            DataIndex="Concepto">
                                                                            <SummaryRenderer Handler="return 'TOTAL';" />
                                                                        </ext:Column>
                                                                        <ext:NumberColumn
                                                                            ID="ncImporteEgresos"
                                                                            runat="server"
                                                                            Text="IMPORTE"
                                                                            Align="Center"
                                                                            Width="157"
                                                                            DataIndex="Importe"
                                                                            SummaryType="Sum">
                                                                            <Renderer Fn="ncImporte_Renderer" />
                                                                            <Editor>
                                                                                <ext:NumberField 
                                                                                    ID="nfImporteEgresos"
                                                                                    runat="server"
                                                                                    AllowDecimals="true"
                                                                                    AllowExponential="false"
                                                                                    DecimalPrecision="2"
                                                                                    DecimalSeparator="."
                                                                                    MaxLength="10"
                                                                                    EnforceMaxLength="true"
                                                                                    MaxValue="9999999999"
                                                                                    MinValue="0"
                                                                                    Step="1">
                                                                                </ext:NumberField>
                                                                            </Editor>
                                                                        </ext:NumberColumn>
                                                                    </Columns>
                                                                </ColumnModel>
                                                                <SelectionModel>
                                                                    <ext:CellSelectionModel
                                                                        ID="csmCapacidadPagoEgresos" 
                                                                        runat="server">
                                                                    </ext:CellSelectionModel>
                                                                </SelectionModel>
                                                                <Plugins>
                                                                    <ext:CellEditing 
                                                                        ID="ceCapacidadPagoEgresos" 
                                                                        runat="server"
                                                                        ClicksToEdit="1">
                                                                    </ext:CellEditing>
                                                                </Plugins>
                                                                <Features>
                                                                    <ext:Summary ID="summaryCapacidadPagoEgresos" runat="server" />
                                                                </Features>
                                                            </ext:GridPanel>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                    <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosOperacion" 
                                        runat="server" 
                                        Title="Datos de Operación" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsDatosOperacion"
                                                runat="server"
                                                Title="Operación">
                                                <Items>
                                                    <ext:Container 
                                                        ID="cDatosOperacion1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowExponential" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="AllowDecimals" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Step" Value="1" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="9" Mode="Raw" />
                                                            <ext:Parameter Name="MinValue" Value="0" Mode="Raw" />
                                                            <ext:Parameter Name="MaxValue" Value="999999999" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField 
                                                                ID="nfCantidad"
                                                                runat="server"
                                                                FieldLabel="Cantidad solicitada"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField 
                                                                ID="nfPlazo"
                                                                runat="server"
                                                                FieldLabel="Plazo"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosOperacion2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox 
                                                                ID="cmbFormaPago" 
                                                                runat="server"
                                                                AllowBlank="false"
                                                                FieldLabel="Forma de pago"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Items>
                                                                    <ext:ListItem Index="0" Text="SEMANAL" Value="SEMANAL" />
                                                                    <ext:ListItem Index="0" Text="QUINCENAL" Value="QUINCENAL" />
                                                                    <ext:ListItem Index="0" Text="MENSUAL" Value="MENSUAL" />
                                                                </Items>
                                                            </ext:ComboBox>
                                                            <ext:TextField 
                                                                ID="txtfDestinoPrestamo" 
                                                                runat="server"
                                                                AllowBlank="true"
                                                                FieldLabel="Destino préstamo"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfDestinoPrestamo.setValue(App.txtfDestinoPrestamo.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosOperacion3" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox 
                                                                ID="cmbTipo" 
                                                                runat="server"
                                                                FieldLabel="Tipo prestamo"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Items>
                                                                    <ext:ListItem Index="0" Text="CONSUMO" Value="CONSUMO" />
                                                                    <ext:ListItem Index="0" Text="COMERCIO Y/O PRODUCCIÓN" Value="COMERCIO Y/O PRODUCCIÓN" />
                                                                </Items>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
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
                            <ext:StatusBar ID="sbSolicitudPrestamo" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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
                                        <EventMask ShowMask="true" Msg="Registrando información..." />
                                        <ExtraParams>
                                            <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                            <ext:Parameter Name="usuario" Value="Ext.encode(window.parent.App.sUsuario.getRecordsValues())" Mode="Raw" />
                                            <ext:Parameter Name="edad" Value="App.txtfConyugeEdad.getValue()" Mode="Raw" />
                                            <ext:Parameter Name="ingresos" Value="Ext.encode(App.sCapacidadPagoIngresos.getRecordsValues())" Mode="Raw" />
                                            <ext:Parameter Name="egresos" Value="Ext.encode(App.sCapacidadPagoEgresos.getRecordsValues())" Mode="Raw" />
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
                </Items>
            </ext:Panel>
        </div>
    </form>
</body>
</html>