<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaPreciarioGeneral.aspx.cs" Inherits="OSEF.ERP.APP.FormaPreciarioGeneral" %>

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
    <script type='text/javascript' src="js/formaPreciarioGeneral.js"></script>
    <style type="text/css">
        .dirty-row .x-grid-cell, .dirty-row .x-grid-rowwrap-div {
	        background-color: #fbf1c9 !important;
        }
        
        .new-row .x-grid-cell, .new-row .x-grid-rowwrap-div {
	        background: #c8ffc8 !important;
        } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaPreciarioGeneral" runat="server" HideInDesign="true" />
       
        <ext:Store
            ID="sPreciarioGeneral"
            runat="server">
            <Model>
                <ext:Model
                    ID="mPreciarioGeneral"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                        <ext:ModelField Name="TipoObra" Type="Boolean" />
                        <ext:ModelField Name="TipoMantenimiento" Type="Boolean" />
                        <ext:ModelField Name="FechaEmision" Type="Date" />
                        <ext:ModelField Name="Archivo" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="Usuario" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="Cliente" Type="String"/>
                    </Fields>
                </ext:Model>
            </Model>
            <DirectEvents>
                <Load OnEvent="sPreciarioGeneral_Load" Success="sPreciarioGeneral_Load_Success">
                     <EventMask ShowMask="true" Msg="Cargando información..." />
                </Load>
            </DirectEvents>
            <Listeners>
                <Add Fn="sPreciario_Add" />
            </Listeners>
        </ext:Store>

        <ext:FormPanel 
            ID="fpPreciario"
            runat="server"
            MonitorResize="true"
            Height="560"
            Width="910"
            BodyStyle="background-color:#fff;">
            <TopBar>
                <ext:Toolbar 
                    ID="tbFormaAvance" 
                    runat="server" 
                    Height="40">
                    <Items>
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
                                <Click OnEvent="imgbtnGuardar_Click" Success="App.imgbtnGuardar.setDisabled(false);">
                                    <EventMask ShowMask="true" Msg="Registrando información..." />
                                    <ExtraParams>
                                        <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <ext:Parameter Name="estatus" Value="App.cmbEstatus.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="archivo" Value="App.txfArchivoActual.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="DetallePreciario" Value="Ext.encode(#{sCarga}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="tipoObra" Value="App.rObra.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="tipoMnto" Value="App.rMnto.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="registrosnuevos" Value="getNewEncodedRecords()" Mode="Raw" />
                                        <ext:Parameter Name="registrosactualizados" Value="getUpdatedRecords()" Mode="Raw" />
                                        <ext:Parameter Name="registroseliminados" Value="getRemovedRecords()" Mode="Raw" /> 
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
                            ToolTip="Cancelar Movimiento"
                            Height="30"
                            Width="30">
                            <Listeners>
                                <Click Handler="window.parent.App.wEmergente.hide();" />
                            </Listeners>
                        </ext:ImageButton>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <Items>
                <ext:Panel 
                    ID="pDatosGenerales" 
                    runat="server" 
                    BodyPadding="10"
                    Width="900"
                    Height="184" 
                    AutoScroll="false">
                    <Items>
                        <ext:FieldContainer 
                            ID="fcID"
                            runat="server"
                            FieldLabel="ID"
                            LabelWidth="120"
                            AnchorHorizontal="100%"
                            Layout="ColumnLayout">
                            <Items>
                                 <ext:TextField 
                                    ID="txtfID" 
                                    runat="server" 
                                    Width="200" 
                                    StyleSpec="margin-right: 6px;"
                                    Disabled="true">
                                    <Listeners>
                                        <Blur Handler="App.txtfID.setValue(App.txtfID.getValue().toUpperCase());" />
                                    </Listeners>
                                </ext:TextField>
                                <ext:TextField
                                    ID="txtfDescripcion"
                                    runat="server"
                                    EmptyText="Nombre Preciario"
                                    Width="360"
                                    AllowBlank="false"
                                    AutoFocus="true">
                                    <Listeners>
                                        <Change Fn="txtfDescripcion_Change" />
                                        <Blur Handler="App.txtfDescripcion.setValue(App.txtfDescripcion.getValue().toUpperCase());" />
                                    </Listeners>
                                </ext:TextField>
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer 
                            ID="fcTipoPreciario" 
                            runat="server"
                            LabelWidth="115"  
                            FieldLabel="Tipo de Preciario" 
                            AnchorHorizontal="100%" 
                            Layout="ColumnLayout">
                            <Items>
                                <ext:RadioGroup
                                    ID="rgTipoPreciario"
                                    runat="server"
                                    Width="210">
                                    <Items>
                                        <ext:Radio ID="rObra" runat="server" BoxLabel="Obra">
                                            <Listeners>
                                                <Change Fn="rObra_Change"></Change>
                                            </Listeners>
                                        </ext:Radio>
                                        <ext:Radio ID="rMnto" runat="server" BoxLabel="Mantenimiento">
                                            <Listeners>
                                                <Change Fn="rMnto_Change"></Change>
                                            </Listeners>
                                        </ext:Radio>
                                    </Items>
                                </ext:RadioGroup>
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer 
                            ID="fcFechaEmision"
                            runat="server"
                            LabelWidth="120"
                            FieldLabel="Fecha de Emisión"
                            AnchorHorizontal="100%"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:DateField
                                    ID="dfFechaEmision"
                                    runat="server"
                                    Width="200"
                                    StyleSpec="margin-right: 6px;"
                                    Disabled="true">
                                    <PickerOptions 
                                        ID="pOFechaEmision"
                                        runat="server"
                                        Cls="my-date-picker">
                                    </PickerOptions>
                                </ext:DateField>
                                <ext:ComboBox 
                                    ID="cmbEstatus"
                                    runat="server"
                                    Width="200"
                                    Disabled="false">
                                    <SelectedItems >
                                        <ext:ListItem Index="0">
                                        </ext:ListItem>
                                    </SelectedItems>
                                    <Items>
                                        <ext:ListItem Index="0" Text="ACTIVO" Value="ACTIVO" />
                                        <ext:ListItem Index="1" Text="INACTIVO" Value="INACTIVO" />
                                        <ext:ListItem Index="2" Text="BORRADOR" Value="BORRADOR" />
                                    </Items>
                                </ext:ComboBox>

                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer
                            ID="fcSeleccionar"
                            runat="server"
                            FieldLabel="Seleccionar Archivo"
                            AnchorHorizontal="100%"
                            LabelWidth="120"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:FileUploadField 
                                    ID="fufArchivoExcel" 
                                    runat="server" 
                                    Icon="Attach"
                                    EmptyText="No haz seleccionado un archivo"
                                    AllowBlank="false"
                                    Width="304"
                                    StyleSpec="margin-right: 6px;" 
                                    Text="">
                                    <Listeners>
                                        <Change Fn="CheckExtension" />
                                    </Listeners>
                                </ext:FileUploadField>
                                <ext:NumberField
                                    ID="nfHoja"
                                    runat="server"
                                    Width="207"
                                    MaxLength="1"
                                    EnforceMaxLength="true"
                                    MinValue="0"
                                    Text="0"
                                    StyleSpec="margin-right: 6px;"
                                    FieldLabel="Excel Hoja N°"
                                    MaxValue="8"
                                    AllowDecimals="false"
                                    Step="1"
                                    LabelWidth="120"
                                    AllowBlank="false">
                                </ext:NumberField>
                                <ext:ImageButton 
                                    ID="btnCargar"
                                    runat="server"
                                    StyleSpec="margin-right: 6px;"
                                    ImageUrl="assets/img/controles/Guardar.png"
                                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                                    OverImageUrl="assets/img/controles/GuardarOver.png"
                                    PressedImageUrl="assets/img/controles/GuardarPressed.png"
                                    ToolTip="Cargar Archivo"
                                    Height="23"
                                    Width="23">
                                    <DirectEvents>
                                        <Click OnEvent="btnImportar_Click" Success="btnImportar_Click_Success">
                                            <EventMask ShowMask="true" Msg="Importando datos..." />
                                        </Click>
                                    </DirectEvents>
                                </ext:ImageButton>
                                <ext:ImageButton 
                                    ID="imgbtnBorrarCarga"
                                    runat="server"
                                    StyleSpec="margin-right: 6px;"
                                    ImageUrl="assets/img/controles/CleanNormal.png"
                                    DisabledImageUrl="assets/img/controles/CleanDisabled.png"
                                    OverImageUrl="assets/img/controles/CleanHover.png"
                                    PressedImageUrl="assets/img/controles/CleanPressed.png"
                                    ToolTip="Limpiar"
                                    Height="23"
                                    Width="23">
                                    <Listeners>
                                        <Click Fn="BorrarDetallePreciario"></Click>
                                    </Listeners>
                                </ext:ImageButton>
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer
                            ID="fcSeleccionado"
                            runat="server"
                            FieldLabel="Archivo Actual"
                            AnchorHorizontal="100%"
                            LabelWidth="120"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:TextField
                                    ID="txfArchivoActual"
                                    runat="server"
                                    Width="406"
                                    StyleSpec="margin-right: 40px;"
                                    Disabled="true">
                                </ext:TextField>

                                 <ext:TextField 
                                    ID="txtfBuscar"
                                    runat="server"
                                    Height="24"
                                    StyleSpec="margin-top: 0px;"
                                    EmptyText="Buscar Clave/Concepto"
                                    Width="307">
                                    <Listeners>
                                        <Change Fn="txtBuscar_Change" />
                                    </Listeners>
                                    <RightButtons>
                                        <ext:ImageButton
                                            ID="imgbtnBuscar"
                                            runat="server"
                                            ImageUrl="assets/img/controles/search.png"
                                            OverImageUrl=""
                                            PressedImageUrl=""
                                            Height="22px"
                                            Width="22px"> 
                                            <Listeners>
                                            <Click Fn="imgbtnBuscar_Click"></Click>
                                            </Listeners>
                                        </ext:ImageButton>
                                    </RightButtons>
                                </ext:TextField>

                            </Items>
                        </ext:FieldContainer> 
                         
                         <ext:FieldContainer
                                        ID="fClientes"
                                        runat="server"
                                        LabelWidth="120"
                                        Width="500" 
                                        Height="25px"
                                        FieldLabel="Cliente"
                                        Layout="HBoxLayout">
                                        <Items>
                                        
                                <ext:TextField 
                                                ID="IdCliente" 
                                                runat="server" 
                                                Width="150" 
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
                                                <Listeners>
                                                    <Change Handler="App.IdCliente.getValue().trim().length > 0 && App.sCarga.getCount() > 1 ? App.imgbtnGuardar.setDisabled(false):App.imgbtnGuardar.setDisabled(true);"/> 
                                                </Listeners>
                                             </ext:TextField> 
                                             <ext:TextField
                                             ID="txtCliente"
                                             runat ="server"
                                             Width="150"
                                             StyleSpec="margin-right: 3px;  height:24px;"
                                                AllowBlank="false" 
                                                ReadOnly="true"/> 
                                        </Items>
                                        </ext:FieldContainer>

                    </Items>
                </ext:Panel>
                <%--  DETALLE PRECIARIO--%>
                <ext:Panel
                    ID="pPreciario"
                    runat="server"
                    BodyPadding="5"
                    Width="900"
                    AutoScroll="True">
                    <Items>
                        <ext:FieldSet
                            ID="fsPreciario" 
                            runat="server" 
                            Height="300" 
                            Title="Preciario"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:GridPanel
                                    ID="gpPreciario"
                                    runat="server"
                                    Width="850"
                                    Height="270">
                                    <Store>
                                        <ext:Store
                                            ID="sCarga"
                                            OnReadData="OnReadData_sCarga"
                                            runat="server">
                                            <Model>
                                                <ext:Model ID="mCarga" runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="ID" Type="String" />
                                                        <ext:ModelField Name="Clave" Type="String" />
                                                        <ext:ModelField Name="Preciario" Type="String" />
                                                        <ext:ModelField Name="Descripcion" Type="String" />
                                                        <ext:ModelField Name="Unidad" Type="String" />
                                                        <ext:ModelField Name="Cantidad" Type="Float" />
                                                        <ext:ModelField Name="Costo" Type="Float" />
                                                        <ext:ModelField Name="Categoria" Type="String" />
                                                        <ext:ModelField Name="SubCategoria" Type="String" />
                                                        <ext:ModelField Name="SubSubCategoria" Type="String" />
                                                        <ext:ModelField Name="FechaAlta" Type="Date" />
                                                        <ext:ModelField Name="Estatus" Type="String" />
                                                        <ext:ModelField Name="Tipo" Type="String" />
                                                        <ext:ModelField Name="Moneda" Type="String" />
                                                        <ext:ModelField Name="RCategoria" Type="Object" />
                                                        <ext:ModelField Name="RSubCategoria" Type="Object" />
                                                        <ext:ModelField Name="RSubSubCategoria" Type="Object" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel 
                                        ID="cmPreciario" 
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
                                                Text="ID"
                                                Width="80"
                                                DataIndex="Clave">
                                                <Editor>
                                                    <ext:TextField 
                                                        ID="txtCLAVE"
                                                        runat="server" >
                                                        <Listeners>
                                                            <Change Handler="this.setValue(this.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column
                                                ID="cConcepto"
                                                runat="server"
                                                Text="Concepto"
                                                Width="260"
                                                DataIndex="Descripcion">
                                                <Editor>
                                                    <ext:TextField 
                                                        ID="txtDescripcionConcepto"
                                                        runat="server" >
                                                        <Listeners>
                                                            <Change Handler="this.setValue(this.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column
                                                ID="cUnidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Unidad"
                                                DataIndex="Unidad"
                                                Width="105">
                                                <Editor>
                                                    <ext:ComboBox
                                                        ID="cmbUnidad"
                                                        runat="server"
                                                        Editable="true"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <Items>
                                                            <ext:ListItem Index="1" Text="BULTOS" Value="BULTOS" />
                                                            <ext:ListItem Index="2" Text="JGO" Value="JGO" />
                                                            <ext:ListItem Index="3" Text="KG" Value="KG" />
                                                            <ext:ListItem Index="4" Text="LOTE" Value="LOTE" />
                                                            <ext:ListItem Index="5" Text="M" Value="M" />
                                                            <ext:ListItem Index="6" Text="M2" Value="M2" />
                                                            <ext:ListItem Index="7" Text="M3" Value="M3" />
                                                            <ext:ListItem Index="8" Text="MOD " Value="MOD" />
                                                            <ext:ListItem Index="9" Text="MODULO" Value="MODULO" />
                                                            <ext:ListItem Index="10" Text="PRUEBA" Value="PRUEBA" />
                                                            <ext:ListItem Index="11" Text="PZA" Value="PZA" />
                                                            <ext:ListItem Index="12" Text="RED" Value="RED" />
                                                            <ext:ListItem Index="13" Text="SAL" Value="SAL" />
                                                            <ext:ListItem Index="14" Text="SERVICIO" Value="SERVICIO" />
                                                            <ext:ListItem Index="15" Text="SISTEMA" Value="SISTEMA" />
                                                            <ext:ListItem Index="16" Text="SUCURSAL" Value="SUCURSAL" />
                                                            <ext:ListItem Index="17" Text="% EQUIPO" Value="% EQUIPO" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column 
                                                ID="cMoneda"
                                                runat="server"
                                                Align="Center"
                                                Text="Moneda"
                                                DataIndex="Moneda"
                                                Width="110">
                                                
                                                <Editor>
                                                   <ext:ComboBox
                                                        ID="cmbMoneda"
                                                        runat="server"
                                                        Editable="true"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="MXN" Value="MXN" />
                                                            <ext:ListItem Index="1" Text="USD" Value="USD" />
                                                            <ext:ListItem Index="2" Text="EU" Value="EU" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column 
                                                ID="Column1"
                                                runat="server"
                                                Align="Center"
                                                Text="Precio"
                                                DataIndex="Costo"
                                                Width="110">
                                                <Renderer Fn="rendererCosto"></Renderer>
                                                <Editor>
                                                    <ext:NumberField 
                                                        ID="NumberField1"
                                                        runat="server"
                                                        AllowDecimals="true"
                                                        AllowExponential="false"
                                                        DecimalPrecision="2"
                                                        DecimalSeparator="."
                                                        MaxLength="10"
                                                        EnforceMaxLength="true"
                                                        MaxValue="999999999"
                                                        MinValue="0"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column 
                                                ID="cCategoria"
                                                runat="server"
                                                Align="Center"
                                                Text="Categoría"
                                                DataIndex="Categoria"
                                                Width="190">
                                                <Renderer Fn="cCategoria_Renderer" />
                                                <Editor>
                                                    <ext:ComboBox
                                                        ID="cmbCategoria"
                                                        runat="server"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        EnforceMaxLength="true"
                                                        StyleSpec="margin-right: 6px;"
                                                        Editable="true"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <Store>
                                                            <ext:Store ID="sCategoria" runat="server">
                                                                <Model>
                                                                    <ext:Model ID="mCategoria" runat="server">
                                                                        <Fields>
                                                                            <ext:ModelField Name="ID" Type="String" />
                                                                            <ext:ModelField Name="Descripcion" Type="String" />
                                                                        </Fields>
                                                                    </ext:Model>
                                                                </Model>
                                                            </ext:Store>
                                                        </Store>
                                                    </ext:ComboBox>
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column 
                                                ID="cSubCategoria"
                                                runat="server"
                                                Align="Center"
                                                Text="SubCategoría"
                                                DataIndex="SubCategoria"
                                                Width="190">
                                                <Renderer Fn="cSubCategoria_Renderer" />
                                                <Editor>
                                                    <ext:ComboBox
                                                        ID="cmbSubCategoria"
                                                        runat="server"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        EnforceMaxLength="true"
                                                        StyleSpec="margin-right: 6px;"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <Store>
                                                            <ext:Store
                                                                ID="sSubCategoria"
                                                                runat="server">
                                                                <Model>
                                                                    <ext:Model ID="mSubCategoria" runat="server" IDProperty="ID">
                                                                        <Fields>
                                                                            <ext:ModelField Name="ID" Type="String" />
                                                                            <ext:ModelField Name="Descripcion" Type="String" />
                                                                        </Fields>
                                                                    </ext:Model>
                                                                </Model>
                                                            </ext:Store>
                                                        </Store>
                                                    </ext:ComboBox>
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column 
                                                ID="cSubSubCategoria"
                                                runat="server"
                                                Align="Center"
                                                Text="SubSubCategoria"
                                                DataIndex="SubSubCategoria"
                                                Width="190">
                                                <Renderer Fn="cSubSubCategoria_Renderer" />
                                                <Editor>
                                                    <ext:ComboBox
                                                        ID="cmbSubSubCategoria"
                                                        runat="server"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        EnforceMaxLength="true"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <Store>
                                                            <ext:Store
                                                                ID="sSubSubCategorias"
                                                                runat="server">
                                                                <Model>
                                                                    <ext:Model ID="mSubSubcategorias" runat="server" IDProperty="ID">
                                                                        <Fields>
                                                                            <ext:ModelField Name="ID" Type="String" />
                                                                            <ext:ModelField Name="Descripcion" Type="String" />
                                                                        </Fields>
                                                                    </ext:Model>
                                                                </Model>
                                                            </ext:Store>
                                                        </Store>
                                                    </ext:ComboBox>
                                                </Editor>
                                            </ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    <SelectionModel>
                                         <ext:CellSelectionModel
                                            ID="csmPreciario" 
                                            runat="server">
                                        </ext:CellSelectionModel>
                                    </SelectionModel>
                                    <Plugins>
                                        <ext:CellEditing 
                                            ID="ceFormaPreciarioGeneral" 
                                            runat="server"
                                            ClicksToEdit="1">
                                            <Listeners>
                                                <BeforeEdit Fn="ceFormaPreciarioGeneral_BeforeEdit" />
                                                <Edit Fn="ceFormaPreciarioGeneral_Edit" />
                                                <ValidateEdit Fn="ceFormaPreciarioGeneral_ValidateEdit" />
                                            </Listeners>
                                        </ext:CellEditing>
                                    </Plugins>
                                    <View>
                                        <ext:GridView
                                            ID="gvPreciario"
                                            runat="server"
                                            StripeRows="true">
                                            <GetRowClass Fn="getRowClass" /> 
                                        </ext:GridView>
                                    </View>

                                     <BottomBar>
                                     <ext:PagingToolbar ID="PagingToolbar1" runat="server">
                                        <Items>
                                            <ext:Label ID="Label1" runat="server" Text="Tamaño página:" />
                                            <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
                                            <ext:ComboBox ID="ComboBox1" runat="server" Width="80">
                                                <Items>
                                                    <ext:ListItem Text="1" />
                                                    <ext:ListItem Text="2" />
                                                    <ext:ListItem Text="10" />
                                                    <ext:ListItem Text="20" />
                                                </Items>
                                                <SelectedItems>
                                                    <ext:ListItem Value="10" />
                                                </SelectedItems>
                                                <Listeners>
                                                    <Select Handler="#{gpPreciario}.store.pageSize = parseInt(this.getValue(), 10); #{gpPreciario}.store.reload();" />
                                                </Listeners>
                                            </ext:ComboBox>
                                        </Items>
                                        <Plugins>
                                            <ext:ProgressBarPager ID="ProgressBarPager1" runat="server" />
                                        </Plugins>
                                    </ext:PagingToolbar>
                                </BottomBar>
                                </ext:GridPanel>
                                <%--Fin Detalle PRECIARIO--%>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
            </Items>
            <BottomBar>
                <ext:StatusBar 
                    ID="sbFormaPreciario" 
                    runat="server" 
                    Cls="x-colorToolbar" 
                    Text="BORRADOR">
                </ext:StatusBar>
            </BottomBar>
        </ext:FormPanel>
    </form>
</body>
</html>