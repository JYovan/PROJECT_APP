<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Colonias.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Colonias" %>

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

    <script type="text/javascript" src="js/colonias.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
    <div>
        <ext:ResourceManager ID="rmColonias" runat="server">
        </ext:ResourceManager>

       <ext:GridPanel
            ID="gpColonias"
            runat="server"
            Height="420"
            Width="960"
            Title="COLONIAS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbColonias" runat="server">
                    <Items>
                        <ext:ImageButton
                            ID="imgbtnNuevo"
                            runat="server"
                            ImageUrl="assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="assets/img/controles/nuevo-disable.png"
                            OverImageUrl="assets/img/controles/nuevo-over.png"
                            PressedImageUrl="assets/img/controles/nuevo-pressed.png"
                            Height="50"
                            Width="50">
                            <Listeners>
                                <Click Fn="imgbtnNuevo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnEditar"
                            runat="server"
                            ImageUrl="assets/img/controles/edit-normal.png"
                            DisabledImageUrl="assets/img/controles/edit-disable.png"
                            OverImageUrl="assets/img/controles/edit-over.png"
                            PressedImageUrl="assets/img/controles/edit-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                            <Listeners>
                                <Click Fn="imgbtnEditar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnBorrar"
                            runat="server"
                            ImageUrl="assets/img/controles/delete-normal.png"
                            DisabledImageUrl="assets/img/controles/delete-disable.png"
                            OverImageUrl="assets/img/controles/delete-over.png"
                            PressedImageUrl="assets/img/controles/delete-pressed.png"
                            Height="50"
                            Width="50"
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
                                        CustomTarget="App.gpColonias.body"
                                        Target="CustomTarget"
                                        Msg="Eliminando registro">
                                    </EventMask>
                                    <ExtraParams>
                                        <ext:Parameter Name="ID" Value="App.gpColonias.getSelectionModel().getSelection()[0].get('ID')" Mode="Raw">
                                        </ext:Parameter>
                                    </ExtraParams>
                                </Click>
                             </DirectEvents>
                        </ext:ImageButton>

                           <ext:ComboBox
                                ID="cmbEstado"
                                runat="server"
                                DisplayField="Descripcion"
                                ValueField="ID"
                                 Editable="true"
                                  Width="220"
                                  FieldLabel="Estado"
                            MatchFieldWidth="true"
                            LabelWidth="50"
                            ForceSelection="true"
                            QueryMode="Local"
                            TypeAhead="true">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                         
                                <Store>
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
                                </Store>
                                <DirectEvents>
                                <Change OnEvent="cmbEstado_Change">
                                    <ExtraParams>
                                        <ext:Parameter Name="valor" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Change>
                            </DirectEvents>
                            </ext:ComboBox>

                    
                          <ext:ComboBox
                                ID="cmbMunicipio"
                                runat="server"
                                DisplayField="Descripcion"
                                ValueField="ID"
                                LabelWidth="70"
                                Width="250"
                                 Editable="true"
                            MatchFieldWidth="true"
                            FieldLabel="Municipio"
                            ForceSelection="true"
                            QueryMode="Local"
                            TypeAhead="true">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Store>
                                    <ext:Store
                                        ID="sMunicipios"
                                        runat="server">
                                        <Model>
                                            <ext:Model ID="mMunicipios" runat="server" IDProperty="ID">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <DirectEvents>
                                <Change OnEvent="cmbMunicipio_Select">
                                    <ExtraParams>
                                        <ext:Parameter Name="valorMunicipio" Value="App.cmbMunicipio.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Change>
                            </DirectEvents>
                            </ext:ComboBox>

                            <ext:ToolbarSpacer ID="tbsPreciarios" runat="server" Width="15">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton
                            ID="imgbtnActualizar"
                            runat="server"
                            ImageUrl="assets/img/controles/update-normal.png"
                            DisabledImageUrl="assets/img/controles/update-disable.png"
                            OverImageUrl="assets/img/controles/update-hover.png"
                            PressedImageUrl="assets/img/controles/update-pressed.png"
                            Height="50"
                            Width="50">
                           <Listeners>
                                <Click Handler="#{sColonias}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
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
                <ext:Store
                    ID="sColonias"
                    runat="server"
                    OnReadData="OnReadData_sColonias">
                    <Model>
                        <ext:Model ID="mColonias" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="Descripcion" Type="String" />
                                <ext:ModelField Name="Estado" Type="String" />
                                <ext:ModelField Name="Municipio" Type="String" />
                                <ext:ModelField Name="REstado" Type="Object" />
                                <ext:ModelField Name="RMunicipio" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sColonias_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cID"
                        runat="server"
                        Text="ID"
                        Align="Center"
                        Width="200"
                        DataIndex="ID">
                      
                    </ext:Column>
                    <ext:Column
                        ID="cColonia"
                        runat="server"
                        Text="COLONIA"
                        Align="Left"
                        Width="700"
                        DataIndex="Descripcion">
                    </ext:Column>
                </Columns>
            </ColumnModel>
             <Listeners>
                <ItemClick Fn="gpColonias_ItemClick" />
            </Listeners>
            <View>
                <ext:GridView
                    ID="gvColonias"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmColonias"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbColonias"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>
    </div>
    </form>
</body>
</html>
