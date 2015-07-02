<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pruebaagrega.aspx.cs" Inherits="OSEF.ERP.APP.pruebaagrega" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">

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

<script type="text/javascript">
    var Add = function () {


        var ID = App.FormPanel1.componentLayout.layoutCount;
        App.FormPanel1.add([
                { xtype: 'textfield', fieldLabel: 'Description', emptyText: 'txt' + ID, id: 'txt' + ID },
                { xtype: 'button', text: 'Remove',
                    listeners:
                        {
                            click:
                            {
                                fn: function (btn) {

                                 //   alert(App.FormPanel1.items.items[2].id);
                                    App.FormPanel1.remove(App.FormPanel1.items.items[2].id);
                                    App.FormPanel1.remove(App.FormPanel1.items.items[1].id);
                                }
                            }
                        }
                }
           
            ]);
           

    }

</script>
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
   
               
        <ext:FormPanel ID="FormPanel1" runat="server" Region="Center" Width="500" AutoHeight="true">
            <Items>
                                     
                        <ext:Button ID="Button1" runat="server" Text="Add">
                            <Listeners>
                                <Click Fn="Add" />
                            </Listeners>
                        </ext:Button>
                </Items>
        </ext:FormPanel>
    </form>
</body>
</html>