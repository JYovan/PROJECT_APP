<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExploradorRegistroConaproch.aspx.cs" Inherits="OSEF.ERP.APP.ExploradorRegistroConaproch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="css/customeControls.css" />
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
    <script type="text/javascript" src="js/administrador.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmAdministrador" runat="server" HideInDesign="true" />

        <ext:Hidden ID="FormatType" runat="server" />
        
        <ext:Store 
            ID="sAdminRegistro" 
            runat="server" 
            OnReadData="sAdminRegistro_RefreshData"
            OnSubmitData="sAdminRegistro_Submit"
            RemoteSort="true">            
            <Proxy>
                <ext:PageProxy>
                    <Reader>
                        <ext:ArrayReader></ext:ArrayReader>
                    </Reader>                    
                </ext:PageProxy>
            </Proxy>
            <Model>
                <ext:Model ID="mAdminRegistro" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="APaterno" Type="String" />
                        <ext:ModelField Name="AMaterno" Type="String" />
                        <ext:ModelField Name="FechaNacimiento" Type="Date" />
                        <ext:ModelField Name="Edad" Type="Int" />
                        <ext:ModelField Name="Genero" Type="String" />
                        <ext:ModelField Name="Estado" Type="String" />
                        <ext:ModelField Name="Ciudad" Type="String" />
                        <ext:ModelField Name="Telefono" Type="String" />
                        <ext:ModelField Name="Celular" Type="String" />
                        <ext:ModelField Name="Email" Type="String" />
                        <ext:ModelField Name="TipoParticipante" Type="Int" />
                        <ext:ModelField Name="TipoParticipanteNombre" Type="String" />
                        <ext:ModelField Name="OtroTipoParticipante" Type="String" />
                        <ext:ModelField Name="NombreEmpresa" Type="String" />
                        <ext:ModelField Name="Puesto" Type="String" />
                        <ext:ModelField Name="Area" Type="String" />
                        <ext:ModelField Name="Factura" Type="Boolean" />
                        <ext:ModelField Name="Pagado" Type="Boolean" />
                        <ext:ModelField Name="Respuesta01" Type="String" />
                        <ext:ModelField Name="Respuesta02" Type="Boolean" />
                        <ext:ModelField Name="Respuesta03" Type="Boolean" />
                        <ext:ModelField Name="Respuesta04" Type="String" />
                        <ext:ModelField Name="Respuesta05" Type="Int" />
                        <ext:ModelField Name="EmpresaNombre" Type="String" />
                        <ext:ModelField Name="RFC" Type="String" />
                        <ext:ModelField Name="Calle" Type="String" />
                        <ext:ModelField Name="NoExt" Type="String" />
                        <ext:ModelField Name="NoInt" Type="String" />
                        <ext:ModelField Name="Colonia" Type="String" />
                        <ext:ModelField Name="CP" Type="Auto" />
                        <ext:ModelField Name="EmpresaEstado" Type="String" />
                        <ext:ModelField Name="EmpresaCiudad" Type="String" />
                        <ext:ModelField Name="EmpresaEmail" Type="String" />
                        <ext:ModelField Name="EmpresaTelefono" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
        
        <ext:GridPanel 
            ID="gpAdminRegistro" 
            runat="server" 
            StoreID="sAdminRegistro"
            Title="Administrador de Registros" 
            Width="1000" 
            Height="420"
            StyleSpec="margin:0 auto; margin-top: 20px;"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left">
            <TopBar>
                <ext:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <ext:Button ID="btnExcel" runat="server" Text="Excel" Icon="PageExcel">
                            <Listeners>
                                <Click Handler="submitValue(#{gpAdminRegistro}, #{FormatType}, 'xls');" />
                            </Listeners>
                        </ext:Button>
                        <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                        <ext:TextField
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200"
                            Cls="textFieldCustom">
                            <Listeners>
                                <Change Fn="txtBuscar_Change" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <ColumnModel ID="ColumnModel1" runat="server">
                <Columns>
                    <ext:Column
                        ID="cID"
                        runat="server"                        
                        Text="Código"
                        Width="80"
                        Sortable="true" 
                        DataIndex="ID"
                        Align="Center"
                        Locked="true">
                    </ext:Column>
                    <ext:Column
                        ID="cNombre"
                        runat="server"
                        Text="Nombre"
                        Width="150"
                        DataIndex="Nombre"
                        Locked="true">
                    </ext:Column>
                    <ext:Column
                        ID="cAPaterno"
                        runat="server"
                        Text="Apellido paterno"
                        Width="150"
                        DataIndex="APaterno"
                        Locked="true" />
                    <ext:Column
                        ID="cAMaterno"
                        runat="server"
                        Text="Apellido materno"
                        Width="150"
                        DataIndex="AMaterno"
                        Locked="true" />
                    <ext:DateColumn
                        ID="dcFechaNacimiento"
                        runat="server"
                        Text="Fecha nacimiento"
                        Width="110"
                        DataIndex="FechaNacimiento"
                        Format="dd/m/Y"
                        Align="Center" />
                    <ext:NumberColumn
                        ID="ncEdad"
                        runat="server"
                        Text="Edad"
                        Width="50"
                        DataIndex="Edad"
                        Format="0,000"
                        Align="Center" />
                    <ext:Column
                        ID="cGenero"
                        runat="server"
                        Text="Genero"
                        Width="70"
                        DataIndex="Genero"
                        Align="Center" />
                    <ext:Column
                        ID="cEstado"
                        runat="server"
                        Text="Estado"
                        Width="140"
                        DataIndex="Estado" />
                    <ext:Column
                        ID="cCiudad"
                        runat="server"
                        Text="Ciudad"
                        Width="140"
                        DataIndex="Ciudad" />
                    <ext:Column
                        ID="cTelefono"
                        runat="server"
                        Text="Teléfono"
                        Width="140"
                        DataIndex="Telefono" />
                    <ext:Column
                        ID="cCelular"
                        runat="server"
                        Text="Celular"
                        Width="140"
                        DataIndex="Celular" />
                    <ext:Column
                        ID="cEmail"
                        runat="server"
                        Text="Correo eléctronico"
                        Width="140"
                        DataIndex="Email" />
                    <ext:NumberColumn
                        ID="cTipoParticipante"
                        runat="server"
                        Text="Tipo participante"
                        Width="100"
                        DataIndex="TipoParticipante"
                        Format="0,000"
                        Align="Center" />
                    <ext:Column
                        ID="cTipoParticipanteNombre"
                        runat="server"
                        Text="Tipo participante"
                        Width="150"
                        DataIndex="TipoParticipanteNombre" />
                    <ext:Column
                        ID="cOtroTipoParticipante"
                        runat="server"
                        Text="Otro"
                        Width="150"
                        DataIndex="OtroTipoParticipante" />
                    <ext:Column
                        ID="cEmpresa"
                        runat="server"
                        Text="Empresa"
                        Width="140"
                        DataIndex="NombreEmpresa" />
                    <ext:Column
                        ID="cPuesto"
                        runat="server"
                        Text="Puesto"
                        Width="140"
                        DataIndex="Puesto" />
                    <ext:Column
                        ID="cArea"
                        runat="server"
                        Text="Area"
                        Width="140"
                        DataIndex="Area" />
                    <ext:BooleanColumn
                        ID="bcFactura"
                        runat="server"
                        Text="Factura"
                        Width="60"
                        DataIndex="Factura"
                        TrueText="Si"
                        FalseText="No"
                        Align="Center" />
                    <ext:BooleanColumn
                        ID="bcPagado"
                        runat="server"
                        Text="Pagado"
                        Width="60"
                        DataIndex="Pagado"
                        TrueText="Si"
                        FalseText="No"
                        Align="Center">
                        <Editor>
                            <ext:Checkbox
                                ID="chkbPagado"
                                runat="server" />
                        </Editor>
                    </ext:BooleanColumn>
                    <ext:Column
                        ID="cRespuesta01"
                        runat="server"
                        Text="Respuesta01"
                        Width="150"
                        DataIndex="Respuesta01" />
                    <ext:BooleanColumn
                        ID="bcRespuesta02"
                        runat="server"
                        Text="Respuesta02"
                        Width="80"
                        DataIndex="Respuesta02"
                        TrueText="Si"
                        FalseText="No"
                        Align="Center" />
                    <ext:BooleanColumn
                        ID="bcRespuesta03"
                        runat="server"
                        Text="Respuesta03"
                        Width="80"
                        DataIndex="Respuesta03"
                        TrueText="Si"
                        FalseText="No"
                        Align="Center" />
                    <ext:Column
                        ID="cRespuesta04"
                        runat="server"
                        Text="Respuesta04"
                        Width="150"
                        DataIndex="Respuesta04" />
                    <ext:NumberColumn
                        ID="ncRespuesta05"
                        runat="server"
                        Text="Respuesta05"
                        Width="80"
                        DataIndex="Respuesta05"
                        Format="0,000"
                        Align="Center" />
                    <ext:Column
                        ID="cEmpresaNombre"
                        runat="server"
                        Text="Razón social"
                        Width="150"
                        DataIndex="EmpresaNombre" />
                    <ext:Column
                        ID="cRFC"
                        runat="server"
                        Text="RFC"
                        Width="150"
                        DataIndex="RFC" />
                    <ext:Column
                        ID="cCalle"
                        runat="server"
                        Text="Calle"
                        Width="150"
                        DataIndex="Calle" />
                    <ext:Column
                        ID="cNoExt"
                        runat="server"
                        Text="No. Ext"
                        Width="80"
                        DataIndex="NoExt"
                        Align="Center" />
                    <ext:Column
                        ID="cNoInt"
                        runat="server"
                        Text="No. Int"
                        Width="80"
                        DataIndex="NoInt"
                        Align="Center" />
                    <ext:Column
                        ID="cColonia"
                        runat="server"
                        Text="Colonia"
                        Width="150"
                        DataIndex="Colonia" />
                    <ext:NumberColumn
                        ID="ncCP"
                        runat="server"
                        Text="C.P."
                        Width="80"
                        DataIndex="CP"
                        Format="00000"
                        Align="Center" />
                    <ext:Column
                        ID="cEmpresaEstado"
                        runat="server"
                        Text="Estado"
                        Width="150"
                        DataIndex="EmpresaEstado" />
                    <ext:Column
                        ID="cEmpresaCiudad"
                        runat="server"
                        Text="Ciudad"
                        Width="150"
                        DataIndex="EmpresaCiudad" />
                    <ext:Column
                        ID="cEmpresaEmail"
                        runat="server"
                        Text="Email"
                        Width="150"
                        DataIndex="EmpresaEmail" />
                    <ext:Column
                        ID="cEmpresaTelefono"
                        runat="server"
                        Text="Teléfono"
                        Width="150"
                        DataIndex="EmpresaTelefono" />
                </Columns>
            </ColumnModel>
            <Plugins>
                <ext:CellEditing
                    ID="ceAdminRegistro"
                    runat="server">
                    <Listeners>
                        <Edit Fn="edit" />
                    </Listeners>
                </ext:CellEditing>
            </Plugins>
        </ext:GridPanel>
        
        <ext:Label ID="Label1" runat="server" />
    </form>
</body>
</html>
