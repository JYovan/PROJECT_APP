<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SolicitudesPrestamos.aspx.cs" Inherits="OSEF.ERP.APP.SolicitudesPrestamos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type='text/javascript' src="js/solicitudesPrestamos.js"></script>
    <script type="text/javascript">
        window.onload = cargarEstilo;
    </script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmSolicitudesPrestamos" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpSolicitudesPrestamos"
            runat="server"
            Height="420"
            Width="960"
            Title="SOLICITUDES PRESTAMOS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbSolicitudesPrestamos" runat="server">
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
                                        CustomTarget="App.gpSolicitudesPrestamos.body"
                                        Target="CustomTarget"
                                        Msg="Eliminando registro">
                                    </EventMask>
                                    <ExtraParams>
                                        <ext:Parameter Name="ID" Value="App.gpSolicitudesPrestamos.getSelectionModel().getSelection()[0].get('ID')" Mode="Raw" />
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsSolicitudesPrestamos" runat="server" Width="500">
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
                                <Click Handler="#{sSolicitudesPrestamos}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <Listeners>
                                <Change Fn="txtfBuscar_Change" />
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
                    ID="sSolicitudesPrestamos"
                    runat="server"
                    OnReadData="OnReadData_sSolicitudesPrestamos">
                    <Model>
                        <ext:Model ID="mSolicitudesPrestamos" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="NombreCompleto" Type="String">
                                    <Convert Fn="NombreCompleto_Convert" />
                                </ext:ModelField>
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="APaterno" Type="String" />
                                <ext:ModelField Name="AMaterno" Type="String" />
                                <ext:ModelField Name="Cantidad" Type="Float" />
                                <ext:ModelField Name="Plazo" Type="Int" />
                                <ext:ModelField Name="Inicio" Type="Date" />
                                <ext:ModelField Name="Fin" Type="Date" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sSolicitudesPrestamos_DataChanged" />
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
                        Width="100"
                        DataIndex="ID">
                    </ext:Column>
                    <ext:Column
                        ID="cNombreCompleto"
                        runat="server"
                        Text="NOMBRE COMPLETO"
                        Align="Left"
                        Width="350"
                        DataIndex="NombreCompleto">
                    </ext:Column>
                    <ext:NumberColumn
                        ID="ncCantidad"
                        runat="server"
                        Text="CANTIDAD"
                        Width="100"
                        Align="Center"
                        DataIndex="Cantidad">
                        <Renderer Fn="ncCantidad_Renderer" />
                    </ext:NumberColumn>
                    <ext:NumberColumn
                        ID="ncPlazo"
                        runat="server"
                        Text="PLAZO"
                        Width="110"
                        Align="Center"
                        DataIndex="Plazo"
                        Format="000">
                    </ext:NumberColumn>
                    <ext:DateColumn
                        ID="dcInicio"
                        runat="server"
                        Text="INICIO"
                        Width="150"
                        Align="Center"
                        DataIndex="Inicio"
                        Format="dd/MM/yyyy">
                    </ext:DateColumn>
                    <ext:DateColumn
                        ID="dcFin"
                        runat="server"
                        Text="FIN"
                        Width="150"
                        Align="Center"
                        DataIndex="Fin"
                        Format="dd/MM/yyyy">
                    </ext:DateColumn>
                </Columns>
            </ColumnModel>
            <View>
                <ext:GridView
                    ID="gvSolicitudesPrestamos"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <Listeners>
                <ItemClick Fn="gpSolicitudesPrestamos_ItemClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmSolicitudesPrestamos"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbSolicitudesPrestamos"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>

    </form>
</body>
</html>
