<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Usuarios" %>

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
    <script type="text/javascript" src="js/libs/jquery-2.0.3.min.js"></script>
    <script type='text/javascript' src="js/menu-usuario.js"></script>
    <script type='text/javascript' src="js/usuarios.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmUsuarios" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpUsuarios"
            runat="server"
            Height="460"
            Width="990"
            Title="USUARIOS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            StyleSpec="margin:0 auto; margin-top: 20px;"  
            Header="true"
            TitleAlign="Left">
            <TopBar>
                <ext:Toolbar ID="tbUsuarios" runat="server">
                    <Items>
                        <ext:ImageButton
                            ID="imgbtnNuevo"
                            runat="server"
                            ImageUrl="assets/img/controles/new.png"
                            DisabledImageUrl=""
                            OverImageUrl=""
                            PressedImageUrl=""
                            ToolTip="Nuevo usuario"
                            Height="50"
                            Width="50">
                            <Listeners>
                                <Click Fn="imgbtnNuevo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnEditar"
                            runat="server"
                            ImageUrl="assets/img/controles/edit.png"
                            DisabledImageUrl=""
                            OverImageUrl=""
                            PressedImageUrl=""
                            ToolTip="Editar usuario"
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
                            ImageUrl="assets/img/controles/delete.png"
                            DisabledImageUrl=""
                            OverImageUrl=""
                            PressedImageUrl=""
                            ToolTip="Borrar usuario"
                            Height="50"
                            Width="50"
                            Disabled="true">
                            <Listeners>
                                <Click Fn="imgbtnBorrar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsUsuario" runat="server" Width="535">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton
                            ID="imgbtnActualizar"
                            runat="server"
                            ImageUrl="assets/img/controles/update.png"
                            DisabledImageUrl=""
                            OverImageUrl=""
                            PressedImageUrl=""
                            ToolTip="Actualizar usuarios"
                            Height="50"
                            Width="50">
                            <Listeners>
                                <Click Handler="#{sUsuarios}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
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
                                    ID="imgbtnActualizarUsuarios"
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
                    ID="sUsuarios"
                    runat="server"
                    OnReadData="OnReadData_sUsuarios">
                    <Model>
                        <ext:Model ID="mUsuarios" runat="server">
                            <Fields>
                                <ext:ModelField Name="prueba" Type="Object" />
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="NombreCompleto" Type="String">
                                    <Convert Fn="NombreCompleto_Convert" />
                                </ext:ModelField>
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="APaterno" Type="String" />
                                <ext:ModelField Name="AMaterno" Type="String" />
                                <ext:ModelField Name="Correo" Type="String" />
                                <ext:ModelField Name="EnLinea" Type="Boolean" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="Bloqueado" Type="Boolean" />
                                <ext:ModelField Name="FechaAlta" Type="Date" />
                                <ext:ModelField Name="FechaBloqueo" Type="Date" />
                                <ext:ModelField Name="UltimoAcceso" Type="Date" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sUsuarios_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:CommandColumn
                        ID="ccOpciones"
                        runat="server"
                        Width="40">
                        <Commands>
                            <ext:GridCommand Icon="ArrowDown">
                                <Menu EnableScrolling="false">
                                    <Items>
                                        <ext:MenuCommand CommandName="AccesoModulos" Text="Acceso Módulos" Icon="ArrowRight" />
                                        <ext:MenuCommand CommandName="CambiarContrasena" Text="Cambiar contraseña" Icon="ArrowRight" />
                                    </Items>
                                </Menu>
                            </ext:GridCommand>
                        </Commands>
                        <Listeners>
                            <Command Fn="ccOpciones_Command" />
                        </Listeners>
                    </ext:CommandColumn>
                    <ext:Column 
                        ID="cUsuario"
                        runat="server"
                        Text="USUARIO"
                        Align="Left"
                        Filterable="false"
                        Width="110"
                        DataIndex="ID" />
                    <ext:Column
                        ID="cNombre"
                        runat="server"
                        Text="NOMBRE"
                        Filterable="false"
                        Align="Left"
                        Width="300"
                        DataIndex="NombreCompleto" />
                    <ext:Column
                        ID="cCorreo"
                        runat="server"
                        Text="CORREO"
                        Filterable="false"
                        Align="Left"
                        Width="220"
                        DataIndex="Correo" />
                    <ext:Column
                        ID="cEstatus"
                        runat="server"
                        Text="ESTATUS"
                        Align="Center"
                        Width="120"
                        DataIndex="Estatus">
                        <Renderer Fn="cUsuario_Renderer"></Renderer>
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbEstatus"
                                runat="server">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todo)" Value="Todos" />
                                    <ext:ListItem Index="1" Text="ALTA" />
                                    <ext:ListItem Index="2" Text="BAJA" />
                                    <ext:ListItem Index="3" Text="BLOQUEADO" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                 <Listeners>
                                    <Select Fn="cmbEstatusFiltro_Select" />
                                </Listeners>
                            </ext:ComboBox>
                        </HeaderItems>
                    </ext:Column>
                    <ext:DateColumn
                        ID="dcUltimoAcceso"
                        runat="server"
                        Text="ULTIMO ACCESO"
                        Filterable="false"
                        Align="Center"
                        Width="170"
                        DataIndex="UltimoAcceso"
                        Format="dd/MM/yyyy HH:mm:ss">
                        <%--<HeaderItems>
                            <ext:ComboBox
                                ID="cmbUltimoAcceso"
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
                        </HeaderItems>--%>
                    </ext:DateColumn>
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
                                    <ext:ListItem Value="10" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Handler="#{gpUsuarios}.store.pageSize = parseInt(this.getValue(), 10); #{gpUsuarios}.store.reload();" />
                                </Listeners>
                            </ext:ComboBox>
                        </Items>
                        </ext:PagingToolbar>
                    </BottomBar>
            <Listeners>
                <ItemClick Fn="gpUsuarios_ItemClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmUsuarios"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
        </ext:GridPanel>
    </form>
</body>
</html>