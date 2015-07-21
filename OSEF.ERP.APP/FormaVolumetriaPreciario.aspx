<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaVolumetriaPreciario.aspx.cs" Inherits="OSEF.ERP.APP.FormaVolumetriaPreciario" %>

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
    <script type='text/javascript' src="js/volumetrias.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaVolumetriaPreciario" runat="server" HideInDesign="true" />
    
        <ext:Store
            ID="sVolumetria"
            runat="server">
            <Model>
                <ext:Model
                    ID="mVolumetria"
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
                        <ext:ModelField Name="Preciario" Type="String" />
                        <ext:ModelField Name="RPreciario" Type="Object" />
                        <ext:ModelField Name="Origen" Type="String" />
                        <ext:ModelField Name="OrigenID" Type="String" />
                        <ext:ModelField Name="Cliente" Type="String"/>
                        <ext:ModelField Name="RCliente" Type="Object"/>
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sVolumetria_Load" />
                <Add Fn="sVolumetria_Add" />
            </Listeners>
        </ext:Store>

        <ext:FormPanel
            ID="fpVolumetriasPreciario"
            runat="server" 
            MonitorResize="true"
            Height="575"
            Width="910"
            BodyStyle="background-color:#fff;">
            <TopBar>
                <ext:Toolbar 
                    ID="tbVolumetriasPreciario" 
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
                                        <ext:Parameter Name="VolumetriaForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <%--<ext:Parameter Name="Volumetria" Value="Ext.encode(#{sVolumetria}.getRecordsValues())" Mode="Raw" />--%>
                                        <ext:Parameter Name="IDVolumetria" Value="strID" Mode="Raw" />
                                        <ext:Parameter Name="Sucursal" Value="App.txtfIDSucursal.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="VolumetriaD" Value="Ext.encode(#{sConceptos}.getRecordsValues())" Mode="Raw" />
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
                                <Click OnEvent="imgbtnAfectar_Click"  Success="imgbtnAfectar_Click_Success">
                                    <EventMask ShowMask="true" Msg="Afectando movimiento..." />
                                    <ExtraParams>
                                        <ext:Parameter Name="VolumetriaForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <%--<ext:Parameter Name="Volumetria" Value="Ext.encode(#{sVolumetria}.getRecordsValues())" Mode="Raw" />--%>
                                        <ext:Parameter Name="IDVolumetria" Value="strID" Mode="Raw" />
                                        <ext:Parameter Name="sucursal" Value="App.txtfIDSucursal.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="VolumetriaD" Value="Ext.encode(#{sConceptos}.getRecordsValues())" Mode="Raw" />
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
                <ext:Panel 
                    ID="pDatosGenerales" 
                    runat="server" 
                    BodyPadding="5"
                    Width="900"
                    Height="266" 
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
                                    Height="25px"
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
                                                <ext:ListItem Index="0" Text="Captura" Value="Captura" />
                                                <ext:ListItem Index="1" Text="Fin" Value="Fin" />
                                            </Items>
                                            <Listeners>
                                                <Select Fn="cmbMov_Select" />
                                            </Listeners>
                                        </ext:ComboBox>
                                        <ext:TextField
                                            ID="txtfMovID"
                                            runat="server"
                                            Width="110"
                                            Margins="0 3 0 0"
                                            Disabled="true" />
                                            
                                       
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
                                                ReadOnly="true"/> 
                                        </Items>
                                        </ext:FieldContainer>
 

                                <ext:FieldContainer
                                    ID="fcPreciario"
                                    runat="server"
                                    FieldLabel="Preciario"
                                    AnchorHorizontal="100%"
                                    LabelWidth="120"
                                     Height="25"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:TextField 
                                        ID="cmbPreciario" 
                                        runat="server" 
                                        Width="200" 
                                        StyleSpec="margin-right: 3px;"
                                        AllowBlank="false" 
                                        ReadOnly="true"> 
                                                    <RightButtons>
                                                        <ext:Button 
                                                        ID="btnBuscarPreciario" 
                                                        runat="server" 
                                                        Icon="Find" 
                                                        StandOut="true">
                                                            <Listeners>
                                                                <Click Fn="imgbtnBuscar_Click" />
                                                            </Listeners>
                                                        </ext:Button>
                                                    </RightButtons>  
                                                    <Listeners>  
                                                     <Change Fn="cmbPreciario_Change" />
                                                     </Listeners>  
                                                     <DirectEvents>
                                                        <Change OnEvent="cmbPreciarios_Change"  >
                                                            <ExtraParams>
                                                            <ext:Parameter Name="valor" Value="App.cmbPreciario.getValue()" Mode="Raw" />
                                                            </ExtraParams>
                                                        </Change>
                                                     </DirectEvents>
                                                    </ext:TextField> 
                                        <ext:TextField
                                            ID="txtfDescripcionPreciario"
                                            runat="server"
                                            Width="360"
                                            Margins="0 3 0 0"
                                            Disabled="true">
                                        </ext:TextField>
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    ID="fcSucursal"
                                    runat="server"
                                    FieldLabel="Sucursal"
                                    AnchorHorizontal="100%"
                                    LabelWidth="120"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:TextField
                                            ID="txtfIDSucursal"
                                            runat="server"
                                            Width="200"
                                            Margins="0 3 0 0"
                                            Disabled="true">                                        
                                        </ext:TextField>
                                        <ext:TextField
                                            ID="txtfSucursalNombre"
                                            runat="server"
                                            Width="360"
                                            Margins="0 3 0 0"
                                            Disabled="true">                                        
                                        </ext:TextField>
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer 
                                    ID="fcFechaEmision"
                                    runat="server"
                                    LabelWidth="120"
                                    FieldLabel="Fecha de Emisión"
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
                                                ID="pOFechaEmision"
                                                runat="server"
                                                Cls="my-date-picker">
                                            </PickerOptions>
                                        </ext:DateField>
                                       

                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    ID="fcObservaciones"
                                    runat="server"
                                    LabelWidth="120"
                                    FieldLabel="Observaciones"
                                    AnchorHorizontal="100%" 
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:TextField 
                                            ID="txtfObservaciones" 
                                            runat="server" 
                                            Width="563" 
                                            Margins="0 3 0 0"
                                            MaxLength="200"
                                            EnforceMaxLength="true">
                                        </ext:TextField>
                                    </Items>
                                </ext:FieldContainer>
                            </Items>
                        </ext:FieldSet>
                        <ext:FieldContainer
                            ID="fcDescricpion"
                            runat="server"
                            AnchorHorizontal="100%" 
                            Layout="ColumnLayout">
                            <Items>
                                <ext:TextArea
                                    ID="taDescripcion"
                                    runat="server"
                                    Disabled="true"
                                    LabelWidth="70"
                                    StyleSpec="margin-left: 0px;  margin-top:-5px;"
                                    Text=""
                                    Cls="xcustomtextAreaSinBorde"
                                    Height="66"
                                    Width="808" >
                                </ext:TextArea>
                            </Items>
                        </ext:FieldContainer>
                    </Items>
                </ext:Panel>
                <%--  DETALLE--%>
                <ext:Panel
                    ID="pDetalleVolumetria"
                    runat="server"
                    BodyPadding="5"
                    Width="900"
                    AutoScroll="True">
                    <Items>
                        <ext:FieldSet
                            ID="fsDetalleVolumetria" 
                            runat="server" 
                            Height="235" 
                            Title="Volumetría Detalle"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:GridPanel
                                    ID="gpVolumetriaDetalle"
                                    runat="server"
                                    Width="870"
                                    Height="210"
                                    EnableColumnHide="false"
                                    EnableColumnMove="false">
                                    <Store>
                                        <ext:Store
                                            ID="sConceptos"
                                            runat="server">
                                            <Model>
                                                <ext:Model 
                                                    ID="mConceptos"
                                                    runat="server" 
                                                    IDProperty="Renglon">
                                                    <Fields>
                                                        <ext:ModelField Name="Volumetria" Type="Int" />
                                                        <ext:ModelField Name="Renglon" Type="Int" />
                                                        <ext:ModelField Name="ConceptoID" Type="String" />
                                                        <ext:ModelField Name="Cantidad" Type="Float" />
                                                        <ext:ModelField Name="Utilizada" Type="Float" />
                                                        <ext:ModelField Name="Fotos" Type="String" />
                                                        <ext:ModelField Name="Clave" Type="String" />
                                                        <ext:ModelField Name="Fotos" Type="Int" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                            <Listeners>
                                                <Update Fn="sConceptos_DataUpdate" ></Update>
                                                
                                            </Listeners>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel 
                                        ID="cmVolumetriaDetalle" 
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
                                                Text="CLAVE"
                                                Width="105"
                                                DataIndex="Clave"> 
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
                                            <ext:NumberColumn
                                                ID="cCantidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Cantidad"
                                                DataIndex="Cantidad"
                                                Width="150">
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
                                                      <ext:CommandSpacer Width="60"></ext:CommandSpacer>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccGenerador_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>

                                            <ext:NumberColumn 
                                                ID="cUtilizada"
                                                runat="server"
                                                Align="Center"
                                                Text="Utlizada"
                                                DataIndex="Utilizada"
                                                Width="150">
                                                  <Renderer Fn="cUtilizada_Renderer" />
                                                <Editor>
                                                    <ext:NumberField 
                                                        ID="nfUtilizada"
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
                                                    </ext:NumberField>
                                                </Editor>
                                            </ext:NumberColumn>

                                            

                                            <ext:CommandColumn
                                                ID="ccFotos"
                                                Text="Fotos"
                                                Align="Center"
                                                runat="server"
                                                Width="105">
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
                                        </Columns>
                                    </ColumnModel>
                                    <Listeners>
                                        <ItemClick Fn="gpPreciarioConceptos_ItemClick" />
                               
                                        <Select Fn="obetenerRenglon_Select"></Select>
                          
                                    </Listeners>
                                    <SelectionModel>
                                        <ext:CellSelectionModel
                                            ID="csmVolumetriaDetalle" 
                                            runat="server">
                                        </ext:CellSelectionModel>
                                    </SelectionModel>
                                    <Plugins>
                                        <ext:CellEditing 
                                            ID="ceVolumetriaDetalle" 
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
                                            ID="gvVolumetriaDetalle"
                                            runat="server"
                                            StripeRows="true">
                                        </ext:GridView>
                                    </View>
                                </ext:GridPanel>
                                <%--Fin Detalle--%>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
            </Items>
            <BottomBar>
                <ext:StatusBar 
                ID="sbFormaVolumetriaDetalle" 
                runat="server" 
                Cls="x-colorToolbar" 
                Text="SIN AFECTAR" />
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