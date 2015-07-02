<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCertificadoInversion.aspx.cs" Inherits="OSEF.ERP.APP.FormaCertificadoInversion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="js/certificadosInversiones.js"></script>
    <script type="text/javascript">
        window.onload = cargarEstilo;

        //Funcion que valida que tema va a ser utilizadp
        function cargarEstilo() {
            //Validamos la cookie
            if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
                //Asiganmos los elementos en el header
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", 'css/login.css')
                var fileref2 = document.createElement("link")
                fileref2.setAttribute("rel", "stylesheet")
                fileref2.setAttribute("type", "text/css")
                fileref2.setAttribute("href", 'css/customControls.css')
                var fileref3 = document.createElement("link")
                fileref3.setAttribute("rel", "stylesheet")
                fileref3.setAttribute("type", "text/css")
                fileref3.setAttribute("href", 'css/xMask.css')
                var fileref4 = document.createElement("link")
                fileref4.setAttribute("rel", "stylesheet")
                fileref4.setAttribute("type", "text/css")
                fileref4.setAttribute("href", 'css/xDatePicker.css')
                var fileref5 = document.createElement("link")
                fileref5.setAttribute("rel", "stylesheet")
                fileref5.setAttribute("type", "text/css")
                fileref5.setAttribute("href", 'css/xSplitButton.css')
                var fileref6 = document.createElement("link")
                fileref6.setAttribute("rel", "stylesheet")
                fileref6.setAttribute("type", "text/css")
                fileref6.setAttribute("href", 'css/xGridPanel.css')
                var fileref7 = document.createElement("link")
                fileref7.setAttribute("rel", "stylesheet")
                fileref7.setAttribute("type", "text/css")
                fileref7.setAttribute("href", 'css/xWindowPopup.css')
                var fileref8 = document.createElement("link")
                fileref8.setAttribute("rel", "stylesheet")
                fileref8.setAttribute("type", "text/css")
                fileref8.setAttribute("href", 'css/xPanel.css')
                var fileref9 = document.createElement("link")
                fileref9.setAttribute("rel", "stylesheet")
                fileref9.setAttribute("type", "text/css")
                fileref9.setAttribute("href", 'css/xComboBox.css')
                var fileref10 = document.createElement("link")
                fileref10.setAttribute("rel", "stylesheet")
                fileref10.setAttribute("type", "text/css")
                fileref10.setAttribute("href", 'css/xCustomChart.css')
                var fileref11 = document.createElement("link")
                fileref11.setAttribute("rel", "stylesheet")
                fileref11.setAttribute("type", "text/css")
                fileref11.setAttribute("href", 'css/xToolbar.css')
                var fileref12 = document.createElement("link")
                fileref12.setAttribute("rel", "stylesheet")
                fileref12.setAttribute("type", "text/css")
                fileref12.setAttribute("href", 'css/xLabel.css')
                var fileref13 = document.createElement("link")
                fileref13.setAttribute("rel", "stylesheet")
                fileref13.setAttribute("type", "text/css")
                fileref13.setAttribute("href", 'css/xTreePanel.css')
                var fileref14 = document.createElement("link")
                fileref14.setAttribute("rel", "stylesheet")
                fileref14.setAttribute("type", "text/css")
                fileref14.setAttribute("href", 'css/xHiperlink.css')
                var fileref15 = document.createElement("link")
                fileref15.setAttribute("rel", "stylesheet")
                fileref15.setAttribute("type", "text/css")
                fileref15.setAttribute("href", 'css/xTextField.css')
                var fileref16 = document.createElement("link")
                fileref16.setAttribute("rel", "stylesheet")
                fileref16.setAttribute("type", "text/css")
                fileref16.setAttribute("href", 'css/xFieldSet.css')
                var fileref17 = document.createElement("link")
                fileref17.setAttribute("rel", "stylesheet")
                fileref17.setAttribute("type", "text/css")
                fileref17.setAttribute("href", 'css/xButton.css')
                var fileref18 = document.createElement("link")
                fileref18.setAttribute("rel", "stylesheet")
                fileref18.setAttribute("type", "text/css")
                fileref18.setAttribute("href", 'css/metroButtons.css')
                var fileref19 = document.createElement("link")
                fileref19.setAttribute("rel", "stylesheet")
                fileref19.setAttribute("type", "text/css")
                fileref19.setAttribute("href", 'css/metroButtons.css')
                var fileref20 = document.createElement("link")
                fileref20.setAttribute("rel", "stylesheet")
                fileref20.setAttribute("type", "text/css")
                fileref20.setAttribute("href", 'css/xDisplayImages.css')
                var fileref21 = document.createElement("link")
                fileref21.setAttribute("rel", "stylesheet")
                fileref21.setAttribute("type", "text/css")
                fileref21.setAttribute("href", 'css/xIcons.css')
                var fileref22 = document.createElement("link")
                fileref22.setAttribute("rel", "stylesheet")
                fileref22.setAttribute("type", "text/css")
                fileref22.setAttribute("href", 'css/xTabPanel.css')

                document.getElementsByTagName("head")[0].appendChild(fileref);
                document.getElementsByTagName("head")[0].appendChild(fileref2);
                document.getElementsByTagName("head")[0].appendChild(fileref3);
                document.getElementsByTagName("head")[0].appendChild(fileref4);
                document.getElementsByTagName("head")[0].appendChild(fileref5);
                document.getElementsByTagName("head")[0].appendChild(fileref6);
                document.getElementsByTagName("head")[0].appendChild(fileref7);
                document.getElementsByTagName("head")[0].appendChild(fileref8);
                document.getElementsByTagName("head")[0].appendChild(fileref9);
                document.getElementsByTagName("head")[0].appendChild(fileref10);
                document.getElementsByTagName("head")[0].appendChild(fileref11);
                document.getElementsByTagName("head")[0].appendChild(fileref12);
                document.getElementsByTagName("head")[0].appendChild(fileref13);
                document.getElementsByTagName("head")[0].appendChild(fileref14);
                document.getElementsByTagName("head")[0].appendChild(fileref15);
                document.getElementsByTagName("head")[0].appendChild(fileref16);
                document.getElementsByTagName("head")[0].appendChild(fileref17);
                document.getElementsByTagName("head")[0].appendChild(fileref18);
                document.getElementsByTagName("head")[0].appendChild(fileref19);
                document.getElementsByTagName("head")[0].appendChild(fileref20);
                document.getElementsByTagName("head")[0].appendChild(fileref21);
                document.getElementsByTagName("head")[0].appendChild(fileref22);
            }

            if (Ext.util.Cookies.get('osefTheme') == 'caja') {
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", 'css/customControls2.css')
                var fileref2 = document.createElement("link")
                fileref2.setAttribute("rel", "stylesheet")
                fileref2.setAttribute("type", "text/css")
                fileref2.setAttribute("href", 'css/login2.css')
                document.getElementsByTagName("head")[0].appendChild(fileref);
                document.getElementsByTagName("head")[0].appendChild(fileref2);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaCertificadoInversion" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sCertificadoInversion"
            runat="server">
            <Model>
                <ext:Model
                    ID="mCertificadoInversion"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Cliente" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="APaterno" Type="String" />
                        <ext:ModelField Name="AMaterno" Type="String" />
                        <ext:ModelField Name="NombreCompleto" Type="String" />
                        <ext:ModelField Name="TipoInversion" Type="String" />
                        <ext:ModelField Name="UnidadCalculo" Type="Int" />
                        <ext:ModelField Name="TasaInteres" Type="Float" />
                        <ext:ModelField Name="FechaVencimiento" Type="Date" />
                        <ext:ModelField Name="ValorInversion" Type="Float" />
                        <ext:ModelField Name="InstruccionesCapital" Type="String" />
                        <ext:ModelField Name="InstruccionesInteres" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="UsuarioAlta" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="UsuarioModificacion" Type="String" />
                        <ext:ModelField Name="FechaModificacion" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>           
        </ext:Store>
    
        <ext:FormPanel 
            ID="fpCertificadoInversion"
            runat="server"
            Height="330"
            Width="730"
            BodyPadding="10"
            MonitorResize="true">
            <Items>
                <ext:FieldContainer
                    ID="fcSocio" 
                    runat="server" 
                    FieldLabel="Socio"
                    LabelWidth="150" 
                    AnchorHorizontal="100%" 
                    Layout="HBoxLayout">                                       
                    <Items>
                        <ext:ComboBox
                            ID="cmbCliente" 
                            runat="server" 
                            Width="200" 
                            AutoFocus="true"
                            Margins="0 3 0 0"
                            Disabled="false"
                            ValueField="ID"
                            DisplayField="ID"
                            QueryMode="Local"
                            TypeAhead="true"
                            MatchFieldWidth="false"
                            AllowBlank="false"
                            PageSize="10"
                            ValueNotFoundText="Elemento no encontrado"
                            ForceSelection="true">
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
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Nombre" Type="String" />
                                                <ext:ModelField Name="APaterno" Type="String" />
                                                <ext:ModelField Name="AMaterno" Type="String" />
                                                <ext:ModelField Name="NombreCompleto" Type="String">
                                                    <Convert Fn="NombreCompleto_Convert" />
                                                </ext:ModelField>
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
                            Width="340" 
                            Margins="0 3 0 0"
                            Disabled="true">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>            
                <ext:FieldContainer 
                    ID="fcSegundaSeccion" 
                    runat="server" 
                    FieldLabel="Tipo inversión" 
                    AnchorHorizontal="100%"
                     LabelWidth="150"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox
                            ID="cmbTipoInversion" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:ComboBox>
                        <ext:TextField 
                            ID="txtfUnidadCalculo" 
                            runat="server" 
                            LabelWidth="120"
                            FieldLabel="Unidad calculo"
                            Width="340"
                            AllowBlank="false">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>                
                 <ext:FieldContainer 
                    ID="fcTasaInteres" 
                    runat="server" 
                    FieldLabel="Tasa  interés"
                     LabelWidth="150" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:NumberField
                            ID="nfTasaInteres" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:NumberField>
                        <ext:DateField 
                            ID="dfFechaVencimiento" 
                            runat="server" 
                            LabelWidth="120"
                            FieldLabel="Vencimiento"
                            Width="340"
                            AllowBlank="false">
                            <PickerOptions
                                Cls="my-date-picker"
                                ID="pOFechaVencimiento"
                                runat="server">
                            </PickerOptions>
                        </ext:DateField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer 
                    ID="fcValorInversion" 
                    runat="server" 
                    LabelWidth="150"
                    FieldLabel="Valor inversión" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:NumberField
                            ID="nfValorInversion" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:NumberField>                        
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer 
                    ID="fcInstruccionesCapital" 
                    runat="server" 
                    LabelWidth="150"
                    FieldLabel="Instrucciones al capital" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox
                            ID="nfInstruccionesCapital" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer 
                    ID="fcInstruccionesInteres" 
                    runat="server" 
                    FieldLabel="Instrucciones al interés" 
                    LabelWidth="150"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox
                            ID="nfInstruccionesInteres" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>
                <ext:Container
                    ID="cAlta"
                    runat="server"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfUsuarioAlta"
                            runat="server"
                            Width="355"
                            Editable="false"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            AllowBlank="true"
                            Disabled="true"
                            FieldLabel="Usuario alta"
                            LabelWidth="150">
                        </ext:TextField>
                        <ext:DateField
                            ID="dfFechaAlta"
                            runat="server"
                            StyleSpec="margin-right: 6px;"
                            Width="250"
                            AllowBlank="true"
                            Disabled="true"
                            Vtype="daterange">
                        </ext:DateField>
                    </Items>
                </ext:Container>
                <ext:Container
                    ID="cModificacion"
                    runat="server"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfUsuarioModificacion"
                            runat="server"
                            Width="355"
                            Editable="false"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            AllowBlank="true"
                            FieldLabel="Usuario modificación"
                            LabelWidth="150"
                            Disabled="true">
                        </ext:TextField>
                        <ext:DateField
                            ID="dfFechaModificacion"
                            runat="server"
                            StyleSpec="margin-right: 6px;"
                            Width="250"
                            AllowBlank="true"
                            Disabled="true"
                            Vtype="daterange">
                        </ext:DateField>
                    </Items>
                </ext:Container>
            </Items>
            <BottomBar>
                <ext:StatusBar ID="sbCertificadoInversion" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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