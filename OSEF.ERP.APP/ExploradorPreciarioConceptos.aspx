<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExploradorPreciarioConceptos.aspx.cs" Inherits="OSEF.ERP.APP.ExploradorVolumetrias" %>



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
    <script type='text/javascript' src="js/exploradorConceptoPreciario.js"></script>


   
</head>
<body class="xCustomBody">
     <ext:ResourceManager ID="rmExploradorConceptosPreciario" runat="server" HideInDesign="true">
        </ext:ResourceManager>
    
    <form id="form1" runat="server">
     <ext:Hidden ID="GridData" runat="server" />
        <ext:GridPanel
            ID="gpExploradorConceptosPreciario"
            runat="server"
            Height="420"
            Width="1000"
            Title="EXPLORADOR CONCEPTOS PRECIARIO"
            EnableColumnHide="true"
            EnableColumnMove="true"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbVolumetrias" runat="server">
                    <Items>
                                <ext:ComboBox
                        ID="cmbPreciario"
                        runat="server"
                        DisplayField="ID"
                        ValueField="ID"
                        EmptyText="PRECIARIO"
                        MatchFieldWidth="false"
                        Margins="0 3 0 0"
                        Cls="spanCustomCombo xEspacioCmbxCustom"
                        PageSize="10"
                        AllowBlank="false"
                        ForceSelection="true"
                        QueryMode="Local"
                        TypeAhead="true">
                        <ListConfig ID="lcPreciario" runat="server" Width="350" Cls="xEspacioCmbxCustom">
                            <ItemTpl ID="itPreciario" runat="server">
                                <Html>
                                    <div class="search-item">
							            <h3>{ID}</h3>
                                        <span>{Descripcion}</span>
						            </div>
                                </Html>
                            </ItemTpl>
                        </ListConfig>
                            <Store>
                                <ext:Store
                                    ID="sPreciarios"
                                    runat="server">
                                    <Model>
                                        <ext:Model
                                            ID="mPreciarios"
                                            runat="server">
                                            <Fields>
                                                <ext:ModelField Name="ID" />
                                                <ext:ModelField Name="Descripcion" />
                                                <ext:ModelField Name="Sucursal" />
                                                <ext:ModelField Name="Archivo" />
                                                <ext:ModelField Name="Estatus" />
                                                <ext:ModelField Name="FechaAlta" />
                                                <ext:ModelField Name="RSucursal" Type="Object" />
                                                        
                                            </Fields>
                                        </ext:Model>                            
                                    </Model>
                                </ext:Store>
                            </Store> 
                                                                   
                    </ext:ComboBox>
                                <ext:ComboBox
                                ID="cmbCategoria"
                                runat="server"
                                Width="175"
                                DisplayField="Descripcion"
                                ValueField="ID"
                                EmptyText="CATEGORÍA"
                                EnforceMaxLength="true"
                                StyleSpec="margin-right: 6px;"
                                AllowBlank="false">
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
                                <DirectEvents>
                                    <Change OnEvent="cmbCategoria_Change">
                                        <ExtraParams>
                                            <ext:Parameter Name="categoria" Value="App.cmbCategoria.getValue()" Mode="Raw" />
                                        </ExtraParams>
                                    </Change>
                                </DirectEvents>
                            </ext:ComboBox>
                             <ext:ComboBox
                                ID="cmbSubCategoria"
                                runat="server"
                                Width="175"
                                EmptyText="SUBCATEGORÍA"
                                ValueField="ID"
                                DisplayField="Descripcion"
                                EnforceMaxLength="true"
                                StyleSpec="margin-right: 6px;"
                                AllowBlank="false">
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
                                <DirectEvents>
                                    <Select OnEvent="cmbSubCategoria_Select">
                                        <ExtraParams>
                                            <ext:Parameter Name="subcategoria" Value="App.cmbSubCategoria.getValue()" Mode="Raw" />
                                        </ExtraParams>
                                    </Select>
                                </DirectEvents>
                            </ext:ComboBox>
                             <ext:ComboBox
                                ID="cmbSubSubCategoria"
                                runat="server"
                                Width="175"
                                EmptyText="SUBSUBCATEGORÍAS"
                                DisplayField="Descripcion"
                                ValueField="ID"
                                EnforceMaxLength="true"
                                StyleSpec="margin-right: 6px;"
                                AllowBlank="false">
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

                        <ext:ImageButton
                            ID="imgbtnActualizar"
                            runat="server"
                            
                            ImageUrl="assets/img/controles/login.png"
                            OverImageUrl="assets/img/controles/login-hover.png"
                            PressedImageUrl="assets/img/controles/login-pressed.png"
                            Height="23"
                            ToolTip="Filtrar"
                            Disabled="false"
                            Width="23">
                           <DirectEvents>
                                    <Click OnEvent="cmbSubSubCategoria_Select">
                                    <EventMask ShowMask="true" Msg="Cargando Preciario..." />
                                        <ExtraParams>
                                            <ext:Parameter Name="subsubcategoria" Value="App.cmbSubSubCategoria.getValue()" Mode="Raw" />
                                            <ext:Parameter Name="subcategoria" Value="App.cmbSubCategoria.getValue()" Mode="Raw" />
                                            <ext:Parameter Name="categoria" Value="App.cmbCategoria.getValue()" Mode="Raw" />
                                            <ext:Parameter Name="preciario" Value="App.cmbPreciario.getValue()" Mode="Raw" />
                                              
                                        </ExtraParams>
                                    </Click>
                                </DirectEvents>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnExporToExcel"
                            runat="server"
                            ImageUrl="assets/img/controles/ExcelNormal.png"
                            OverImageUrl="assets/img/controles/ExcelOver.png"
                            PressedImageUrl="assets/img/controles/ExcelPressed.png"
                            DisabledImageUrl="assets/img/controles/ExcelDisabled.png"
                            Height="23"
                            ToolTip="Exportar a excel"
                            Disabled="true"
                            Width="23">
						    <DirectEvents>
							    <Click OnEvent="ExportEt" IsUpload="true"  >
								    <ExtraParams>
									    <ext:Parameter Name="data" Value="#{gpExploradorConceptosPreciario}.getRowsValues({ filterField : function (r,name, value) { 
                                                                         return name == 'Clave' || name == 'Descripcion' || name == 'Cantidad' || name == 'Utilizada' || name == 'Costo' || name == 'Importefinal';
                                                                         }})" 
                                     Mode="Raw" 
                                     Encode="true" />
									    <ext:Parameter Name="format" Value="xls" Mode="Value" />
								    </ExtraParams>
							    </Click>
						    </DirectEvents>
                         </ext:ImageButton>


                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="BUSCAR CLAVE/CONCEPTO"
                            Width="200">
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
                <ext:Store ID="sPreciarioConcepto" runat="server"  PageSize="100" >
                    <Model>
                        <ext:Model ID="mPreciarioConcepto" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="Clave" Type="String" />
                                <ext:ModelField Name="Preciario" Type="String" />
                                <ext:ModelField Name="Descripcion" Type="String" />
                                <ext:ModelField Name="Unidad" Type="String" />
                                <ext:ModelField Name="Cantidad" Type="Float" />
                                <ext:ModelField Name="Utilizada" Type="Float" />
                                <ext:ModelField Name="Costo" Type="Float" />
                                <ext:ModelField Name="Importe" Type="Float" />
                                <ext:ModelField Name="Importefinal" Type="Float" />
                                <ext:ModelField Name="Categoria" Type="String" />
                                <ext:ModelField Name="SubCategoria" Type="String" />
                                <ext:ModelField Name="SubSubCategoria" Type="String" />
                                <ext:ModelField Name="FechaAlta" Type="Date" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="Tipo" Type="String" />
                                <%--<ext:ModelField Name="RCategoria" Type="Object" />
                                <ext:ModelField Name="RSubcategoria" Type="Object" />
                                <ext:ModelField Name="RSubsubcategoria" Type="Object" /> --%>
                                <ext:ModelField Name="Cliente" Type="String" /> 
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sExploradorPConcepto_DataChanged" />
                        <Load Fn="sPreciarioConcepto_Load"></Load>
                    </Listeners>
                </ext:Store>
            </Store>

            <ColumnModel>
                <Columns>
                    
                    <ext:Column 
                        ID="cClave"
                        runat="server"
                        Text="CLAVE"
                        Align="Center"
                        Width="120"
                        Filterable="false"
                        DataIndex="Clave">
                         <Renderer Fn="cMov_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cDescripcion"
                        runat="server"
                        Text="CONCEPTO"
                        Filterable="false"
                        Align="Left"
                        Width="340"
                        DataIndex="Descripcion">
                    </ext:Column>
                    <ext:Column
                        ID="cCantidad"
                        runat="server"
                        Text="CANTIDAD"
                        Filterable="false"
                        Align="Center"
                        Width="120"
                        DataIndex="Cantidad">
                    </ext:Column>
                    <ext:Column
                        ID="cUtilizada"
                        runat="server"
                        Text="UTLIZADA"
                        Align="Center"
                        Width="120"
                        DataIndex="Utilizada">
                        <Renderer Fn="renderCantidadUtilizada" />
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbUtilizada"
                                runat="server"
                                ForceSelection="true"
                                Editable="false">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                    <ext:ListItem Index="1" Text="UTILIZADOS"  Value="1"/>
                                    <ext:ListItem Index="2" Text="SIN UTILIZAR" Value="0" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbCantidadFiltro_Select" />
                                </Listeners>
                              
                            </ext:ComboBox>
                        </HeaderItems>
                    </ext:Column>
                     <ext:Column
                        ID="ccPrecio"
                        runat="server"
                        Text="PRECIO"
                        Filterable="false"
                        Align="Center"
                        Width="150"
                        DataIndex="Costo">
                        <Renderer Fn="txtCosto_renderer" />
                    </ext:Column>
                     <ext:Column
                        ID="cTotal"
                        runat="server"
                        Text="IMPORTE"
                        Filterable="false"
                        Align="Center"
                        Width="125"
                        DataIndex="Importefinal">
                         <Renderer Fn="cImporte_renderer" />
                    </ext:Column>
                </Columns>
            </ColumnModel>

            <Plugins>
                        <ext:FilterHeader ID="FilterHeader1" runat="server" Remote="true" />
                    </Plugins>
                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" HideRefresh="True">
                        <Items>
                            <ext:Label ID="Label1" runat="server" Text="Tamaño página:" />
                            <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
                            <ext:ComboBox ID="ComboBox2" runat="server" Width="80">
                                <Items>
                                    <ext:ListItem Text="1" />
                                    <ext:ListItem Text="5" />
                                    <ext:ListItem Text="10" />
                                    <ext:ListItem Text="25" />
                                    <ext:ListItem Text="50" />
                                    <ext:ListItem Text="100" />
                                    <ext:ListItem Text="250" />
                                    <ext:ListItem Text="500" />
                                    <ext:ListItem Text="1000" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Value="100" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Handler="#{gpExploradorConceptosPreciario}.store.pageSize = parseInt(this.getValue(), 10); #{gpExploradorConceptosPreciario}.store.reload();" />
                                </Listeners>
                            </ext:ComboBox>
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
