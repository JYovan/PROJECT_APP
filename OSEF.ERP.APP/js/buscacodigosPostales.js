//Variables gloables
var estadoNuevo = false;
var estadoEditar = false;
var indice = 0;

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


//Evento que se lanza al seleccionar un elemento del nodo
var tpCodigosPostales_SelectionChange = function (treemodel, nodos, opciones) {

    estadoEditar = false;
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!estadoNuevo && !estadoEditar) {

        //2. Obtiene los nodo seleccionados
        App.direct.ObtenerCodigosPostales(App.tpCodigosPostales.getSelectionModel().getSelection()[0].getId(), {
            //2. Si es proceso es correcto
            success: function (result) {

            },
            //3. Si existe un error
            failure: function (errorMsg) {
                Ext.Msg.alert('Error', errorMsg);
            }
        });
    }
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

//Hacer doble clic sobre algun concepto del GridPanel
var gpCP_ItemDblClick = function (gridview, registro, gvhtml, index) {
    if (Ext.util.Cookies.get('cookieElijeCodigoPostal') == 'Clientes') {
        window.parent.App.wSubModulo.getBody().App.txtfCodigoPostal.setValue(App.sCodigosPostales.getAt(index).get('Numero'))
        Ext.util.Cookies.set('cookieCP', App.sCodigosPostales.getAt(index).get('Id'));
        window.parent.App.wSubModulo.getBody().App.txtEstado.setValue(App.sCodigosPostales.getAt(index).get('REstado').Descripcion);
        Ext.util.Cookies.set('cookieEstado', App.sCodigosPostales.getAt(index).get('Estado'));
        window.parent.App.wSubModulo.getBody().App.txtMunicipio.setValue(App.sCodigosPostales.getAt(index).get('RMunicipio').Descripcion);
        Ext.util.Cookies.set('cookieMunicipio', App.sCodigosPostales.getAt(index).get('Municipio'));
        window.parent.App.wSubModulo.getBody().App.txtColonia.setValue(App.sCodigosPostales.getAt(index).get('RColonia').Descripcion);
        Ext.util.Cookies.set('cookieColonia', App.sCodigosPostales.getAt(index).get('Colonia'));
        window.parent.App.wSubSubSubModulo.hide();
    }
    if (Ext.util.Cookies.get('cookieElijeCodigoPostal') == 'Sucursales') {
        window.parent.App.wSubSubSubModulo.getBody().App.txtfCodigoPostal.setValue(App.sCodigosPostales.getAt(index).get('Numero'))
        Ext.util.Cookies.set('cookieCP', App.sCodigosPostales.getAt(index).get('Id'));
        window.parent.App.wSubSubSubModulo.getBody().App.txtEstado.setValue(App.sCodigosPostales.getAt(index).get('REstado').Descripcion);
        Ext.util.Cookies.set('cookieEstado', App.sCodigosPostales.getAt(index).get('Estado'));
        window.parent.App.wSubSubSubModulo.getBody().App.txtMunicipio.setValue(App.sCodigosPostales.getAt(index).get('RMunicipio').Descripcion);
        Ext.util.Cookies.set('cookieMunicipio', App.sCodigosPostales.getAt(index).get('Municipio'));
        window.parent.App.wSubSubSubModulo.getBody().App.txtColonia.setValue(App.sCodigosPostales.getAt(index).get('RColonia').Descripcion);
        Ext.util.Cookies.set('cookieColonia', App.sCodigosPostales.getAt(index).get('Colonia'));
        window.parent.App.wSubSubSubSubModulo.hide();
    } 

}