<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InnerForm.aspx.cs" Inherits="OSEF.ERP.APP.InnerForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmInnerForm" runat="server" HideInDesign="true" Theme="Neptune" />

        <ext:TextField
            ID="txtfText1"
            runat="server"
            FieldLabel="Test1">
        </ext:TextField>

        <ext:TextField
            ID="TextField2"
            runat="server"
            FieldLabel="Test2">
        </ext:TextField>
    </form>
</body>
</html>
