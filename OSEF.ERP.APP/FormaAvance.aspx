<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaAvance.aspx.cs" Inherits="OSEF.ERP.APP.FormaAvance" %>

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
    <script type="text/javascript" src="js/avance.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaAvances" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sRevision"
            runat="server">
            <Model>
                <ext:Model
                    ID="mRevision"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="Int" />
                        <ext:ModelField Name="Mov" Type="String" />
                        <ext:ModelField Name="MovID" Type="String" />
                        <ext:ModelField Name="Origen" Type="String" />
                        <ext:ModelField Name="OrigenID" Type="String" />
                        <ext:ModelField Name="Semana" Type="Int" />
                        <ext:ModelField Name="Sucursal" Type="String" />
                        <ext:ModelField Name="FechaEmision" Type="Date" />
                        <ext:ModelField Name="FechaRevision" Type="Date" />
                        <ext:ModelField Name="Observaciones" Type="String" />
                        <ext:ModelField Name="Comentarios" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="UsuarioAlta" Type="String" />
                        <ext:ModelField Name="RSucursal" Type="Object" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sRevision_Load" />
                <Add Fn="sRevision_Add" />
            </Listeners>
        </ext:Store>

        <ext:Store
            ID="sRevisionD"
            runat="server"
            GroupField="Categoria">
            <Model>
                <ext:Model
                    ID="mRevisionD"
                    runat="server">
                    <Fields>
                        <ext:ModelField Name="Revision" Type="Int" />
                        <ext:ModelField Name="Renglon" Type="Int" />
                        <ext:ModelField Name="Categoria" Type="String" />
                        <ext:ModelField Name="SubCategoria" Type="String" />
                        <ext:ModelField Name="Concepto" Type="String" />
                        <ext:ModelField Name="Proveedor" Type="String" />
                        <ext:ModelField Name="Programado" Type="Float" />
                        <ext:ModelField Name="Real" Type="Float" />
                        <ext:ModelField Name="RSubCategoria" Type="Object" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>

        <ext:Store
            ID="sProveedores"
            runat="server">
            <Model>
                <ext:Model ID="mProveedores" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="ContactoNombre" Type="String" />
                        <ext:ModelField Name="ContactoAPaterno" Type="String" />
                        <ext:ModelField Name="ContactoAMaterno" Type="String" />
                        <ext:ModelField Name="Correo" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Sorters>
                <ext:DataSorter Property="ID" Direction="ASC" />
            </Sorters>
        </ext:Store>

        <ext:Store
            ID="sCategorias"
            runat="server"
            OnReadData="OnReadData_sCategorias">
            <Model>
                <ext:Model
                    ID="mCategorias"
                    runat="server"
                    IDProperty="Id">
                    <Fields>
                        <ext:ModelField Name="Id" Type="String" />
                        <ext:ModelField Name="Orden" Type="Int" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>

        <ext:Store
            ID="sSubCategorias"
            runat="server"
            OnReadData="OnReadData_sSubCategorias">
            <Model>
                <ext:Model
                    ID="mSubCategorias"
                    runat="server"
                    IDProperty="Id">
                    <Fields>
                        <ext:ModelField Name="Id" Type="String" />
                        <ext:ModelField Name="Orden" Type="Int" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                        <ext:ModelField Name="CategoriaIdRaw" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>

        <ext:Store
            ID="sConceptos"
            runat="server"
            OnReadData="OnReadData_sConceptos">
            <Model>
                <ext:Model
                    ID="mConceptos"
                    runat="server"
                    IDProperty="Id">
                    <Fields>
                        <ext:ModelField Name="Id" Type="String" />
                        <ext:ModelField Name="Modulo" Type="String" />
                        <ext:ModelField Name="Orden" Type="Int" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                        <ext:ModelField Name="CategoriaIdRaw" Type="String" />
                        <ext:ModelField Name="SubCategoriaIdRaw" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Sorters>
                <ext:DataSorter Property="Categoria" Direction="ASC" />
            </Sorters>
        </ext:Store>

        <ext:FormPanel 
            ID="fpFormaAvance"
            runat="server" 
            MonitorResize="true"
            Height="555"
            Width="910"
            BodyStyle="background-color:#fff;">
            <TopBar>
                <ext:Toolbar 
                    ID="tbFormaAvance" 
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
                                <Click Fn="imgbtnNuevo_Click" />
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
                                        <ext:Parameter Name="RevisionForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <ext:Parameter Name="Revision" Value="Ext.encode(#{sRevision}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="RevisionD" Value="ObtenerDetalle()" Mode="Raw" />
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
                            <Listeners>
                                <Click Fn="imgbtnInfo_Click" />
                            </Listeners>
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
                                <Click OnEvent="imgbtnAfectar_Click" Before="imgbtnAfectar_Click_Before" Success="imgbtnAfectar_Click_Success">
                                    <EventMask ShowMask="true" Msg="Afectando movimiento..." />
                                    <ExtraParams>
                                        <ext:Parameter Name="RevisionForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <ext:Parameter Name="Revision" Value="Ext.encode(#{sRevision}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="RevisionD" Value="ObtenerDetalle()" Mode="Raw" />
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
                            <Listeners>
                                <Click Fn="imgbtnAutorizar_Click" />
                            </Listeners>
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
                                <Click Fn="imgbtnImprimir_Click" />
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
                            <Listeners>
                                <Click Fn="imgbtnBorrar_Click" />
                            </Listeners>
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
                            <Listeners>
                                <Click Fn="imgbtnCancelar_Click" />
                            </Listeners>
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
                            <Listeners>
                                <Click Fn="imgbtnPrimero_Click" />
                            </Listeners>
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
                            <Listeners>
                                <Click Fn="imgbtnAnterior_Click" />
                            </Listeners>
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
                            <Listeners>
                                <Click Fn="imgbtnSiguiente_Click" />
                            </Listeners>
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
                            <Listeners>
                                <Click Fn="imgbtnUltimo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <Items>
                <ext:TabPanel
                    ID="tpContenedor"
                    runat="server" 
                    ActiveTabIndex="0" 
                    Width="900"
                    Height="203" 
                    Plain="true" 
                    Cls="custotabpanel xchris">
                    <Items>
                        <ext:Panel 
                            ID="pDatosGenerales" 
                            runat="server" 
                            Title="Datos Generales" 
                            BodyPadding="5"
                            AutoScroll="false">
                            <Items>
                                <ext:FieldSet 
                                    ID="fsDivisorDatos" 
                                    runat="server" 
                                    Title="Datos Generales" 
                                    DefaultAnchor="100%"
                                    AutoScroll="false">
                                    <Items>
                                        <ext:Panel ID="pDivisorColumnas" runat="server" Layout="ColumnLayout">
                                            <Items>
                                                <ext:Panel 
                                                    ID="Panel2"
                                                    runat="server">
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
                                                                        <ext:ListItem Index="0" Text="Iniciar proyecto" Value="Iniciar proyecto" />
                                                                        <ext:ListItem Index="1" Text="Revisión" Value="Revisión" />
                                                                        <ext:ListItem Index="2" Text="Terminar proyecto" Value="Terminar proyecto" />
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
                                                                <ext:NumberField
                                                                    ID="nfSemana"
                                                                    runat="server"
                                                                    Width="247"
                                                                    MaxLength="3"
                                                                    EnforceMaxLength="true"
                                                                    MinValue="0"
                                                                    FieldLabel="Semana N°"
                                                                    MaxValue="999"
                                                                    AllowDecimals="false"
                                                                    Step="1"
                                                                    LabelWidth="120"
                                                                    Margins="0 3 0 0"
                                                                    AllowBlank="false"
                                                                    EmptyNumber="0"
                                                                    AllowExponential="false"
                                                                    EmptyText="0">
                                                                    <Listeners>
                                                                        <Change Fn="nfSemana_Change" />
                                                                    </Listeners>
                                                                </ext:NumberField>
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
                                                                    Margins="0 3 0 0"
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
                                                                <ext:DateField
                                                                    ID="dfFechaRevision"
                                                                    runat="server"
                                                                    Width="360"
                                                                    LabelWidth="150" 
                                                                    FieldLabel="Fecha de Revisión"
                                                                    Margins="0 3 0 0" 
                                                                    Disabled="false">
                                                                    <Listeners>
                                                                        <Change Fn="dfFechaRevision_Change" />
                                                                    </Listeners>
                                                                    <PickerOptions 
                                                                        ID="poFechaRevision" 
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
                                                                    <Listeners>
                                                                        <Blur Handler="App.txtfObservaciones.setValue(App.txtfObservaciones.getValue().toUpperCase());" />
                                                                    </Listeners>
                                                                </ext:TextField>
                                                            </Items>
                                                        </ext:FieldContainer>
                                                    </Items>
                                                </ext:Panel>
<%--                                                <ext:Panel
                                                    ID="pDivisorColumnas2"
                                                    runat="server"
                                                    StyleSpec="margin-left: 85px;">
                                                    <Items>
                                                        <ext:ImageButton 
                                                            ID="imgbtnGaleria" 
                                                            runat="server" 
                                                            ImageUrl="assets/img/controles/GaleriaNormal.png"
                                                            DisabledImageUrl="assets/img/controles/GaleriaDisabled.png" 
                                                            OverImageUrl="assets/img/controles/GaleriaOver.png"
                                                            PressedImageUrl="assets/img/controles/GaleriaPressed.png" 
                                                            ToolTip="Adjuntar Imágenes"
                                                            Height="40" 
                                                            Width="40">
                                                            <Listeners>
                                                                <Click Fn="imgbtnGaleria_Click" />
                                                            </Listeners>
                                                        </ext:ImageButton>
                                                    </Items>
                                                </ext:Panel>--%>
                                            </Items>
                                        </ext:Panel>
                                    </Items>
                                </ext:FieldSet>
                            </Items>
                        </ext:Panel>
                        <ext:Panel
                            ID="pComentarios" 
                            runat="server" 
                            Title="Comentarios" 
                            BodyPadding="10" 
                            AutoScroll="true">
                            <Items>
                                <ext:FieldContainer 
                                    ID="FieldContainerCalles" 
                                    runat="server" 
                                    FieldLabel="Comentarios"
                                    AnchorHorizontal="100%">
                                    <Items>
                                        <ext:TextArea 
                                            ID="txtfComentarios"
                                            runat="server"
                                            Margins="0 3 0 0"
                                            Width="740"
                                            Height="125"
                                            MaxLength="5000"
                                            EnforceMaxLength="true">
                                            <Listeners>
                                                <Blur Handler="App.txtfComentarios.setValue(App.txtfComentarios.getValue().toUpperCase());" />
                                            </Listeners>
                                        </ext:TextArea>
                                    </Items>
                                </ext:FieldContainer>
                            </Items>
                        </ext:Panel>
                    </Items>
                </ext:TabPanel>
                <%--  DETALLE--%>
                <ext:Panel
                    ID="pDetalleAvance"
                    runat="server"
                    BodyPadding="5"
                    Width="900"
                    AutoScroll="True">
                    <Items>
                        <ext:FieldSet
                            ID="fsDetalleAvance" 
                            runat="server" 
                            Height="275" 
                            Title="Avance Detalle"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:TabPanel 
                                    ID="tpDetalle" 
                                    runat="server"
                                    Width="900" 
                                    Height="243"
                                    Plain="true" 
                                    Cls="custotabpanel xchris">
                                </ext:TabPanel>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
            </Items>
            <BottomBar>
                <ext:StatusBar 
                ID="sbFormaAvance" 
                runat="server" 
                Cls="x-colorToolbar" 
                Text="BORRADOR" />
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

        <ext:Window 
            ID="wFormaGaleria" 
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

        <ext:Window 
        ID="wCargarImagenes" 
        runat="server" 
        Icon="Application"
        Hidden="true"
        Modal="true" 
        Padding="5" 
        Resizable="False" 
        Region="Center" 
        XOnEsc="Ext.emptyFn">
            <Loader 
            ID="Loader2" 
            runat="server" 
            Mode="Frame" 
            AutoLoad="false">
                <LoadMask 
                ShowMask="true" 
                Msg="Cargando..." />
            </Loader>
        </ext:Window>

    </form>
</body>
</html>