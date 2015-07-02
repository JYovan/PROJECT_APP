
var indice = 0;
//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    window.parent.App.wEmergente.load('FormaPreciarioGeneral.aspx');
    Ext.util.Cookies.set('cookieEditarPreciarioGeneral', 'Nuevo');
    window.parent.App.wEmergente.setHeight(610);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Preciario');
    window.parent.App.wEmergente.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    window.parent.App.wEmergente.load('FormaPreciarioGeneral.aspx');
    Ext.util.Cookies.set('cookieEditarPreciarioGeneral', App.gpPreciariosGenerales.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.setHeight(610);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Preciario ' + Ext.util.Cookies.get('cookieEditarPreciarioGeneral'));
    window.parent.App.wEmergente.show();
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sPreciariosGenerales.clearFilter();
    App.sPreciariosGenerales.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpPreciariosGenerales.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Acciones al hacer clic en un registro
var gpPreciariosGenerales_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};


//Cambio en los datos del tablero
var sPreciariosGenerales_DataChanged = function () {
    if (App.sPreciariosGenerales.getCount() > 1 || App.sPreciariosGenerales.getCount() == 0) {
        App.sbPreciariosGenerales.setText(App.sPreciariosGenerales.getCount() + ' ' + 'PRECIARIOS GENERALES');
    }
    else {
        App.sbPreciariosGenerales.setText(App.sPreciariosGenerales.getCount() + ' ' + 'PRECIARIO GENERAL');
    }
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function () {

    var identificador = App.gpPreciariosGenerales.getSelectionModel().getSelection()[0].get('ID');
    var nombre = App.gpPreciariosGenerales.getSelectionModel().getSelection()[0].get('Descripcion');

    App.gpPreciariosGenerales.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 350,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripción: ' + nombre + '</p>',
        title: 'Eliminar registro'
    });
    App.gpPreciariosGenerales.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);

};


//Evento que hace el filtro al seleccionar algun elemento
var cmbTipoFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();
    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sPreciariosGenerales.clearFilter();
    }
    if (valor == 'Mantenimiento') {
        App.sPreciariosGenerales.filterBy(function (elemento) {
            console.log(elemento);
            if (elemento.get('TipoMantenimiento') == true) {
                return true
            }
            else {
                return false;
            }
        });
    }

    if (valor == 'Obra') {
        App.sPreciariosGenerales.filterBy(function (elemento) {
            console.log(elemento);
            if (elemento.get('TipoObra') == true) {
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
        App.sPreciariosGenerales.clearFilter();
    }
    else {
        App.sPreciariosGenerales.filterBy(function (elemento) {
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
        App.sPreciariosGenerales.clearFilter();
    }
    else {
        App.sPreciariosGenerales.filterBy(function (elemento) {

            if (elemento.get('Usuario') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

