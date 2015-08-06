//Cambio en los datos del tablero
var sOrdenesEstimaciones_DataChanged = function () {

    var sum = 0;
    App.sOrdenesEstimaciones.each(function (record) {
        sum += record.get('ImporteTotal');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.PagingToolbar1.displayMsg = 'TOTAL: $' + F.number(sum, "000,000,000.00");
    App.lblPagingTool.setText('MOSTRANDO 1 - ' + App.sOrdenesEstimaciones.getCount() + ' DE ' + App.PagingToolbar1.store.totalCount.toString() + ' MOVIMIENTOS');
};


//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sOrdenesEstimaciones.clearFilter();
    App.sOrdenesEstimaciones.filter([{ filterFn: function (item) {
        if (item.get('Observaciones').toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true; 
        }
        else {
            return false; 
        }
    }
    }]);
    App.gpExploradorConceptosPreciarioGeneral.getSelectionModel().deselectAll();

};


//Evento que hace el filtro al seleccionar algun elemento
var cmbUsuarioFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sOrdenesEstimaciones.clearFilter();
    }
    else {
        App.sOrdenesEstimaciones.filterBy(function (elemento) {

            if (elemento.get('Usuario') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

//Evento que hace el filtro al seleccionar algun elemento
var cmbSucursalFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = registro[0].get('ID');

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Sucursal
    if (valor == 'Todos') {
        App.sOrdenesEstimaciones.clearFilter();
    }
    else {
        App.sOrdenesEstimaciones.filterBy(function (elemento) {

            if (elemento.get('Sucursal') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};


//Concatenar la columna de Movimiento
var cMov_Renderer = function (valor, metaData, registro) {
    var estatus = registro.get('Estatus');

    switch (estatus) {
        case 'BORRADOR':
            return '<img class="IconColumnaEstatus" src="images/borrador.png" alt="borrador" />' + registro.get('Mov') + " " + registro.get('MovID');
        case 'PENDIENTE':
            return '<img class="IconColumnaEstatus" src="images/pendiente.png" alt="pendiente" /> ' + registro.get('Mov') + " " + registro.get('MovID');
        case 'CONCLUIDO':
            return '<img class="IconColumnaEstatus" src="images/concluido.png" alt="concluido" /> ' + registro.get('Mov') + " " + registro.get('MovID');
        case 'CANCELADO':
            return '<img class="IconColumnaEstatus" src="images/cancelar.png" alt="cancelar" /> ' + registro.get('Mov') + " " + registro.get('MovID');
    }
};

//Asignar la descripción de la sucursal a esta columna
var cSucursal_Renderer = function (valor, columna, registro) {

    if (valor.length != 0) {
        return registro.get('RSucursal').CR + '  ' + registro.get('RSucursal').Nombre;
    }
};



//Evento que hace el filtro al seleccionar algun elemento
var txtMovID_Change = function (textfield, newValue, oldValue, e) {
    App.sOrdenesEstimaciones.clearFilter();
    App.sOrdenesEstimaciones.filter([{ filterFn: function (item) {

        if (item.get('MovID').toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true;
        }
        else {
            return false;
        }
    }
    }]);
    App.gpExploradorConceptosPreciarioGeneral.getSelectionModel().deselectAll();
};



var gpExploradorConceptos_ItemClick = function (gridview, registro, gvhtml, index) {


    Ext.util.Cookies.set('NOrden', registro.get('RSucursal').CR + '-' + registro.get('NoOrden'));

    window.parent.App.wGenerador.load('FormaReporteOrdenCambioD.aspx');
    window.parent.App.wGenerador.setHeight(160);
    window.parent.App.wGenerador.setWidth(590);
    window.parent.App.wGenerador.center();
    window.parent.App.wGenerador.setTitle('Reporte del Movimiento: ' + registro.get('Id'));
    window.parent.App.wGenerador.show();

    //Id mov para reporte
    Ext.util.Cookies.set('cookieEditarOrdenEstimacion', registro.get('Id'));

};




//Darle formato a la columna de Programado
var cImporte_renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';

    return F.number(valor, "$ 000,000,000.00");
};


var cmbSucursal_Change = function (combobox, valorNuevo, viejoValor) {
    App.sSucursales.clearFilter();
    if (App.cmbSucursal.getValue() != null) {
        App.sSucursales.filter([{ filterFn: function (item) {
            if (item.get('CR').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
            else { return false; }
        }
        }]);
    }


};


//Regresar el nombre del cliente
var cCliente_Renderer = function (valor, metaData, registro) {
    var r = registro.get('RCliente').Nombre;

    if (r != null && r.trim() != '') {
        return registro.get('RCliente').Nombre;
    }
}; 