var indice;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function (imagebutton, evento, opciones) {
    Ext.util.Cookies.set('cookieEditarProgramaObra', 'Nuevo');
    window.parent.App.wEmergente.load('http://localhost/APP.OSEF.OBRA/index.html');
    window.parent.App.wEmergente.setHeight(window.parent.Ext.getBody().getViewSize().height);
    window.parent.App.wEmergente.setWidth(window.parent.Ext.getBody().getViewSize().width);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Programa de Obra');
    window.parent.App.wEmergente.show();
};

//Evento de clic botón Editar
var imgbtnEditar_Click = function (imagebutton, evento, opciones) {
    Ext.util.Cookies.set('cookieEditarProgramaObra', App.gpProgramasObras.getSelectionModel().getSelection()[0].get('Id'));
    window.parent.App.wEmergente.load('http://localhost/APP.OSEF.OBRA/index.html');
    window.parent.App.wEmergente.setHeight(window.parent.Ext.getBody().getViewSize().height);
    window.parent.App.wEmergente.setWidth(window.parent.Ext.getBody().getViewSize().width);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Programa de Obra ' + Ext.util.Cookies.get('cookieEditarProgramaObra'));
    window.parent.App.wEmergente.show();
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {
    if (result.extraParamsResponse.existe) {
        Ext.Msg.show({
            id: 'msgProgramaObra',
            title: 'Advertencia Programa Obra',
            msg: 'El Programa De Obra, esta siendo utilizado.',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpProgramasObras.getSelectionModel().getSelection()[0].get('Id');
        var obra = App.gpProgramasObras.getSelectionModel().getSelection()[0].get('RSucursal').Nombre;
        App.sProgramasObras.removeAt(App.gpProgramasObras.getSelectionModel().getSelection()[0].index);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Programa de Obra eliminado: ' + obra + '</p>',
            title: 'REGISTRO ELIMINADO'
        });
        App.gpProgramasObras.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
    }
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sProgramasObras.clearFilter();
    App.sProgramasObras.filter([{ filterFn: function (item) {
        if (item.get('Id') == newValue
            || item.get('RSucursal').CR == newValue
            || item.get('RSucursal').ID.toUpperCase().indexOf(newValue.toUpperCase()) > -1
            || item.get('RSucursal').Nombre.toUpperCase().indexOf(newValue.toUpperCase()) > -1)
        { return true; }
        else { return false; }
    } 
    }]);

    App.gpProgramasObras.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Cambio en los datos del tablero
var sProgramasObras_DataChanged = function () {
    //    if (App.sOrdenesEstimaciones.getCount() > 1 || App.sOrdenesEstimaciones.getCount() == 0) {
    //        App.sbOrdenesEstimacion.setText('MOSTRANDO 1 - ' + App.sOrdenesEstimaciones.getCount() + ' DE ' + App.PagingToolbar1.store.totalCount.toString() + ' MOVIMIENTOS');
    //    }
    //    else {
    //        App.sbOrdenesEstimacion.setText(App.sOrdenesEstimaciones.getCount() + ' ' + 'MOVIMIENTO');
    //    }

    App.PagingToolbar1.displayMsg = 'MOSTRANDO {1} DE {2} MOVIMIENTOS';
};

//Acciones al hacer clic en un registro
var gpProgramasObras_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Acción al hacer doble clic sobre algun registro
var gpProgramasObras_ItemDblClick = function () {
    Ext.util.Cookies.set('cookieEditarProgramaObra', App.gpProgramasObras.getSelectionModel().getSelection()[0].get('Id'));
    window.parent.App.wEmergente.load('http://localhost/APP.OSEF.OBRA/index.html');
    window.parent.App.wEmergente.setHeight(window.parent.Ext.getBody().getViewSize().height);
    window.parent.App.wEmergente.setWidth(window.parent.Ext.getBody().getViewSize().width);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Programa de Obra ' + Ext.util.Cookies.get('cookieEditarProgramaObra'));
    window.parent.App.wEmergente.show();
};

//Asignar la descripción de la sucursal a esta columna
var cSucursal_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        return registro.get('RSucursal').Nombre + ' - CR ' + registro.get('RSucursal').CR;
    }
};

//Evento que hace el filtro al seleccionar algun elemento
var cmbSucursalFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.rawValue;

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Sucursal 
    if (valor == '(Todos)' || valor.toString().trim() === '') {
        App.sProgramasObras.clearFilter();
    } else {
        App.sProgramasObras.filterBy(function (elemento) {
            if (elemento.data.RSucursal.Nombre == valor) {
                return true;
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
        App.sProgramasObras.clearFilter();
    }
    else {
        App.sProgramasObras.filterBy(function (elemento) {
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
        App.sProgramasObras.clearFilter();
    }
    else {
        App.sProgramasObras.filterBy(function (elemento) {

            if (elemento.get('Usuario') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

/**BUSCAR POR FECHA**/
var applyFilter = function (fieldvalue, dindex) {
    var store = App.gpProgramasObras.getStore();
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