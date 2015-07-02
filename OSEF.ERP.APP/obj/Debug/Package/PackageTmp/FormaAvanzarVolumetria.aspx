<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaAvanzarVolumetria.aspx.cs" Inherits="OSEF.ERP.APP.FormaAvanzarVolumetria" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/avance.js"></script>
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
    <script type='text/javascript' src="js/volumetrias.js"></script>
    <script type="text/javascript" src="js/avanzarVolumetria.js"></script>
</head>
<body>
    <ext:ResourceManager 
    ID="rmAvanzarVolumetria" 
    runat="server" 
    HideInDesign="true" />
 
    <ext:Panel 
    ID="pAvanzarMovimiento" 
    runat="server" 
    Width="200" 
    BodyPadding="10">
        <Items>
            <ext:FieldSet 
            ID="fsAvanzarMovimiento" 
            runat="server" 
            DefaultAnchor="100%">
                <Items>
                    <ext:RadioGroup 
                    ID="rgAvanzarMovimiento" 
                    runat="server" 
                    ColumnsNumber="1">
                        <Items>
                            <ext:Radio 
                            ID="rFin" 
                            runat="server" 
                            InputValue="Fin" 
                            BoxLabel="Fin" />
                        </Items>
                    </ext:RadioGroup>
                </Items>
            </ext:FieldSet>
        </Items>
        <Buttons>
            <ext:Button 
            ID="btnAceptar" 
            runat="server" 
            Text="Aceptar" 
            MarginSpec="0 10 0 0">
                <DirectEvents>
                    <Click 
                    OnEvent="btnAceptar_Click" 
                    Success="btnAceptar_Click_Success" >
                        <ExtraParams>
                             <ext:Parameter Name="Fin" Value="App.rFin.getValue()" Mode="Raw" />
                            
                          <ext:Parameter Name="ID" Value="window.parent.App.sVolumetria.getAt(0).get('ID')" Mode="Raw" />
                        </ExtraParams>
                       <EventMask ShowMask="true" Target="CustomTarget" CustomTarget="window.parent" Msg="Avanzando..." />
                    </Click>
                </DirectEvents>
                  
            </ext:Button>
            <ext:Button 
            ID="btnCancelar" 
            runat="server" 
            Text="Cancelar" 
            MarginSpec="0 10 0 0">
                    <Listeners>
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Panel>
</body>
</html>
