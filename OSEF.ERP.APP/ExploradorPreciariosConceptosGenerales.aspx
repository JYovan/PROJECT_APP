<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExploradorPreciariosConceptosGenerales.aspx.cs" Inherits="OSEF.ERP.APP.ExploradorPreciariosGenerales" %>

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
    <script type='text/javascript' src="js/exploradorConceptoPreciarioGeneral.js"></script> 
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
    
       <ext:ResourceManager ID="rmExploradorConceptosPreciario" runat="server" HideInDesign="true">
        </ext:ResourceManager>

      <ext:Hidden ID="GridData" runat="server" />
        <ext:GridPanel
            ID="gpExploradorConceptosPreciarioGeneral"
            runat="server"
            Height="420"
            Width="1000"
            Title="EXPLORADOR ORDENES DE CAMBIO"
            EnableColumnHide="true"
            EnableColumnMove="true"
            
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbPreciarios" runat="server">
                    <Items>
                            


                             <ext:ComboBox
                                ID="cmbSucursal"
                                runat="server"
                                LabelWidth="70"
                                Width="350"
                                FieldLabel="SUCURSAL"
                                ValueField="ID"
                                Cls="spanCustomCombo xEspacioCmbxCustom"
                                PageSize="10"
                                DisplayField="Nombre"
                                StyleSpec="margin-right: 6px;"
                                Editable="true"
                                MatchFieldWidth="true"
                                ForceSelection="true"
                                QueryMode="Local"
                                TypeAhead="true"
                                EnforceMaxLength="true">
                                 <ListConfig ID="lcPreciario" runat="server" Width="400" Cls="xEspacioCmbxCustom">
                                    <ItemTpl ID="itPreciario" runat="server">
                                        <Html>
                                            <div class="search-item">
							                    <h3>{CR}</h3>
                                                <span>{Nombre}</span>
						                    </div>
                                        </Html>
                                    </ItemTpl>
                                </ListConfig>
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos"  />
                                </Items>
                             <%--   <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>--%>
                                <Listeners>
                                    <Select Fn="cmbSucursalFiltro_Select" />
                                </Listeners>
                                <Store>
                                    <ext:Store
                                        ID="sSucursales"
                                        runat="server">
                                        <Model>
                                            <ext:Model ID="mSucursales" runat="server" IDProperty="ID">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                    <ext:ModelField Name="CR" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <Listeners>
                                <Change Fn="cmbSucursal_Change" />
                                </Listeners>
                            </ext:ComboBox>
 
                        
                        <ext:ToolbarSpacer 
                        runat="server" 
                        ID="tsExploradorGeneralOrdenesEstimaciones" 
                        Width="320">
                        
                        </ext:ToolbarSpacer>

                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="BUSCAR POR ASUNTO"
                            Width="290">
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
                                </ext:ImageButton>
                            </RightButtons>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>
             <Store>
                <ext:Store
                    ID="sOrdenesEstimaciones"
                    runat="server"
                   OnReadData="OnReadData_sOrdenesEstimaciones">
                    <Model>
                        <ext:Model ID="mOrdenesEstimaciones" runat="server">
                            <Fields>
                                <ext:ModelField Name="Id" Type="Int" />
                                <ext:ModelField Name="Mov" Type="String" />
                                <ext:ModelField Name="MovID" Type="String" />
                                <ext:ModelField Name="Sucursal" Type="String" />
                                 <ext:ModelField Name="RSucursal" Type="Object" />
                                <ext:ModelField Name="FechaEmision" Type="Date" />
                                <ext:ModelField Name="Observaciones" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="ImporteTotal" Type="Float" />
                                <ext:ModelField Name="Usuario" Type="String" />
                               <ext:ModelField Name="NoOrden" Type="String" />
                                <ext:ModelField Name="Cliente" Type="String" />
                                <ext:ModelField Name="RCliente" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                      <Sorters>
                        <ext:DataSorter Property="FechaEmision" Direction="DESC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sOrdenesEstimaciones_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cMovimiento"
                        runat="server"
                        Text="MOVIMIENTO"
                        Align="Center"
                        Width="170"
                        DataIndex="Mov">
                         <HeaderItems>
                            <ext:TextField
                                ID="txtMovID"
                                runat="server"
                                EmptyText="Fitrar por MovID"
                                Editable="false">
                              <Listeners>
                                    <Change Fn="txtMovID_Change" />
                                </Listeners>
                            </ext:TextField>
                        </HeaderItems>
                        <Renderer Fn="cMov_Renderer" />
                    </ext:Column>
                    <%-- <ext:DateColumn
                        ID="dcFechaEmision"
                        runat="server"
                        Text="EMITIDO"
                        Align="Center"
                        Width="100"
                        DataIndex="FechaEmision"
                        Format="dd/MM/yyyy">
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbFechaRevision"
                                runat="server">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todo)" />
                                    <ext:ListItem Index="1" Text="Hoy" />
                                    <ext:ListItem Index="2" Text="Ayer" />
                                    <ext:ListItem Index="3" Text="Mañana" />
                                    <ext:ListItem Index="4" Text="Esta semana" />
                                    <ext:ListItem Index="5" Text="Semana pasada" />
                                    <ext:ListItem Index="6" Text="Este mes" />
                                    <ext:ListItem Index="7" Text="Mes móvil" />
                                    <ext:ListItem Index="8" Text="Mes pasado" />
                                    <ext:ListItem Index="9" Text="Este año" />
                                    <ext:ListItem Index="10" Text="Año móvil" />
                                    <ext:ListItem Index="11" Text="Año pasado" />
                                    <ext:ListItem Index="12" Text="Enero" />
                                    <ext:ListItem Index="13" Text="Febrero" />
                                    <ext:ListItem Index="14" Text="Marzo" />
                                    <ext:ListItem Index="15" Text="Abril" />
                                    <ext:ListItem Index="16" Text="Mayo" />
                                    <ext:ListItem Index="17" Text="Junio" />
                                    <ext:ListItem Index="18" Text="Julio" />
                                    <ext:ListItem Index="19" Text="Agosto" />
                                    <ext:ListItem Index="20" Text="Septiembre" />
                                    <ext:ListItem Index="21" Text="Octubre" />
                                    <ext:ListItem Index="22" Text="Noviembre" />
                                    <ext:ListItem Index="23" Text="Diciembre" />
                                    <ext:ListItem Index="24" Text="Especifica..." />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                            </ext:ComboBox>
                        </HeaderItems>
                    </ext:DateColumn>--%> 
                    <ext:DateColumn 
                    ID="cEmitido" 
                    runat="server" 
                    Text="EMITIDO" 
                    Width="90" 
                    DataIndex="FechaEmision" 
                    Format="dd/MM/yyyy">
                        <HeaderItems>
                            <ext:DateField ID="fEmitido" runat="server" Editable="false">
                                <Listeners>
                                    <Change Handler="applyFilter(this);" />
                                </Listeners>
                                <Plugins>
                                    <ext:ClearButton ID="ClearButton1" runat="server" />
                                </Plugins>
                            </ext:DateField>
                        </HeaderItems>
                    </ext:DateColumn>
                     <ext:Column
                        ID="cNoOrden"
                        runat="server"
                        Text="NO.ORDEN"
                        Align="Center"
                        Width="80"
                        Filterable="false"
                        DataIndex="NoOrden">
                        <Renderer Fn="cOrden_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cCliente"
                        runat="server"
                        Text="CLIENTE"
                        Align="Center"
                        Width="150"
                        Filterable="false"
                        DataIndex="Cliente">
                        <Renderer Fn="cCliente_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Filterable="false"
                        Text="SUCURSAL"
                        Align="Center"
                        Width="170"
                        DataIndex="Sucursal">
                      <Renderer Fn="cSucursal_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cAsunto"
                        runat="server"
                        Text="ASUNTO"
                        Filterable="false"
                        Align="Center"
                        Width="300"
                        DataIndex="Observaciones">
                    </ext:Column>
                    <ext:Column
                        ID="cTotal"
                        runat="server"
                        Filterable="false"
                        Text="IMPORTE"
                        Align="Center"
                        Width="95"
                        DataIndex="ImporteTotal">
                        <Renderer Fn="cImporte_renderer"></Renderer>
                    </ext:Column>
                    <ext:Column
                        ID="cUsuario"
                        runat="server"
                        Text="USUARIO"
                        Align="Center"
                        Width="150"
                        DataIndex="Usuario">
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbUsuario"
                                runat="server"
                                DisplayField="Nombre"
                                ValueField="ID"
                                Editable="true"
                                MatchFieldWidth="true"
                                ForceSelection="true"
                                QueryMode="Local"
                                TypeAhead="true"
                                EnforceMaxLength="true"
                                >
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Store>
                                <ext:Store ID="sUsuarios" runat="server">
                                    <Model>
                                        <ext:Model ID="mUsuarios" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Correo" Type="String" />
                                                <ext:ModelField Name="Nombre" Type="String" />
                                                <ext:ModelField Name="APaterno" Type="String" />
                                                <ext:ModelField Name="AMaterno" Type="String" />
                                                <ext:ModelField Name="Estatus" Type="String" />
                                                <ext:ModelField Name="Bloqueado" Type="Boolean" />
                                                <ext:ModelField Name="EnLinea" Type="Boolean" />
                                                <ext:ModelField Name="FechaAlta" Type="Date" />
                                                <ext:ModelField Name="FechaBloqueo" Type="Date" />
                                                <ext:ModelField Name="UltimoAcceso" Type="Date" />
                                                <ext:ModelField Name="CambioContrasena" Type="Date" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                                </Store>
                                 <Listeners>
                                    <Select Fn="cmbUsuarioFiltro_Select" />
                                </Listeners>
                            </ext:ComboBox>
                        
                        </HeaderItems>
                    
                    </ext:Column>
                </Columns>
            </ColumnModel>
            
            <Plugins>
                    <ext:FilterHeader ID="FilterHeader1" runat="server" Remote="true" />
            </Plugins>
                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" 
                        DisplayInfo="true"
                        DisplayMsg=""
                        HideRefresh="True">
                        <Items>
                            <ext:Label ID="Label1" runat="server" Text="Tamaño página:" />
                            <ext:ToolbarSpacer ID="ToolbarSpacer2" runat="server" Width="10" />
                              
                            <ext:ComboBox ID="ComboBox2" runat="server" 
                            Editable="false"
                            Width="80">
                                <Items>
                                    <ext:ListItem Text="1" />
                                    <ext:ListItem Text="5" />
                                    <ext:ListItem Text="15" />
                                    <ext:ListItem Text="25" /> 
                                    <ext:ListItem Text="50" />
                                    <ext:ListItem Text="100" />
                                    <ext:ListItem Text="200" />
                                    <ext:ListItem Text="300" />
                                    <ext:ListItem Text="500" />
                                    <ext:ListItem Text="1000" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Value="10" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Handler="#{gpExploradorConceptosPreciarioGeneral}.store.pageSize = parseInt(this.getValue(), 10); #{gpExploradorConceptosPreciarioGeneral}.store.reload();" />
                                </Listeners>
                            </ext:ComboBox> 
                            
                            <ext:Label runat="server" ID="lblPagingTool" Text="Label 1"></ext:Label>
                        </Items>
                        </ext:PagingToolbar>
                    </BottomBar>

            <Listeners>
                <ItemDblClick Fn="gpExploradorConceptos_ItemClick" />
            </Listeners>
            <View>
                <ext:GridView
                    ID="gvExploradorPreciarioConcepto"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <SelectionModel> 
                <ext:RowSelectionModel
                    ID="rsmExploradorPreciarioConcepto"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel> 
        </ext:GridPanel>
    </form>
</body>
</html>
