//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sConceptosFiltrados.clearFilter();
    App.sConceptosFiltrados.filter([{ filterFn: function (item) {
        if (item.get('Clave').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpConceptos.getSelectionModel().deselectAll();
};

//Acciones al hacer clic en un registro
var gpConceptos_ItemClick = function (gridview, registro, gvhtml, index) {
    App.txtDescripcion.setValue(registro.get('Descripcion'));
};

//Acciones al seleccionar un registro
var gpConceptos_Select = function (gridview, registro, gvhtml, index) {
    App.txtDescripcion.setValue(registro.get('Descripcion'));
};


//Hacer doble clic sobre algun concepto del GridPanel
var gpConceptos_ItemDblClick = function (gridview, registro, gvhtml, index) {
  
    window.parent.App.wEmergente.getBody().App.txtfBuscar.setValue(App.sConceptosFiltrados.getAt(index).get('Clave'));
    window.parent.App.wAyudaConcepto.hide();
 

};