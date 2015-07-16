

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () { 
    Ext.util.Cookies.set('cookieCP', '');
    Ext.util.Cookies.set('cookieEditarCliente', 'Nuevo');
    window.parent.App.wSubModulo.load('FormaCliente.aspx');
    window.parent.App.wSubModulo.setHeight(515);
    window.parent.App.wSubModulo.setWidth(830);
    window.parent.App.wSubModulo.center();
    window.parent.App.wSubModulo.setTitle('Nuevo cliente');
    window.parent.App.wSubModulo.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    var idcp = App.gpClientes.getSelectionModel().getSelection()[0].get('RCodigoPostal');
    if (idcp != null) {
        Ext.util.Cookies.set('cookieCP', idcp.Id);
    }
    Ext.util.Cookies.set('cookieEditarCliente', App.gpClientes.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wSubModulo.load('FormaCliente.aspx');
    window.parent.App.wSubModulo.setHeight(515);
    window.parent.App.wSubModulo.setWidth(830);
    window.parent.App.wSubModulo.center();
    window.parent.App.wSubModulo.setTitle('Editar cliente ' + Ext.util.Cookies.get('cookieEditarCliente'));
    window.parent.App.wSubModulo.show();
};

//Acciones al hacer clic en un registro
var gpClientes_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Cambio en los datos del tablero
var sClientes_DataChanged = function () {


    if (App.sClientes.getCount() > 1 || App.sClientes.getCount() == 0) {
        App.sbClientes.setText(App.sClientes.getCount() + ' CLIENTES');
    }
    else {
        App.sbClientes.setText(App.sClientes.getCount() + ' CLIENTE');
    }

    //Resize column Description when records are 11
    if (App.sClientes.getCount() > 10) {
        App.gpClientes.columns[1].setWidth(263);
    }
    else {
        App.gpClientes.columns[1].setWidth(280);
    }
};

//Concatenar la columna de Nombre Completo
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};




//Método que se lanza despues de guardar un registro
var imgbtnGuardar_Click_Success = function (response, result) {


    if (Ext.util.Cookies.get('cookieEditarCliente') === 'Nuevo') {
        Ext.Msg.show({
            id: 'msgNuevo',
            title: 'Registro nuevo',
            msg: '<p align="center">Cliente registrado con éxito</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { window.parent.App.wSubModulo.hide(); window.parent.App.pCentro.getBody().App.sClientes.reload(); },
            icon: Ext.MessageBox.INFO
        });
    }
    else {
        Ext.Msg.show({
            id: 'msgActualizar',
            title: 'Actualizar registro',
            msg: '<p align="center">Cliente actualizado ID: ' + result.extraParamsResponse.registro + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { window.parent.App.wSubModulo.hide(); window.parent.App.pCentro.getBody().App.sClientes.reload(); },
            icon: Ext.MessageBox.INFO
        });
    }
};

//Evento lanzado al cargar el store de la sucursal
var sCliente_Load = function () {
    //1. Validar si es nuevo o se va a Editar
    if (Ext.util.Cookies.get('cookieEditarCliente') !== 'Nuevo') {
        App.direct.sCliente_Load({
            //Si el proceso es correcto
            success: function (result) {
                App.cmbEstatus.setDisabled(false);
            },

            //Si existe un error
            failure: function (errorMsg) {
                Ext.Msg.alert('Error', errorMsg);
            }
        });
    }
    else {
        App.cmbEstatus.setDisabled(true);
    }

    //2. Obtener el Store de sClientes
    store = window.parent.App.pCentro.getBody().App.sClientes;
};

//Evento lanzado al agregar un registro al store
var sCliente_Add = function (store, registro) {
    //Primera parte
    App.txtfID.setValue(registro[0].get('ID'));
    App.txtfNombre.setValue(registro[0].get('Nombre'));
    App.txtfAPaterno.setValue(registro[0].get('APaterno'));
    App.txtfAMaterno.setValue(registro[0].get('AMaterno'));
    App.txtfTelefono.setValue(registro[0].get('Telefono'));
    App.txtfTelefonoMovil.setValue(registro[0].get('TelefonoMovil'));
    App.txtfCorreo.setValue(registro[0].get('Correo'));
    App.txtfUsuario.setValue(registro[0].get('Usuario'));
    App.cmbEstatus.select(registro[0].get('Estatus'));
    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));

    //Segunda parte
    App.txtfCalle.setValue(registro[0].get('Calle'));
    App.txtfEntreCalles.setValue(registro[0].get('EntreCalles'));
    App.txtfNoExterior.setValue(registro[0].get('NoExterior'));
    App.txtfNoInterior.setValue(registro[0].get('NoInterior'));

    if (registro[0].get('RCodigoPostal') != null) {
        App.txtfCodigoPostal.setValue(registro[0].get('RCodigoPostal').Numero);
        App.txtColonia.setValue(registro[0].get('RColonia').Descripcion);
        App.txtEstado.setValue(registro[0].get('REstado').Descripcion);
        App.txtMunicipio.setValue(registro[0].get('RMunicipio').Descripcion);

    }

    App.txtFileName.setValue(registro[0].get('RutaLogo'));
};




var txtBuscarCliente_Change = function (textfield, newValue, oldValue, e) {
    App.sClientes.clearFilter();
    App.sClientes.filter([{ filterFn: function (item) {
        if (item.get('Nombre').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Acciones al hacer clic en un registro de busqueda
var gpBuscaClientes_ItemDblClick = function (gridview, registro, gvhtml, index) {
    window.parent.App.wEmergente.getBody().App.IdCliente.setValue(App.sClientes.getAt(index).get('ID'));
    window.parent.App.wEmergente.getBody().App.txtCliente.setValue(App.sClientes.getAt(index).get('Nombre')); 
    window.parent.App.wAyudaConcepto.hide();
};


var onFUCliente = function (componente, valor) {
    App.txtFileName.setValue(App.fuImagenCliente.getValue());
}

//Evento de clic del botón BuscarSucursal
var btnBuscarSucursal_Click = function () {
    Ext.util.Cookies.set('cookieElijeSucursal', "Cliente");
    window.parent.App.wSubSubModulo.load('Sucursales.aspx'); 
    window.parent.App.wSubSubModulo.setHeight(470);
    window.parent.App.wSubSubModulo.setWidth(980);
    window.parent.App.wSubSubModulo.center();
    window.parent.App.wSubSubModulo.setTitle('BUSCAR UNA SUCURSAL');
    window.parent.App.wSubSubModulo.show();
};

var imgbtnBuscar_Click = function () {
    Ext.util.Cookies.set('cookieElijeCodigoPostal', 'Clientes');
    var wssssm = window.parent.App.wSubSubSubModulo;
    wssssm.load('FormaBuscaCodigosPostales.aspx');
    wssssm.setHeight(350);
    wssssm.setWidth(980);
    wssssm.center();
    wssssm.setTitle('BUSCAR CODIGO POSTAL');
    wssssm.show();
};

//Asignar la descripción de la cuadrilla a esta columna
var cCodigoPostal_Renderer = function (valor, columna, registro) { 
    columna.style = "background-color: #A3CC52; color: #FFFFFF;";
    return registro.get('RCodigoPostal').Numero;
};

var imgbtn_EliminarCliente = function () {

    var identificador = App.gpClientes.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpClientes.getStore().find('ID', identificador); 
    var nombre = App.sClientes.getAt(indice).get('Nombre');
    Ext.Msg.show({
        id: 'msgEliminarCliente',
        title: 'ADVERTENCIA',
        msg: '¿Estás seguro de eliminar el cliente: ' + nombre + '? ',
        buttons: Ext.MessageBox.YESNO,
        onEsc: Ext.emptyFn,
        closable: false,
        fn: function (btn) {
            if (btn === 'yes') {
                App.direct.EliminarCliente(identificador);
                App.gpClientes.getStore().reload();
            }
        },
        icon: Ext.MessageBox.WARNING
    });

}


var showResult = function () {

}