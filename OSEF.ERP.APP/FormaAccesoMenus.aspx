<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaAccesoMenus.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaAccesosMenu" %>

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
    <script type='text/javascript' src="js/usuarios.js"></script>

</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmAccesoMenu" runat="server" />
        <ext:GridPanel 
            ID="GridPanel1" 
            runat="server"  
            Header="false" 
            Width="650"
            Height="350">
            <Store>
                <ext:Store ID="sAccesos" runat="server" PageSize="50">
                    <Model>
                        <ext:Model ID="Model1" runat="server" IDProperty="ID">
                            <Fields>
                                <ext:ModelField Name="ID" Type="Int" />
                                <ext:ModelField Name="UsuarioID" Type="String" />
                                <ext:ModelField Name="ModuloID" Type="String" />
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="Permiso" Type="Boolean" /> 
                            </Fields>
                        </ext:Model>
                    </Model>
                  </ext:Store>
            </Store> 
            <ColumnModel ID="ColumnModel1" runat="server">
		        <Columns>  
                    <ext:Column ID="cNombre" runat="server" Text="MODULO" Align="Center" Width="465" DataIndex="Nombre">
                    </ext:Column>
                    <ext:CheckColumn ID="chkPermiso" runat="server" Text="PERMISO" Align="Center" Width="165" DataIndex="Permiso" Editable="true">
                    <HeaderItems> 
                        <ext:Checkbox ID="chkTodos" 
                            runat="server"
                            Name="chkTodos" 
                            Checked="false" >
                            <Listeners>
                                <Change Fn="setCheckedAllRecords_Permision"></Change> 
                            </Listeners>
                        </ext:Checkbox>
                    </HeaderItems>
                    </ext:CheckColumn> 
		        </Columns>
            </ColumnModel>
            <BottomBar>
            </BottomBar>  
            <Buttons>
               <%-- <ext:ImageButton 
                    ID="imgbtnModule" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Modulo.png" 
                    DisabledImageUrl="assets/img/controles/ModuloDisabled.png"
                    OverImageUrl="assets/img/controles/ModuloOver.png" 
                    PressedImageUrl="assets/img/controles/ModuloPressed.png" 
                    ToolTip="Nuevo Modulo" 
                    Height="50" 
                    Width="50"> 
                    <Listeners>
                        <Click Fn="imgbtnNuevoModulo"></Click>
                    </Listeners>
                </ext:ImageButton>--%>
            
                
                <ext:ImageButton 
                    ID="imgbtnCancelar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Cancelar.png" 
                    DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                    OverImageUrl="assets/img/controles/CancelarOver.png" 
                    PressedImageUrl="assets/img/controles/CancelarPressed.png" 
                    ToolTip="Cancelar" 
                    Height="50" 
                    Width="50">
                    <Listeners>
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
                </ext:ImageButton>
                
                        <ext:ImageButton
                    ID="imgbtnGuardar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Guardar.png" 
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Guardar" 
                    Height="50" 
                    Width="50" > 
                    <DirectEvents>
                        <Click OnEvent="imgbtnGuardar_Click" Success="onSubmitData">
                            <EventMask ShowMask="true" Msg="Guardando información..." />
                            <ExtraParams>
                                <ext:Parameter Name="permisos" Value="getUpdatedRecords()" Mode="Raw" />
                            </ExtraParams>
                        </Click>
                    </DirectEvents>
                </ext:ImageButton>
            </Buttons>    
        </ext:GridPanel>
    </form>
</body>
</html>
