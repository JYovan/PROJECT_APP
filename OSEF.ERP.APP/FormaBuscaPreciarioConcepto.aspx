<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaBuscaPreciarioConcepto.aspx.cs" Inherits="OSEF.ERP.APP.FormaBuscaPreciarioConcepto" %>

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
    <script type='text/javascript' src="js/buscaConceptoPreciario.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaBuscarPreciarioConcepto" runat="server" HideInDesign="true" />

        <ext:FormPanel 
            ID="fpBuscaPreciarioConcepto"
            runat="server"
            MonitorResize="true"
            Height="380"
            Width="665"
            BodyStyle="background-color:#fff;">
            <Items>
                <ext:Panel 
                    ID="pFiltros" 
                    runat="server" 
                    BodyPadding="10"
                    Width="700"
                    Height="180" 
                    AutoScroll="false">
                    <Items>
                        <ext:FieldContainer
                            ID="fcFiltros"
                            runat="server"
                            FieldLabel="Categoría"
                            AnchorHorizontal="100%"
                            LabelWidth="120"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:ComboBox
                                    ID="cmbCategoria"
                                    runat="server"
                                    Width="200"
                                    DisplayField="Descripcion"
                                    ValueField="ID"
                                    EnforceMaxLength="true"
                                    StyleSpec="margin-right: 6px;"
                                    AllowBlank="true">
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
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer
                            ID="fcFiltro2"
                            runat="server"
                            FieldLabel="SubCategoría"
                            AnchorHorizontal="100%"
                            LabelWidth="120"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:ComboBox
                                    ID="cmbSubCategoria"
                                    runat="server"
                                    Width="200"
                                    DisplayField="Descripcion"
                                    ValueField="ID"
                                    EnforceMaxLength="true"
                                    StyleSpec="margin-right: 6px;"
                                    AllowBlank="true">
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
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer
                            ID="fcFiltro3"
                            runat="server"
                            FieldLabel="SubSubCategoría"
                            AnchorHorizontal="100%"
                            LabelWidth="120"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:ComboBox
                                    ID="cmbSubSubCategoria"
                                    runat="server"
                                    Width="200"
                                    DisplayField="Descripcion"
                                    ValueField="ID"
                                    EnforceMaxLength="true"
                                    StyleSpec="margin-right: 6px;"
                                    AllowBlank="true">
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
                                <ext:Button
                                    ID="btnBuscar"
                                    runat="server"
                                    Text="Buscar"
                                    Icon="Find">
                                    <DirectEvents>
                                        <Click OnEvent="btnBuscar_Click">
                                            <EventMask ShowMask="true" Msg="Cargando conceptos..." />
                                            <ExtraParams>
                                                <ext:Parameter Name="categoria" Value="App.cmbCategoria.getValue()" Mode="Raw" />
                                                <ext:Parameter Name="subcategoria" Value="App.cmbSubCategoria.getValue()" Mode="Raw" />
                                                <ext:Parameter Name="subsubcategoria" Value="App.cmbSubSubCategoria.getValue()" Mode="Raw" />
                                            </ExtraParams>
                                        </Click>
                                    </DirectEvents>
                                </ext:Button>
                            </Items>
                        </ext:FieldContainer>                      
                        <ext:FieldContainer
                            ID="fcDescripcion"
                            runat="server"
                            FieldLabel="Descripcion"
                            AnchorHorizontal="100%"
                            LabelWidth="120"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:TextArea
                                    ID="txtDescripcion"
                                    runat="server"
                                    Width="514"
                                    Height="50"
                                    StyleSpec="margin-right: 16px;"
                                    AllowBlank="false"
                                    Disabled="true">
                                </ext:TextArea>
                            </Items>
                        </ext:FieldContainer>
                          <ext:FieldContainer
                            ID="fcFiltroID"
                            runat="server"
                            FieldLabel="Búsqueda"
                            AnchorHorizontal="100%"
                            LabelWidth="120"
                            Layout="ColumnLayout">
                            <Items>
                                <ext:TextField
                                    ID="txtBuscar"
                                    runat="server"
                                    EmptyText="Buscar por Clave/Descripcion"
                                    Width="335"
                                    Disabled="false">
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
                        </ext:FieldContainer>
                    </Items>
                </ext:Panel>
                <%--  conceptos filtrados--%>
                <ext:Panel
                    ID="pConceptos"
                    runat="server"
                    BodyPadding="5"
                    Width="660"
                    AutoScroll="True">
                    <Items>
                        <ext:FieldSet
                            ID="fsConceptos" 
                            runat="server" 
                            Height="190" 
                            Title="Conceptos"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:GridPanel
                                    ID="gpConceptos"
                                    runat="server"
                                    Width="700"
                                    Height="170">
                                    <Store>
                                        <ext:Store
                                            ID="sConceptosFiltrados"
                                            runat="server">
                                            <Model>
                                                <ext:Model ID="mCarga" runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="ID" Type="String" />
                                                        <ext:ModelField Name="Clave" Type="String" />
                                                        <ext:ModelField Name="Descripcion" Type="String" />
                                                        <ext:ModelField Name="Unidad" Type="String" />
                                                        <ext:ModelField Name="Cantidad" Type="Float" />
                                                        <ext:ModelField Name="Utilizada" Type="Float" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel 
                                        ID="cmPreciario" 
                                        runat="server">
                                        <Columns>
                                            <ext:Column
                                                ID="cIDPreciario"
                                                runat="server"
                                                Text="ID"
                                                Width="80"
                                                DataIndex="Clave">
                                            </ext:Column>
                                            <ext:Column
                                                ID="cConcepto"
                                                runat="server"
                                                Text="Concepto"
                                                Width="250"
                                                DataIndex="Descripcion">
                                            </ext:Column>
                                                <ext:Column
                                                ID="cCantidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Cantidad"
                                                DataIndex="Cantidad"
                                                Width="100">
                                            </ext:Column>
                                            <ext:Column
                                                ID="cUtilizada"
                                                runat="server"
                                                Align="Center"
                                                Text="Utilizada"
                                                DataIndex="Utilizada"
                                                Width="100">
                                            </ext:Column>
                                                <ext:Column
                                                ID="cUnidad"
                                                runat="server"
                                                Text="Unidad"
                                                Width="80"
                                                DataIndex="Unidad">
                                            </ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    <Listeners>
                                    <Select Fn="gpConceptos_Select"></Select>
                                        <ItemClick Fn="gpConceptos_ItemClick" />
                                        <ItemDblClick Fn="gpConceptos_ItemDblClick" />
                                    </Listeners>
                                    <SelectionModel>
                                        <ext:RowSelectionModel
                                            ID="rsmConceptos"
                                            runat="server">
                                        </ext:RowSelectionModel>
                                    </SelectionModel>
                                    <View>
                                        <ext:GridView
                                            ID="gvPreciario"
                                            runat="server"
                                            StripeRows="true">
                                            <Listeners>
                                             <ItemKeyDown Fn="gpConceptos_keyDown" />
                                            </Listeners>
                                        </ext:GridView>
                                    </View>
                                </ext:GridPanel>
                                <%--Fin conceptos filtro--%>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
            </Items> 
        </ext:FormPanel>
    </form>
</body>
</html>