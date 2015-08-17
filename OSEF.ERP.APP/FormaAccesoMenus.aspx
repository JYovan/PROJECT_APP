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
        <ext:GridPanel 
            ID="GridPanel1" 
            runat="server"  
            Header="false" 
            Width="500"
            Height="300">
            <Store>
                <ext:Store ID="sAccesos" runat="server" PageSize="50">
                    <Model>
                        <ext:Model ID="Model1" runat="server" IDProperty="ID">
                            <Fields>
                                <ext:ModelField Name="ID" Type="Int" />
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="Permiso" Type="Boolean" /> 
                            </Fields>
                        </ext:Model>
                    </Model>
                  </ext:Store>
            </Store> 
            <ColumnModel ID="ColumnModel1" runat="server">
		        <Columns>  
                    <ext:Column ID="cNombre" runat="server" Text="MODULO" Align="Center" Width="400" DataIndex="Nombre">
                    </ext:Column>
                    <ext:CheckColumn ID="chkPermiso" runat="server" Text="PERMISO" Align="Center" Width="100" DataIndex="Permiso" Editable="true">
                    </ext:CheckColumn> 
		        </Columns>
            </ColumnModel>
            <BottomBar>
                <ext:PagingToolbar ID="PagingToolbar1" runat="server">
                    <Items>
                        <ext:Button ID="Button1" runat="server" Text="Submit Selected Records" StandOut="true">
                           <%-- <DirectEvents>
                                <Click OnEvent="Button1_Click">
                                    <EventMask ShowMask="true" />
                                </Click>
                            </DirectEvents>--%>
                        </ext:Button>
                    </Items>
                </ext:PagingToolbar>
            </BottomBar>        
        </ext:GridPanel>
    </form>
</body>
</html>
