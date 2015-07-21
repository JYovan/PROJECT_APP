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

</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmAccesoMenu" runat="server" />
        
        <ext:FormPanel ID="frAccesoMenu" 
            runat="server"
            Width="500"
            BodyPadding="10"
            Height="300"
            Layout="FitLayout">
            <Items>
                <ext:ItemSelector 
                    ID="isAccesoMenu" 
                    runat="server"
                    AllowBlank="false"
                    MsgTarget="Side"
                    FromTitle="No Asignados"
                    ToTitle="Asignados"
                    Cls="x-custom-form-item x-customPanelHeader x-btnCustomDefaultOver x-btnCustomDefault"
                    >
                    <Items> 
                        <ext:ListItem Text="Avances" Value="Avances" />
                        <ext:ListItem Text="Categorias" Value="Categorias" />
                        <ext:ListItem Text="Clientes" Value="Clientes"/>
                        <ext:ListItem Text="Codigos Postales" Value="Codigos Postales"/>
                        <ext:ListItem Text="Codigos PPTA" Value="Códigos PPTA"/>
                        <ext:ListItem Text="Colonia" Value="Colonia"/>
                        <ext:ListItem Text="Conceptos" Value="Conceptos"/>
                        <ext:ListItem Text="Cuadrillas" Value="Cuadrillas"/>
                        <ext:ListItem Text="Estados" Value="Estados"/>
                        <ext:ListItem Text="Explorador Mesa de Reporte" Value="Explorador Mesa de Reporte"/>
                        <ext:ListItem Text="Explorador Ordenes de Cambio" Value="Explorador Ordenes de Cambio" />
                        <ext:ListItem Text="Explorador Preciario Concepto Volumetrias" Value="Explorador Preciario Concepto Volumetrias" />
                        <ext:ListItem Text="Monitor" Value="Monitor" />
                        <ext:ListItem Text="Municipios" Value="Municipios" />
                        <ext:ListItem Text="Ordenes de cambio" Value="Ordenes de cambio"/>
                        <ext:ListItem Text="Preciarios Generales" Value="Preciarios Generales" />
                        <ext:ListItem Text="Preciarios Sucursales" Value="Preciarios Sucursales"/>
                        <ext:ListItem Text="Proveedores" Value="Proveedores" />
                        <ext:ListItem Text="Reportes y Estimaciones" Value="Reportes y Estimaciones" />
                        <ext:ListItem Text="SubCategorias" Value="SubCategorias" />
                        <ext:ListItem Text="Usuarios" Value="Usuarios" />
                        <ext:ListItem Text="Visual Gantt" Value="Visual Gantt" />
                        <ext:ListItem Text="Volumetrias" Value="Volumetrias" /> 
                    </Items> 
                </ext:ItemSelector>
            </Items>
            <DockedItems>
                

                <ext:Toolbar ID="Toolbar2" runat="server" Dock="Bottom">
                    <Defaults>
                        <ext:Parameter Name="minWidth" Value="75" />
                    </Defaults>
                    <Items>
                        <ext:ToolbarFill />
                        <ext:Button 
                        ID="Button3" 
                        runat="server" 
                        Text="Limpiar" 
                        Handler="App.ItemSelector1.reset();" />
                        <ext:Button 
                        ID="Button4" 
                        runat="server" 
                        Text="Guardar" />
                    </Items>
                </ext:Toolbar>
            </DockedItems>
        </ext:FormPanel>
    </form>
</body>
</html>
