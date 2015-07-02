var imgbtnGuardar_change = function () {
    var regex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{1,99}$/
    var desregex = /^[a-zA-Z0-9\sáéíóúñÁÉÍÓÚÑ.,-_]{3,499}$/ 

    if (regex.test(App.txtCodigoMainSaver.getValue()) && Ext.getCmp('txtDias').getValue() != null) {
        App.imgbtnGuardar.setDisabled(false);
        App.sbPPTA.setText('La información esta completa/correcta.');
    } else {
        App.imgbtnGuardar.setDisabled(true);
        App.sbPPTA.setText('No se permiten caracteres especiales o vacíos.');
    }
}

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
    if (Ext.util.Cookies.get('cookieEditarCodigoPPTA') != 'Nuevo') {

        Ext.Msg.show({
            id: 'msgCP',
            title: 'CÓDIGO PPTA ',
            msg: '<p align="center">CÓDIGO PPTA: ' + result.extraParamsResponse.data + ' ACTUALIZADO.</p>',
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
    }
    else {
        Ext.Msg.show({
            id: 'msgCP',
            title: 'CÓDIGO PPTA ',
            msg: '<p align="center">CÓDIGO PPTA: ' + result.extraParamsResponse.data + ' REGISTRADO.</p>',
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
    }

    window.parent.App.pCentro.getBody().App.sCodigoPPTA.reload();

};


//Evento lanzado al cargar el store de la sucursal
var sCodigoPPTA_Load = function () {
    App.direct.sCodigoPPTA_Load();
};

//Evento lanzado al agregar un registro al store
var sCodigoPPTA_Add = function (sucursal, registro) {

    //    App.txtID.setValue(registro[0].get('ID'));
//    App.cmbEspecialidad.setValue(registro[0].get('REspecialidad').ID);
    App.txtCodigoMainSaver.setValue(registro[0].get('CodigoMainSaver').trim());
//    App.txtDescripcion.setValue(registro[0].get('Descripcion'));
    App.txtDias.setValue(registro[0].get('Dias'));
//    App.txtPrioridad.setValue(registro[0].get('Prioridad'));
//    App.txtTiempoEstimado.setValue(registro[0].get('TiempoEstimado'));
    //    App.txtCodigoMainSaver.setDisabled(true);
    App.txtCodigoMainSaver.setReadOnly(true);
};

////Evento al cargar el store de Familia
//var sFamilia_Load = function () {
//    if (App.sCodigoPPTA.getAt(0) != undefined) {
//        App.cmbFamilia.setValue(App.sCodigoPPTA.getAt(0).get('Familia'));
//    }
//};

////Evento al cargar el store de SubEspecialidad
//var sSubespecialidad_Load = function () {
//    if (App.sCodigoPPTA.getAt(0) != undefined) {
//        App.cmbSubEspecialidad.setValue(App.sCodigoPPTA.getAt(0).get('SubEspecialidad'));
//    }
//};


//Evento de clic del botón Nuevo
//var imgbtnNuevaEspecialidad_Click = function () {
//    var w = window.parent.App.wNew;
//    Ext.util.Cookies.set('cookieNuevaEspecialidad', 'Nuevo');
//    w.load('FormaEspecialidad.aspx');
//    w.setHeight(200);
//    w.setWidth(380);
//    w.center();
//    w.setTitle('NUEVA ESPECIALIDAD');
//    w.show();
//};

////Evento de clic del botón Nuevo
//var imgbtnNuevaFamilia_Click = function () {
//    var w = window.parent.App.wNew;
//    Ext.util.Cookies.set('cookieNuevaFamilia', 'Nuevo');
//    w.load('FormaFamilias.aspx');
//    w.setHeight(200);
//    w.setWidth(390);
//    w.center();
//    w.setTitle('NUEVA FAMILIA');
//    w.show();
//};

////Evento de clic del botón Nuevo
//var imgbtnNuevaSubEspecialidad_Click = function () {
//    var w = window.parent.App.wNew;
//    Ext.util.Cookies.set('cookieNuevaSubEspecialidad', 'Nuevo');
//    w.load('FormaSubEspecialidad.aspx');
//    w.setHeight(200);
//    w.setWidth(390);
//    w.center();
//    w.setTitle('NUEVA SUBESPECIALIDAD');
//    w.show();
//};
// 

