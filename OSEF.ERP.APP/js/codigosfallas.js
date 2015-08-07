//Variables gloables
var codigoNuevo = false;
var codigofallaEditar = false;
var indice = 0;

//Accion que se lanza al hacer clic en un registro
var tpCodigosPPTA_Select = function (gridview, registro, index, gvhtml) {
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!codigoNuevo && !codigofallaEditar) {
        //2. Habilitar los botones de editar y borrar
        App.imgbtnEditar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
        indice = App.gpCodigoPPTA.getSelectionModel().getSelection()[0].index;
    }
};

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    var w = window.parent.App.wEmergente;
    Ext.util.Cookies.set('cookieEditarCodigoPPTA', 'Nuevo');
    w.load('FormaCodigoPPTA.aspx');
    w.setHeight(200);
    w.setWidth(380);
    w.center();
    w.setTitle('NUEVO CÓDIGO PPTA');
    w.show();
}; 

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    App.imgbtnNuevo.setDisabled(false);
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
    var w = window.parent.App.wEmergente;
    Ext.util.Cookies.set('cookieEditarCodigoPPTA', App.gpCodigoPPTA.getSelectionModel().getSelection()[0].get('CodigoMainSaver').trim());
    w.load('FormaCodigoPPTA.aspx');
    w.setHeight(200);
    w.setWidth(380);
    w.center();
    w.setTitle('EDITAR CÓGIDO PPTA ' + Ext.util.Cookies.get('cookieEditarCodigoPPTA'));
    w.show(); 
};
 



//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {

    if (result.extraParamsResponse.existe) {

        Ext.Msg.show({
            id: 'msgCodigoPPTA',
            title: 'Advertencia Código PPTA',
            msg: 'El código PPTA, esta siendo utilizado en algún modulo de Ordenes y Estimaciones.',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpCodigoPPTA.getSelectionModel().getSelection()[0].get('CodigoMainSaver');

        App.sCodigoPPTA.removeAt(App.gpCodigoPPTA.getSelectionModel().getSelection()[0].index);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">CodigoMainSaver: ' + identificador + '</p><p class="deletePop">Codigo PPTA eliminado .</p>',
            title: 'Registro eliminado'
        });
        App.gpCodigoPPTA.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
        //4. Recargar el tablero  

    }
};
   

//Cell Editor
//var ceCodigoPPTA_Edit = function (cellEdit, datos, options) {
//    var festado = App.sEstados.findRecord('ID', datos.value);
//    var rsts = datos.record.get('REstado');
//    rsts.ID = festado.get('ID');
//    rsts.Descripcion = festado.get('Descripcion');
//    datos.record.set('REstado', rsts);

//};

//Editar el registro en el que se esta posicionado
var imgbtnsEditar_Click = function () {
    //Get index of record selection
    var index = App.gpCodigoPPTA.getSelectionModel().getSelection()[0].index;

    //Validar si el indice esta como indefinido
    if (index == undefined) {
        index = indice;
    }

    //Get store of GridPanel
    var store = App.gpCodigoPPTA.getStore();

    //Enabled the edit option
    App.gpCodigoPPTA.editingPlugin.startEdit(App.gpCodigoPPTA.getStore().getAt(index), App.gpCodigoPPTA.columns[1]);
};


//Validar la edición o un nuevo registro
var ceCodigoPPTA_ValidateEdit = function (editor, context) {
    var store = App.gpCodigoPPTA.getStore();
    if (context.field == 'Numero') {
        App.direct.ActualizarCodigoPPTA(store.getAt(context.rowIdx).get('CodigoMainSaver'), store.getAt(context.rowIdx).get('Numero'), context.value.toUpperCase());
    }
};


//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {

    Ext.Msg.show({
        id: 'msgCP',
        title: 'CÓDIGO PPTA ',
        msg: '<p align="center">Código Main Saver: ' + result.extraParamsResponse.data + ' registrado.</p>',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.INFO,
        fn: function (btn) {
            if (btn === 'ok') {
                window.parent.App.wEmergente.hide();
            }
        }

    });
    //4. Recargar el tablero  

};

//Hacer la busqueda de información
var txtBuscarCodigoFalla_Change = function (textfield, newValue, oldValue, e) {
    App.sCodigoPPTA.clearFilter();
    App.sCodigoPPTA.filter([{ filterFn: function (item) {
        if (item.get('CodigoMainSaver').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpCodigoPPTA.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

function getData() {
    App.sCodigoPPTA.reload();
    App.gpCodigoPPTA.getSelectionModel().deselectAll();
} 


//Accion que se lanza al hacer clic en un registro
var tpCodigoPPTA_Select = function (gridview, registro, index, gvhtml) {
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!codigoNuevo && !codigofallaEditar) {
        //2. Habilitar los botones de editar y borrar
        App.imgbtnEditar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
        indice = App.gpCodigoPPTA.getSelectionModel().getSelection()[0].index;
    }
};

//Cambio en los datos del tablero
var sCodigoPPTA_DataChanged = function () {
//    if (App.sCodigoPPTA.getCount() > 1 || App.sCodigoPPTA.getCount() == 0) {
//        App.sbCodigoPPTA.setText(App.sCodigoPPTA.getCount() + ' CODIGOS PPTA');
//    }
//    else {
//        App.sbCodigoPPTA.setText(App.sCodigoPPTA.getCount() + ' CODIGO PPTA');
    //    }
    App.PagingToolbar1.displayMsg = 'MOSTRANDO {1} DE {2} CÓDIGOS PPTA';
};

//Asignar la descripción "dias" a la columna
var cvDias_Renderer = function (valor, columna, registro) {
    if (valor != "" || valor.length != 0) {
        return valor + " días";
    } else {
        return "0 días";
    }
};

var cEspecialidad_Renderer = function (valor, columna, registro) {
    return valor.Nombre;
}
var cSubEspecialidad_Renderer = function (valor, columna, registro) {
    return valor.Nombre;
}
var cFamilia_Renderer = function (valor, columna, registro) {
    return valor.Nombre;
} 