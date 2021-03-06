﻿var banderaValidate = false;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarUsuario', 'Nuevo');
    window.parent.App.wEmergente.load('FormaUsuario.aspx');
    window.parent.App.wEmergente.setHeight(425);
    window.parent.App.wEmergente.setWidth(770);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo usuario');
    window.parent.App.wEmergente.show();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sUsuarios.reload();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarUsuario', App.gpUsuarios.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaUsuario.aspx');
    window.parent.App.wEmergente.setHeight(425);
    window.parent.App.wEmergente.setWidth(770);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar usuario ' + Ext.util.Cookies.get('cookieEditarUsuario'));
    window.parent.App.wEmergente.show();
};

//Evento que se lanza antes del Blur de Correo
var txtfID_Blur_Before = function (textfield, tipo, evento) {
    if (Ext.util.Cookies.get('cookieEditarUsuario') != 'Nuevo') {
        if (App.sUsuario.getAt(0).get('ID') != textfield.getValue()) {
            return true;
        }
        else {
            return false;
        }
    }
};

var showResult = function () { 

}

//Evento que es lanzado despues del DirectEvent
var txtfID_Blur_Success = function (response, result) {
    if (result.extraParamsResponse.repetido) {
        Ext.Msg.show({
            id: 'msgUsuario',
            title: 'Error en Usuario',
            msg: 'El usuario ya existe',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) {
                if (btn === 'ok') {
                    App.txtfID.focus(true); App.imgbtnGuardar.setDisabled(true)
                }
            },
            icon: Ext.MessageBox.ERROR
        });
    }
};

//Evento que se lanza antes del Blur de Correo
var txtfCorreo_Blur_Before = function (textfield, tipo, evento) {
    if (Ext.util.Cookies.get('cookieEditarUsuario') != 'Nuevo') {
        if (App.sUsuario.getAt(0).get('Correo') != textfield.getValue()) {
            return true;
        }
        else {
            return false;
        }
    }
};

//Evento que es lanzado despues del DirectEvent
var txtfCorreo_Blur_Success = function (response, result) {
    if (result.extraParamsResponse.repetido) {
        Ext.Msg.show({
            id: 'msgCorreo',
            title: 'Error en Correo',
            msg: 'El correo ya existe',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) {
                if (btn === 'ok') {
                    App.txtfCorreo.focus(true); App.imgbtnGuardar.setDisabled(true)
                }
            },
            icon: Ext.MessageBox.ERROR
        });
    }
};

//Validar el TextField de Contraseña
var txtfContrasena_Validator = function (valor) {
    if (App.txtfConfirmarContrasena.getPassword() == '') {
        return true;
    }
    else if (this.getPassword() == App.txtfConfirmarContrasena.getPassword()) {
        if (banderaValidate == false) {
            banderaValidate = true;
            App.txtfConfirmarContrasena.validate();
            banderaValidate = false;
        }
        return true;
    }
    else {
        return 'Las contraseñas no coinciden';
    }
};

//Validar el TextField de Confirmar Contraseña
var txtfConfirmarContrasena_Validator = function (valor) {
    if (App.txtfContrasena.getPassword() == '') {
        return true;
    }
    else if (this.getPassword() == App.txtfContrasena.getPassword()) {
        if (banderaValidate == false) {
            banderaValidate = true;
            App.txtfContrasena.validate();
            banderaValidate = false;
        }
        return true;
    }
    else {
        return 'Las contraseñas no coinciden';
    }
};

//Dar formato a los datos que se mandarán desde el formulario
var sendData = function () {
    var data = App.fpUsuario.getForm().getValues(false, false, false, true);

    data.txtfContrasena = data.txtfContrasena[1];
    data.txtfConfirmarContrasena = data.txtfConfirmarContrasena[1];
    return data;
};

//Evento lanzado al cargar el store de la sucursal
var sUsuario_Load = function () {
    App.direct.sUsuario_Load();
};

//Evento lanzado al agregar un registro al store
var sUsuario_Add = function (usuario, registro) {
    App.txtfID.setDisabled(true);
    App.txtfID.setValue(registro[0].get('ID'));
    App.txtfCorreo.setValue(registro[0].get('Correo'));
    App.txtfCorreo.focus();
    App.txtfNombre.setValue(registro[0].get('Nombre'));
    App.txtfAPaterno.setValue(registro[0].get('APaterno'));
    App.txtfAMaterno.setValue(registro[0].get('AMaterno'));
    App.txtfContrasena.setValue('Contrasena');
    App.txtfContrasena.setDisabled(true);
    App.txtfConfirmarContrasena.setValue('Contrasena');
    App.txtfConfirmarContrasena.setDisabled(true);
    App.cmbEstatus.setValue(registro[0].get('Estatus'));
    App.cmbEstatus.setDisabled(false);
    App.chkBloqueado.setValue(registro[0].get('Bloqueado'));
    App.chkEnLinea.setValue(registro[0].get('EnLinea'));
    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));
    App.dfFechaBloqueo.setValue(registro[0].get('FechaBloqueo'));
    App.dfUltimoAcceso.setValue(registro[0].get('UltimoAcceso'));
    App.dfCambioContrasena.setValue(registro[0].get('CambioContrasena'));
    App.cmbEmpresa.setValue(registro[0].get('Empresa'));
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpUsuarios.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpUsuarios.getStore().find('ID', identificador);
    var nombre = App.sUsuarios.getAt(indice).get('Nombre');
    Ext.Msg.show({
        id: 'msgUsuarioEliminar',
        title: 'Advertencia',
        msg: '¿Estás seguro de eliminar el usuario: ' + nombre + '? ',
        buttons: Ext.MessageBox.YESNO,
        onEsc: Ext.emptyFn,
        closable: false,
        fn: function (btn) {
            if (btn === 'yes') {
                App.direct.EliminarUsuario(identificador);
                App.gpUsuarios.getStore().reload();
            }
        },
        icon: Ext.MessageBox.WARNING
    });
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sUsuarios.clearFilter();
    App.sUsuarios.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Concatenar la columna de NombreCompleto
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Cambio en los datos del tablero
var sUsuarios_DataChanged = function () {
//    if (App.sUsuarios.getCount() > 1) {
//        App.sbUsuarios.setText(App.sUsuarios.getCount() + ' ' + 'USUARIOS');
//    }
//    else {
//        App.sbUsuarios.setText(App.sUsuarios.getCount() + ' ' + 'USUARIO');
//    }

//    //Resize column Nombre when records are 11
//    if (App.sUsuarios.getCount() > 10) {
//        App.gpUsuarios.columns[2].setWidth(280);
//    }
//    else {
//        App.gpUsuarios.columns[2].setWidth(300);
    //    }
    App.PagingToolbar1.displayMsg = 'MOSTRANDO {1} DE {2} USUARIOS';
};

//Acciones al hacer clic en un registro
var gpUsuarios_ItemClick = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};

//Lanzar algun comando de la lista de opciones
var ccOpciones_Command = function (opciones, comando, registro, indice) {
    if (comando == 'AccesoModulos') {
        Ext.util.Cookies.set('cEditarUxM', registro.data.ID);
        window.parent.App.wEmergente.load('FormaAccesoMenus.aspx');
        window.parent.App.wEmergente.setHeight(400);
        window.parent.App.wEmergente.setWidth(670);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Accesos a modulos: ' + registro.data.ID);
        window.parent.App.wEmergente.show();
    }
    
    else if (comando == 'CambiarContrasena') {
        window.parent.App.wEmergente.load('FormaCambiarContrasena.aspx');
        window.parent.App.wEmergente.setHeight(255);
        window.parent.App.wEmergente.setWidth(420);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Cambiar contraseña usuario: ' + registro.data.ID);
        window.parent.App.wEmergente.show();
    }
   
};


//Concatenar la columna de ESTATUS
var cUsuario_Renderer = function (valor, metaData, registro) {
    var estatus = registro.get('Estatus');

    switch (estatus) {
          case 'BAJA':
              return '<img class="IconColumnaEstatus" src="images/pendiente.png" alt="pendiente" /> '  + registro.get('Estatus');
        case 'ALTA':
            return '<img class="IconColumnaEstatus" src="images/concluido.png" alt="concluido" /> '  + registro.get('Estatus');
        case 'BLOQUEADO':
            return '<img class="IconColumnaEstatus" src="images/cancelar.png" alt="cancelar" /> '  + registro.get('Estatus');
    }
};



//Evento que hace el filtro al seleccionar algun elemento
var cmbEstatusFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.value;

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Sucursal
    if (valor == 'Todos') {
        App.sUsuarios.clearFilter();
    }
    else {
        App.sUsuarios.filterBy(function (elemento) {

            if (elemento.get('Estatus').trim() == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

var showSuccess = function () {

};

var getUpdatedRecords = function () {

    var store = App.sAccesos;
    var editedRecords = store.getUpdatedRecords();
    var encodedupdaterecords;
    var xudata = [];
    if (editedRecords.length > 0 || editedRecords != null) {
        for (i = 0; i < editedRecords.length; i++) {
            xudata.push(editedRecords[i].data);
        }
        if (xudata.length > 0) {
            encodedupdaterecords = Ext.encode(xudata);
            return encodedupdaterecords;
        } else {
            return 0;
        }
    }
};
var onSubmitData = function () {
    App.sAccesos.reload();
    Ext.Msg.show({
        id: 'msgPermisos',
        title: 'EXITO',
        msg: "PERMISOS GUARDADOS.",
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.Success
    });
}


var setCheckedAllRecords_Permision = function (avance, registro, index) {
    App.sAccesos.each(function (record) {
        App.chkTodos.getValue() ? record.set('Permiso', true) : record.set('Permiso', false);
    });
}

//Evento de click del botón Editar
var imgbtnNuevoModulo = function () {
    var wp = window.parent.App.wSubModulo;
    wp.load('FormaModulo.aspx');
    wp.setHeight(180);
    wp.setWidth(670);
    wp.center();
    wp.setTitle('Nuevo Modulo');
    wp.show();
};