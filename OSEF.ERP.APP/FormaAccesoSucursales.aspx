<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaAccesoSucursales.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaAccesoSucursales" %>

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
        <ext:ResourceManager ID="rmAccesoSucursales" runat="server" />
        
        <ext:FormPanel ID="frAccesoSucursales" 
            runat="server"
            Width="500"
            BodyPadding="10"
            Height="300"
            Layout="FitLayout">
            <Items>
                <ext:ItemSelector 
                    ID="isAccesoSucursales" 
                    runat="server"
                    AllowBlank="false"
                    MsgTarget="Side"
                    FromTitle="No Asignadas"
                    ToTitle="Asignadas"
                    Cls="x-custom-form-item x-customPanelHeader x-btnCustomDefaultOver x-btnCustomDefault"
                    >
                    <Items>
                        <ext:ListItem Text="Sucursal 1" Value="1" />
                        <ext:ListItem Text="Sucursal 2" Value="2" />
                        <ext:ListItem Text="Sucursal 3" Value="3" />
                        <ext:ListItem Text="Sucursal 4" Value="4" />
                        <ext:ListItem Text="Sucursal 5" Value="5" />
                    </Items>
                    <SelectedItems>
                        <ext:ListItem Value="3" />
                        <ext:ListItem Value="4" />
                        <ext:ListItem Value="5" />
                    </SelectedItems>
                </ext:ItemSelector>
            </Items>
            <DockedItems>
                

                <ext:Toolbar ID="tlAccesoSucursales" runat="server" Dock="Bottom">
                    <Defaults>
                        <ext:Parameter Name="minWidth" Value="75" />
                    </Defaults>
                    <Items>
                        <ext:ToolbarFill />
                        <ext:Button 
                        ID="btnLimpiar" 
                        runat="server" 
                        Text="Limpiar" 
                        Handler="App.ItemSelector1.reset();" 
                        Cls="cbtn" />
                        <ext:Button 
                        ID="btnGuardar" 
                        runat="server" 
                        Text="Guardar" 
                          Cls="cbtn" />
                    </Items>
                </ext:Toolbar>
            </DockedItems>
        </ext:FormPanel>
    </form>
</body>
</html>
