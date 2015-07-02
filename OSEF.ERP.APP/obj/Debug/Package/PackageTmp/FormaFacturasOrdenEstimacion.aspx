<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaFacturasOrdenEstimacion.aspx.cs" Inherits="OSEF.ERP.APP.FormaFacturasOrdenEstimacion" %>

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
    <link rel="stylesheet" href="css/xDisplayImages.css"/>

    <%--FancyGallery--%>
	<script type="text/javascript" src="fancylibs/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="fancylibs/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="fancylibs/jquery.fancybox.css?v=2.1.5" media="screen" />


    <script type="text/javascript">
        $(document).ready(function () {

            $('.fancybox').fancybox();

            // Remove padding, set opening and closing animations, close if clicked and disable overlay
            $(".fancybox-effects-d").fancybox({
                padding: 0,

                openEffect: 'elastic',
                openSpeed: 150,

                closeEffect: 'elastic',
                closeSpeed: 150,

                closeClick: true,

                helpers: {
                    overlay: null
                }
            });

        });
        var onDelete_image = function (conceptoID, ID, nombreIMG) {

            Ext.Msg.show({
                id: 'msgEliminaImagen',
                title: 'Advertencia',
                msg: '¿Estás seguro de eliminar la factura: '+nombreIMG+'? ',
                buttons: Ext.MessageBox.YESNO,
                onEsc: Ext.emptyFn,
                closable: false,
                fn: function (btn) { 
                    if (btn === 'yes') {
                        App.direct.BorrarFactura(conceptoID, ID, nombreIMG);
                        App.sImagenesOrdenEstimacionD.reload({
                            callback: function () {
                                App.direct.onLoadDataFactura();
                            }
                        });
                        window.parent.App.wEmergente.getBody().App.sConceptos.reload({
                            callback: function () {
                                window.parent.App.wEmergente.getBody().App.direct.sOrdenMantenimiento_Load();
                            }
                        });
                    }
                },
                icon: Ext.MessageBox.WARNING
            });
        };
	</script>

    <ext:XScript ID="XScript1" runat="server">
        <script>
            var prepareData = function (data) {
                data.Nombre = Ext.util.Format.ellipsis(data.Nombre, 500);
                return data;
            };
        </script>
    </ext:XScript>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmImgenesOrdenEstimacionD" runat="server" HideInDesign="true" />

        <ext:Store ID="sImagenesOrdenEstimacionD" runat="server" >
            <Model>
                <ext:Model ID="mImagenesOrdenEstimacionD" runat="server">
                    <Fields>
                        <ext:ModelField Name="MovID" Type="Int" />
                        <ext:ModelField Name="Concepto" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="Direccion" Type="String" />      
                        <ext:ModelField Name="Usuario" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>

         <ext:Panel 
            ID="fpImagenesOrdenEstimacionD"
            runat="server" 
            BodyStyle="background-color:#fff;"
            Height="479"
            Width="660"
            AutoScroll="true">
            <Items>
                <ext:DataView
                    ID="dvImagenesOrdenEstimacionD"
                    runat="server"
                    ItemSelector="div.thumb-wrap"
                    EmptyText="No hay imagenes para mostrar"
                    StoreID="sImagenesOrdenEstimacionD"
                    MultiSelect="true"
                    OverItemCls="x-item-over"
                    TrackOver="true"
                    Cls="images-view">
                    <Tpl ID="Tpl1" runat="server">
                        <Html>
                            <tpl for=".">
                                <div class="thumb-wrap" id="{Nombre}">
                                    <div class="thumb">
                                        <a class="fancybox-effects-d" href="{Direccion}" title="{Concepto}">
                                            <img src="{Direccion}" title="{Nombre}"></img>
                                        </a>
                                    </div>
                                    <span class="x-editable">{Nombre} 
                                        <img src="resources/images/delete.gif" style="margin-top:10px" onclick="onDelete_image('{Concepto}','{MovID}','{Nombre}');" title="Borrar"></img>
                                    </span>
                                </div>    
                            </tpl>
                            <div class="x-clear"></div>
                        </Html>
                    </Tpl>
                    <PrepareData Fn="prepareData" />
                </ext:DataView>
            </Items>
         </ext:Panel>
    </form>
</body>
</html>