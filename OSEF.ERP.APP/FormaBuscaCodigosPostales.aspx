<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaBuscaCodigosPostales.aspx.cs"
    Inherits="OSEF.ERP.APP.FormaBuscaCodigosPostales" %>

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
    <link rel="stylesheet" href="css/xHiperlink.css" />
    <link rel="stylesheet" href="css/xTextField.css" />
    <link rel="stylesheet" href="css/xFieldSet.css" />
    <link rel="stylesheet" href="css/xPanel.css" />
    <link rel="stylesheet" href="css/xButton.css" />
    <script type="text/javascript" src="js/buscacodigosPostales.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmCodigosPostales" runat="server" HideInDesign="true" /> 

    <ext:GridPanel ID="gpCodigosPostales" runat="server" Height="300" Width="960" Title="CÓDIGOS POSTALES"
        EnableColumnHide="false" EnableColumnMove="false" Header="false" TitleAlign="Left"
        StyleSpec="margin:0 auto; margin-top: 0px;" Cls="x-CustomTreePanel">
        <LeftBar>
            <ext:Toolbar ID="Toolbar1" runat="server">
                <Items>
                    <ext:NumberField 
                    ID="nfBuscar" 
                    runat="server" 
                    AutoFocus="true" 
                    EmptyText="Buscar"
                    AllowDecimals="false"
                     AllowExponential="false"
                     DecimalPrecision="0"
                     MaxLength="5"

                     EnforceMaxLength="true"
                     MaxValue="99999"
                     MinValue="0"
                     Step="1"
                   Margins="0 10px 0 0"> 
                    <DirectEvents>
                        <Change OnEvent="txtCP_Change">
                            <ExtraParams>
                                <ext:Parameter Name="vNumero" Value="App.nfBuscar.getValue()" Mode="Raw" />
                            </ExtraParams>
                        </Change>
                    </DirectEvents>  
                   
                    </ext:NumberField>
                    <ext:TreePanel ID="tpCodigosPostales" runat="server" Width="270" Height="265" Icon="BookOpen"
                        AutoScroll="true" Header="false">
                        <Listeners>
                            <BeforeLoad Fn="tpCodigosPostales_BeforeLoad" />
                        </Listeners>
                        <SelectionModel>
                            <ext:TreeSelectionModel ID="tsmCodigosPostales" runat="server">
                                <Listeners>
                                    <Select Fn="tpCodigosPostales_SelectionChange">
                                    </Select>
                                </Listeners>
                            </ext:TreeSelectionModel>
                        </SelectionModel>
                    </ext:TreePanel> 
                </Items>
            </ext:Toolbar>
        </LeftBar>
        <Store>
            <ext:Store ID="sCodigosPostales" runat="server">
                <Model>
                    <ext:Model ID="mCodigosPostales" runat="server" IDProperty="ID">
                        <Fields>
                            <ext:ModelField Name="Id" Type="String" />
                            <ext:ModelField Name="Estado" Type="String" />
                            <ext:ModelField Name="Municipio" Type="String" />
                            <ext:ModelField Name="Colonia" Type="String" />

                            <ext:ModelField Name="REstado" Type="Object" />
                            <ext:ModelField Name="EstadoDesc" Type="String" />

                            <ext:ModelField Name="RMunicipio" Type="Object" />
                            <ext:ModelField Name="MunicipioDesc" Type="String" />

                            <ext:ModelField Name="RColonia" Type="Object" />
                            <ext:ModelField Name="ColoniaDesc" Type="String" />

                            <ext:ModelField Name="Numero" Type="Int" />
                        </Fields>
                    </ext:Model>
                </Model>
            </ext:Store>
        </Store>
        <ColumnModel>
            <Columns> 
               
                  <ext:NumberColumn ID="ncCodigoPostal" runat="server" Text="C.P." Align="Left"
                    Width="90" DataIndex="Numero">
                    <Renderer Fn="rfCP" />
                </ext:NumberColumn> 
                <ext:Column ID="cEstado" runat="server" Text="ESTADO" Align="Left" Width="160" DataIndex="Estado">
                        <Renderer Fn="cEstado_Renderer" />
                </ext:Column>

                <ext:Column ID="cMunicipio" runat="server" Text="MUNICIPIO" Align="Center" Width="175"
                    DataIndex="Municipio" >
                        <Renderer Fn="cMunicipio_Renderer" />
                </ext:Column>

                <ext:Column ID="cColonia" runat="server" Text="COLONIA" Align="Left" Width="240"
                    DataIndex="Colonia" >
                        <Renderer Fn="cColonia_Renderer" />
                </ext:Column>

             
                 
            </Columns>
        </ColumnModel>
        <Listeners>
            <ItemDblClick Fn="gpCP_ItemDblClick" />
        </Listeners>
        <SelectionModel>
            <ext:RowSelectionModel ID="rsmCodigosPostales" runat="server">
            </ext:RowSelectionModel>
        </SelectionModel>
        <FooterBar>
            <ext:StatusBar ID="sbCodigosPostales" runat="server" Text="*ELIJA UN REGISTRO DE LA TABLA"
                StatusAlign="Left">
            </ext:StatusBar>
        </FooterBar>
    </ext:GridPanel>
    </form>
</body>
</html>
