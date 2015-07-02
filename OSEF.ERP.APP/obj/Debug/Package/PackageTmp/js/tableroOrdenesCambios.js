var indice;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarOrdenEstimacion', 'Nuevo');
    window.parent.App.wEmergente.load('FormaOrdenEstimacion.aspx');
    window.parent.App.wEmergente.setHeight(600);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Movimiento');
    window.parent.App.wEmergente.show();
    Ext.util.Cookies.set('cookieEsEstimacion', 'No');
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarOrdenEstimacion', App.gpOrdenesEstimaciones.getSelectionModel().getSelection()[0].get('Id'));

    window.parent.App.wEmergente.load('FormaOrdenEstimacion.aspx');
    window.parent.App.wEmergente.setHeight(600);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Movimiento ' + Ext.util.Cookies.get('cookieEditarOrdenEstimacion'));
    window.parent.App.wEmergente.show();
};

var gpOrdenEstimacion_ItemDblClick = function (gridview, registro, gvhtml, index) {

    Ext.util.Cookies.set('cookieEditarOrdenEstimacion', App.gpOrdenesEstimaciones.getSelectionModel().getSelection()[0].get('Id'));

    window.parent.App.wEmergente.load('FormaOrdenEstimacion.aspx');
    window.parent.App.wEmergente.setHeight(600);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Movimiento ' + Ext.util.Cookies.get('cookieEditarOrdenEstimacion'));
    window.parent.App.wEmergente.show();
}

//Cambio en los datos del tablero
var sOrdenesEstimaciones_DataChanged = function () {
    if (App.sOrdenesEstimaciones.getCount() > 1 || App.sOrdenesEstimaciones.getCount() == 0) {
        App.sbOrdenesEstimacion.setText(App.sOrdenesEstimaciones.getCount() + ' ' + 'MOVIMIENTOS');
    }
    else {
        App.sbOrdenesEstimacion.setText(App.sOrdenesEstimaciones.getCount() + ' ' + 'MOVIMIENTO');
    }
};


//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sOrdenesEstimaciones.clearFilter();
    App.sOrdenesEstimaciones.filter([{ filterFn: function (item) {
        if (item.get('Mov').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('MovID').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpOrdenesEstimaciones.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};


//Acciones al hacer clic en un registro
var gpOrdenesEstimaciones_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    //App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Filtros

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
var cmbCuadrillasFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sOrdenesEstimaciones.clearFilter();
    }
    else {
        App.sOrdenesEstimaciones.filterBy(function (elemento) {

            if (elemento.get('RCuadrilla') != null) {
                if (elemento.get('RCuadrilla').ID == valor) {
                    return true
                }
                else {
                    return false;
                }

            }

        });
    }
};





//Evento que hace el filtro al seleccionar algun elemento
var txtReporteFiltro_Change = function (textfield, newValue, oldValue, e) {
    App.sOrdenesEstimaciones.clearFilter();
    App.sOrdenesEstimaciones.filter([{ filterFn: function (item) {

        if (item.get('Reporte').toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true;
        }
        else {
            return false;
        }
    }
    }]);
    App.gpOrdenesEstimaciones.getSelectionModel().deselectAll();

};

//Evento que hace el filtro al seleccionar algun elemento
var cmbEstatusFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sOrdenesEstimaciones.clearFilter();
    }
    else {
        App.sOrdenesEstimaciones.filterBy(function (elemento) {
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

//Evento que hace el filtro al seleccionar algun elemento
var cmbMovimientoFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.value;

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Sucursal
    if (valor == 'Todos') {
        App.sOrdenesEstimaciones.clearFilter();
    }
    else {
        App.sOrdenesEstimaciones.filterBy(function (elemento) {

            if (elemento.get('Mov').trim() == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

//Asignar la descripción de la sucursal a esta columna
var cSucursal_Renderer = function (valor, columna, registro) {

    if (valor.length != 0) {
        return registro.get('RSucursal').Nombre + ' - CR ' + registro.get('RSucursal').CR;
    }
};

//Asignar Zona de la sucursal a esta columna
var cZona_Renderer = function (valor, columna, registro) {

    if (valor.length != 0) {
        return registro.get('RSucursal').Direccionzona;
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


//Asignar la descripción de la cuadrilla a esta columna
var cCuadrilla_Renderer = function (valor, columna, registro) {

    if (valor.length != 0) {
        return registro.get('RCuadrilla').Nombre;
    }
};


//Evento que hace el filtro al seleccionar algun elemento
var cmbMovimientoFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.value;

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Sucursal
    if (valor == 'Todos') {
        App.sOrdenesEstimaciones.clearFilter();
    }
    else {
        App.sOrdenesEstimaciones.filterBy(function (elemento) {

            if (elemento.get('Mov').trim() == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};



var txtNoOrdenFiltro_Change = function (textfield, newValue, oldValue, e) {
    App.sOrdenesEstimaciones.clearFilter();


    App.sOrdenesEstimaciones.filter([{ filterFn: function (item) {

        if (item.get('NoOrden').indexOf(newValue.toUpperCase()) > -1 || item.get('RSucursal').CR.toString().toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true;
        }
        else {
            return false;
        }
    }
    }]);
    App.gpOrdenesEstimaciones.getSelectionModel().deselectAll();
};

//Asignar la descripción de la sucursal a esta columna
var cNoOrden_Renderer = function (valor, columna, registro) {

    if (valor.length != 0) {
        return registro.get('RSucursal').CR +'-'+ registro.get('NoOrden');
    }
};