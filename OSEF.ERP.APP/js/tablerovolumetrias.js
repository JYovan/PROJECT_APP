﻿var indice;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarVolumetria', 'Nuevo');
    window.parent.App.wEmergente.load('FormaVolumetriaPreciario.aspx');
    window.parent.App.wEmergente.setHeight(621.5);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nueva Volumetría');
    window.parent.App.wEmergente.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarVolumetria', App.gpVolumetrias.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaVolumetriaPreciario.aspx');
    window.parent.App.wEmergente.setHeight(621.5);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Volumetría ' + Ext.util.Cookies.get('cookieEditarVolumetria'));
    window.parent.App.wEmergente.show();
};

var gpVolumetrias_ItemDblClick = function (gridview, registro, gvhtml, index) {
    Ext.util.Cookies.set('cookieEditarVolumetria', App.gpVolumetrias.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaVolumetriaPreciario.aspx');
    window.parent.App.wEmergente.setHeight(621.5);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Volumetría ' + Ext.util.Cookies.get('cookieEditarVolumetria'));
    window.parent.App.wEmergente.show();
}

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

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sVolumetrias.clearFilter();
    App.sVolumetrias.filter([{ filterFn: function (item) {
        console.log(item);
        if (item.get('Mov').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('MovID').toUpperCase().indexOf(newValue.toUpperCase()) > -1
         || item.get('ID') == newValue || item.get('RCliente').Nombre.toUpperCase().indexOf(newValue.toUpperCase()) > -1
         || item.get('RSucursal').Nombre.toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpVolumetrias.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};


//Cambio en los datos del tablero
var sVolumetrias_DataChanged = function () {
//    if (App.sVolumetrias.getCount() > 1 || App.sVolumetrias.getCount() == 0) {
//        App.sbVolumetrias.setText('MOSTRANDO 1 - ' + App.sVolumetrias.getCount() + ' DE ' + App.PagingToolbar1.store.totalCount.toString() + ' VOLUMETRÍAS');
//    }
//    else {
//        App.sbVolumetrias.setText(App.sVolumetrias.getCount() + ' ' + 'VOLUMETRÍAS');
//    }
};

//Acciones al hacer clic en un registro
var gpVolumetrias_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    //App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Evento que hace el filtro al seleccionar algun elemento
var cmbPreciarioFiltro_Select = function (combobox, registro) {


    //1. Obtener el valor
    var valor = registro[0].get('ID');

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sVolumetrias.clearFilter();
    }
    else {
        App.sVolumetrias.filterBy(function (elemento) {
            if (elemento.get('Preciario') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};


//Evento que hace el filtro al seleccionar algun elemento
var cmbEstatusFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sVolumetrias.clearFilter();
    }
    else {
        App.sVolumetrias.filterBy(function (elemento) {
            if (elemento.get('Estatus') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};


//Evento que hace el filtro al seleccionar algun elemento
var cmbUsuarioFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sVolumetrias.clearFilter();
    }
    else {
        App.sVolumetrias.filterBy(function (elemento) {

            if (elemento.get('Usuario') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

//Regresar el nombre de la sucursal
var cSucursal_Renderer = function (valor, metaData, registro) {
    return registro.get('RSucursal').Nombre;
};

//Regresar el nombre del preciario
var cPreciario_Renderer = function (valor, metaData, registro) {
    return registro.get('RPreciario').Descripcion;
};

//Regresar el nombre del cliente
var cCliente_Renderer = function (valor, metaData, registro) {
    return registro.get('RCliente').Nombre;
};

/**BUSCAR POR FECHA**/
var applyFilter = function (stor, fieldvalue, dindex) {
    var store = stor.getStore();
    store.filterBy(getRecordFilter(fieldvalue, dindex));
};

var getRecordFilter = function (fieldvalue, dindex) {
    var f = [];
    f.push({
        filter: function (record) {
            return filterDate(fieldvalue, dindex, record);
        }
    });

    var len = f.length;

    return function (record) {
        for (var i = 0; i < len; i++) {
            if (!f[i].filter(record)) {
                return false;
            }
        }
        return true;
    };
};

var filterDate = function (value, dataIndex, record) {
    var dateone = value, datetwo = record.get(dataIndex);
    if (dateone !== null && datetwo !== null) {
        if (value.toString() == record.get(dataIndex).toString()) {
            return true;
        } else {
            return false;
        }
    }
    return true;
};