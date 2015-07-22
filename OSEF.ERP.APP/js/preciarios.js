var indice = 0;
var store;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    window.parent.App.wEmergente.load('FormaPreciario.aspx');
    Ext.util.Cookies.set('cookieEditarPreciario', 'Nuevo');
    window.parent.App.wEmergente.setHeight(580);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Preciario');
    window.parent.App.wEmergente.show();
};

//Evento que borra el preciario, sí se equivocó de archivo
var BorrarDetallePreciario = function () {
    App.sCarga.removeAll();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    window.parent.App.wEmergente.load('FormaPreciario.aspx');
    Ext.util.Cookies.set('cookieEditarPreciario', App.gpPreciarios.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.setHeight(580);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Preciario ' + Ext.util.Cookies.get('cookieEditarPreciario'));
    window.parent.App.wEmergente.show();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sPreciarios.reload();
    App.sbFormaPreciario.setText('ACTIVO');
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {
    if (result.extraParamsResponse.existe) {
        Ext.Msg.show({
            id: 'msgPreciarios',
            title: 'Advertencia Preciarios',
            msg: 'El preciario esta siendo utilizada en un registro',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpPreciarios.getSelectionModel().getSelection()[0].get('ID');
        var nombre = App.gpPreciarios.getSelectionModel().getSelection()[0].get('Descripcion');

        App.gpPreciarios.getStore().removeAt(indice);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripción: ' + nombre + '</p>',
            title: 'Eliminar registro'
        });
        App.gpPreciarios.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
    }
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

    //alert("Extensión inválida, sólo archivos con extensión:\n\n" + validFilesTypes.join(", "));
    }
    HabilitarGuardar();
    return isValidFileHabilitarGuardar
};

//Cambio en los datos del tablero
var sPreciarios_DataChanged = function () {
    if (App.sPreciarios.getCount() > 1 || App.sPreciarios.getCount() == 0) {
        App.sbPreciarios.setText(App.sPreciarios.getCount() + ' ' + 'PRECIARIOS');
    }
    else {
        App.sbPreciarios.setText(App.sPreciarios.getCount() + ' ' + 'PRECIARIO');
    }   
};

//Acciones al hacer clic en un registro
var gpPreciarios_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sPreciarios.clearFilter();
    App.sPreciarios.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpPreciarios.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbSucursal_Select = function (combobox, registro) {
    App.txtfSucursalNombre.setValue(registro[0].data.Nombre);
    //Validar si se habilita Guardar
    HabilitarGuardar();   
};

//Evento que se lanza al poner algun caracter en el control de la Sucursal
var cmbSucursal_Change = function (combobox, valorNuevo, viejoValor) {
    App.sSucursales.clearFilter();
    if (App.cmbSucursal.getValue() != null) {
        App.sSucursales.filter([{ filterFn: function (item) {
            if (item.get('ID').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
            else { return false; }
        }
        }]);
    }
    else {
        App.txtfSucursalNombre.setValue('');
    }
    //Validar si se habilita Guardar
    HabilitarGuardar();
};

//Evento que se lanza al poner algun caracter en el control del cliente
var txtfClienteID_Change = function () {

    HabilitarGuardar();
};


//Evento que se lanza al poner algun caracter en el control de la Sucursal
var txtfSucursalID_Change = function () {

    HabilitarGuardar();
};

//Evento que se lanza al poner algun texto en la descripcion
var txtfDescripcion_Change = function (txtDescripcion, Evento) {
    //Validar si se habilita Guardar
    HabilitarGuardar();
};

//Evento lanzado al cargar el store de avance encabezado
var sPreciario_Load_Success = function () {
//    App.direct.sPreciario_Load();

    if (Ext.util.Cookies.get('cookieEditarPreciario') != 'Nuevo') {
        store = window.parent.App.pCentro.getBody().App.sPreciarios;
//        App.sCarga.insert(App.sCarga.getCount(), { Clave: 'ADC-001' });
        //console.log(App.sCarga);
        //    App.gpPreciario.getView().focusRow(App.sCarga.getCount()-1);
        //    App.gpPreciario.editingPlugin.startEdit(App.gpPreciario.store.getAt(App.sCarga.getCount()-1), App.gpPreciario.columns[2]);
    }
    else {
        var d = new Date();
        App.dfFechaEmision.setValue(d);
    }

 
};

//Evento lanzado al agregar un registro al store
var sPreciario_Add = function (avance, registro) {
    //Lo que pasa cuando se selecciona un registro y es diferente de nuevo
    if (Ext.util.Cookies.get('cookieEditarPreciario') != 'Nuevo') {
        App.txtfID.setValue(registro[0].get('ID'));
        App.txtfDescripcion.setValue(registro[0].get('Descripcion'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.txfArchivoActual.setValue(registro[0].get('Archivo'));
        App.cmbEstatus.setValue(registro[0].get('Estatus'));
        App.dfFechaEmision.setValue(registro[0].get('FechaAlta'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));

        if (registro[0].get('Cliente').trim().length > 0) {
            //            console.log(registro[0].get('Cliente'));
            App.direct.ObtenerCliente(registro[0].get('Cliente'), {
                success: function (result) {
                    //                    console.log(result);
                    if (result != null && result.trim().length > 0) {
                        App.IdCliente.setValue(registro[0].get('Cliente'));
                        App.txtCliente.setValue(result);
                    } else {
                        Ext.Msg.show({
                            id: 'msgCliente',
                            title: 'Error en Cliente',
                            msg: "No se ha podido obtener el cliente.",
                            buttons: Ext.MessageBox.OK,
                            onEsc: Ext.emptyFn,
                            closable: false,
                            icon: Ext.MessageBox.WARNING
                        });
                    }
                },
                failure: function (errorMessage) {
                    Ext.Msg.show({
                        id: 'msgClienteError',
                        title: 'Error en Cliente',
                        msg: "Ha ocurrido un error inesperado.",
                        buttons: Ext.MessageBox.OK,
                        onEsc: Ext.emptyFn,
                        closable: false,
                        icon: Ext.MessageBox.WARNING
                    });
                }
            });
        } else {
            console.log(registro[0].get('Cliente').trim().length);
        }
        //Deshabilita botones cuando se edita un movimiento al cargar el store
        App.cmbEstatus.setDisabled(false);
        App.txtfSucursalCR.setDisabled(true);
        App.cmbEstatus.setDisabled(true);
        App.nfHoja.setDisabled(true);
        App.btnCargar.setDisabled(true);
        App.imgbtnBorrarCarga.setDisabled(true);
        App.fufArchivoExcel.setDisabled(true);
        App.sbFormaPreciario.setText(registro[0].get('Estatus'));
    }
};

//Renderizar objeos con descripciones de categorias
//Asignar la descripción de la categoria a esta columna
var cCategoria_Renderer = function (valor, columna, registro) {

    if (valor.length != 0) {
        var Categoria = registro.get('RCategoria');
        return Categoria.Descripcion;
    }
};

//Asignar la descripción de la subcategoria a esta columna
var cSubcategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var Subcategoria = registro.get('RSubcategoria');
        return Subcategoria.Descripcion;
    }
};

//Asignar la descripción de la subsubcategoria a esta columna
var cSubsubcategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var Subsubcategoria = registro.get('RSubsubcategoria');
        return Subsubcategoria.Descripcion;
    }
};

var btnImportar_Click_Success = function (response, result) {
    //Valida si se habilita el boton de guardar
    console.log(result.extraParamsResponse.accion);
 
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
    //alert(result.extraParamsResponse.data);
}

//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {    
    //Valida que el control de subir archivo contenga algo, si no, se le asigna un caracter, para que entre a la validacion de habilitarGuarda();
    var FileUploadValue = "";
    if (Ext.util.Cookies.get('cookieEditarPreciario') != 'Nuevo' && App.fufArchivoExcel.getValue()=="" ) {
        FileUploadValue = "1";
    }
    if (Ext.util.Cookies.get('cookieEditarPreciario') == 'Nuevo') {
         FileUploadValue = App.fufArchivoExcel.getValue();
    }

    //Valida que todos los controles del encabezado obligatorios estén llenos
     if (App.txtfSucursalCR.getValue() != "" && FileUploadValue != "" && App.txtfDescripcion.getValue() != "" && App.sCarga.getCount() != 0 && App.IdCliente.getValue() != "") {
        App.imgbtnGuardar.setDisabled(false);
    }
    else 
    {
        App.imgbtnGuardar.setDisabled(true);
    }
}

//Evento que hace el filtro al seleccionar algun elemento
var cmbEstatusFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sPreciarios.clearFilter();
    }
    else {
        App.sPreciarios.filterBy(function (elemento) {
            if (elemento.get('Estatus') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

//Evento que hace el filtro al seleccionar algun elemento
var cmbSucursalFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = registro[0].get('ID');
 
    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Sucursal
    if (valor == 'Todos') {
        App.sPreciarios.clearFilter();
    }
    else {
        App.sPreciarios.filterBy(function (elemento) {

            if (elemento.get('Sucursal') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

//Evento que hace el filtro al seleccionar algun elemento
var cmbUsuarioFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = combobox.getValue();
    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Preciario
    if (valor == 'Todos') {
        App.sPreciarios.clearFilter();
    }
    else {
        App.sPreciarios.filterBy(function (elemento) {
            console.log(elemento);
            if (elemento.get('Usuario') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};

//Para el botón de eliminar, Eliminar un registro
var cmbSucursal_Change_Success = function (response, result) {
    if (result.extraParamsResponse.existe) {
        Ext.Msg.show({
            id: 'msgPreciarios',
            title: 'Advertencia Preciario',
            msg: 'La sucursal ya esta siendo utilizada en otro preciario',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });

        App.txtfSucursalCR.setValue("");
        App.txtfSucursalNombre.setValue("");
    }
    else {

    }
};

//Pone todas las celdas de color 
var renderImporte = function (value, metadata) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';

    metadata.style = "background-color: #85F978;";
    return F.number(value, "$000,000,000.00");
};

var renderImporteUtilizado = function (value, metadata, registro) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';

    if (parseFloat(registro.get('Importefinal')) > 0 ) {
        metadata.style = "background-color: #0C8D1B; color: #fff;";        
    }
    else {
        metadata.style = "background-color: #FEBB5D;";      
    }
    return F.number(value, "$000,000,000.00");
};

//Pone todas las celdas de color segun la validacion
var renderCantidadUtilizada = function (value, metadata, registro) {
if (parseFloat(registro.get('Utilizada')) > 0)
     {
        metadata.style = "background-color: #7E6FEB;";
    }
    return value;
};


//Formato numerico a Precio
var rendererCosto = function (value) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(value, "$000,000,000.00");
};


var sCarga_Load = function (avance, registro, index) {
  
    var sum = 0;
    var sum2 = 0;
    App.sCarga.each(function (record) {
    
        sum += record.get('Importe');
        sum2 += record.get('Importefinal');
    });

    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    App.dfTotalInicial.setValue('$' + F.number(sum, "000,000,000.00"));
    App.dfTotalFinal.setValue('$' + F.number(sum2, "000,000,000.00"));

}



//Evento de clic del botón BuscarSucursal
var btnBuscarSucursal_Click = function () {
    Ext.util.Cookies.set('cookieElijeSucursal', "Preciario");
    if (App.IdCliente.getValue() != null && App.IdCliente.getValue().toString().trim() !== "") {
        Ext.util.Cookies.set('cookieElijeSucursalID', App.IdCliente.getValue()); 
        window.parent.App.wAyudaConcepto.load('FormaBuscaSucursal.aspx');
        window.parent.App.wAyudaConcepto.setHeight(370);
        window.parent.App.wAyudaConcepto.setWidth(720);
        window.parent.App.wAyudaConcepto.center();
        window.parent.App.wAyudaConcepto.setTitle('Seleccionar Sucursal');
        window.parent.App.wAyudaConcepto.show();
    } else {
        Ext.Msg.show({
            id: 'msgOrdenesEstimacionesCliente',
            title: 'ATENCIÓN',
            msg: '<p align="center">DEBES DE ELEGIR UN CLIENTE.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
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

var btnBuscar_Cliente = function () {
    var win = window.parent.App.wAyudaConcepto;
    win.load('FormaBuscaCliente.aspx');
    win.setHeight(400);
    win.setWidth(500);
    win.center();
    win.setTitle('BUSQUEDA DE CLIENTES');
    win.show();
}