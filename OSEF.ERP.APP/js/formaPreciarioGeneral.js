//Evento que se lanza al poner algun texto en la descripcion
var txtfDescripcion_Change = function (txtDescripcion, Evento) {
    //Validar si se habilita Guardar
    HabilitarGuardar();
};

//Revisa la extencion del archivo de excel forzosamente
var CheckExtension = function (FileUploadField1, file) {
    //Se declara un arreglo con las extenciones que serán permitidas
    var validFilesTypes = ["xls", "xlsx"];
    //se pasa el parametro que contiene el archivo
    var filePath = file;
    //Se extrae la cadena a apartir del punto
    var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
    //Se declara la bandera falsa
    var isValidFile = false;
    //se recorre el arreglo que contiene las extenciones validas y se compara
    for (var i = 0; i < validFilesTypes.length; i++) {
        //Si la extenvion es igual a la valida la variable es igual a true
        if (ext == validFilesTypes[i]) {
            isValidFile = true;
            break;
        }
    }
    //si no es valida no la deja pasar y manda el mensaje ademas de poner en blanco el control
    if (!isValidFile) {
        file.value = null;
        FileUploadField1.reset();

        Ext.Msg.show({
            id: 'msgPreciarios',
            title: 'Advertencia Preciarios',
            msg: "Extensión inválida, sólo archivos con extensión:\n\n" + validFilesTypes.join(", "),
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });

    }
    HabilitarGuardar();
    return isValidFile;
};


//Evento que borra el preciario, sí se equivocó de archivo
var BorrarDetallePreciario = function () {
    App.sCarga.removeAll();
};

//Evento que se lanza despues de cargar un archivo de Excel
var btnImportar_Click_Success = function (response, result) {
    //Valida si se habilita el boton de guardar
    HabilitarGuardar();

    if (result.extraParamsResponse.accion == 'error') {
        Ext.Msg.show({
            id: 'msgPreciarioConcepto',
            title: 'Advertencia Preciarios',
            msg: "El formato no coincide con el indicado en las columnas <br><br>" + result.extraParamsResponse.data + "<br><br>Por favor verifica tu archivo.",

            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
}

//Funciones que validan que este seleccionado un tipo preciario al meno
var rObra_Change = function (radio) {
    App.rObra.setValue(radio.value);
    HabilitarGuardar();
};

var rMnto_Change = function (radio) {  
    App.rMnto.setValue(radio.value);    
    HabilitarGuardar();
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sCarga.clearFilter();
    App.sCarga.filter([{ filterFn: function (item) {
        if (item.get('Clave').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    //App.sCarga.getSelectionModel().deselectAll();
  
};
 
//Renglones nuevos
var getRowClass = function (record) {


    if (record.phantom) {
        return "new-row";

    }

    if (record.dirty) {
        App.imgbtnGuardar.setDisabled(false);
        return "dirty-row";

    }
    else if (record.dirty== false) {
        App.imgbtnGuardar.setDisabled(true);
    }
};

//Formato numerico a Precio
var rendererCosto = function (value) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(value, "$000,000,000.00");
};

//Formato Cantidades
var rendererCantidad = function (valor, metaData, registro) {  
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(registro.get('Cantidad'), "000,000,000.00");
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
//    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sPreciariosGenerales.reload();
    App.sbFormaPreciario.setText('ACTIVO');
};

////Evento que ocurre al dar clic en imgbtnGuardar
//var imgbtnGuardar_Click_SuccessRepetido = function () {
//  
//};
 
//Evento lanzado al agregar un registro al store
var sPreciario_Add = function (avance, registro) {
    //Lo que pasa cuando se selecciona un registro y es diferente de nuevo
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') != 'Nuevo') {
        App.txtfID.setValue(registro[0].get('ID'));
        App.txtfDescripcion.setValue(registro[0].get('Descripcion'));
        App.txfArchivoActual.setValue(registro[0].get('Archivo'));
        App.cmbEstatus.setValue(registro[0].get('Estatus'));
        App.dfFechaEmision.setValue(registro[0].get('FechaAlta'));
        App.rObra.setValue(registro[0].get('TipoObra'));
        App.rMnto.setValue(registro[0].get('TipoMantenimiento'));

        //Deshabilita botones cuando se edita un movimiento al cargar el store
        App.cmbEstatus.setDisabled(false);
        App.cmbEstatus.setDisabled(true);
        App.nfHoja.setDisabled(true);
        App.btnCargar.setDisabled(true);
        App.rObra.setDisabled(true);
        App.rMnto.setDisabled(true);
        App.imgbtnBorrarCarga.setDisabled(true);
        App.fufArchivoExcel.setDisabled(true);
        App.sbFormaPreciario.setText(registro[0].get('Estatus'));
    }
};

//Evento que muestra el valor de la columna Concepto por su descripción y no por su ID
var cCategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        return registro.get('RCategoria').Descripcion;
    }
};

//Asignar la descripción de la subcategoria a esta columna
var cSubCategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        return registro.get('RSubCategoria').Descripcion;
    }
};

//Asignar la descripción de la subsubcategoria a esta columna
var cSubSubCategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        return registro.get('RSubSubCategoria').Descripcion;
    }
};

//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro

    App.direct.ObtenerConceptosEnUsoPorIDyClave(registro.get('ID'), registro.get('Clave'), {
        success: function (result) { 
            if (result) {
                Ext.Msg.show({
                    id: 'msgPreciarioConcepto',
                    title: 'Advertencia Preciarios',
                    msg: "El concepto actualmente se encuentra en uso y no se puede eliminar.",

                    buttons: Ext.MessageBox.OK,
                    onEsc: Ext.emptyFn,
                    closable: false,
                    icon: Ext.MessageBox.WARNING
                });
            } else {

                Ext.Msg.show({
                    id: 'msgConceptoEliminar',
                    title: 'Advertencia',
                    msg: '¿Estás seguro de eliminar este concepto? ',
                    buttons: Ext.MessageBox.YESNO,
                    onEsc: Ext.emptyFn,
                    closable: false,
                    fn: function (btn) {
                        if (btn === 'yes') {
                            App.sCarga.removeAt(fila);
                            HabilitarGuardar();
                        }
                        else {

                        }
                    },
                    icon: Ext.MessageBox.WARNING
                });
            }
        },
        failure: function (errorMessage) {
            Ext.Msg.show({
                id: 'msgPreciarioConcepto',
                title: 'Error Preciarios',
                msg: "Ha ocurrido un error inesperado.", 
                buttons: Ext.MessageBox.OK,
                onEsc: Ext.emptyFn,
                closable: false,
                icon: Ext.MessageBox.WARNING
            });
        }
    });


};

//Evento que valida si ya esta concluido para bloquear el detalle y si es borrador no hace nada si ya esta concluido o cancelado
var ceFormaPreciarioGeneral_BeforeEdit = function (editor, context, opciones) {
    //1. Validar si es el campo de SubCategoria
    if (context.field == 'SubCategoria') {
        App.direct.CargarSubCategoriasPorCategoria(context.record.get('Categoria'), {
            success: function (result) {
                App.cmbSubCategoria.select(context.record.get('SubCategoria'));
            }, 
            failure: function (errorMessage) { }
        });
    }
    else if (context.field == 'SubSubCategoria') {
        App.direct.CargarSubSubCategoriasPorSubCategoria(context.record.get('SubCategoria'), {
            success: function (result) {
                App.cmbSubSubCategoria.select(context.record.get('SubSubCategoria'));
            },
            failure: function (errorMessage) { }
        });
    }

    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') == 'Nuevo') {
        return false;
    }
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') != 'Nuevo') {
        return true;
    }
    else {
        return true
    }
};


//Evento lanzado al cargar el store de avance encabezado
var sPreciarioGeneral_Load_Success = function () {
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') != 'Nuevo') {

        //        App.direct.ObtenerUltimoConceptoAdicional({
        //            success: function (result) {
        App.sCarga.insert(App.sCarga.getCount(), {CLAVE:""});
        //            }
        //        });
    }
    else {
        var d = new Date();
        App.dfFechaEmision.setValue(d);
    }

};

var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {

    if (grid.getStore().getCount() - 1 == rowIndex) {
        toolbar.items.get(0).disabled = true;
    }
};

//Se lanza antes de terminar la edición del campo
var ceFormaPreciarioGeneral_ValidateEdit = function (editor, context, opciones) {
    if (context.field == 'Categoria') {
        App.direct.CargarObjetoCategoriaPorID(context.value, {
            success: function (result) {
                context.record.set('RCategoria', result);
                return true;
            },

            failure: function (errorMessage) { }
        });
    }
    else if (context.field == 'SubCategoria') {
        App.direct.CargarObjetoSubCategoriaPorID(context.value, {
            success: function (result) {
                context.record.set('RSubCategoria', result);
                return true;
            },

            failure: function (errorMessage) { }
        });
    }
    else if (context.field == 'SubSubCategoria') {
        App.direct.CargarObjetoSubSubCategoriaPorID(context.value, {
            success: function (result) {
                context.record.set('RSubSubCategoria', result);
                return true;
            },
            failure: function (errorMessage) { }
        });
    } 
};


//Evento que se lanza despues de editar una columna en PreciarioConcepto
var ceFormaPreciarioGeneral_Edit = function (cellediting, columna, opciones) {

    //Verificar si abajo de esta columna existe otra
    if (App.sCarga.getAt(columna.rowIdx + 1) == undefined) {

        //Verificar si toda la fila contiene datos
        var registro = App.sCarga.getAt(columna.rowIdx);


        if (registro.get('Descripcion').length != 0 && registro.get('Unidad').length != 0 && registro.get('Precio') != 0
        && registro.get('Categoria').length != 0 && registro.get('SubCategoria').length != 0 && registro.get('SubSubCategoria').length != 0) {
            //Insertar un nuevo registro 
//            var adc = 'ADC-';
//            if (registro.get('Clave') != null) {
//                var preclave = parseInt(registro.get('Clave').substring(4, 7));
//                var clave = String(preclave + 1);
//                console.log(registro.get('Clave').substring(4, 7));
//                if (clave >= 1 && clave <= 9) {
//                    clave = '00' + clave;
//                } else if (clave >= 10 && clave <= 99) {
//                    clave = '0' + clave;
//                } else if (clave.length >= 100 && clave <= 999) {
//                    clave = clave;
//                }
//                clave = adc.concat(clave);
                //Inserta la nueva clave adicional
//                App.sCarga.insert(App.sCarga.getCount(), { Clave: clave });
                App.sCarga.insert(App.sCarga.getCount(), { Clave: "" });
                App.gpPreciario.getView().refreshNode(App.sCarga.getCount() - 2);
//            }
            //Validar si se habilita el boton de afectar 
            HabilitarGuardar();
        }
    }
};


/*-------------------------Validacion de guardar-----------------*/
//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {
    //Valida que el control de subir archivo contenga algo, si no, se le asigna un caracter, para que entre a la validacion de habilitarGuarda();
    var FileUploadValue = "s";
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') != 'Nuevo' && App.fufArchivoExcel.getValue() == "") {
        FileUploadValue = "1";
    }
    if (Ext.util.Cookies.get('cookieEditarPreciarioGeneral') == 'Nuevo') {

        FileUploadValue = App.fufArchivoExcel.getValue();
    }

    //Valida que todos los controles del encabezado obligatorios estén llenos
    if (FileUploadValue != "" && App.txtfDescripcion.getValue() != "" && App.sCarga.getCount() != 0) {
        if (App.rObra.getValue() == true || App.rMnto.getValue() == true) {
           App.imgbtnGuardar.setDisabled(false);
        }
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
};


//Acciones del boton d agregar concepto en el detalle
var imgbtnBuscar_Click = function (columna, comando, registro, fila, opciones) {
    window.parent.App.wAyudaConcepto.load('FormaAyudaBusquedaConceptoPreciario.aspx');
    window.parent.App.wAyudaConcepto.setHeight(430);
    window.parent.App.wAyudaConcepto.setWidth(685);
    window.parent.App.wAyudaConcepto.center();
    window.parent.App.wAyudaConcepto.setTitle('Selecciona concepto');
    window.parent.App.wAyudaConcepto.show();
};
 
//Obtiene las filas agregadas, editadas y eliminadas del store
var getNewEncodedRecords = function () {

    var store = App.sCarga;
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
    var store = App.sCarga;
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

    var store = App.sCarga;
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