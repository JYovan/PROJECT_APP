<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaBuscaCliente.aspx.cs" Inherits="OSEF.ERP.APP.FormaBuscaCliente" %>

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
    <link rel="stylesheet" href="css/xTabPanel.css" />
    <link rel="stylesheet" href="css/xComboBox.css" />
    <link rel="stylesheet" href="css/xCustomChart.css" />
    <link rel="stylesheet" href="css/xIcons.css" />
    <link rel="stylesheet" href="css/xToolbar.css" />
    <link rel="stylesheet" href="css/xLabel.css" />
    <link rel="stylesheet" href="css/xTreePanel.css" />
    <link rel="stylesheet" href="css/xHiperlink.css" />
    <link rel="stylesheet" href="css/xTextField.css" />
    <link rel="stylesheet" href="css/xFieldSet.css" />
    <link rel="stylesheet" href="css/xPanel.css" />
    <link rel="stylesheet" href="css/xButton.css" />
    <script type='text/javascript' src="js/clientes.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmClientes" runat="server" HideInDesign="true" />
        
        <ext:GridPanel
            ID="gpClientes"
            runat="server"
            Height="350"
            Width="550"
            Title=""
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left">
            <TopBar>
                <ext:Toolbar ID="tbCodigos" runat="server">
                    <Items>
                        <ext:ToolbarSpacer ID="tbsCodigos" runat="server" Width="260">
                        </ext:ToolbarSpacer>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                             Height="25" 
                            Width="200">
                            <Listeners>
                                <Change Fn="txtBuscarCliente_Change" />
                            </Listeners>
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnActualizarGrupoMenu"
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
                    ID="sClientes"
                    runat="server"
                    OnReadData="OnReadData_sClientes">
                    <Model>
                        <ext:Model ID="mClientes" runat="server" IDProperty="ID">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="NombreCompleto" Type="String">
                                    <Convert Fn="NombreCompleto_Convert" />
                                </ext:ModelField>
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="APaterno" Type="String" />
                                <ext:ModelField Name="AMaterno" Type="String" />
                                <ext:ModelField Name="FechaNacimiento" Type="Date" />
                                <ext:ModelField Name="Correo" Type="String" />
                                <ext:ModelField Name="Telefono" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sClientes_DataChanged" />
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
                        Width="90"
                        DataIndex="ID" />
                    <ext:Column 
                        ID="cSocio"
                        runat="server"
                        Text="CLIENTE"
                        Align="Left"
                        Width="280"
                        DataIndex="NombreCompleto" />  
                      <ext:Column
                        ID="cEstatus"
                        runat="server"
                        Text="ESTATUS"
                        Align="Center"
                        Width="110"
                        DataIndex="Estatus" />                   
                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemDblClick Fn="gpBuscaClientes_ItemDblClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmCodigos"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbClientes"
                    runat="server"
                    Text=""
                    StatusAlign="Left"> 
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel> 
    </form>
</body>
</html>
