var timer = 50;

/*Funcion que realiza el fade in y el fade out*/
$(document).ready(function () {
    $("#otroUsuario").click(function (event) {
        parent.App.pCentro.getLoader().load('Menu.aspx');
    });

    $("#usuarios").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Usuarios.aspx');
        });
    });

    $("#articulos").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Articulos.aspx');
        });
    }); 

    $("#sucursal").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Sucursales.aspx');
        });
    });

    $("#conceptos").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Conceptos.aspx');
        });
    });  

    $("#categorias").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Categorias.aspx');
        });
    });

    $("#subcategorias").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Subcategorias.aspx');
        });
    });

    $("#proveedores").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Proveedores.aspx');
        });
    });

    $("#estados").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Estados.aspx');
        });
    });
 
    $("#municipios").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Municipios.aspx');
        });
    });
  
    $("#colonias").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('colonias.aspx');
        });
    });

    $("#codigospostales").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('CodigosPostales.aspx');
        });
    });
  
    $("#socios").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Clientes.aspx');
        });
    });

    $("#preciarios").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Preciarios.aspx');
        });
    });

    $("#volumetrias").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('VolumetriasPreciario.aspx');
        });
    });

    $("#reportes").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Reportes.aspx');
        });
    });

    $("#exploradorPreciarioConcepto").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('ExploradorPreciarioConceptos.aspx');
        });
    });

    $("#clientes").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Clientes.aspx');
        });
    });

    $("#preciariosGenerales").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('PreciariosGenerales.aspx');
        });
    });
 
    $("#OrdenesEstimaciones").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('OrdenesEstimaciones.aspx');
        });
    });

    $("#exploradorPreciarioConceptosGenerales").click(function (event) {

        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('ExploradorPreciariosConceptosGenerales.aspx');
        });
    });

    $("#cuadrillas").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('Cuadrillas.aspx');
        });
    });

    $("#MesaDeReporte").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('ExploradorMesaDeReporte.aspx');
        });
    });

    $("#CodigoFallas").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('CodigoFallas.aspx');
        });
    });

    $("#ordenesCambio").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('OrdenesCambios.aspx');
        });
    });

    parent.App.direct.getData({
        success: function (result) {
            $("#lPlantas").attr("href", 'http://plantas.ibuho.mx:81/index.php?IdProcess=1&txtUsr=' + result.Nombre + '&txtPwd=' + result.Contrasena);
          //  $("#lPlantas").attr("href", 'http://localhost:81/PlantasElectricas/index.php?IdProcess=1&txtUsr=' + result.Nombre + '&txtPwd=' + result.Contrasena);
        },
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    // Por el moemnto no estará disponible
    $("#avances").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Avances.aspx');
        });
    });

    //Abre el project para programar la obra
    $("#gantt").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('ProgramasObras.aspx');
        });
    });

//    parent.App.direct.getData({
//        success: function (result) {
//            $("#gantt").attr("href", 'http://programaobra.ibuho.mx/index.html' + '?txtUsr=' + result.Nombre + '&txtPwd=' + result.Contrasena);
//        },
//        failure: function (errorMsg) {
//            Ext.Msg.alert('Error', errorMsg);
//        }
//    });
});