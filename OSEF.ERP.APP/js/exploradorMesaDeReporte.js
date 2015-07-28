//Cambio en los datos del tablero
var sMesaDeReportes_DataChanged = function () {
    if (App.sMesaDeReporte.getCount() > 1 || App.sMesaDeReporte.getCount() == 0) {
        App.sbMesaDeReporte.setText(App.sMesaDeReporte.getCount() + ' ' + 'MOVIMIENTOS');
    }
    else {
        App.sbMesaDeReporte.setText(App.sMesaDeReporte.getCount() + ' ' + 'MOVIMIENTO');
    }
};


//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sMesaDeReporte.clearFilter();
    App.sMesaDeReporte.filter([{ filterFn: function (item) {
        if (item.get('Observaciones').toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true;
        }
        else {
            return false;
        }
    }
    }]);
    App.gpExploradorMesaDeReporte.getSelectionModel().deselectAll();

};


//Evento que hace el filtro al seleccionar algun elemento
var cmbUsuarioFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sMesaDeReporte.clearFilter();
    }
    else {
        App.sMesaDeReporte.filterBy(function (elemento) {

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
var cmbClasificacion_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sMesaDeReporte.clearFilter();
    }
    else {
        App.sMesaDeReporte.filterBy(function (elemento) {
            console.log(elemento);
            if (elemento.get('Clasificacion') == valor) {
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
        App.sMesaDeReporte.clearFilter();
    }
    else {
        App.sMesaDeReporte.filterBy(function (elemento) {

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
    App.sMesaDeReporte.clearFilter();
    App.sMesaDeReporte.filter([{ filterFn: function (item) {

        if (item.get('MovID').toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true;
        }
        else {
            return false;
        }
    }
    }]);
    App.gpExploradorMesaDeReporte.getSelectionModel().deselectAll();
};



var gpExploradorConceptos_ItemClick = function (gridview, registro, gvhtml, index) {

    Ext.util.Cookies.set('NReporte', registro.get('Reporte'));

    var w = window.parent.App.wGenerador;
    w.load('FormaReporteEstimacion.aspx');
    w.setHeight(160);
    w.setWidth(590);
    w.center();
    w.setTitle('Reporte del Movimiento ' + registro.get('Id'));
    w.show();

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

var sMesaDeReporte_Load = function (avance, registro, index) {

    var sum = 0;
    App.sMesaDeReporte.each(function (record) {
        sum += record.get('ImporteTotal');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.ToolBarTotal.setText('TOTAL: $' + F.number(sum, "000,000,000.00"));
}
var showResult = function (t) {
    if (t) {
        App.sMesaDeReporte.reload();
    }
}



//Evento que hace el filtro al seleccionar algun elemento
var txtReporteFiltro_Change = function (textfield, newValue, oldValue, e) {
    App.sMesaDeReporte.clearFilter();
    App.sMesaDeReporte.filter([{ filterFn: function (item) {

        if (item.get('Reporte').toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true;
        }
        else {
            return false;
        }
    }
    }]);
    App.gpExploradorMesaDeReporte.getSelectionModel().deselectAll();
};

var cFacturado_Renderer = function (valor, columna, registro) {
    if (registro.get('Facturado')) {
        columna.style = "background-color: #0C8D1B; color: #fff;";
        return "Si";
    } else {
        columna.style = "background-color: #ff0033; color: #fff;";
        return "No";
    }
}

var getUpdatedRecords = function () {

    var store = App.sMesaDeReporte;
    var editedRecords = store.getUpdatedRecords();
    var encodedupdaterecords;
    var xudata = [];

    if (editedRecords.length > 0 || editedRecords != null) {
        for (i = 0; i < editedRecords.length; i++) {
            xudata.push(editedRecords[i].data);
        }
        if (xudata.length > 0) { 
            return Ext.encode(xudata);
        } else {
            return 0;
        }
    }
};

var setCheckedAllRecords_Facturado = function (avance, registro, index) { 
    App.sMesaDeReporte.each(function (record) { 
        App.chkFacturado.getValue() ? record.set('Facturado', true) : record.set('Facturado', false);
    }); 
}

var setCheckedAllRecords_Revisado = function (avance, registro, index) {
    App.sMesaDeReporte.each(function (record) {
        App.chkRevisar.getValue() ? record.set('Revisado', true) : record.set('Revisado', false); 
    });
}
 
var cClasificacion_Renderer = function (valor, metaData, registro) {
    var clasi = registro.get('Clasificacion'); 
    switch (clasi) {
        case 'MOBILIARIO':
            return '<img class="IconColumnaEstatus" src="assets/img/controles/rsofa.png" alt="borrador" width="16" heigth="16" />' +registro.get('Clasificacion');
        case 'CERRAJERIA':
            return '<img class="IconColumnaEstatus" src="assets/img/controles/rkey.png" alt="pendiente" width="16" heigth="16"/> ' + registro.get('Clasificacion');
        case 'INMUEBLE':
            return '<img class="IconColumnaEstatus" src="assets/img/controles/rhome.png" alt="concluido" width="16" heigth="16"/> ' + registro.get('Clasificacion'); 
    }
};

var chkHistorialFacturado_Change = function () {
    var loadmask = new Ext.LoadMask(Ext.getBody(), { msg: "Espere..." });
    loadmask.show();
    if (App.chkHistorialFacturado.getValue()) {
        App.direct.ObtenerMesaDeReporteFacturado();
//        console.log(App.gpExploradorMesaDeReporte);
        loadmask.hide();
    } else {
        App.direct.ObtenerMesaDeReporte();
        //        App.gpExploradorMesaDeReporte.setHidden(2, true);
        loadmask.hide();
    }
};

var onBilledRecords = function () {
    var billed = false,
        report = false,
        ok = false,
        store = App.sMesaDeReporte,
        urecords = store.getUpdatedRecords(),
        i = 0, data = [],
        xmov = [], dlg;
    for (; i < urecords.length; ) {
        billed = urecords[i].data.Facturado ? true : false;
        report = urecords[i].data.Revisado ? true : false;
        //        console.log(urecords[i].data.Reporte);   
        if (!(billed & report)) {
            xmov.push(urecords[i].data.MovID);
        }
        i++;
    }
    if (billed & report) {
        Ext.Msg.show({
            title: 'ATENCIÓN',
            msg: 'Escribe el numero de factura: ',
            width: 300,
            buttons: Ext.MessageBox.OKCANCEL,
            multiline: true,
            fn: function (value, text) {
                if (value == 'ok') {
                    if (/^[A-Za-z0-9 ]{3,20}$/.test(text)) {
                        App.direct.setFacturar(getUpdatedRecords(), text);
                    } else {
                        Ext.Msg.show({
                            id: 'msgReportFact',
                            title: 'ADVERTENCIA',
                            msg: "DEBE DE ESCRIBIR UN NÚMERO DE FACTURA VÁLIDO.",
                            buttons: Ext.MessageBox.OK,
                            onEsc: Ext.emptyFn,
                            closable: false,
                            icon: Ext.MessageBox.WARNING
                        }); 
                    }
                }
            },
            animEl: 'addAddressBtn'
        });
    } else {
        if (urecords.length <= 0) {
            Ext.Msg.show({
                id: 'msgReportFact',
                title: 'ADVERTENCIA',
                msg: "SELECCIONE AL MENOS 1 REGISTRO.",
                buttons: Ext.MessageBox.OK,
                onEsc: Ext.emptyFn,
                closable: false,
                icon: Ext.MessageBox.WARNING
            });
        } else {
            Ext.Msg.show({
                id: 'msgFactReport',
                title: 'ADVERTENCIA',
                msg: 'UPS! LOS REGISTROS CON NÚMERO DE MOVIMIENTO:<br> ' + xmov.join(", ") + '<br>NO ESTAN FACTURADOS O NO ESTAN REVISADOS.',
                buttons: Ext.MessageBox.OK,
                onEsc: Ext.emptyFn,
                closable: false,
                icon: Ext.MessageBox.WARNING
            });
        }
    }
};

//Evento que hace el filtro al seleccionar algun elemento
var txtFacturaMantenimiento_Change = function (textfield, newValue, oldValue, e) {
    App.sMesaDeReporte.clearFilter();
    App.sMesaDeReporte.filter([{ filterFn: function (item) { 
        if (item.get('FacturaMantenimiento').toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true;
        }
        else {
            return false;
        }
    }
    }]);
    App.gpExploradorMesaDeReporte.getSelectionModel().deselectAll();
};

//Regresar el nombre del cliente
var cCliente_Renderer = function (valor, metaData, registro) {
    var r = registro.get('RCliente').Nombre;
    if (r != null) {
        return registro.get('RCliente').Nombre;
    }
}; 
