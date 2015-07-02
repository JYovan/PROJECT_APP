<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="OSEF.ERP.APP.Prueba" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var btnWindow_Click = function () {
            App.wEmergente.load('FormaCambiarContrasena.aspx');
            App.wEmergente.setHeight(258);
            App.wEmergente.setWidth(420);
            App.wEmergente.center();
            App.wEmergente.setTitle('Inner Form in a Window');
            App.wEmergente.show();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmDefault" runat="server" HideInDesign="true" Theme="Neptune" />

        <ext:Button
            ID="btnWindow"
            runat="server"
            Text="Load Window">
            <Listeners>
                <Click Fn="btnWindow_Click" />
            </Listeners>
        </ext:Button>

        <ext:Window 
            ID="wEmergente"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="lEmergente" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>
    </form>
</body>
</html>
