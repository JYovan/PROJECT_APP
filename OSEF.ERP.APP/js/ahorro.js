//Funcion que valida que tema va a ser utilizadp
function cargarEstilo() {
    //Validamos la cookie
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
        //Asiganmos los elementos en el header
        var fileref = document.createElement("link")
        fileref.setAttribute("rel", "stylesheet")
        fileref.setAttribute("type", "text/css")
        fileref.setAttribute("href", 'css/login.css')
        var fileref2 = document.createElement("link")
        fileref2.setAttribute("rel", "stylesheet")
        fileref2.setAttribute("type", "text/css")
        fileref2.setAttribute("href", 'css/customControls.css')
        var fileref3 = document.createElement("link")
        fileref3.setAttribute("rel", "stylesheet")
        fileref3.setAttribute("type", "text/css")
        fileref3.setAttribute("href", 'css/xMask.css')
        var fileref4 = document.createElement("link")
        fileref4.setAttribute("rel", "stylesheet")
        fileref4.setAttribute("type", "text/css")
        fileref4.setAttribute("href", 'css/xDatePicker.css')
        var fileref5 = document.createElement("link")
        fileref5.setAttribute("rel", "stylesheet")
        fileref5.setAttribute("type", "text/css")
        fileref5.setAttribute("href", 'css/xSplitButton.css')
        var fileref6 = document.createElement("link")
        fileref6.setAttribute("rel", "stylesheet")
        fileref6.setAttribute("type", "text/css")
        fileref6.setAttribute("href", 'css/xGridPanel.css')
        var fileref7 = document.createElement("link")
        fileref7.setAttribute("rel", "stylesheet")
        fileref7.setAttribute("type", "text/css")
        fileref7.setAttribute("href", 'css/xWindowPopup.css')
        var fileref8 = document.createElement("link")
        fileref8.setAttribute("rel", "stylesheet")
        fileref8.setAttribute("type", "text/css")
        fileref8.setAttribute("href", 'css/xPanel.css')
        var fileref9 = document.createElement("link")
        fileref9.setAttribute("rel", "stylesheet")
        fileref9.setAttribute("type", "text/css")
        fileref9.setAttribute("href", 'css/xComboBox.css')
        var fileref10 = document.createElement("link")
        fileref10.setAttribute("rel", "stylesheet")
        fileref10.setAttribute("type", "text/css")
        fileref10.setAttribute("href", 'css/xCustomChart.css')
        var fileref11 = document.createElement("link")
        fileref11.setAttribute("rel", "stylesheet")
        fileref11.setAttribute("type", "text/css")
        fileref11.setAttribute("href", 'css/xToolbar.css')
        var fileref12 = document.createElement("link")
        fileref12.setAttribute("rel", "stylesheet")
        fileref12.setAttribute("type", "text/css")
        fileref12.setAttribute("href", 'css/xLabel.css')
        var fileref13 = document.createElement("link")
        fileref13.setAttribute("rel", "stylesheet")
        fileref13.setAttribute("type", "text/css")
        fileref13.setAttribute("href", 'css/xTreePanel.css')
        var fileref14 = document.createElement("link")
        fileref14.setAttribute("rel", "stylesheet")
        fileref14.setAttribute("type", "text/css")
        fileref14.setAttribute("href", 'css/xHiperlink.css')
        var fileref15 = document.createElement("link")
        fileref15.setAttribute("rel", "stylesheet")
        fileref15.setAttribute("type", "text/css")
        fileref15.setAttribute("href", 'css/xTextField.css')
        var fileref16 = document.createElement("link")
        fileref16.setAttribute("rel", "stylesheet")
        fileref16.setAttribute("type", "text/css")
        fileref16.setAttribute("href", 'css/xFieldSet.css')
        var fileref17 = document.createElement("link")
        fileref17.setAttribute("rel", "stylesheet")
        fileref17.setAttribute("type", "text/css")
        fileref17.setAttribute("href", 'css/xButton.css')
        var fileref18 = document.createElement("link")
        fileref18.setAttribute("rel", "stylesheet")
        fileref18.setAttribute("type", "text/css")
        fileref18.setAttribute("href", 'css/metroButtons.css')
        var fileref19 = document.createElement("link")
        fileref19.setAttribute("rel", "stylesheet")
        fileref19.setAttribute("type", "text/css")
        fileref19.setAttribute("href", 'css/metroButtons.css')
        var fileref20 = document.createElement("link")
        fileref20.setAttribute("rel", "stylesheet")
        fileref20.setAttribute("type", "text/css")
        fileref20.setAttribute("href", 'css/xDisplayImages.css')
        var fileref21 = document.createElement("link")
        fileref21.setAttribute("rel", "stylesheet")
        fileref21.setAttribute("type", "text/css")
        fileref21.setAttribute("href", 'css/xIcons.css')
        var fileref22 = document.createElement("link")
        fileref22.setAttribute("rel", "stylesheet")
        fileref22.setAttribute("type", "text/css")
        fileref22.setAttribute("href", 'css/xTabPanel.css')

        document.getElementsByTagName("head")[0].appendChild(fileref);
        document.getElementsByTagName("head")[0].appendChild(fileref2);
        document.getElementsByTagName("head")[0].appendChild(fileref3);
        document.getElementsByTagName("head")[0].appendChild(fileref4);
        document.getElementsByTagName("head")[0].appendChild(fileref5);
        document.getElementsByTagName("head")[0].appendChild(fileref6);
        document.getElementsByTagName("head")[0].appendChild(fileref7);
        document.getElementsByTagName("head")[0].appendChild(fileref8);
        document.getElementsByTagName("head")[0].appendChild(fileref9);
        document.getElementsByTagName("head")[0].appendChild(fileref10);
        document.getElementsByTagName("head")[0].appendChild(fileref11);
        document.getElementsByTagName("head")[0].appendChild(fileref12);
        document.getElementsByTagName("head")[0].appendChild(fileref13);
        document.getElementsByTagName("head")[0].appendChild(fileref14);
        document.getElementsByTagName("head")[0].appendChild(fileref15);
        document.getElementsByTagName("head")[0].appendChild(fileref16);
        document.getElementsByTagName("head")[0].appendChild(fileref17);
        document.getElementsByTagName("head")[0].appendChild(fileref18);
        document.getElementsByTagName("head")[0].appendChild(fileref19);
        document.getElementsByTagName("head")[0].appendChild(fileref20);
        document.getElementsByTagName("head")[0].appendChild(fileref21);
        document.getElementsByTagName("head")[0].appendChild(fileref22);
    }

    if (Ext.util.Cookies.get('osefTheme') == 'caja') {
        var fileref = document.createElement("link")
        fileref.setAttribute("rel", "stylesheet")
        fileref.setAttribute("type", "text/css")
        fileref.setAttribute("href", 'css/customControls2.css')
        var fileref2 = document.createElement("link")
        fileref2.setAttribute("rel", "stylesheet")
        fileref2.setAttribute("type", "text/css")
        fileref2.setAttribute("href", 'css/login2.css')
        document.getElementsByTagName("head")[0].appendChild(fileref);
        document.getElementsByTagName("head")[0].appendChild(fileref2);
    }
};

//Evento clic del boton de nuevo
var imgbtnNuevo_Click = function () {
    //1. Asignar la fecha en una variable
    var d = new Date();

    //2. Limpiar campos
    App.cmbMov.setValue('');
    App.txtfMovID.setValue('');
    App.cmbCliente.setValue('');

    //2. Asignar Fecha de Emisión, Titulo Window y Estatus
    App.dfFechaEmision.setValue(d);
    window.parent.App.wEmergente.setTitle('Nuevo Movimiento');
    App.sbAhorro.setText('SIN AFECTAR');

    //3. Cambiar Cookie
    Ext.util.Cookies.set('cookieEditarAhorro', 'Nuevo');
    
    //4. Borrar el GridPanel del Detalle y Encabezado
    App.sAhorro.removeAll();

    //5. asignar el enfoque al movimiento
    App.cmbMov.focus();
};

//Vuelve al tablero ocultando la ventana emergente
var imgbtnAbrir_Click = function () {
    window.parent.App.wEmergente.hide();
};

//Concatenar la columna de Nombre Completo
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Cambiar el ID del artículo por su Descripción
var cArticulo_Renderer = function (value, metadata, registro) {
    if (value != '') {
        return App.sArticulos.findRecord('ID', value).get('Descripcion');
    }
};

//Dar formato de moneda a los campos monetarios
var ncMonetario_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};

//Evento lanzado al cargar el store de Ahorro Encabezado
var sAhorro_Load = function (store, registros, successful, opciones) {
    //1. Comenzar con el registro
    store.insert(0, {});
    console.log(store);
};

//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
    //1. Asignar la fecha en una variable
    var d = new Date();

    //2. Validar si es nuevo, se asigna el movimiento 
    if (Ext.util.Cookies.get('cookieEditarAhorro') == 'Nuevo') {
        App.dfFechaEmision.setValue(d);
        App.cmbMov.focus();
    }
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Movimiento
var cmbMov_Select = function (combobox, registro) {
    //1. Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();

    //2. Validar si se habilita Guardar
    HabilitarGuardar();

    //3. Validar si se habilita el boton de afectar
    HabilitarAfectar();
};

//Evento que se lanza al cambiar un valor en ComboBox de Clientes
var cmbCliente_Change = function (combobox, valorNuevo, valorAnterior) {
    //1. validar si el valor es null, limpiar Nombre Completo
    if (valorNuevo == null) {
        App.txtfNombreCompleto.setValue('');
    }
    else {
        App.txtfNombreCompleto.setValue(App.sCliente.findRecord('ID', valorNuevo).get('NombreCompleto'));
    }

    //2. Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();

    //3. Validar si se habilita Guardar
    HabilitarGuardar();

    //4. Validar si se habilita el boton de afectar
    HabilitarAfectar();
};

//Evento que se lanza despues de editar una columna en Detalle de Ahorro
var ceAhorro_Edit = function (cellediting, columna) {
    //1. Verificar si abajo de esta columna existe otra
    if (App.sAhorroD.getAt(columna.rowIdx + 1) == undefined) {
        //2. Verificar si toda la fila contiene datos
        var registro = App.sAhorroD.getAt(columna.rowIdx);

        if (registro.get('Articulo').length != 0 && registro.get('Importe') != 0) {
            //3. Obtener el Renglon anterior
            var renglonAnterior = App.sAhorroD.getAt(columna.rowIdx).get('Renglon') + 1;

            //4. Insertar un nuevo registro
            App.sAhorroD.insert(App.sAhorroD.getCount(), { Renglon: renglonAnterior });

            //5. Actualiza el renglon anterior pintando el botón de borrar
            App.gpAhorro.getView().refreshNode(App.sAhorroD.getCount() - 2);

            //6. Validar si se habilita el boton de afectar
            HabilitarAfectar();
        }
    }

    //7. Validar si es la columna de Articulo, pasarse automáticamente a captura de Importe
    if (columna.field == 'Articulo') {
        if (App.gpAhorro.enterWasPressed) {
            App.gpAhorro.editingPlugin.startEdit(columna.rowIdx, columna.colIdx + 2);
            App.gpAhorro.enterWasPressed = false;
        }
    }

    //8. Si la columna modificada es el Importe, calcular Totales
    if (columna.field == 'Importe') {
        //9. Actualizar el Saldo
        if (App.cmbMov != 'Retiro') {
            App.sAhorroD.getAt(columna.rowIdx).set('Saldo', columna.value + App.sAhorroD.getAt(columna.rowIdx).get('Saldo'));
        }
        else {
            App.sAhorroD.getAt(columna.rowIdx).set('Saldo', columna.value - App.sAhorroD.getAt(columna.rowIdx).get('Saldo'));
        }

        var sum = 0;
        App.sAhorroD.each(function (record) {
            sum += record.get('Importe');
        });

        var F = Ext.util.Format;
        F.thousandSeparator = ',';
        F.decimalSeparator = '.';
        App.dfTotalImporte.setValue(F.number(sum, "$000,000,000.00"));

        sum = 0;
        App.sAhorroD.each(function (record) {
            sum += record.get('SaldoAnterior');
        });

        F = Ext.util.Format;
        F.thousandSeparator = ',';
        F.decimalSeparator = '.';
        App.dfTotalSaldoAnterior.setValue(F.number(sum, "$000,000,000.00"));

        sum = 0;
        App.sAhorroD.each(function (record) {
            sum += record.get('Saldo');
        });

        F = Ext.util.Format;
        F.thousandSeparator = ',';
        F.decimalSeparator = '.';
        App.dfTotalSaldo.setValue(F.number(sum, "$000,000,000.00"));
    }
};

//Ocultar el último renglon
var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    //1. Toma el último renglon para esconderlo
    if (grid.getStore().getCount() - 1 == rowIndex) {
        toolbar.items.get(0).hide();
    }

    //2. Valida el estatus del movimiento para saber si se tiene que habilitar el comando de borrar
    if (Ext.util.Cookies.get('cookieEditarAhorro') != 'Nuevo') {
        if (App.sAhorro.getAt(0).get('Estatus') == 'CONCLUIDO' || App.sAhorro.getAt(0).get('Estatus') == 'CANCELADO') {
            //3. Toma el primer elemento de la columna para poder deshabilitarlo
            var botonEliminar = toolbar.items.get(0);
            botonEliminar.setDisabled(true);
            botonEliminar.setTooltip("No se puede borrar un concepto");
        }
    }
};

//-----------------------------------------------VALIDACIONES-----------------------------------------------
//Función que valida si se habilita el primer renlgon en el GridPanel Detalle
function PrimerRenglonDetalle() {
    //1. Validar si se asigna el primer renglon del articulo
    if (App.cmbMov.getValue() != null && App.cmbCliente.getValue() != null) {
        //2. Obtener el store de Ahorro y revisar si es igual a 0
        var store = App.gpAhorro.getStore();
        if (store.getCount() == 0) {
            //3. Insertar el primer registro
            store.insert(0, { Renglon: 0 });
        }
    }
};

//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {
    //1. Validar si existe valor en movimiento y Cliente
    if (App.cmbMov.getValue() != null && App.cmbCliente.getValue() != null) {
        App.imgbtnGuardar.setDisabled(false);
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
}

//Validar si se habilita el botón d Afectar
function HabilitarAfectar() {
    //1. Validar si existe valor en Movimiento y Cliente
    if (App.cmbMov.getValue() != null && App.cmbCliente.getValue() != null) {
        //2. Validar si ay más de un registro
        if (App.gpAhorro.getStore().getCount() != 0) {
            //3. Validar que el registro este completo
            if (App.sAhorroD.getAt(0).get('Articulo').length != 0 && App.sAhorroD.getAt(0).get('Importe') != 0) {
                App.imgbtnAfectar.setDisabled(false);
            }
        }
        else {
            App.imgbtnAfectar.setDisabled(true);
        }
    }
    else {
        App.imgbtnAfectar.setDisabled(true);
    }
}