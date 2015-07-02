//Variables gloables
var estadoNuevo = false;
var estadoEditar = false;
var indice=0;

//Evento que se lanza al abrir un nodo del TreePanel
var tpCodigosPostales_BeforeLoad = function (store, operation, options) {
    //1. Obtener el nodo que se abre
    var node = operation.node;

    //2. Construir los nodos hijos
    App.direct.GenerarNodo(node.getId(), {
        success: function (result) {
            node.set('loading', false);
            node.set('loaded', true);
            var data = Ext.decode(result);
            if (data.length != 0) {
                node.appendChild(data, undefined, true);
                node.expand();
            }
        },

        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //3. Regresar falso para no lanzar el Load
    return false;
};

//Cambia de color la columna de Codigos postales
var rfCP = function (value, metadata, registro) {
    var F = Ext.util.Format;

    if (parseFloat(registro.get('Numero')) > 0) {
        metadata.style = "background-color: #0C8D1B; color: #fff;";
    }
    else {
        metadata.style = "background-color: #FEBB5D;";
    }
    return F.number(value, "00000");
};

//Evento que se lanza al seleccionar un elemento del nodo
var tpCodigosPostales_SelectionChange = function (treemodel, nodos, opciones) {

    estadoEditar = false;
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!estadoNuevo && !estadoEditar) {
        getSelectedNodeFromTreePanel(App.tpCodigosPostales.getSelectionModel().getSelection()[0].getId());
    }
};

function getSelectedNodeFromTreePanel(node) {
    //1. Obtiene los nodo seleccionados
    App.direct.ObtenerCodigosPostales(node, {
        //2. Si es proceso es correcto
        success: function (result) {

        },
        //3. Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });
}

//Accion que se lanza al hacer clic en un registro
var tpCodigosPostales_Select = function (gridview, registro, index, gvhtml) {
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!estadoNuevo && !estadoEditar) {
        //2. Habilitar los botones de editar y borrar
        App.imgbtnEditar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false); 
        indice = App.gpCodigosPostales.getSelectionModel().getSelection()[0].index; 
    }
};

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarConcepto', 'Nuevo');
    window.parent.App.wEmergente.load('FormaCodigoPostales.aspx');
    window.parent.App.wEmergente.setHeight(220);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Codigo Postal');
    window.parent.App.wEmergente.show();
};

//Editar un registro
var imgbtnEditar_Click = function (imagebutton, evento, opciones) {

    //1. Campos y Botones a deshabilitar o habilitar 
    App.imgbtnNuevo.setDisabled(false);
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
    
    estadoEditar = true;
};



//Editar un registro
var imgbtnGuardar_Click = function () {

    //1. Validar la información 

    //2. Dejar forma lista para modificar 
    alert(App.cmbEstado.getValue());

};
// msg: '<p align="center">Código Postal registrado ID: ' + App.sVolumetria.getAt(0).get('ID') + '.</p>',

var imgbtnGuardar_Click_Success = function (response, result) {
    getSelectedNodeFromTreePanel(window.parent.App.tpCodigosPostales.getSelectionModel().getSelection()[0].getId());
    window.parent.App.wEmergente.hide();
}

var imgbtnGuardar_change = function () {
    var regex = /^[0-9]{5,5}$/
    if (regex.test(App.txtCP.getValue())) {
        App.imgbtnGuardar.setDisabled(false);
    } else {
        App.imgbtnGuardar.setDisabled(true);
    }
}


//Evento de click del botón Editar
var imgbtnEditar_Click = function () { 
    Ext.util.Cookies.set('cookieEditarCodigoPostal', App.gpCodigosPostales.getSelectionModel().getSelection()[0].get('Id'));
    window.parent.App.wEmergente.load('FormaCodigoPostales.aspx'); 
    window.parent.App.wEmergente.setHeight(220);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar codigo postal ' + Ext.util.Cookies.get('cookieEditarCodigoPostal')); 
    window.parent.App.wEmergente.show();
};


//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {

    if (result.extraParamsResponse.existe) {

        Ext.Msg.show({
            id: 'msgCodigopostal',
            title: 'Advertencia Código Postal',
            msg: 'El código postal, esta siendo utilizado en algún modulo de sucursales.',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpCodigosPostales.getSelectionModel().getSelection()[0].get('Id');
        var numero = App.gpCodigosPostales.getSelectionModel().getSelection()[0].get('Numero');
         
        App.sCodigosPostales.removeAt(App.gpCodigosPostales.getSelectionModel().getSelection()[0].index);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Codigo Postal eliminado: ' + numero + '</p>',
            title: 'Registro eliminado'
        });
        App.gpCodigosPostales.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
        //4. Recargar el tablero  

    }
};

//Hacer doble clic sobre algun concepto del GridPanel
var gpCP_ItemDblClick = function (gridview, registro, gvhtml, index) {  
    window.parent.App.wEmergente.getBody().App.txtfCodigoPostal.setValue(App.sCodigosPostales.getAt(index).get('Numero'))
    Ext.util.Cookies.set('cookieCP', App.sCodigosPostales.getAt(index).get('Id'));
    window.parent.App.wEmergente.getBody().App.txtEstado.setValue(App.sCodigosPostales.getAt(index).get('REstado').Descripcion);
    Ext.util.Cookies.set('cookieEstado', App.sCodigosPostales.getAt(index).get('Estado'));
    window.parent.App.wEmergente.getBody().App.txtMunicipio.setValue(App.sCodigosPostales.getAt(index).get('RMunicipio').Descripcion);
    Ext.util.Cookies.set('cookieMunicipio', App.sCodigosPostales.getAt(index).get('Municipio'));
    window.parent.App.wEmergente.getBody().App.txtColonia.setValue(App.sCodigosPostales.getAt(index).get('RColonia').Descripcion);
    Ext.util.Cookies.set('cookieColonia', App.sCodigosPostales.getAt(index).get('Colonia')); 
    window.parent.App.wAyudaConcepto.hide();
}


//Asignar la descripción del estado a esta columna
var cEstado_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        if (registro.get('Estado') != registro.get('REstado').ID) {
            var sts = App.sEstados.findRecord('ID', valor);
            return sts.get('Descripcion');
        } else {
            return registro.get('REstado').Descripcion;
        } 
    }
};

//Asignar la descripción del municipio a esta columna
var cMunicipio_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {  
        if (registro.get('Municipio') != registro.get('RMunicipio').ID) {
            var mun = App.sMunicipios.findRecord('ID', valor);
            return mun.get('Descripcion');
        } else {
            return registro.get('RMunicipio').Descripcion;
        }
    }
};

//Asignar la descripción del Colonia a esta columna
var cColonia_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        if (registro.get('Colonia') != registro.get('RColonia').ID) {
            var col = App.sColonias.findRecord('ID', valor);
            return col.get('Descripcion');
        } else {
            return registro.get('RColonia').Descripcion;
        }
    }
};

//Cell Editor
var ceCodigoPostal_Edit = function (cellEdit, datos, options) {
    var festado = App.sEstados.findRecord('ID', datos.value);
    var rsts = datos.record.get('REstado');
    rsts.ID = festado.get('ID');
    rsts.Descripcion = festado.get('Descripcion');
    datos.record.set('REstado', rsts);

};

//Editar el registro en el que se esta posicionado
var imgbtnsEditar_Click = function () {
    //Get index of record selection
    var index = App.gpCodigosPostales.getSelectionModel().getSelection()[0].index;

    //Validar si el indice esta como indefinido
    if (index == undefined) {
        index = indice;
    }

    //Get store of GridPanel
    var store = App.gpCodigosPostales.getStore();

    //Enabled the edit option
    App.gpCodigosPostales.editingPlugin.startEdit(App.gpCodigosPostales.getStore().getAt(index), App.gpCodigosPostales.columns[1]);
};


//Validar la edición o un nuevo registro
var ceCodigoPostal_ValidateEdit = function (editor, context) {
    var store = App.gpCodigosPostales.getStore(); 
    if (context.field == 'Numero') {
        App.direct.ActualizarCodigoPostal(store.getAt(context.rowIdx).get('Id'), store.getAt(context.rowIdx).get('Numero'), context.value.toUpperCase());
    }
};


//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {

    Ext.Msg.show({
        id: 'msgCP',
        title: 'CÓDIGO POSTAL ',
        msg: '<p align="center">CP: ' + result.extraParamsResponse.data + ' registrado.</p>',
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