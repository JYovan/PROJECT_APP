<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaOrdenEstimacion.aspx.cs" Inherits="OSEF.ERP.APP.FormaOrdenesEstimaciones" %>

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
    <script type='text/javascript' src="js/formaOrdenEstimacion.js"></script>    
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaOrdenEstimacion" runat="server" HideInDesign="true" />
    
        <ext:Store
            ID="sOrdenEstimacion"
            runat="server">
            <Model>
                <ext:Model
                    ID="mOrdenEstimacion"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="Int" />
                        <ext:ModelField Name="Mov" Type="String" />
                        <ext:ModelField Name="MovID" Type="String" />
                        <ext:ModelField Name="Sucursal" Type="String" />
                        <ext:ModelField Name="FechaEmision" Type="Date" />
                        <ext:ModelField Name="Observaciones" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="Usuario" Type="String" />
                        <ext:ModelField Name="RSucursal" Type="Object" />
                        <ext:ModelField Name="Origen" Type="String" />
                        <ext:ModelField Name="OrigenId" Type="String" />
                        <ext:ModelField Name="Reporte" Type="String" />
                        <ext:ModelField Name="Division" Type="String" />
                        <ext:ModelField Name="FechaOrigen" Type="Date" />
                        <ext:ModelField Name="HoraOrigen" Type="Date" />
                        <ext:ModelField Name="FechaMaximaAtencion" Type="Date" />
                        <ext:ModelField Name="DiasAtencion" Type="Float" />
                        <ext:ModelField Name="Reporto" Type="String" />
                        <ext:ModelField Name="TrabajoRequerido" Type="String" />
                        <ext:ModelField Name="Atiende" Type="String" />
                        <ext:ModelField Name="TrabajoRealizado" Type="String" />
                        <ext:ModelField Name="CodigoFalla" Type="String" />
                        <ext:ModelField Name="FechaLlegada" Type="Date" />
                        <ext:ModelField Name="HoraLlegada" Type="Date" />
                        <ext:ModelField Name="FechaFinActividad" Type="Date" />
                        <ext:ModelField Name="HoraFinActividad" Type="Date" />
                        <ext:ModelField Name="Zona" Type="String" />
                        <ext:ModelField Name="Cuadrilla" Type="String" />
                        <ext:ModelField Name="ImporteFinal" Type="Float" />
                        <ext:ModelField Name="RutaImagen" Type="String" />
                        <ext:ModelField Name="Atendido" Type="String" />
                        <ext:ModelField Name="NoOrden" Type="String" />
                        <ext:ModelField Name="ReferenciaOrden" Type="String" />
                        <ext:ModelField Name="Clasificacion" Type="String" />
                        <ext:ModelField Name="Cliente" Type="String" />
                        <ext:ModelField Name="RCliente" Type="Object" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sOrdenesMantenimiento_Load" />
                <Add Fn="sOrdenesMantenimiento_Add" />
            </Listeners>
        </ext:Store>

        <ext:FormPanel
            ID="fpOrdenEstimacion"
            runat="server" 
            MonitorResize="true"
            Height="555"
            Width="910"
            BodyStyle="background-color:#fff;">
            <TopBar>
                <ext:Toolbar
                    ID="tbOrdenEstimacion" 
                    runat="server" 
                    Height="40">
                    <Items>
                        <ext:ImageButton 
                            ID="imgbtnNuevo"
                            runat="server"
                            ImageUrl="assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="assets/img/controles/nuevo-disable.png"
                            OverImageUrl="assets/img/controles/nuevo-over.png"
                            PressedImageUrl="assets/img/controles/nuevo-pressed.png"
                            ToolTip="Nuevo"
                            Height="30"
                            Width="30">
                             <Listeners>
                                <Click Fn="imgbtnFormaNuevo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnAbrir"
                            runat="server"
                            ImageUrl="assets/img/controles/AbrirNormal.png"
                            DisabledImageUrl="assets/img/controles/AbrirDisabled.png"
                            OverImageUrl="assets/img/controles/AbrirOver.png"
                            PressedImageUrl="assets/img/controles/AbrirPressed.png"
                            ToolTip="Abrir"
                            Height="30"
                            Width="30">
                            <Listeners>
                                <Click Fn="imgbtnAbrir_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnGuardar"
                            runat="server"
                            ImageUrl="assets/img/controles/SaveNormal.png"
                            DisabledImageUrl="assets/img/controles/SaveDisabled.png"
                            OverImageUrl="assets/img/controles/SaveOver.png"
                            PressedImageUrl="assets/img/controles/SavePressed.png"
                            ToolTip="Guardar"
                            Height="30"
                            Width="30"
                            Disabled="true">
                            <DirectEvents>
                                <Click OnEvent="imgbtnGuardar_Click" Success="imgbtnGuardar_Click_Success">
                                    <EventMask ShowMask="true" Msg="Guardardo información..." />
                                    <ExtraParams>
                                        <ext:Parameter Name="OrdenEstimacionForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <%--<ext:Parameter Name="OrdenEstimacion" Value="Ext.encode(#{sOrdenEstimacion}.getRecordsValues())" Mode="Raw" />--%>
                                        <ext:Parameter Name="OrdenEstimacion" Value="getRecordValues()" Mode="Raw" />
                                        <ext:Parameter Name="IDOrdenEstimacion" Value="strID" Mode="Raw" />
                                        <ext:Parameter Name="OrdenEstimacionD" Value="Ext.encode(#{sConceptos}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="Sucursal" Value="App.txtfSucursalID.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="diasAtencion" Value="App.nfDiasAtencion.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="fechaMaxima" Value="App.dfFechaMaxima.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnInfo"
                            runat="server"
                            ImageUrl="assets/img/controles/InfoNormal.png"
                            DisabledImageUrl="assets/img/controles/InfoDisabled.png"
                            OverImageUrl="assets/img/controles/InfoOver.png"
                            PressedImageUrl="assets/img/controles/InfoPressed.png"
                            ToolTip="Información"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnAfectar"
                            runat="server"
                            ImageUrl="assets/img/controles/AfectarNormal.png"
                            DisabledImageUrl="assets/img/controles/AfectarDisabled.png"
                            OverImageUrl="assets/img/controles/AfectarOver.png"
                            PressedImageUrl="assets/img/controles/AfectarPressed.png"
                            ToolTip="Afectar" 
                            Height="30"
                            Width="30"
                            Disabled="true">
                            <DirectEvents>
                                <Click OnEvent="imgbtnAfectar_Click"  Before="imgbtnAfectar_Click_Before" Success="imgbtnAfectar_Click_Success">
                                    <EventMask ShowMask="true" Msg="Afectando movimiento..." />
                                     <ExtraParams>
                                        <ext:Parameter Name="OrdenEstimacionForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                         <ext:Parameter Name="OrdenEstimacion" Value="Ext.encode(#{sOrdenEstimacion}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="IDOrdenEstimacion" Value="strID" Mode="Raw" />
                                        <ext:Parameter Name="OrdenEstimacionD" Value="Ext.encode(#{sConceptos}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="Movimiento" Value="App.cmbMov.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="Sucursal" Value="App.txtfSucursalID.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="diasAtencion" Value="App.nfDiasAtencion.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnAutorizar"
                            runat="server"
                            ImageUrl="assets/img/controles/AutorizarNormal.png"
                            DisabledImageUrl="assets/img/controles/AutorizarDisabled.png"
                            OverImageUrl="assets/img/controles/AutorizarOver.png"
                            PressedImageUrl="assets/img/controles/AutorizarPressed.png"
                            ToolTip="Autorizar"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnImprimir"
                            runat="server"
                            ImageUrl="assets/img/controles/ImprimirNormal.png"
                            DisabledImageUrl="assets/img/controles/ImprimirDisabled.png"
                            OverImageUrl="assets/img/controles/ImprimirOver.png"
                            PressedImageUrl="assets/img/controles/ImprimirPressed.png"
                            ToolTip="Imprimir"
                            Height="30"
                            Width="30"
                            Disabled="true">
                            <Listeners>
                                <Click Fn="imgbtnImprimir_Click"></Click>
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer
                            ID="tbsPrimerEspacio"
                            runat="server"
                            Width="190">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton
                            ID="imgbtnBorrar"
                            runat="server"
                            ImageUrl="assets/img/controles/delete-normal.png"
                            DisabledImageUrl="assets/img/controles/delete-disable.png"
                            OverImageUrl="assets/img/controles/delete-over.png"
                            PressedImageUrl="assets/img/controles/delete-pressed.png"
                            ToolTip="Borrar Movimiento"
                            Height="30"
                            Width="30"
                            Disabled="true">
                            <DirectEvents>
                                <Click OnEvent="imgbtnBorrar_Click" Success="imgbtnBorrar_Click_Success">
                                    <Confirmation
                                        ConfirmRequest="true"
                                        Title="Eliminar"
                                        Message="¿Deseas eliminar el registro?">
                                    </Confirmation>
                                    <EventMask
                                        ShowMask="true"
                                        Target="CustomTarget"
                                        Msg="Eliminando registro">
                                    </EventMask>
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
                            ToolTip="Cancelar Movimiento"
                            Height="30"
                            Width="30"
                            Disabled="true">
                             <DirectEvents>
                                <Click OnEvent="imgbtnCancelar_Click" Success="imgbtnCancelar_Click_Success">
                                    <Confirmation
                                        ConfirmRequest="true"
                                        Title="Eliminar"
                                        Message="¿Deseas cancelar el movimiento?">
                                    </Confirmation>
                                    <EventMask
                                        ShowMask="true"
                                        Target="CustomTarget"
                                        Msg="Cancelando registro">
                                    </EventMask>
                                </Click>
                             </DirectEvents>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer
                            ID="tbsSegundoEspacio"
                            runat="server"
                            Width="190">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton 
                            ID="imgbtnPrimero"
                            runat="server"
                            ImageUrl="assets/img/controles/PrimeroNormal.png"
                            DisabledImageUrl="assets/img/controles/PrimeroDisabled.png"
                            OverImageUrl="assets/img/controles/PrimeroOver.png"
                            PressedImageUrl="assets/img/controles/PrimeroPressed.png"
                            ToolTip="Primero"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnAnterior"
                            runat="server"
                            ImageUrl="assets/img/controles/AnteriorNormal.png"
                            DisabledImageUrl="assets/img/controles/AnteriorDisabled.png"
                            OverImageUrl="assets/img/controles/AnteriorOver.png"
                            PressedImageUrl="assets/img/controles/AnteriorPressed.png"
                            ToolTip="Anterior"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnSiguiente"
                            runat="server"
                            ImageUrl="assets/img/controles/SiguienteNormal.png"
                            DisabledImageUrl="assets/img/controles/SiguienteDisabled.png"
                            OverImageUrl="assets/img/controles/SiguienteOver.png"
                            PressedImageUrl="assets/img/controles/SiguientePressed.png"
                            ToolTip="Siguiente"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnUltimo"
                            runat="server"
                            ImageUrl="assets/img/controles/UltimoNormal.png"
                            DisabledImageUrl="assets/img/controles/UltimoDisabled.png"
                            OverImageUrl="assets/img/controles/UltimoOver.png"
                            PressedImageUrl="assets/img/controles/UltimoPressed.png"
                            ToolTip="Ultimo"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <Items>
                <ext:TabPanel
                    ID="tpContenedor"
                    runat="server" 
                    ActiveTabIndex="0" 
                    Plain="true" 
                    Cls="custotabpanel xchris">
                    <Items>
                        <ext:Panel 
                            ID="pDatosGenerales" 
                            runat="server" 
                            Title="Datos Generales"
                            BodyPadding="5"
                            Width="900"
                            Height="226" 
                            AutoScroll="false">
                            <Items>
                                <ext:FieldSet 
                                    ID="fsDivisorDatos" 
                                    runat="server" 
                                    Title="Datos Generales" 
                                    DefaultAnchor="100%"
                                    AutoScroll="false">
                                    <Items>
                                        <ext:FieldContainer 
                                            ID="fcMvomiento"
                                            runat="server"
                                            FieldLabel="Movimiento"
                                            LabelWidth="120"
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:ComboBox 
                                                    ID="cmbMov"
                                                    runat="server"
                                                    Width="200"
                                                    Margins="0 3 0 0"
                                                    Editable="false"
                                                    AllowBlank="false"
                                                    DisplayField="Nombre"
                                                    ValueField="ID">
                                                    <Store>
                                                        <ext:Store ID="sMov" runat="server">
                                                            <Model>
                                                                <ext:Model ID="mMov" runat="server" IDProperty="ID">
                                                                    <Fields>
                                                                        <ext:ModelField Name="ID" Type="String" />
                                                                        <ext:ModelField Name="Nombre" Type="String" />
                                                                    </Fields>
                                                                </ext:Model>
                                                            </Model>
                                                            <Listeners>
                                                                <Add Fn="sMov_Add" />
                                                            </Listeners>
                                                        </ext:Store>
                                                    </Store>
                                                    <Items>
                                                        <ext:ListItem Index="0" Text="Mesa de reporte" Value="Mesa de reporte" />
                                                        <ext:ListItem Index="1" Text="Orden de Cambio" Value="Orden de Cambio" />
                                                    </Items>
                                                    <Listeners>
                                                        <Select Fn="cmbMov_Select" />
                                                        <Change Fn="sMov_Change" />
                                                    </Listeners>
                                                </ext:ComboBox>
                                                <ext:TextField
                                                    ID="txtfMovID"
                                                    runat="server"
                                                    Width="110"
                                                    Margins="0 50 0 0"
                                                    Disabled="true">
                                                </ext:TextField>                                                 
                                                <ext:Checkbox 
                                                    ID="chkBoxOrdenCompra" 
                                                    runat="server" 
                                                    FieldLabel="O. Compra">
                                                    <Listeners>
                                                        <AfterRender Fn="chkBoxOrdenCompra_AfterRender" />
                                                        <Change Fn="chkBoxOrdenCompra_AfterRender" />
                                                    </Listeners>
                                                </ext:Checkbox>
                                                <ext:TextField 
                                                    ID="txtOrigen" 
                                                    runat="server" 
                                                    Hidden="true"
                                                    LabelWidth="50"
                                                    Margins="0 3 0 0"
                                                    FieldLabel="Origen"
                                                    Width="200" 
                                                    Disabled="true"> 
                                                </ext:TextField>
                                                <ext:TextField 
                                                    ID="txtOrigenID" 
                                                    FieldLabel="Origen ID"
                                                    LabelWidth="70"
                                                    Hidden="true"
                                                    runat="server" 
                                                    Width="180" 
                                                    Disabled="true"> 
                                                </ext:TextField>                                            
                                            </Items>
                                        </ext:FieldContainer>

                                        
                                        <ext:FieldContainer
                                        ID="fClientes"
                                        runat="server"
                                        LabelWidth="120"
                                        Width="227" 
                                        Height="25px"
                                        FieldLabel="Cliente"
                                        Layout="HBoxLayout">
                                        <Items>
                                            <ext:TextField 
                                                ID="IdCliente" 
                                                runat="server" 
                                                Width="200" 
                                                StyleSpec="margin-right: 3px;  height:24px;"
                                                AllowBlank="false" 
                                                ReadOnly="true"> 
                                                <RightButtons>
                                                    <ext:Button 
                                                    ID="btnBuscaCliente" 
                                                    runat="server" 
                                                    Icon="Find" 
                                                    StandOut="true">
                                                        <Listeners>
                                                            <Click Fn="btnBuscar_Cliente" />
                                                        </Listeners>
                                                    </ext:Button>
                                                </RightButtons>  
                                             </ext:TextField> 
                                             <ext:TextField
                                             ID="txtCliente"
                                             runat ="server"
                                             Width="360"
                                             StyleSpec="margin-right: 3px;  height:24px;"
                                                AllowBlank="false" 
                                                Disabled="true"/> 
                                        </Items>
                                        </ext:FieldContainer>

                                        <ext:FieldContainer
                                            ID="fcSucursal"
                                            runat="server"
                                            FieldLabel="Sucursal"
                                            AnchorHorizontal="100%"
                                            LabelWidth="120"
                                            Height="25"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:TextField 
                                                    ID="txtfSucursalCR" 
                                                    runat="server" 
                                                    Width="200" 
                                                    Margins="0 3 0 0"
                                                    MaxLength="50" 
                                                    EnforceMaxLength="true" 
                                                    AllowBlank="true" 
                                                    ReadOnly="true">
                                                    <RightButtons>
                                                        <ext:Button 
                                                            ID="btnBuscarSucursal" 
                                                            runat="server" 
                                                            Icon="Find" 
                                                            StandOut="true">
                                                            <Listeners>
                                                                <Click Fn="btnBuscarSucursal_Click" />
                                                            </Listeners>
                                                        </ext:Button>
                                                    </RightButtons>
                                                    <Listeners>
                                                        <Change Fn="txtfSucursalCR_Change" />
                                                    </Listeners>
                                                </ext:TextField>
                                                <ext:TextField 
                                                    ID="txtfSucursalNombre" 
                                                    runat="server" 
                                                    Width="360" 
                                                    Disabled="true"> 
                                                </ext:TextField>
                                                <ext:TextField 
                                                    ID="txtfSucursalID" 
                                                    runat="server"  
                                                    Hidden="true"> 
                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:FieldContainer 
                                            ID="fcFechaEmision"
                                            runat="server"
                                            LabelWidth="120"
                                            Height="25px"
                                            FieldLabel="Fecha de emisión"
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:DateField
                                                    ID="dfFechaEmision"
                                                    runat="server"
                                                    Width="200"
                                                    Margins="0 3 0 0" 
                                                    Disabled="false">
                                                    <PickerOptions 
                                                        ID="poFechaEmision"
                                                        runat="server"
                                                        Cls="my-date-picker">
                                                    </PickerOptions>
                                                </ext:DateField>
                                                 <ext:TextField 
                                                    ID="txtNoOrden" 
                                                    FieldLabel="No. Orden"
                                                    LabelWidth="70"
                                                    runat="server" 
                                                    Margins="0 3 0 0"
                                                    Width="180" 
                                                    ReadOnly="true">
                                                </ext:TextField>
                                                <ext:TextField 
                                                    ID="txtReferenciaOrden" 
                                                    EmptyText="REFERENCIA ORDEN"
                                                    LabelWidth="90"
                                                    runat="server" 
                                                    Width="177"> 
                                                </ext:TextField>            
                                                
                                                
                                                                                    
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:FieldContainer
                                            ID="fcObservaciones"
                                            runat="server"
                                            LabelWidth="120"
                                            FieldLabel="Asunto"
                                            AnchorHorizontal="100%" 
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:TextField 
                                                    ID="txtfObservaciones" 
                                                    runat="server" 
                                                    Width="563" 
                                                    Margins="0 3 0 0"
                                                    MaxLength="800"
                                                    EnforceMaxLength="true">
                                                     <Listeners>
                                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                                    </Listeners>
                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer>
                                    </Items>
                                </ext:FieldSet>
                                <ext:FieldContainer
                                    ID="fcDescricpion"
                                    runat="server"
                                    AnchorHorizontal="100%" 
                                    AutoScroll="true"
                                    Layout="ColumnLayout">
                                    <Items>
                                        <ext:TextArea
                                            ID="taDescripcion"
                                            runat="server"
                                            Disabled="true"
                                            LabelWidth="70"
                                            StyleSpec="margin-left: 0px;  margin-top:-5px;"
                                             Height="55"
                                            Cls="xcustomtextAreaSinBorde"
                                            AutoScroll="true"
                                            Width="888" >
                                        </ext:TextArea>
                                    </Items>
                                </ext:FieldContainer>
                            </Items>
                        </ext:Panel>
                        <%--Segundo panel para los datos del reporte--%>
                        <ext:Panel 
                            ID="pDatosReporte" 
                            runat="server" 
                            Title="Datos Reporte"
                            BodyPadding="5"
                            Hidden="true"
                            Width="900"
                            Height="206" 
                            AutoScroll="false">
                            <Items>
                                <ext:FieldSet 
                                    ID="fsDatosReporte" 
                                    runat="server" 
                                    Title="Datos Reporte" 
                                    DefaultAnchor="100%"
                                    AutoScroll="false">
                                    <Items>
                                        <ext:FieldContainer 
                                            ID="fc1"
                                            runat="server"
                                            FieldLabel="No. Reporte"
                                            LabelWidth="120"
                                            Height="25"
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:TextField 
                                                    ID="txtfNoReporte" 
                                                    runat="server" 
                                                    Width="80" 
                                                    Margins="0 3 0 0">
                                                    <Listeners>
                                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                                    </Listeners>
                                                </ext:TextField>
                                                <ext:TextField 
                                                    ID="txtfCodigoFalla" 
                                                    runat="server"
                                                    FieldLabel="Código de falla" 
                                                    LabelWidth="115"
                                                    Width="320" 
                                                    ReadOnly="true"
                                                    Margins="0 40 0 0"
                                                    Text="">
                                                    <RightButtons>
                                                        <ext:Button 
                                                            ID="btnBuscaCodigoFalla" 
                                                            runat="server" 
                                                            Icon="Find" 
                                                            StandOut="true">
                                                            <Listeners>
                                                                <Click Fn="btnBuscarCodigos_Click" />
                                                            </Listeners>
                                                        </ext:Button>
                                                    </RightButtons>
                                                </ext:TextField>
                                                <ext:Checkbox
                                                    ID="chkAtendido" 
                                                    runat="server"
                                                    Name="chkAtendido"
                                                    FieldLabel="Atendido"
                                                    Checked="false">
                                                </ext:Checkbox>
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:FieldContainer 
                                            ID="fcFechaOrigen"
                                            runat="server"
                                            LabelWidth="120"
                                            FieldLabel="Fecha de Origen"
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:DateField
                                                    ID="dfFechaOrigen"
                                                    runat="server"
                                                    Width="200"
                                                    Editable="false"
                                                    Margins="0 3 0 0" 
                                                    Vtype="daterange"
                                                    Disabled="false">
                                                    <PickerOptions 
                                                        ID="poFechaOrigen"
                                                        runat="server"
                                                        Cls="my-date-picker">
                                                    </PickerOptions>
                                                    <CustomConfig>
                                                        <ext:ConfigItem 
                                                            Name="endDateField" 
                                                            Value="dfFechaMaxima" 
                                                            Mode="Value" />
                                                    </CustomConfig>
                                                    <Listeners>
                                                        <Change Handler="sumarDiasAtencion(App.nfDiasAtencion.getValue(),this.getValue());" />
                                                    </Listeners>
                                                </ext:DateField>
                                                <ext:TimeField 
                                                    ID="tHoraOrigen" 
                                                    runat="server"  
                                                    Increment="15"
                                                     Margins="0 3 0 0" 
                                                     LabelWidth="110"
                                                    FieldLabel="Hora de Origen" 
                                                    Width="360"
                                                    Format="H:mm"
                                                    Disabled="false" />
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:FieldContainer 
                                            ID="fcAtencion"
                                            runat="server"
                                            FieldLabel="Fecha Atencion"
                                            LabelWidth="120"
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:DateField
                                                    ID="dfFechaMaxima"
                                                    runat="server"
                                                    EmptyText="Fecha Máxima Atención"
                                                    Width="200"
                                                    Editable="false"
                                                    Vtype="daterange"
                                                    Margins="0 3 0 0" 
                                                    Disabled="true">
                                                    <PickerOptions 
                                                        ID="poFechaMaxima"
                                                        runat="server"
                                                        Cls="my-date-picker">
                                                    </PickerOptions>
                                                    <CustomConfig>
                                                        <ext:ConfigItem 
                                                            Name="startDateField" 
                                                            Value="dfFechaOrigen"
                                                            Mode="Value" />
                                                    </CustomConfig>
                                                </ext:DateField>
                                                <ext:NumberField 
                                                    ID="nfDiasAtencion"
                                                    runat="server"
                                                    AllowDecimals="true"
                                                    Width="360"
                                                    Text="1"
                                                    AllowExponential="false"
                                                    DecimalPrecision="2"
                                                    DecimalSeparator="."
                                                    MaxLength="10"
                                                    Disabled="true"
                                                    LabelWidth="110"
                                                    FieldLabel="Dias Atención"
                                                    EnforceMaxLength="true"
                                                    MaxValue="999999999"
                                                    MinValue="0"
                                                    Step="1">
                                                     <Listeners>
                                                        <Change Handler="sumarDiasAtencion(this.getValue(),App.dfFechaOrigen.getValue());" />
                                                    </Listeners>
                                                </ext:NumberField>
                                            </Items>
                                        </ext:FieldContainer>                                        
                                        <ext:FieldContainer
                                            ID="fcTrabajoRequerido"
                                            runat="server"
                                            LabelWidth="120"
                                            FieldLabel="Trabajo Requerido"
                                            AnchorHorizontal="100%" 
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:TextField 
                                                    ID="txtfTrabajoRequerido" 
                                                    runat="server" 
                                                    Width="563" 
                                                    EmptyText="Descripción corta del trabajo requerido"
                                                    Margins="0 3 0 0"
                                                    MaxLength="200"
                                                    EnforceMaxLength="true">
                                                    <Listeners>
                                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                                    </Listeners>
                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:FieldContainer
                                            ID="fcReporte"
                                            runat="server"
                                            LabelWidth="120"
                                            FieldLabel="Reportó"
                                            AnchorHorizontal="100%" 
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:TextField 
                                                    ID="txtfReporta" 
                                                    runat="server" 
                                                    EmptyText="Nombre de quien reportó el problema"
                                                    Width="563" 
                                                    Margins="0 3 0 0"
                                                    MaxLength="200"
                                                    EnforceMaxLength="true">
                                                    <Listeners>
                                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                                    </Listeners>
                                                </ext:TextField>
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:FieldContainer 
                                            ID="FieldContainer1"
                                            runat="server"
                                            FieldLabel="División"
                                            LabelWidth="120"
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:ComboBox 
                                                    ID="cmbDivision"
                                                    runat="server"
                                                    Width="200"
                                                    Margins="0 3 0 0"
                                                    Editable="false"
                                                    AllowBlank="false">
                                                    <Items>
                                                        <ext:ListItem Index="0" Text="NORTE" Value="NORTE" />
                                                        <ext:ListItem Index="1" Text="NORESTE" Value="NORESTE" />
                                                        <ext:ListItem Index="2" Text="OCCIDENTE" Value="OCCIDENTE" />
                                                        <ext:ListItem Index="3" Text="CENTRO" Value="CENTRO" />
                                                        <ext:ListItem Index="4" Text="VALLE DE MÉXICO" Value="VALLE DE MÉXICO" />
                                                        <ext:ListItem Index="5" Text="SURESTE" Value="SURESTE" />
                                                    </Items>
                                                    <SelectedItems>
                                                        <ext:ListItem Index="2" />
                                                    </SelectedItems>
                                                </ext:ComboBox>
                                                <ext:ComboBox
                                                    ID="cmbCuadrilla"
                                                    runat="server"
                                                    DisplayField="Nombre"
                                                    ValueField="ID"
                                                    LabelWidth="110"
                                                    FieldLabel="Cuadrilla"
                                                    Width="360"
                                                    MatchFieldWidth="false"
                                                    Margins="0 3 0 0"
                                                    Cls="spanCustomCombo xEspacioCmbxCustom"
                                                    PageSize="10"
                                                    AllowBlank="false"
                                                    ForceSelection="true"
                                                    QueryMode="Local"
                                                    TypeAhead="true">
                                                    <ListConfig ID="lcCuadrilla" runat="server" Width="350" Cls="xEspacioCmbxCustom">
                                                        <ItemTpl ID="itCuadrilla" runat="server">
                                                            <Html>
                                                                <div class="search-item">
							                                        <h3>{ID}</h3>
                                                                    <span>{Nombre}</span>
						                                        </div>
                                                            </Html>
                                                        </ItemTpl>
                                                    </ListConfig>
                                                    <Store>
                                                        <ext:Store
                                                            ID="sCuadrillas"
                                                            runat="server">
                                                            <Model>
                                                                <ext:Model
                                                                    ID="mCuadrillas"
                                                                    runat="server">
                                                                    <Fields>
                                                                        <ext:ModelField Name="ID" />
                                                                        <ext:ModelField Name="Nombre" />
                                                                    </Fields>
                                                                </ext:Model>                            
                                                            </Model>
                                                        </ext:Store>
                                                    </Store>
                                                    <Listeners>
                                                        <Change Fn="cmbCuadrilla_Change" />
                                                    </Listeners>
                                                </ext:ComboBox>
                                            </Items>
                                        </ext:FieldContainer>
                                    </Items>
                                </ext:FieldSet>
                            </Items>
                        </ext:Panel>
                        <%--Tercer panel de para los datos del reporte--%>
                        <ext:Panel 
                            ID="pDatosReporteDos" 
                            runat="server" 
                            Title="Tiempos Reporte" 
                            BodyPadding="5"
                            Hidden="true"
                            Width="900"
                            Height="206" 
                            AutoScroll="false">
                            <Items>
                                <ext:FieldSet 
                                    ID="FieldSet1" 
                                    runat="server" 
                                    Title="Tiempos Reporte" 
                                    DefaultAnchor="100%"
                                    AutoScroll="false">
                                    <Items>
                                        <ext:FieldContainer
                                            ID="fc4"
                                            runat="server"
                                            FieldLabel="Clasificación"
                                            LabelWidth="120" 
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:ComboBox 
                                                    ID="cmbClasificacion"
                                                    runat="server"
                                                    Width="200"
                                                    Margins="0 3 0 0"
                                                    Editable="false"
                                                    AllowBlank="false">
                                                    <Items>
                                                        <ext:ListItem Index="0" Text="MOBILIARIO" Value="MOBILIARIO" />
                                                        <ext:ListItem Index="1" Text="CERRAJERIA" Value="CERRAJERIA" />
                                                        <ext:ListItem Index="2" Text="INMUEBLE" Value="INMUEBLE" /> 
                                                    </Items> 
                                                </ext:ComboBox>
                                                </Items>
                                        </ext:FieldContainer>
                                        <ext:FieldContainer 
                                            ID="FieldContainer2"
                                            runat="server"
                                            LabelWidth="120"
                                            FieldLabel="Fecha de llegada"
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:DateField
                                                    ID="dfFechaLlegada"
                                                    runat="server"
                                                    Width="200"
                                                    Editable="false"
                                                    Margins="0 3 0 0" 
                                                    Vtype="daterange"
                                                    Disabled="false">
                                                    <PickerOptions 
                                                        ID="PickerOptions1"
                                                        runat="server"
                                                        Cls="my-date-picker">
                                                    </PickerOptions>
                                                    <CustomConfig>
                                                        <ext:ConfigItem 
                                                            Name="endDateField2" 
                                                            Value="dfFFechaFinActividad" 
                                                            Mode="Value" />
                                                    </CustomConfig>
                                                </ext:DateField>
                                                <ext:TimeField 
                                                    ID="tfHoraLlegada" 
                                                    runat="server"  
                                                    Increment="15"
                                                    FieldLabel="Hora de llegada"
                                                    LabelWidth="120" 
                                                    Width="300"
                                                    Format="H:mm" />
                                            </Items>
                                        </ext:FieldContainer>
                                        <ext:FieldContainer 
                                            ID="FieldContainer3"
                                            runat="server"
                                            LabelWidth="120"
                                            FieldLabel="Fecha Fin Actividad"
                                            AnchorHorizontal="100%"
                                            Layout="HBoxLayout">
                                            <Items>
                                                <ext:DateField
                                                    ID="dfFechaFinActividad"
                                                    runat="server"
                                                    Width="200"
                                                    Vtype="daterange"
                                                    Editable="false"
                                                    Margins="0 3 0 0" 
                                                    Disabled="false">
                                                    <PickerOptions 
                                                        ID="PickerOptions4"
                                                        runat="server"
                                                        Cls="my-date-picker">
                                                    </PickerOptions>
                                                    <CustomConfig>
                                                        <ext:ConfigItem 
                                                            Name="startDateField2" 
                                                            Value="dfFechallegada"
                                                            Mode="Value" />
                                                    </CustomConfig>
                                                </ext:DateField>
                                                <ext:TimeField 
                                                    ID="tfHoraFinActividad" 
                                                    runat="server"  
                                                    Increment="15" 
                                                    FieldLabel="Hora Fin Actividad"
                                                    LabelWidth="120" 
                                                    Width="300"
                                                    Format="H:mm"> 
                                                </ext:TimeField> 
                                                <ext:FileUploadField 
                                                    ID="fufNormal"
                                                    runat="server"
                                                    Width="10" 
                                                    Icon="Attach"
                                                    ButtonText="Reporte"
                                                    Margins="0 75 0 0"
                                                    AllowBlank="false">
                                                    <Listeners>
                                                        <Change Handler="fufNormal_Change(event,this,App.txtfNoReporte.getValue());" />
                                                    </Listeners>
                                                </ext:FileUploadField>
                                                <ext:Image 
                                                    ID="imgNormal"
                                                    runat="server"
                                                    Hidden="true"
                                                    StyleSpec="margin-right: 3px;"
                                                    Height="100"
                                                    Cls="img-resize"
                                                    Width="100">
                                                    <Listeners>
                                                        <Click Fn="PopupPic"></Click>
                                                    </Listeners>
                                                </ext:Image>
                                                <ext:ImageButton 
                                                    ID="imgbtnBorrarReporte" 
                                                    runat="server"
                                                    ImageUrl="assets/img/controles/delete-normal.png" 
                                                    DisabledImageUrl="assets/img/controles/delete-disable.png"
                                                    OverImageUrl="assets/img/controles/delete-over.png" 
                                                    PressedImageUrl="assets/img/controles/delete-pressed.png"
                                                    ToolTip="Norrar" 
                                                    Height="23" 
                                                    Width="23">
                                                    <Listeners>
                                                        <Click Handler="App.sOrdenEstimacion.getAt(0).set('RutaImagen','');
                                                                App.imgNormal.setImageUrl('');
                                                                Ext.util.Cookies.set('cookieTieneImagenReporte', 'NO');">
                                                        </Click>
                                                    </Listeners>
                                                </ext:ImageButton>
                                            </Items>
                                        </ext:FieldContainer>
                                    </Items>
                                </ext:FieldSet>
                            </Items>
                        </ext:Panel>
                    </Items>
                </ext:TabPanel>
                <%--  DETALLE--%>
                <ext:Panel
                    ID="pDetalle"
                    runat="server"
                    BodyPadding="5"
                    Width="900"
                    AutoScroll="True">
                    <Items>
                        <ext:FieldSet
                            ID="fsDetalle" 
                            runat="server" 
                            Height="205" 
                            Title="Detalle"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:GridPanel
                                    ID="gpOrdenEstimacion"
                                    runat="server"
                                    Width="900"
                                    Height="180"
                                    EnableColumnHide="false"
                                    EnableColumnMove="false">
                                    <Store>
                                        <ext:Store
                                            ID="sConceptos"
                                            OnReadData="sConceptos_OnReadData"
                                            runat="server">
                                            <Model>
                                                <ext:Model 
                                                    ID="mConceptos"
                                                    runat="server" 
                                                    IDProperty="Renglon">
                                                    <Fields>
                                                        <ext:ModelField Name="Id" Type="Int" />
                                                        <ext:ModelField Name="Renglon" Type="Int" />
                                                        <ext:ModelField Name="ConceptoID" Type="String" />
                                                        <ext:ModelField Name="Cantidad" Type="Float" />
                                                        <ext:ModelField Name="Unidad" Type="String" />
                                                        <ext:ModelField Name="Precio" Type="Float" />
                                                        <ext:ModelField Name="Importe" Type="Float" />
                                                        <ext:ModelField Name="IntExt" Type="String" />
                                                        <ext:ModelField Name="Clave" Type="String" />
                                                        <ext:ModelField Name="Moneda" Type="String" />
                                                        <ext:ModelField Name="Fotos" Type="Int" />
                                                        <ext:ModelField Name="Croquis" Type="Int" />
                                                        <ext:ModelField Name="Facturas" Type="Int" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                            <Listeners>
                                                <Update Fn="sConceptos_DataUpdate" ></Update>
                                                <Load Fn="sConceptos_Load"></Load> 
                                            </Listeners>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel 
                                        ID="cmOrdenEstimacion" 
                                        runat="server">
                                        <Columns>
                                            <ext:CommandColumn
                                                ID="ccAcciones"
                                                runat="server" 
                                                Width="25">
                                                <PrepareToolbar Fn="ccAcciones_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="Delete"
                                                        CommandName="Borrar">
                                                        <ToolTip Text="Borrar" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccAcciones_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>
                                            <ext:Column
                                                ID="cIDPreciario"
                                                runat="server"
                                                Text="Clave"
                                                Width="105"
                                                DataIndex="Clave"> 
                                                <Renderer Fn="cRenderer_Clave"></Renderer>
                                            </ext:Column> 
                                            <ext:CommandColumn
                                                ID="ccConcepto"
                                                runat="server" 
                                                Width="25">
                                                <PrepareToolbar Fn="ccConcepto_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="Add"
                                                        CommandName="Agregar">
                                                        <ToolTip Text="Agregar concepto" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccConcepto_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>
                                            <ext:Column
                                                ID="cIntExt"
                                                runat="server"
                                                Text="Int/Ext"
                                                Visible="true"
                                                Width="75"
                                                DataIndex="IntExt">
                                                <Editor>
                                                    <ext:ComboBox
                                                        ID="cmbIntExt"
                                                        runat="server"
                                                        Editable="true"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="INTERIOR" Value="INTERIOR" />
                                                            <ext:ListItem Index="1" Text="EXTERIOR" Value="EXTERIOR" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                </Editor>
                                            </ext:Column>
                                            <ext:NumberColumn
                                                ID="cCantidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Cantidad"
                                                
                                                DataIndex="Cantidad"
                                                Width="80">
                                                <Renderer Fn="cCantidad_Renderer" /> 
                                            </ext:NumberColumn>
                                            <ext:CommandColumn
                                                ID="ccGenerador"
                                                runat="server" 
                                                Width="25">
                                                <PrepareToolbar Fn="ccDimensiones_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="ApplicationOsxAdd"
                                                        CommandName="Agregar">
                                                        <ToolTip Text="Generador" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccGenerador_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>
                                            <ext:Column
                                                ID="cUnidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Unidad"
                                                DataIndex="Unidad"
                                                Width="80">
                                            </ext:Column>
                                            <ext:NumberColumn 
                                                ID="cPrecio"
                                                runat="server"
                                                Align="Center"
                                                Text="Precio"
                                                DataIndex="Precio"
                                                Width="80">
                                                <Renderer Fn="cPrecio_Renderer" />
                                                <Editor>
                                                    <ext:NumberField 
                                                        ID="nfPrecio"
                                                        runat="server"
                                                        AllowDecimals="true"
                                                        AllowExponential="false"
                                                        DecimalPrecision="6"
                                                        DecimalSeparator="."
                                                        MaxLength="10"
                                                        EnforceMaxLength="true"
                                                        MaxValue="999999999"
                                                        MinValue="0"
                                                        Step="1">
                                                        <Listeners>
                                                            <Change Fn="calcularImportePrecio_Change"></Change>
                                                        </Listeners>
                                                    </ext:NumberField>
                                                </Editor>
                                            </ext:NumberColumn>
                                            <ext:Column
                                                ID="cMoneda"
                                                runat="server"
                                                Align="Center"
                                                Width="50"
                                                DataIndex="Moneda">
                                            </ext:Column>
                                            <ext:NumberColumn
                                                ID="ncImporte"
                                                runat="server"
                                                Align="Center"
                                                Text="Importe"
                                                DataIndex="Importe"
                                                Width="110">
                                                <Renderer Fn="cImporte_Renderer" />
                                            </ext:NumberColumn>
                                            <ext:CommandColumn
                                                ID="ccFotos"
                                                Text="Fotos"
                                                runat="server"
                                                Width="65">
                                                <PrepareToolbar Fn="ccFotos_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="ImageAdd"
                                                        CommandName="cnCargarFotos" >
                                                        <ToolTip Text="Cargar Fotos" />
                                                    </ext:GridCommand>
                                                    <ext:GridCommand
                                                        Icon="FolderPicture"
                                                        CommandName="cnVerFotos">
                                                        <ToolTip Text="Ver Fotos" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccFotos_Command" /> 
                                                </Listeners>
                                                <Renderer Fn="cCheckFotos_Renderer" />
                                            </ext:CommandColumn>
                                            <ext:CommandColumn
                                                ID="ccCroquis"
                                                Text="Croquis"
                                                runat="server"
                                                Width="65">
                                                <PrepareToolbar Fn="ccCroquis_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="MapAdd"
                                                        CommandName="cnCargarCroquis" >
                                                        <ToolTip Text="Cargar Croquis" />
                                                    </ext:GridCommand>
                                                    <ext:GridCommand
                                                        Icon="FolderPicture"
                                                        CommandName="cnVerCroquis">
                                                        <ToolTip Text="Ver Croquis" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccCroquis_Command" />
                                                </Listeners>
                                                <Renderer Fn="cCheckCroquis_Renderer" />
                                            </ext:CommandColumn>
                                            <ext:CommandColumn
                                                ID="ccFacturas"
                                                Text="Facturas"
                                                runat="server"
                                                Width="65">
                                                <PrepareToolbar Fn="ccFacturas_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="PageWhiteAcrobat"
                                                        CommandName="cnCargarFactura" >
                                                        <ToolTip Text="Cargar Factura" />
                                                    </ext:GridCommand>
                                                    <ext:GridCommand
                                                        Icon="FolderPicture"
                                                        CommandName="cnVerFactura">
                                                        <ToolTip Text="Ver Factura" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccFactura_Command" />
                                                </Listeners> 
                                                <Renderer Fn="cCheckFacturas_Renderer" />
                                            </ext:CommandColumn> 
                                        </Columns>
                                    </ColumnModel>
                                    <Listeners>
                                        <ItemClick Fn="gpOrdenEstimacion_ItemClick" />
                                    </Listeners>
                                    <SelectionModel>
                                        <ext:CellSelectionModel
                                            ID="csmOrdenEstimacion" 
                                            runat="server">
                                        </ext:CellSelectionModel>
                                    </SelectionModel>
                                    <Plugins>
                                        <ext:CellEditing 
                                            ID="ceOrdenEstimacion" 
                                            runat="server"
                                            ClicksToEdit="1">
                                            <Listeners>
                                                <Edit Fn="cePreciarioConcepto_Edit" />
                                                <BeforeEdit Fn="validaConcluidos" ></BeforeEdit>
                                            </Listeners>
                                        </ext:CellEditing>
                                    </Plugins>
                                    <View>
                                        <ext:GridView
                                            ID="gvOrdenEstimacion"
                                            runat="server"
                                            StripeRows="true">
                                        </ext:GridView>
                                    </View>
                                    <Listeners>
                                        <Select Fn="obetenerRenglon_Select"></Select>
                                    </Listeners>
                                </ext:GridPanel>
                                <%--Fin Detalle--%>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
            </Items>
            <BottomBar>
                <ext:Toolbar ID="tGenerador" runat="server">
                    <Items>
                        <ext:StatusBar 
                            ID="sbOrdenEstimacion" 
                            runat="server" 
                            Cls="x-colorToolbar" 
                            Text="SIN AFECTAR" />
                        <ext:DisplayField
                            ID="dfTotalSinRender"
                            runat="server"

                            Hidden="true">
                        </ext:DisplayField>
                        <ext:DisplayField
                            ID="dfTotal"
                            runat="server" 
                            FieldLabel="Total"
                            Cls="total-field"
                            Margins="0 0px 0 470px"
                            Width="290"
                            Text="">

                        </ext:DisplayField>
                        <%-- Margins="0 0px 0 470px"--%>
                    </Items>
                </ext:Toolbar>
            </BottomBar>
        </ext:FormPanel>

        <ext:Window 
            ID="wEmergente"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="False"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="lEmergente" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
        </ext:Window>
    </form>
</body>
</html>