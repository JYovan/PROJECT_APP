var indice = 0;
var store;


//Cambio en los datos del tablero
var sPreciarios_DataChanged = function () {
    if (App.sPreciarios.getCount() > 1 || App.sPreciarios.getCount() == 0) {
        App.sbPreciarios.setText(App.sPreciarios.getCount() + ' ' + 'PRECIARIOS');
    }
    else {
        App.sbPreciarios.setText(App.sPreciarios.getCount() + ' ' + 'PRECIARIO');
    }
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sPreciarios.clearFilter();
    App.sPreciarios.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1
        || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1
        || item.get('Sucursal').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpPreciarios.getSelectionModel().deselectAll(); 
};

//Asignar el nombre de la sucursal en base al ID
var cSucursal_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        if (registro.get('Sucursal') != registro.get('RSucursal').ID) {
            var sts = App.sPreciarios.findRecord('Sucursal', valor);
            return sts.get('Nombre');
        } else {
            return registro.get('RSucursal').Nombre;
        }
    }
};

//Acciones al hacer clic en un registro
var gpPreciarios_ItemClick = function (gridview, registro, gvhtml, index) {

    indice = index;
};

//Hacer doble clic sobre algun concepto del GridPanel
var gpPreciarioActivo_ItemDblClick = function (gridview, registro, gvhtml, index) {

    var prt = window.parent.App.wEmergente.getBody();
    prt.App.cmbPreciario.setValue(App.sPreciarios.getAt(index).get('ID'));
    prt.App.txtfDescripcionPreciario.setValue(App.sPreciarios.getAt(index).get('Descripcion'));
    prt.App.txtfIDSucursal.setValue(App.sPreciarios.getAt(index).get('Sucursal'));
    prt.App.txtfSucursalNombre.setValue(App.sPreciarios.getAt(index).get('RSucursal').Nombre);
     //    Ext.util.Cookies.set('cookieCP', App.sCodigosPostales.getAt(index).get('Id'));
    window.parent.App.wAyudaConcepto.hide();
}