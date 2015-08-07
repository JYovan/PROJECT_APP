var indiceDetalle;



//Evento que valida si ya esta concluido para bloquear el detalle y si es borrador no hace nada si ya esta concluido o cancelado
var validaConcluidos = function (a, d, f) {

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {
        return false;
  
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    else if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {
        return false;

    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    else if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {
        return false;
    }

    else {
        return true
    }
};

//Evento lanzado al cargar el store de avance encabezado
var sFormaGenerador_Load = function () {



    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CONCLUIDO') {

        App.imgbtnAceptar.setDisabled(true);
        App.txtDescripcionCorta.setDisabled(true);
        App.txtPlano.setDisabled(true);

    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    else if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'CANCELADO') {

        App.imgbtnAceptar.setDisabled(true);
        App.txtDescripcionCorta.setDisabled(true);
        App.txtPlano.setDisabled(true);

    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de generador para solo vista
    else if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') != 'Nuevo' && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Mov').trim() == 'Estimacion') {

        App.imgbtnAceptar.setDisabled(true);
        App.txtDescripcionCorta.setDisabled(true);
        App.txtPlano.setDisabled(true);


    }
    else {
        App.sFormaGenerador.insert(App.sFormaGenerador.getCount(), {});

    }

  

    var tablero = window.parent.App.wEmergente.getBody().App.cmbMov.getValue();
    if (tablero.trim() == 'Mesa de reporte') {
        App.txtDescripcionCorta.setVisible(false);
        App.txtPlano.setVisible(false);
    } else {
        App.txtDescripcionCorta.setValue(App.sFormaGenerador.getAt(0).get('Descripcion').trim());
       App.txtPlano.setValue(App.sFormaGenerador.getAt(0).get('Plano').trim());
    }

    //Pinta el total
    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue(F.number(sum, "000,000,000.000000"));
    ImporteFinal = sum;
};


var nfLargo_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.000000");
};

var nfAncho_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.000000");
};

var nfAlto_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.000000");
};

var nfCantidad_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.000000");
};

var ncTotal_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000,000,000.000000");
};


//Evento que se lanza despues de editar una columna
var ceGenerador_Edit = function (cellediting, columna) {
    //Verificar si abajo de esta columna existe otra
    if (App.sFormaGenerador.getAt(columna.rowIdx + 1) == undefined) {
        //Verificar si toda la fila contiene datos
        var registro = App.sFormaGenerador.getAt(columna.rowIdx);



        if (registro.get('Area').length != 0
        && registro.get('Total') != 0) {

            //Insertar un nuevo registro
            App.sFormaGenerador.insert(App.sFormaGenerador.getCount(), {});
            //Actualiza el renglon anterior pintando el botón de borrar
            App.gpFormaGenerador.getView().refreshNode(App.sFormaGenerador.getCount() - 2);

           
            //Validar si se habilita el boton de afectar
            HabilitarGuardar();

        }
    }
};

//Ocultar el último renglon
var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    if (grid.getStore().getCount() - 1 == rowIndex) {
        toolbar.items.get(0).hide();
    }

};


//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro
    App.sFormaGenerador.removeAt(fila);

   
   //Setea el valor final 
    ImporteFinal = ImporteFinal - parseFloat(registro.get('Total'));
    

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue('' + F.number(ImporteFinal, "000,000,000.000000"));
    ImporteFinal = ImporteFinal;

};


var ImporteFinal;
//Calular Total cuando la columnas cambian
var calcularTotalLargo_Change = function (component) {

    var valorancho = App.sFormaGenerador.getAt(indiceDetalle).data.Ancho;
    var valorAlto = App.sFormaGenerador.getAt(indiceDetalle).data.Alto;
    var valorCantidad = App.sFormaGenerador.getAt(indiceDetalle).data.Cantidad;



    if (valorancho == null || valorancho == "") {
        valorancho = 1;
    }
    if (valorAlto == null || valorAlto == "") {
        valorAlto = 1;
    }
    if (valorCantidad == null || valorCantidad == "") {
        valorCantidad = 1;
    }

    var Total = parseFloat(component.getValue() * parseFloat(valorancho) * parseFloat(valorAlto) * parseFloat(valorCantidad))
    App.sFormaGenerador.getAt(indiceDetalle).set('Total', Total);

    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue('' + F.number(sum, "000,000,000.000000"));
    ImporteFinal = sum;
}

//Calular Total cuando la columnas cambian
var calcularTotalAncho_Change = function (component) {

    var valorLargo = App.sFormaGenerador.getAt(indiceDetalle).data.Largo;
    var valorAlto = App.sFormaGenerador.getAt(indiceDetalle).data.Alto;
    var valorCantidad = App.sFormaGenerador.getAt(indiceDetalle).data.Cantidad;


    if (valorLargo == null || valorLargo == "") {
        valorLargo = 1;
    }
    if (valorAlto == null || valorAlto == "") {
        valorAlto = 1;
    }
    if (valorCantidad == null || valorCantidad == "") {
        valorCantidad = 1;
    }
   
    var Total = parseFloat(component.getValue() * parseFloat(valorLargo) * parseFloat(valorAlto) * parseFloat(valorCantidad))
    App.sFormaGenerador.getAt(indiceDetalle).set('Total', Total);

    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue(F.number(sum, "000,000,000.000000"));
    ImporteFinal = sum;
}


//Calular Total cuando la columnas cambian
var calcularTotalAlto_Change = function (component) {


    var valorLargo = App.sFormaGenerador.getAt(indiceDetalle).data.Largo;
    var valorAncho = App.sFormaGenerador.getAt(indiceDetalle).data.Ancho;
    var valorCantidad = App.sFormaGenerador.getAt(indiceDetalle).data.Cantidad;

    if (valorLargo == null || valorLargo == "") {
        valorLargo = 1;
    }
    if (valorAncho == null || valorAncho == "") {
        valorAncho = 1;
    }
    if (valorCantidad == null || valorCantidad == "") {
        valorCantidad = 1;
    }

    var Total = parseFloat(component.getValue() * parseFloat(valorLargo) * parseFloat(valorAncho) * parseFloat(valorCantidad))
    App.sFormaGenerador.getAt(indiceDetalle).set('Total', Total);

    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue(F.number(sum, "000,000,000.000000"));
    ImporteFinal = sum;

}

//Calular Total cuando la columnas cambian
var calcularTotalCantidad_Change = function (component) {


    

    var valorLargo = App.sFormaGenerador.getAt(indiceDetalle).data.Largo;
    var valorAncho = App.sFormaGenerador.getAt(indiceDetalle).data.Ancho;
    var valorAlto = App.sFormaGenerador.getAt(indiceDetalle).data.Alto;

    if (valorLargo == null || valorLargo == "") {
        valorLargo = 1;
    }
    if (valorAncho == null || valorAncho == "") {
        valorAncho = 1;
    }
    if (valorAlto == null || valorAlto == "") {
        valorAlto = 1;
    }

    var Total = parseFloat(component.getValue() * parseFloat(valorLargo) * parseFloat(valorAncho) * parseFloat(valorAlto))
    App.sFormaGenerador.getAt(indiceDetalle).set('Total', Total);

    var sum = 0;
    App.sFormaGenerador.each(function (record) {

        sum += record.get('Total');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotal.setValue(F.number(sum, "000,000,000.000000"));
    ImporteFinal = sum;
    
}


var cantidad_Blur = function () {

    HabilitarGuardar();
}

//Obtner el indice del grid panel del detalle
var obetenerRenglon_Select = function (gridview, registro, index) {
    indiceDetalle = index;

}


var txtDescripcion_Corta_Change = function () {

    App.txtDescripcionCorta.setValue(App.txtDescripcionCorta.getValue().toUpperCase());
    HabilitarGuardar();
}

//Validar si se habilita el botón d Afectar
function HabilitarGuardar() {
    //Obtiene la fecha de emision del store
    var tablero = window.parent.App.wEmergente.getBody().App.cmbMov.getValue();
    if (tablero.trim() == 'Mesa de reporte'
    && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'BORRADOR' 
    && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Mov').trim() != 'Estimacion') { 
        if (App.gpFormaGenerador.getStore().getCount() != 0) 
            { 
                if (App.sFormaGenerador.getAt(0).get('Area').length != 0
                    && App.sFormaGenerador.getAt(0).get('Total') != 0) {

                    App.imgbtnAceptar.setDisabled(false);
                    
                }
            }
            else 
            {
                App.imgbtnAceptar.setDisabled(true);
            } 
    }
    else {
        App.imgbtnAceptar.setDisabled(true);
    }

    if (window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Estatus') == 'BORRADOR'
    && window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('Mov').trim() != 'Estimacion'
    && App.gpFormaGenerador.getStore().getCount() != 0) {
        if(App.sFormaGenerador.getAt(0).get('Area').length != 0
                    && App.sFormaGenerador.getAt(0).get('Total') != 0) {

                    App.imgbtnAceptar.setDisabled(false);
                }
    }else{
                App.imgbtnAceptar.setDisabled(true);
    }

}


var strID = function () {
    if (Ext.util.Cookies.get('cookieEditarOrdenEstimacion') === 'Nuevo') {
        return null;
    } else {
        return window.parent.App.wEmergente.getBody().App.sOrdenEstimacion.getAt(0).get('ID');
    }
}
var getRecordValues = function () {
    var store = window.parent.App.wEmergente.getBody().App.sConceptos;
    var records = store.getRecordsValues();
    var encodedrecords;
    var xudata = [], data = [];
    if (records.length > 0 || records != null) {
        var r = records[0];
        for (var key in r) {
            //                console.log(key, r[key]);
            xudata.push('"' + key + '":' + r[key]);
            data[key] = r[key];
        }
        xudata.join(",");
        var ext = Ext.encode(records);
        if (xudata.length > 0) {
            return ext;
        } else {
            return 0;
        }
    }
}

var getNewEncodedRecords = function () {

    var store = window.parent.App.wEmergente.getBody().App.sConceptos;
    var newRecords = store.getNewRecords();
    var encodednewrecords;
    var xndata = []; 
    if (newRecords.length > 0 || newRecords != null) {

        for (i = 0; i < newRecords.length; i++) {
            xndata.push(newRecords[i].data);
        }

        xndata.pop();
        if (xndata.length > 0) {
            encodednewrecords = Ext.encode(xndata);
            return encodednewrecords;
        } else {
            return 0;
        }
    }
};

var getRemovedRecords = function () {
    var store = window.parent.App.wEmergente.getBody().App.sConceptos;
    var deleteRecords = store.getRemovedRecords();
    var encodedremovedrecords;
    var xrdata = [];

    if (deleteRecords.length > 0 || deleteRecords != null) {
        for (i = 0; i < deleteRecords.length; i++) {
            xrdata.push(deleteRecords[i].data);
        }
        if (xrdata.length > 0) {
            encodedremovedrecords = Ext.encode(xrdata);
            return encodedremovedrecords;
        } else {
            return 0;
        }
    }
};

var getUpdatedRecords = function () {

    var store = window.parent.App.wEmergente.getBody().App.sConceptos;
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

var imgbtnAceptar_Click = function () {

    var wp = window.parent.App.wEmergente.getBody();
    var tf = false;
    //    var strOrdenEstimacionForma = Ext.encode(wp.App.fpOrdenEstimacion.getForm().getValues()); 
    var newRecords, deleteRecords, updateRecords;

    window.parent.App.wEmergente.getBody().App.sConceptos.getAt(Ext.util.Cookies.get('cookieRenglonOrdenEstimacionD')).set("Cantidad", ImporteFinal.toFixed(6)); 

    newRecords = getNewEncodedRecords();
    deleteRecords = getRemovedRecords();
    updateRecords = getUpdatedRecords();

    wp.App.direct.imgbtnGuardarDirect_Click(strID(), newRecords, updateRecords, deleteRecords, wp.App.sConceptos.getCount(),
                 {
                     success: function () {
                         wp.App.sConceptos.reload({
                             callback: function () {
                                 if (wp.App.sConceptos.getCount() > 0) {
                                     //Obtener el Renglon anterior
                                     var auxRenglonAnterior = wp.App.sConceptos.getCount() - 1;
                                     var renglonAnterior = wp.App.sConceptos.getAt(auxRenglonAnterior).get('Renglon') + 1;
                                     wp.App.sConceptos.insert(wp.App.sConceptos.getCount(), { Renglon: renglonAnterior });
                                 } else {
                                     wp.App.sConceptos.insert(wp.App.sConceptos.getCount(), { Renglon: 1 });
                                 }
                             }
                         });
                     },
                     failure: function (errorMsg) {
                         Ext.Msg.alert('Error', errorMsg);
                     }
                 }
    );
    window.parent.App.wGenerador.hide();
} 
var txtDescripcion_Corta_SpecialKey = function (field, eventArgs) { 
    if (eventArgs.getKey() == eventArgs.ENTER) { 
    }
};
var onSuccess = function () {

};