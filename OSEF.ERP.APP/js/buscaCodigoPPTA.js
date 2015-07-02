//Hacer la busqueda de información en sucursales
var txtBuscarSucursal_Change = function (textfield, newValue, oldValue, e) {
    App.sCodigosPPTA.clearFilter();
    App.sCodigosPPTA.filter([{ filterFn: function (item) {
        if (item.get('CodigoMainSaver').toUpperCase().indexOf(newValue.toUpperCase()) > -1 ) { return true; }
        else { return false; }
    }
    }]);
};


//Acciones al hacer clic en un registro de busqueda
var gpBuscaCodigos_ItemDblClick = function (gridview, registro, gvhtml, index) {
    window.parent.App.wEmergente.getBody().App.txtfCodigoFalla.setValue(App.sCodigosPPTA.getAt(index).get('CodigoMainSaver'));
    window.parent.App.wEmergente.getBody().App.nfDiasAtencion.setValue(App.sCodigosPPTA.getAt(index).get('Dias'));
    window.parent.App.wAyudaConcepto.hide();
};
