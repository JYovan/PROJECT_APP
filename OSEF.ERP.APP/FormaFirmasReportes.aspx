<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaFirmasReportes.aspx.cs" Inherits="OSEF.ERP.APP.FormaFirmasReportes" %>

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

    <script type='text/javascript' src="js/formaFirmas.js"></script>
</head>


<body>
<ext:ResourceManager ID="rmFormaFirmas" runat="server" />
    <form id="form1" runat="server">
  

               <ext:Store
                        ID="sFirmasReportes"
                        runat="server">
                        <Model>
                            <ext:Model ID="mFormaFirmas" runat="server" IDProperty="ID">
                                <Fields>
                                    <ext:ModelField Name="FirmaReviso" Type="String" />
                                    <ext:ModelField Name="FirmaAutorizo" Type="String" />
                                    <ext:ModelField Name="Modulo" Type="String" />
                       
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Listeners>
                           <Load Fn="sFirmas_Load" />
                            <Add Fn="sFirmas_Add" />
                        </Listeners>
                    </ext:Store>


         <ext:FormPanel 
        ID="fpEspecificarParametros" 
        runat="server"
        Width="580"
        Height="140"
        DefaultButton="imgbtnGuardar"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
             <ext:FieldContainer
                ID="fcFirmas"
                runat="server"
                FieldLabel="Firma Revisó"
                AnchorHorizontal="100%"
                LabelWidth="100"
                Layout="HBoxLayout">
                <Items>
                    <ext:TextField
                        ID="txtReviso"
                        runat="server"
                        Width="170"
                        EmptyText="Firma Revisó"
                        Margins="0 3 0 0"
                         AllowBlank="false">
                       <Listeners>
                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                            </Listeners>
                    </ext:TextField>
                      <ext:TextField
                        ID="txtAutorizo"
                        runat="server"
                        Width="275"
                        FieldLabel="Firma Autorizó"
                        EmptyText="Firma Autorizó"
                        Margins="0 3 0 0"
                        AllowBlank="false">
                       <Listeners>
                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                            </Listeners>
                    </ext:TextField>
                </Items>
            </ext:FieldContainer>
        </Items>


            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Especifica el personal que firmará el documento', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);"/>
            </Listeners>
            <BottomBar>
                <ext:StatusBar ID="sbParametros1" 
                runat="server"
                Cls="x-colorToolbar" 
                Text="Completa la información" />
            </BottomBar>
         <Buttons>
                <ext:ImageButton
                    ID="imgbtnGuardar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Guardar.png" 
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Guardar" 
                    Height="50" 
                    Width="50"
                    Disabled="true">
                   <DirectEvents>
                        <Click OnEvent="imgbtnGuardar_Click">
                            <EventMask ShowMask="true" Msg="Registrando información..." />
                            <ExtraParams>
                                <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                            </ExtraParams>
                        </Click>
                    </DirectEvents>
                </ext:ImageButton>
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
            </Buttons>
        </ext:FormPanel>
    
    </form>
</body>
</html>
