

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
    //    if (App.sClientes.getCount() > 1 || App.sClientes.getCount() == 0) {
    //        App.sbClientes.setText(App.sClientes.getCount() + ' CLIENTES');
    //    }
    //    else {
    //        App.sbClientes.setText(App.sClientes.getCount() + ' CLIENTE');
    //    }

    //    //Resize column Description when records are 11
    //    if (App.sClientes.getCount() > 10) {
    //        App.gpClientes.columns[1].setWidth(263);
    //    }
    //    else {
    //        App.gpClientes.columns[1].setWidth(280);
    //    }
    App.PagingToolbar1.displayMsg = 'MOSTRANDO {1} DE {2} CLIENTES';
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
    var r = registro[0];
    //Primera parte
    App.txtfID.setValue(r.get('ID'));
    App.txtfNombre.setValue(r.get('Nombre'));
    App.txtfAPaterno.setValue(r.get('APaterno'));
    App.txtfAMaterno.setValue(r.get('AMaterno'));
    App.txtfTelefono.setValue(r.get('Telefono'));
    App.txtfTelefonoMovil.setValue(r.get('TelefonoMovil'));
    App.txtfCorreo.setValue(r.get('Correo'));
    App.txtfUsuario.setValue(r.get('Usuario'));
    App.cmbEstatus.select(r.get('Estatus'));
    App.dfFechaAlta.setValue(r.get('FechaAlta'));

    App.txtElaboro.setValue(r.get('Elaboro'));
    App.txtReviso.setValue(r.get('Reviso'));
    App.txtAutorizo.setValue(r.get('Autorizo'));

    //Segunda parte
    App.txtfCalle.setValue(r.get('Calle'));
    App.txtfEntreCalles.setValue(r.get('EntreCalles'));
    App.txtfNoExterior.setValue(r.get('NoExterior'));
    App.txtfNoInterior.setValue(r.get('NoInterior'));

    if (r.get('RCodigoPostal') != null) {
        App.txtfCodigoPostal.setValue(r.get('RCodigoPostal').Numero);
        App.txtColonia.setValue(r.get('RColonia').Descripcion);
        App.txtEstado.setValue(r.get('REstado').Descripcion);
        App.txtMunicipio.setValue(r.get('RMunicipio').Descripcion);

    }
    App.cmbProveedor.setValue(r.get('Proveedor'));
    App.txtFileName.setValue(r.get('RutaLogo'));
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
    var wp = window.parent.App.wEmergente.getBody();
    wp.App.IdCliente.setValue(App.sClientes.getAt(index).get('ID'));
    wp.App.txtCliente.setValue(App.sClientes.getAt(index).get('Nombre'));
    if (wp.App.cmbPreciario != undefined) {
        wp.App.cmbPreciario.setValue('');
        wp.App.txtfDescripcionPreciario.setValue('');
        wp.App.txtfIDSucursal.setValue('');
        wp.App.txtfSucursalNombre.setValue('');
    }
    wp.App.imgbtnGuardar.setDisabled(true);
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