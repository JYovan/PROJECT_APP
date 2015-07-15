//Cambio en los datos del tablero
var sExploradorPConcepto_DataChanged = function () {
    if (App.sPreciarioConcepto.getCount() > 1 || App.sPreciarioConcepto.getCount() == 0) {
        App.sbExploradorPreciarioConcepto.setText(App.sPreciarioConcepto.getCount() + ' ' + 'CONCEPTOS');
    }
    else {
        App.sbExploradorPreciarioConcepto.setText(App.sPreciarioConcepto.getCount() + ' ' + 'CONCEPTOS');
    }
};


//Concatenar la columna de Movimiento
var cMov_Renderer = function (valor, metaData, registro) {
    var utilizada = registro.get('Utilizada');

    if (utilizada > 0) {
        return '<img class="IconColumnaEstatus" src="images/concluido.png" alt="concluido" /> ' + registro.get('Clave')
    }
    else {
        return '<img class="IconColumnaEstatus" src="images/pendiente.png" alt="pendiente" /> ' + registro.get('Clave');
    }


};

//Pone todas las celdas de color segun la validacion
var renderCantidadUtilizada = function (value, metadata, registro) {

    if (parseFloat(registro.get('Utilizada')) > 0) {
        metadata.style = "background-color: #7E6FEB;";

    }

    return value;
};


//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sPreciarioConcepto.clearFilter();
    App.sPreciarioConcepto.filter([{ filterFn: function (item) {
        if (item.get('Clave').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpExploradorConceptosPreciario.getSelectionModel().deselectAll();

};




//Evento que hace el filtro al seleccionar algun elemento
var cmbCantidadFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sPreciarioConcepto.clearFilter();
    }

    if (valor =='1') {
        App.sPreciarioConcepto.filterBy(function (elemento) {
         
            if (elemento.get('Utilizada') > 0) {
                return true;
            }
            else {
                return false;
            }
        });

    }
    if (valor == '0') {
        App.sPreciarioConcepto.filterBy(function (elemento) {

            if (elemento.get('Utilizada') == 0) {
                return true;
            }
            else {
                return false;
            }
        });

    }
};


var gpExploradorConceptos_ItemClick = function (gridview, registro, gvhtml, index) {
    window.parent.App.wEmergente.load('FormaReporteVolumetria.aspx');
    window.parent.App.wEmergente.setHeight(146);
    window.parent.App.wEmergente.setWidth(300);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Imprimir volumetría concepto');
    window.parent.App.wEmergente.show();

    Ext.util.Cookies.set('cookiePreciario', registro.get('Preciario'));
    Ext.util.Cookies.set('cookieConceptoID', registro.get('ID'));
};






var sPreciarioConcepto_Load = function () {
        if (App.sPreciarioConcepto.getCount() != 0) {
        App.imgbtnExporToExcel.setDisabled(false);
    }
}



//Darle formato a la columna de Programado
var cImporte_renderer = function (valor, metadata, registro) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';

    if (parseFloat(registro.get('Importefinal')) > parseFloat(registro.get('Importe'))) {
        metadata.style = "background-color: #AE0000; color: #FFFFFF";

    }
    else {
        metadata.style = "background-color: #173300; color: #FFFFFF";
    }

    return F.number(valor, "$000,000,000.00");
};


//Darle formato a la columna de Programado
var txtCosto_renderer = function (valor) {


    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};


