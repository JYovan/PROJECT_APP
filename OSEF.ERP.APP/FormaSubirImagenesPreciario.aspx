<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaSubirImagenesPreciario.aspx.cs" Inherits="OSEF.ERP.APP.FormaSubirImagenesPreciario" %>

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
    <script type="text/javascript" src="js/subirImagenesPreciario.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaSubirImagenesPreciario" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpSubirImagenesPreciario"
            runat="server"
            Width="590"
            Height="300"
            EnableColumnHide="false"
            EnableColumnMove="false">
            <Store>
                <ext:Store ID="sSubirImagenesPreciario" runat="server">
                    <Model>
                        <ext:Model ID="mSubirImagenesPreciario" runat="server" IDProperty="ID">
                            <Fields>
                                <ext:ModelField Name="ID" Type="Int" />
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="Tamano" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="Progreso" Type="String" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column
                        ID="cNombre"
                        runat="server"
                        Align="Left"
                        Text="Nombre"
                        DataIndex="Nombre"
                        Width="200" />
                    <ext:Column
                        ID="cTamano"
                        runat="server"
                        Align="Center"
                        Text="Tamaño"
                        DataIndex="Tamano"
                        Width="100">
                        <Renderer Format="FileSize" />
                    </ext:Column>
                    <ext:Column
                        ID="cEstatusIcon"
                        runat="server"
                        Text="&nbsp;"
                        DataIndex="Estatus"
                        Width="30">
                        <Renderer Fn="cEstatusIcon_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cEstatus"
                        runat="server"
                        Align="Center"
                        Text="Estatus"
                        DataIndex="Estatus"
                        Width="100" />
                    <ext:ProgressBarColumn
                        ID="pbcProgreso"
                        runat="server"
                        Text="Progreso"
                        DataIndex="Progreso"
                        Width="160" />
                </Columns>
            </ColumnModel>
            <TopBar>
                <ext:Toolbar ID="tbSubirImagenesPreciario" runat="server">
                    <Items>
                        <ext:MultiUpload
                            ID="muSubirImagenesPreciario"
                            runat="server"
                            OnFileUpload="muSubirImagenesPreciario_OnFileUpload"
                            FileDropAnywhere="true"
                            FileSizeLimit="15 MB"
                            FileTypes="*.png;*.jpg;*.jpeg;*.gif"
                            FileTypesDescription="Archivos de imagen"
                            FileUploadLimit="100"
                            FileQueueLimit="0">
                            <Button>
                                <ext:Button ID="btnSubirImagenesPreciario" runat="server" Text="Subir..." />
                            </Button>
                            <Listeners>
                                <SwfUploadLoadFailed Fn="loadFailed" />
                                <FileSelected Fn="fileSelected" />
                                <UploadStart Handler="updateRecord(file.id, 'Estatus', 'Enviando');" />
                                <UploadProgress Handler="updateRecord(file.id, 'Progreso', bytesComplete / bytesTotal);" />
                                <UploadComplete Handler="updateRecord(file.id, 'Progreso', 1); updateRecord(file.id, 'Estatus', 'Cargado');" />
                                <UploadAborted Handler="updateRecord(file.id, 'Estatus', 'Abortado');" />
                                <UploadRemoved Handler="var store = this.up('grid').store; store.remove(store.getById(file.id));" />
                                <UploadError Fn="uploadError" />
                                <FileSelectionError Fn="fileSelectionError" />
                            </Listeners>
                        </ext:MultiUpload>
                        <ext:ToolbarSeparator />
                        <ext:Button
                            ID="btnIniciar"
                            runat="server"
                            Text="Iniciar"
                            Icon="Tick"
                            Handler="onUploadImages(); " />
                        <ext:Button
                            ID="btnCancelar"
                            runat="server"
                            Text="Cancelar"
                            Icon="Decline"
                            Handler="abortUpload" />
                        <ext:Button
                            ID="btnCancelarTodo"
                            runat="server"
                            Text="Cancelar Todo"
                            Icon="Decline"
                            Handler="#{muSubirImagenesPreciario}.abortAllUploads();" />
                        <ext:Button
                            ID="btnEliminar"
                            runat="server"
                            Text="Eliminar"
                            Icon="Delete"
                            Handler="removeUpload" />
                        <ext:Button
                            ID="btnEliminarTodo"
                            runat="server"
                            Text="Eliminar Todo"
                            Icon="Delete"
                            Handler="#{muSubirImagenesPreciario}.removeAllUploads();" />
                    </Items>
                </ext:Toolbar>
            </TopBar>
        </ext:GridPanel>
    </form>
</body>
</html>
