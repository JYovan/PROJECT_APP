//Concatenar la columna de contacto
var Gerente_Convert = function (value, record) {
    return record.get('GerenteBBVANombre') + ' ' + record.get('GerenteBBVAAPaterno') + ' ' + record.get('GerenteBBVAAMaterno');
};

//Asignar la descripción de la subsubcategoria a esta columna
var cDireccion_Renderer = function (valor, columna, registro) {
    return registro.get('Calle') + ' N°.' + registro.get('NoExterior') + ' COL.' + registro.get('RColonia').Descripcion;
};

//Hacer la busqueda de información en sucursales
var txtBuscarSucursal_Change = function (textfield, newValue, oldValue, e) {
    App.sBSucursales.clearFilter();
    App.sBSucursales.filter([{ filterFn: function (item) {
        if (item.get('CR').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Acciones al hacer clic en un registro de busqueda
var gpBuscaSucursales_ItemDblClick = function (gridview, registro, gvhtml, index) {
    Ext.util.Cookies.set('cookieSucursalID', App.sBSucursales.getAt(index).get('ID'));
    window.parent.App.wEmergente.getBody().App.txtfSucursalCR.setValue(App.sBSucursales.getAt(index).get('CR'));
    window.parent.App.wEmergente.getBody().App.txtfSucursalNombre.setValue(App.sBSucursales.getAt(index).get('Nombre'));
    window.parent.App.wEmergente.getBody().App.txtfSucursalID.setValue(App.sBSucursales.getAt(index).get('ID'));
    window.parent.App.wAyudaConcepto.hide();
};


//Cambio en los datos del tablero de búsqueda de sucursales
var sBSucursales_DataChanged = function () {
    if (App.sBSucursales.getCount() > 1) {
        App.stsbSucursales.setText(App.sBSucursales.getCount() + ' SUCURSALES');
    }
    else {
        App.stsbSucursales.setText(App.sBSucursales.getCount() + ' ' + 'SUCURSAL');
    }

    //Resize column Description when records are 11
    if (App.sBSucursales.getCount() > 10) {
        App.gpSucursales.columns[2].setWidth(260);
    }
    else {
        App.gpSucursales.columns[2].setWidth(280);
    }
};
var onZeroBranch = function () {
   

};