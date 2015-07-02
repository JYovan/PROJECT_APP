<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fAhorro.aspx.cs" Inherits="OSEF.ERP.APP.fAhorro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/ahorro.js" ></script>
    <script type="text/javascript">
        window.onload = cargarEstilo;
    </script>
</head>
<body class="xCustomBody">
    <ext:ResourceManager ID="rmAhorro" runat="server" HideInDesign="true" />

    <ext:Model
        ID="mAhorroD"
        runat="server"
        Name="AhorroD"
        IDProperty="Renglon">
        <Fields>
            <ext:ModelField Name="Ahorro" Type="Int" />
            <ext:ModelField Name="Renglon" Type="Int" />
            <ext:ModelField Name="Articulo" Type="String" />
            <ext:ModelField Name="SaldoAnterior" Type="Float" />
            <ext:ModelField Name="Importe" Type="Float" />
            <ext:ModelField Name="Saldo" Type="Float" />
        </Fields>
    </ext:Model>

    <ext:Store
        ID="sAhorro"
        runat="server">
        <Model>
            <ext:Model
                ID="mAhorro"
                runat="server"
                Name="Ahorro"
                IDProperty="ID">
                <Fields>
                    <ext:ModelField Name="ID" Type="Int" />
                    <ext:ModelField Name="Mov" Type="String" />
                    <ext:ModelField Name="MovID" Type="String" />
                    <ext:ModelField Name="FechaEmision" Type="Date" />
                    <ext:ModelField Name="Cliente" Type="String" />
                    <ext:ModelField Name="Importe" Type="Float" />
                    <ext:ModelField Name="Saldo" Type="Float" />
                    <ext:ModelField Name="Estatus" Type="String" />
                </Fields>
                <Associations>
                    <ext:HasManyAssociation Model="AhorroD" Name="hmaAhorroD" AssociationKey="RAhorroD">
                    </ext:HasManyAssociation>
                </Associations>
            </ext:Model>
        </Model>
        <Listeners>
            <Load Fn="sAhorro_Load" />
        </Listeners>
    </ext:Store>

    <ext:FormPanel
        ID="fpOrdenEstimacion"
        runat="server" 
        MonitorResize="true"
        Height="460"
        Width="760"
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
                            <Click OnEvent="imgbtnGuardar_Click">
                                <EventMask ShowMask="true" Msg="Guardardo información..." />
                                <ExtraParams>
                                    <ext:Parameter Name="AhorroForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                    <ext:Parameter Name="Ahorro" Value="Ext.encode(#{sAhorro}.getRecordsValues())" Mode="Raw" />
                                    <ext:Parameter Name="AhorroD" Value="Ext.encode(#{sAhorroD}.getRecordsValues())" Mode="Raw" />
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
<%--                        <DirectEvents>
                            <Click OnEvent="imgbtnAfectar_Click"  Before="imgbtnAfectar_Click_Before" Success="imgbtnAfectar_Click_Success">
                                <EventMask ShowMask="true" Msg="Afectando movimiento..." />
                                    <ExtraParams>
                                    <ext:Parameter Name="OrdenEstimacionForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                    <ext:Parameter Name="OrdenEstimacion" Value="Ext.encode(#{sOrdenEstimacion}.getRecordsValues())" Mode="Raw" />
                                    <ext:Parameter Name="OrdenEstimacionD" Value="Ext.encode(#{sConceptos}.getRecordsValues())" Mode="Raw" />
                                    <ext:Parameter Name="Movimiento" Value="App.cmbMov.getValue()" Mode="Raw" />
                                    <ext:Parameter Name="Sucursal" Value="App.txtfSucursalID.getValue()" Mode="Raw" />
                                    <ext:Parameter Name="diasAtencion" Value="App.nfDiasAtencion.getValue()" Mode="Raw" />
                                </ExtraParams>
                            </Click>
                        </DirectEvents>--%>
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
<%--                        <Listeners>
                            <Click Fn="imgbtnImprimir_Click"></Click>
                        </Listeners>--%>
                    </ext:ImageButton>
                    <ext:ToolbarSpacer
                        ID="tbsPrimerEspacio"
                        runat="server"
                        Width="110">
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
<%--                        <DirectEvents>
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
                        </DirectEvents>--%>
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
<%--                        <DirectEvents>
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
                        </DirectEvents>--%>
                    </ext:ImageButton>
                    <ext:ToolbarSpacer
                        ID="tbsSegundoEspacio"
                        runat="server"
                        Width="110">
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
            <ext:FieldSet
                ID="fsDatosGenerales" 
                runat="server" 
                Height="120" 
                Title="Datos generales"
                DefaultAnchor="100%"
                Margin="5">
                <Items>
                    <ext:Container 
                        ID="cMvomiento"
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout"
                        Margin="5">
                        <Items>
                            <ext:ComboBox 
                                ID="cmbMov"
                                runat="server"
                                Width="350"
                                Margins="0 10 0 0"
                                Editable="false"
                                AllowBlank="false"
                                DisplayField="Nombre"
                                ValueField="ID"
                                FieldLabel="Movimiento"
                                LabelWidth="120">
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
                                    <ext:ListItem Index="0" Text="Deposito" Value="Deposito" />
                                    <ext:ListItem Index="1" Text="Retiro" Value="Retiro" />
                                    <ext:ListItem Index="2" Text="Deposito Intereses" Value="Deposito Intereses" />
                                </Items>
                                <Listeners>
                                    <Select Fn="cmbMov_Select" />
                                </Listeners>
                            </ext:ComboBox>
                            <ext:TextField
                                ID="txtfMovID"
                                runat="server"
                                Width="350"
                                Margins="0 10 0 0"
                                Disabled="true"
                                FieldLabel="Folio"
                                LabelWidth="30">
                            </ext:TextField>
                        </Items>
                    </ext:Container>
                    <ext:Container 
                        ID="cFechaEmision"
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout"
                        Margin="5">
                        <Items>
                            <ext:DateField
                                ID="dfFechaEmision"
                                runat="server"
                                Width="350"
                                Margins="0 10 0 0" 
                                Disabled="true"
                                LabelWidth="120"
                                FieldLabel="Fecha de emisión">
                                <PickerOptions 
                                    ID="poFechaEmision"
                                    runat="server"
                                    Cls="my-date-picker">
                                </PickerOptions>
                            </ext:DateField>
                            <ext:TimeField 
                                ID="tfHora" 
                                runat="server"  
                                Increment="15"
                                Margins="0 10 0 0" 
                                LabelWidth="30"
                                FieldLabel="Hora" 
                                Width="350"
                                Format="H:mm"
                                Disabled="true">
                            </ext:TimeField>
                        </Items>
                    </ext:Container>
                    <ext:Container 
                        ID="cCliente"
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout"
                        Margin="5">
                        <Items>
                            <ext:ComboBox
                                ID="cmbCliente" 
                                runat="server" 
                                ValueField="ID"
                                DisplayField="ID"
                                QueryMode="Local"
                                TypeAhead="true"
                                Disabled="false"
                                FieldLabel="Socio"
                                LabelWidth="120"
                                Width="350"
                                Margins="0 10 0 0"
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
                                <ListConfig
                                    ID="lcCliente"
                                    runat="server"
                                    Width="330">
                                    <ItemTpl
                                        ID="itCliente"
                                        runat="server">
                                        <Html>
                                            <div class="search-item">
							                    <h3>{ID}</h3>
                                                <span>{NombreCompleto}</span>
						                    </div>
                                        </Html>
                                    </ItemTpl>
                                </ListConfig>
                                <Listeners>
                                    <Change Fn="cmbCliente_Change" />
                                </Listeners>
                            </ext:ComboBox>
                            <ext:TextField
                                ID="txtfNombreCompleto" 
                                runat="server"
                                Disabled="true"
                                Width="350"
                                Margins="0 10 0 0">
                            </ext:TextField>
                        </Items>
                    </ext:Container>
                </Items>
            </ext:FieldSet>
            <ext:FieldSet
                ID="fsDetalle" 
                runat="server" 
                Height="250" 
                Title="Detalle"
                DefaultAnchor="100%"
                Margin="5">
                <Items>
                    <ext:GridPanel
                        ID="gpAhorro"
                        runat="server"
                        Width="700"
                        Height="200"
                        EnableColumnHide="false"
                        EnableColumnMove="false">
                        <Store>
                            <ext:Store
                                ID="sAhorroD"
                                runat="server"
                                ModelName="AhorroD">
                            </ext:Store>
                        </Store>
                        <ColumnModel 
                            ID="cmAhorro" 
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
<%--                                            <Listeners>
                                        <Command Fn="ccAcciones_Command" />
                                    </Listeners>--%>
                                </ext:CommandColumn>
                                <ext:Column
                                    ID="cArticulo"
                                    runat="server"
                                    Text="Producto"
                                    Width="253"
                                    DataIndex="Articulo">
                                    <Editor>
                                        <ext:ComboBox
                                            ID="cmbArticulo"
                                            runat="server"
                                            Editable="true"
                                            MatchFieldWidth="true"
                                            ForceSelection="true"
                                            QueryMode="Local"
                                            TypeAhead="true"
                                            DisplayField="Descripcion"
                                            ValueField="ID">
                                            <Store>
                                                <ext:Store
                                                    ID="sArticulos"
                                                    runat="server">
                                                    <Model>
                                                        <ext:Model
                                                            ID="mArticulos"
                                                            runat="server"
                                                            IDProperty="ID">
                                                            <Fields>
                                                                <ext:ModelField Name="ID" Type="String" />
                                                                <ext:ModelField Name="Corta" Type="String" />
                                                                <ext:ModelField Name="Descripcion" Type="String" />
                                                            </Fields>
                                                        </ext:Model>
                                                    </Model>
                                                </ext:Store>
                                            </Store>
                                            <Listeners>
                                                <SpecialKey Handler="if (e.getKey() === e.ENTER) {
                                                                         this.up('gridpanel').enterWasPressed = true; 
                                                                     }">
                                                </SpecialKey>
                                            </Listeners>
                                        </ext:ComboBox>
                                    </Editor>
                                    <Renderer Fn="cArticulo_Renderer" />
                                </ext:Column>
                                <ext:NumberColumn
                                    ID="ncSaldoAnterior"
                                    runat="server"
                                    Align="Center"
                                    Text="Saldo anterior"
                                    DataIndex="SaldoAnterior"
                                    Width="150">
                                    <Renderer Fn="ncMonetario_Renderer" />
                                </ext:NumberColumn>
                                <ext:NumberColumn 
                                    ID="ncImporte"
                                    runat="server"
                                    Align="Center"
                                    Text="Importe"
                                    DataIndex="Importe"
                                    Width="150">
                                    <Renderer Fn="ncMonetario_Renderer" />
                                    <Editor>
                                        <ext:NumberField 
                                            ID="nfImporte"
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
                                </ext:NumberColumn>
                                <ext:NumberColumn
                                    ID="ncSaldo"
                                    runat="server"
                                    Align="Center"
                                    Text="Saldo"
                                    DataIndex="Saldo"
                                    Width="150">
                                    <Renderer Fn="ncMonetario_Renderer" />
                                </ext:NumberColumn>
                            </Columns>
                        </ColumnModel>
<%--                                <Listeners>
                            <ItemClick Fn="gpOrdenEstimacion_ItemClick" />
                        </Listeners>--%>
                        <SelectionModel>
                            <ext:CellSelectionModel
                                ID="csmAhorro" 
                                runat="server">
                            </ext:CellSelectionModel>
                        </SelectionModel>
                        <Plugins>
                            <ext:CellEditing 
                                ID="ceAhorro" 
                                runat="server"
                                ClicksToEdit="1">
                                <Listeners>
                                    <Edit Fn="ceAhorro_Edit" Delay="1" />
                                    <%--<BeforeEdit Fn="validaConcluidos" ></BeforeEdit>--%>
                                </Listeners>
                            </ext:CellEditing>
                        </Plugins>
                        <View>
                            <ext:GridView
                                ID="gvAhorro"
                                runat="server"
                                StripeRows="true">
                            </ext:GridView>
                        </View>
<%--                                <Listeners>
                            <Select Fn="obetenerRenglon_Select"></Select>
                        </Listeners>--%>
                    </ext:GridPanel>
                        <%--Fin Detalle--%>
                </Items>
            </ext:FieldSet>
        </Items>
        <BottomBar>
            <ext:Toolbar ID="tbAhorro" runat="server">
                <Items>
                    <ext:StatusBar 
                        ID="sbAhorro" 
                        runat="server" 
                        Cls="x-colorToolbar" 
                        Text="SIN AFECTAR" />
                    <ext:DisplayField
                        ID="dfTotalSaldoAnterior"
                        runat="server"
                        Cls="total-field"
                        Width="140"
                        Margins="0 8 0 170"
                        Text="$ 0.00">
                    </ext:DisplayField>
                    <ext:DisplayField
                        ID="dfTotalImporte"
                        runat="server"
                        Cls="total-field"
                        Margins="0 8 0 0"
                        Width="140"
                        Text="$ 0.00">
                    </ext:DisplayField>
                    <ext:DisplayField
                        ID="dfTotalSaldo"
                        runat="server"
                        Cls="total-field"
                        Margins="0 0 0 0"
                        Width="140"
                        Text="$ 0.00">
                    </ext:DisplayField>
                </Items>
            </ext:Toolbar>
        </BottomBar>
    </ext:FormPanel>

</body>
</html>