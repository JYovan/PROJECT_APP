<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaReporteVolumetria.aspx.cs" Inherits="OSEF.ERP.APP.Previa" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vista Preliminar</title>
    <link rel="shortcut icon" href="images/myApp.ico" />
    <link rel="stylesheet" href="css/preliminar.css" />
</head>
<body class="xCustomBody">
    <ext:ResourceManager ID="rmFormaReporteOrdenCambioD" runat="server" />
    <form id="form1" runat="server">
    <ext:FormPanel ID="fpEspecificarParametros" runat="server" Width="280" Height="95"
        BodyPadding="10" DefaultAnchor="100%">
        <Items>
            <ext:FieldContainer ID="fcFirmas" runat="server" AnchorHorizontal="100%" LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                </Items>
            </ext:FieldContainer>
        </Items>
        <Content>
            <div align="center">
                <br />
                <asp:ImageButton ID="imgbtnPop" runat="server" OnClick="imgbtnExportarReporteVolumetrias_Click" Height="30"
                    Width="30" class="imgs" ImageUrl="assets/img/controles/vp.png" />
              <%--  <asp:ImageButton ID="imgbtnXLS" runat="server" OnClick="toXls" Height="30"
                    Width="30" class="imgs" ImageUrl="assets/img/controles/ExcelNormal.png" />
                <asp:ImageButton ID="imgbtnPDF" runat="server" OnClick="toPDF" Height="30" Width="30"
                    class="imgs" ImageUrl="assets/img/controles/pdfNormal.png" />--%>
            </div>
        </Content>
        <BottomBar>
            <ext:StatusBar ID="sbParametros1" runat="server" Cls="x-colorToolbar" Text="Clic en la imagen para imprimir" />
        </BottomBar>
    </ext:FormPanel>
    </form>
</body>
</html> 