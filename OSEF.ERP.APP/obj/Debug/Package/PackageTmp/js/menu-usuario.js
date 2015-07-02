var timer = 50;

/*Funcion que realiza el fade in y el fade out*/
$(document).ready(function () {
    $("#otroUsuario").click(function (event) {
        parent.App.pCentro.getLoader().load('Menu.aspx');
    });

    //Abrir tablero de ahorros Caja Popular Hidrocalida
    $("#ahorros").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('tAhorros.aspx');
        });
    });

    $("#avances").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Avances.aspx');
        });
    });

    $("#gruposMenu").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('GruposMenu.aspx');
        });
    });

    $("#gruposMenu2").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('GruposMenu2.aspx');
        });
    });

    $("#usuarios").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Usuarios.aspx');
        });
    });

    $("#usuarios2").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Usuarios2.aspx');
        });
    });

    $("#menus").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Menus.aspx');
        });
    });

    $("#menus2").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Menus2.aspx');
        });
    });

    $("#articulos").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Articulos.aspx');
        });
    });

    $("#profesiones").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Profesiones.aspx');
        });
    });

    $("#finalidades").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Finalidades.aspx');
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

    $("#conceptos2").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Conceptos2.aspx');
        });
    });

    $("#cuentascontables").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('CuentasContables.aspx');
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

    $("#estados2").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Estados2.aspx');
        });
    });

    $("#municipios").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Municipios.aspx');
        });
    });

    $("#municipios2").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Municipios2.aspx');
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

    $("#codigospostales2").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('CodigosPostales2.aspx');
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

    $("#gantt").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            //            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Principal2.aspx');
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

    $("#solicitudesPrestamos").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('SolicitudesPrestamos.aspx');
        });
    });

    $("#certificadosInversiones").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('CertificadosInversiones.aspx');
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

    $("#eRegistro").click(function (event) {
        $("#contenedor").fadeOut(timer, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.pCentro.getLoader().load('ExploradorRegistroConaproch.aspx');
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

});