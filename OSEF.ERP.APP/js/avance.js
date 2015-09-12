var editable = true;

//Boton de nuevo
var imgbtnNuevo_Click = function () {
    //1. Obtener fecha actual
    var d = new Date();

    //2. Limpiar controles del encabezado
    App.txtfMovID.setValue(null);
    App.nfSemana.setValue(1);
    App.txtfSucursalCR.setValue(null);
    App.txtfSucursalNombre.setValue(null);
    App.txtfSucursalID.setValue(null);
    App.dfFechaEmision.setValue(d);
    App.dfFechaRevision.setValue(null);
    App.txtfObservaciones.setValue(null);
    App.txtfComentarios.setValue(null);

    //3. Eliminar todos los conceptos y TabPaneles
    App.tpDetalle.removeAll();
    App.sCategorias.removeAll();
    App.sSubCategorias.removeAll();
    App.sConceptos.removeAll();

    //4. Actualizar cookie y título
    Ext.util.Cookies.set('cookieEditarRevision', 'Nuevo');
    window.parent.App.wEmergente.setTitle('Nuevo Avance');
    App.dfFechaRevision.focus();
};

//Boton de abrir tablero
var imgbtnAbrir_Click = function () {
    //1. Cerrar la ventana
    window.parent.App.wEmergente.hide();
};

//Evento que ocurre al dar clic en Guardar
var imgbtnGuardar_Click_Success = function (response, result) {
    window.parent.App.pCentro.getBody().App.sAvances.reload();
    if (result.extraParamsResponse.accion == 'insertar') {
        Ext.Msg.show({
            id: 'msgAvance',
            title: 'GUARDAR',
            msg: '<p align="center">Movimiento registrado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });

        App.imgbtnBorrar.setDisabled(false);
        Ext.util.Cookies.set('cookieEditarRevision', App.sRevision.getAt(0).get('ID'));
        window.parent.App.wEmergente.setTitle('Editar avance ' + App.sRevision.getAt(0).get('ID'));

        //Deshabilita los comandos del grid
        App.sCategorias.each(function (registro) {
            var gridpanel = Ext.getCmp('gpCategoria' + registro.get('Id'));
            if (gridpanel != undefined) {
                gridpanel.reconfigure();
            }
        });
    }
    else {
        Ext.Msg.show({
            id: 'msgAvance',
            title: 'ACTUALIZAR',
            msg: '<p align="center">Movimiento actualizado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
    }
};

//Mostrar información de la sucursal seleccionada
var imgbtnInfo_Click = function () {
    //    window.parent.App.wEmergenteGraficas.load('FormaInfoGraficas.aspx');
    //    window.parent.App.wEmergenteGraficas.setHeight(545);
    //    window.parent.App.wEmergenteGraficas.setWidth(960);
    //    window.parent.App.wEmergenteGraficas.center();
    //    window.parent.App.wEmergenteGraficas.setTitle('Gráficas');
    //    window.parent.App.wEmergenteGraficas.show();
};

//Método que se lanza antes de llamar al procedimiento de Afectar
var imgbtnAfectar_Click_Before = function () {
    if (App.sRevision.getCount() != 0) {
        if (App.sRevision.getAt(0).get('Estatus') == 'PENDIENTE') {
            App.wEmergente.load('FormaAvanzarMovimiento.aspx');
            App.wEmergente.setHeight(170);
            App.wEmergente.setWidth(220);
            App.wEmergente.center();
            App.wEmergente.setTitle('Avanzar Movimiento');
            App.wEmergente.show();
            return false;
        }
        else {
            return true;
        }
    }
    else {
        return true;
    }
};

//Afectar el movimiento
var imgbtnAfectar_Click_Success = function (response, result) {
    //1. Actualizar el store del tablero
    window.parent.App.pCentro.getBody().App.sAvances.reload();

    //2. Lanzar ventana de movimiento afectado
    Ext.Msg.show({
        id: 'msgAvance',
        title: 'AFECTAR',
        msg: '<p align="center">Movimiento afectado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.INFO
    });

    //3. Actualizar campos afetados
    App.txtfMovID.setValue(App.sRevision.getAt(0).get('MovID'));
    App.sbFormaAvance.setText(App.sRevision.getAt(0).get('Estatus'));

    //4. Deseleccionar datos del GridPanel y deshabilitar los controles
    App.sCategorias.each(function (registro) {
        var gridpanel = Ext.getCmp('gpCategoria' + registro.get('ID'));
        if (gridpanel != undefined) {
            gridpanel.getSelectionModel().deselectAll();
            gridpanel.reconfigure();
        }
    });

    //5. Deshabilitar botones y asignar ID en Cookie
    DeshabilitarControlesAfectar();
    Ext.util.Cookies.set('cookieEditarRevision', App.sRevision.getAt(0).get('ID'));
};

//Para autorizar un movimiento a afectar
var imgbtnAutorizar_Click = function () {
};

//Mandar a imprimir en una vista previa
var imgbtnImprimir_Click = function () {
};

//Borrar un movimiento que no ha sido afectado
var imgbtnBorrar_Click = function () {
};

//Cancelar un movimiento ya afectado
var imgbtnCancelar_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el primero seleccionado
var imgbtnPrimero_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el anterior seleccionado
var imgbtnAnterior_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el siguiente seleccionado
var imgbtnSiguiente_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el último seleccionado
var imgbtnUltimo_Click = function () {
};

//Lanzar ventana de la galería de imagenes
var imgbtnGaleria_Click = function () {
    //    App.wFormaGaleria.load('FormaGaleria.aspx');
    //    App.wFormaGaleria.setHeight(386);
    //    App.wFormaGaleria.setWidth(900);
    //    App.wFormaGaleria.center();
    //    App.wFormaGaleria.setTitle('Galeria de imágenes');
    //    App.wFormaGaleria.show();
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Movimiento
var cmbMov_Select = function (combobox, registro) {
    //Asignar Fecha en el control Fecha de emisión
    //    var d = new Date();
    //    if (App.dfFechaEmision.getValue() == null) {
    //        App.dfFechaEmision.setValue(d);
    //    }

    //    //Validar si se asigna el primer renglon del detalle
    //    PrimerRenglonDetalle();
    //    //Validar si se habilita Guardar
    //    HabilitarGuardar();
    //    //Validar si se habilita Afectar
    //    HabilitarAfectar();
};

//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
    var d = new Date();

    //Validar si es nuevo, se asigna el movimieno Iniciar Proyecto y Semana número 1
    if (registros[0].get('ID') == 'Iniciar proyecto') {
        App.cmbMov.select(registros[0].get('ID'));
        App.cmbMov.setReadOnly(true);
        App.nfSemana.setValue(1);
        App.nfSemana.setReadOnly(true);
        App.dfFechaEmision.setValue(d);
        App.dfFechaRevision.focus();
    }
    else {
        App.cmbMov.setReadOnly(true);
        App.txtfSucursalCR.setReadOnly(true);
    }
};

//Evento que se lanza al cambiar el valor de la Semana
var nfSemana_Change = function () {
    //Validar si se habilita Afectar
    HabilitarAfectar();
};

//Evento que se lanza al cambiar el CR de la sucursal
var txtfSucursalCR_Change = function (textfield, nuevoValor, viejoValor, opciones) {
    //1. Validar si se habilita Guardar
    HabilitarGuardar();

    //2. Validar si se habilita Información
    HabilitarInformacion();

    //3. Validar si se habilita Afectar
    HabilitarAfectar();

    //4. Configurar el detalle
    if (nuevoValor != '') {
        CargarDetalle(Ext.util.Cookies.get('cookieSucursalID'));
    }
};

//Evento de clic del botón BuscarSucursal
var btnBuscarSucursal_Click = function (boton, evento, opciones) {
    //1. Asignar cookie y abrir ventana
    Ext.util.Cookies.set('cookieElijeSucursal', "Avance");
    Ext.util.Cookies.set('cookieElijeSucursalID', '');
    window.parent.App.wAyudaConcepto.load('FormaBuscaSucursal.aspx');
    window.parent.App.wAyudaConcepto.setHeight(370);
    window.parent.App.wAyudaConcepto.setWidth(720);
    window.parent.App.wAyudaConcepto.center();
    window.parent.App.wAyudaConcepto.setTitle('Seleccionar Sucursal');
    window.parent.App.wAyudaConcepto.show();
};

//Evento que se lanza al poner alguna fecha valida en el control de FechaRevision
var dfFechaRevision_Change = function () {
    //Validar si se habilita Afectar
    HabilitarAfectar();
};

//Evento que se lanza al cargar datos al Store
var sConceptos_Load = function (store, registros, transaccion, opciones) {
    //1. Validar si es nuevo movimiento
    if (Ext.util.Cookies.get('cookieEditarRevision') == 'Nuevo') {
        //2. Configurar el detalle
        //ConfigurarDetalle(store);
    }
    else {
        //3. Configurar el detalle
        //MostrarDetalle(App.sRevisionD);
    }
};

//Evento que muestra el valor de la columna Concepto por su descripción y no por su ID
var cConcepto_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sConceptos.findRecord('Id', valor);
        return registro.get('Descripcion');
    }
};

//Evento que renderiza el valor de la columna SubCategoria
var cSubCategoria_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sSubCategorias.findRecord('Id', valor);
        return registro.get('Descripcion');
    }
};

//Evento que muestra el valor de la columna Proveedor por su nombre y no por su ID
var cProveedor_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sProveedores.findRecord('ID', valor);
        return registro.get('Nombre');
    }
};

//Darle formato a la columna de Programado
var cProgramado_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000.00%");
};

//Darle formato a la columna de Real
var cReal_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000.00%");
};

//Evento lanzado al cargar el store de avance encabezado
var sRevision_Load = function () {
    App.direct.sRevision_Load();
    store = window.parent.App.pCentro.getBody().App.sAvances;
};

//Evento lanzado al agregar un registro al store
var sRevision_Add = function (avance, registro) {
    if (Ext.util.Cookies.get('cookieEditarRevision') != 'Nuevo') {
        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.nfSemana.setValue(registro[0].get('Semana'));
        App.txtfSucursalID.setValue(registro[0].get('Sucursal'));
        App.txtfSucursalCR.setValue(registro[0].get('RSucursal').CR);
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.dfFechaRevision.setValue(registro[0].get('FechaRevision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.txtfComentarios.setValue(registro[0].get('Comentarios'));
        App.sbFormaAvance.setText(registro[0].get('Estatus'));

        if (registro[0].get('Estatus') == 'PENDIENTE') {
            editable = false;
        }

        //Construir detalle
        App.sConceptos.reload();
    }
};

//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro
    registro.store.removeAt(fila);

    //Asignar renglones
    var renglon = 0;
    registro.store.each(function (dato) {
        dato.set('Renglon', renglon);
        renglon = renglon + 1;
    });

    //Validar si se habilita Afectar
    HabilitarAfectar();
};

//Lo que hace el comando de fotos
var ccFotos_Command = function (column, nombre, registro, renglon, opciones) {
    Ext.util.Cookies.set('cookieConceptoRevision', registro.get('Concepto'));

    if (nombre == 'cnCargarFotos') {
        window.parent.App.wGenerador.load('FormaSubirImagenesAvance.aspx');
        window.parent.App.wGenerador.setHeight(350);
        window.parent.App.wGenerador.setWidth(600);
        window.parent.App.wGenerador.center();
        window.parent.App.wGenerador.setTitle('Subir Fotos');
        window.parent.App.wGenerador.show();
    }
    else {
        window.parent.App.wGenerador.load('FormaImagenesAvance.aspx');
        window.parent.App.wGenerador.setHeight(520);
        window.parent.App.wGenerador.setWidth(670);
        window.parent.App.wGenerador.center();
        window.parent.App.wGenerador.setTitle('Visualizar Fotos');
        window.parent.App.wGenerador.show();
    }
};

//Validaciones de comandos para fotos
var ccFotos_PrepareToolbar = function (grid, toolbar, rowIndex, record) {

    //1. Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarRevision') != 'Nuevo' && App.sRevision.getAt(0).get('Estatus') == 'CONCLUIDO') {
        //2. Toma el primer elemento de la columna para poder deshabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar fotos a un movimiento concluido");
    }

    //3. Valida el estatus del movimiento para saber si se tiene que habilitar el comando de ver fotos
    if (Ext.util.Cookies.get('cookieEditarRevision') != 'Nuevo' && App.sRevision.getAt(0).get('Estatus') == 'CANCELADO') {
        //4. Toma el primer elemento de la columna para poder deshabilitarlo
        var botonCargar = toolbar.items.get(0);
        botonCargar.setDisabled(true);
        botonCargar.setTooltip("No se pueden cargar fotos a un movimiento cancelado");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar conceptos 
    if (Ext.util.Cookies.get('cookieEditarRevision') != 'Nuevo' && App.sRevision.getAt(0).get('Mov').trim() == 'Iniciar proyecto') {
        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        botonCargar2.setDisabled(true);
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar fotos 
    if (Ext.util.Cookies.get('cookieEditarRevision') == 'Nuevo' && App.sRevision.getAt(0) == undefined) {
        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(true);
        botonVerFotos2.setDisabled(true);
        botonCargar2.setTooltip("Debes de guardar el movimiento antes");
        botonVerFotos2.setTooltip("Debes de guardar el movimiento antes");
    }

    //Valida el estatus del movimiento para saber si se tiene que habilitar el comando de cargar y ver fotos
    if (Ext.util.Cookies.get('cookieEditarRevision') != 'Nuevo' && App.sRevision.getAt(0).get('Estatus') == 'BORRADOR') {
        //Toma el primer elemento de la columna para poder desabilitarlo
        var botonCargar2 = toolbar.items.get(0);
        var botonVerFotos2 = toolbar.items.get(1);
        botonCargar2.setDisabled(false);
        botonVerFotos2.setDisabled(false);
        botonCargar2.setTooltip("Cargar Fotos");
        botonVerFotos2.setTooltip("Ver Fotos");
    }
};

//------------------------------ Funciones ------------------------------//

//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {
    //1. Validar si Mov y SucursalCR tienen información
    if (App.cmbMov.getValue().length !== 0 && App.txtfSucursalCR.getValue().length !== 0) {
        App.imgbtnGuardar.setDisabled(false);
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
}

//Validar si se habilita el botón de Información
function HabilitarInformacion() {
    //1. Validar si SucursalCR tiene información
    if (App.txtfSucursalCR.getValue().length !== 0) {
        App.imgbtnInfo.setDisabled(false);
    }
    else {
        App.imgbtnInfo.setDisabled(true);
    }
}

//Validar si se habilita el botón d Afectar
function HabilitarAfectar() {
    //1. Validar si los datos son llenos de los campos Mov, Semana, SucursalCR, FechaEmision y FechaRevision
    if (App.cmbMov.getValue() != null && App.nfSemana.getValue() != null && App.txtfSucursalCR.getValue() != null && App.dfFechaRevision.getValue() != null && App.dfFechaEmision.getValue() != null) {
        //2. Validar si los campos Semana, SucursalCR, FechaEmision y FechaRevision son validos
        if (App.nfSemana.isValid() && App.txtfSucursalCR.isValid() && App.dfFechaEmision.isValid() && App.dfFechaRevision.isValid()) {
            App.imgbtnAfectar.setDisabled(false);
        }
        else {
            App.imgbtnAfectar.setDisabled(true);
        }
    }
    else {
        App.imgbtnAfectar.setDisabled(true);
    }
}

//Método que carga el detalle de Categorias, SubCategorias y Conceptos de acuerdo a la Sucursal(Obra)
function CargarDetalle(Id) {
    //1. Lanzar Mascara
    Ext.net.Mask.show({
        el: App.pDetalleAvance.el,
        msg: "Cargando conceptos..."
    });

    //2. Llenar el Store de Categorias
    App.sCategorias.reload({
        scope: this,
        params: {
            SucursalID: Id
        },
        callback: function (registros, operacion, success) {
            if (success) {
                App.sSubCategorias.reload({
                    scope: this,
                    params: {
                        SucursalID: Id
                    },
                    callback: function (registros, operacion, success) {
                        if (success) {
                            App.sConceptos.reload({
                                scope: this,
                                params: {
                                    SucursalID: Id
                                },
                                callback: function (registros, operacion, success) {
                                    if (success) {
                                        ConfigurarDetalle(App.sConceptos);
                                        Ext.net.Mask.hide();
                                    }
                                }
                            });
                        }
                    }
                });
            }
        }
    });
}

//Método que vuelve a cargar los conceptos
function ConfigurarDetalle(store) {
    //1. Eliminar todos los conceptos
    App.tpDetalle.removeAll();

    //2. Recorrer el Store de Categorias
    App.sCategorias.each(function (registro) {
        //3. Crear el Panel que contrendra un TabPanel
        var pCategoria = Ext.create('Ext.panel.Panel', {
            id: 'p' + registro.get('Id'),
            title: registro.get('Descripcion')
        });

        //4. Agregar el Panel al control TabPanel
        App.tpDetalle.addTab(pCategoria);

        //5. Eliminar si existe algun filtro y lanzar el filtro por Categoria
        store.clearFilter(true);
        store.filter('CategoriaIdRaw', registro.get('Id'));

        //6. Construir el Modelo del Store para el GridPanel
        Ext.define('mCategoria' + registro.get('Id'), {
            extend: 'Ext.data.Model',
            idProperty: 'Renglon',
            fields: [
                { name: 'Revision', type: 'int' },
                { name: 'Renglon', type: 'int' },
                { name: 'Concepto', type: 'string' },
                { name: 'SubCategoria', type: 'string' },
                { name: 'Categoria', type: 'string' },
                { name: 'SubCategoriaDesc', type: 'string' },
                { name: 'Proveedor', type: 'string' },
                { name: 'Programado', type: 'float' },
                { name: 'Real', type: 'float' }
            ]
        });

        //7. Contriur el Store del GridPanel
        var sCategoria = Ext.create('Ext.data.Store', {
            storeId: 's' + registro.get('Id'),
            model: 'mCategoria' + registro.get('Id'),
            groupField: 'SubCategoriaDesc',
            sorters: [{
                property: 'SubCategoria',
                direction: 'ASC'
            }],
            proxy: {
                type: 'memory',
                reader: {
                    type: 'json',
                    root: 'items'
                }
            }
        });

        //8. Agregar los conceptos al store del GridPanel
        var cont = 1;
        store.each(function (record, index) {
            var registro = App.sSubCategorias.findRecord('Id', record.get('SubCategoriaIdRaw'));
            if (registro !== null) {
                sCategoria.add({ Revision: 1, Renglon: cont, Concepto: record.get('Id'), SubCategoria: registro.get('SubCategoriaIdRaw'), Categoria: registro.get('CategoriaIdRaw'), SubCategoriaDesc: registro.get('Descripcion'), Proveedor: '', Programado: 0, Real: 0 });
            }
            else {
                sCategoria.add({ Revision: 1, Renglon: cont, Concepto: record.get('Id'), SubCategoria: '', Categoria: '', Proveedor: '', Programado: 0, Real: 0 });
            }
            cont++;
        });

        //9. Construir el gridPanel
        var gpCategoria = Ext.create('Ext.grid.Panel', {
            id: 'gpCategoria' + registro.get('Id'),
            store: Ext.data.StoreManager.lookup('s' + registro.get('Id')),
            columns: [
                    { id: 'ccEliminar' + registro.get('Id'), width: 25, xtype: "commandcolumn", commands: [{ xtype: "button", command: "Borrar", tooltip: { text: "Borrar" }, iconCls: "#Delete"}], listeners: { command: { fn: ccAcciones_Command}} },
                    { id: 'cConcepto' + registro.get('Id'), width: 300, text: 'Concepto', dataIndex: 'Concepto', renderer: cConcepto_Renderer },
                    { id: 'cSubCategoriaDesc' + registro.get('Id'), text: 'SubCategoria', dataIndex: 'SubCategoriaDesc' },
                    { id: 'cProveedor' + registro.get('Id'), width: 300, text: 'Proveedor', dataIndex: 'Proveedor', flex: 1, renderer: cProveedor_Renderer, editor: { id: 'cmbProveedores' + registro.get('ID'), xtype: 'combobox', displayField: 'Nombre', valueField: 'ID', queryMode: 'local', store: App.sProveedores} },
                    { id: 'cProgramado' + registro.get('Id'), width: 100, text: 'Programado', dataIndex: 'Programado', xtype: 'numbercolumn', align: 'center', summaryType: 'sum', renderer: cProgramado_Renderer, editor: { id: 'nfProgramado' + registro.get('ID'), xtype: 'numberfield', allowDecimals: true, allowExponential: false, decimalPrecision: 2, decimalSeparator: '.', step: 0.01, maxValue: 100, minValue: 0} },
                    { id: 'cReal' + registro.get('Id'), width: 100, text: 'Real', dataIndex: 'Real', xtype: 'numbercolumn', align: 'center', summaryType: 'sum', renderer: cReal_Renderer, editor: { id: 'nfReal' + registro.get('ID'), xtype: 'numberfield', allowDecimals: true, allowExponential: false, decimalPrecision: 2, decimalSeparator: '.', step: 0.01, maxValue: 100, minValue: 0} },
                    { id: 'ccFotos' + registro.get('Id'), text: 'Fotos', width: 65, xtype: "commandcolumn", commands: [{ xtype: "button", command: "cnCargarFotos", tooltip: { text: "Cargar Fotos" }, iconCls: "#ImageAdd" }, { xtype: "button", command: "cnVerFotos", tooltip: { text: "Ver Fotos" }, iconCls: "#FolderPicture"}], prepareToolbar: ccFotos_PrepareToolbar, listeners: { command: { fn: ccFotos_Command}} }
                ],
            height: 210,
            width: 870,
            enableColumnHide: false,
            enableColumnMove: false,
            enableColumnResize: false,
            header: false,
            sortableColumns: false,
            selType: 'cellmodel',
            selModel: {
                mode: 'SINGLE'
            },
            plugins: {
                id: 'ceCategoria' + registro.get('Id'),
                ptype: 'cellediting',
                clicksToEdit: 1,
                listeners: {
                    beforeedit: {
                        fn: function (editor, context, opciones) { return editable; }
                    }
                }
            },
            viewConfig: {
                id: 'gvCategoria' + registro.get('Id'),
                stripeRows: true
            },
            features: [{ ftype: 'groupingsummary', hideGroupedHeader: true}]
        });

        //10. Agregar el GridPanel al Panel correspondiente
        pCategoria.add(gpCategoria);
    });

    //11. Asignar la primer pestaña como activa
    App.tpDetalle.setActiveTab(0);

    //12. Quitar filtro
    store.clearFilter(true);
}

//Construir Store del Detalle
var ObtenerDetalle = function () {
    //1. Construir el modelo general
    Ext.define('mRevisionFinal', {
        extend: 'Ext.data.Model',
        fields: [
                { name: 'Revision', type: 'int' },
                { name: 'Renglon', type: 'int' },
                { name: 'Concepto', type: 'string' },
                { name: 'Proveedor', type: 'string' },
                { name: 'Programado', type: 'float' },
                { name: 'Real', type: 'float' }
            ]
    });

    //2. Contriur el store general
    var sRevision = Ext.create('Ext.data.Store', {
        storeId: 'sRevisionFinal',
        model: 'mRevisionFinal',
        proxy: {
            type: 'memory',
            reader: {
                type: 'json',
                root: 'items'
            }
        }
    });

    var contador = 1;
    App.sCategorias.each(function (registro) {
        var gridpanel = Ext.getCmp('gpCategoria' + registro.get('Id'));
        if (gridpanel != undefined) {
            var store = gridpanel.getStore();
            store.each(function (modelo) {
                sRevision.add({ Revision: modelo.get('Revision'), Renglon: modelo.get('Renglon'), Concepto: modelo.get('Concepto'), Proveedor: modelo.get('Proveedor'), Programado: modelo.get('Programado'), Real: modelo.get('Real') });
                contador++;
            });
        }
    });

    return Ext.encode(sRevision.getRecordsValues());
};

//Método que muestra el Detalle
function MostrarDetalle(store) {
    //1. Obtener el arreglo de Categorias y pasar por el vector
    var categorias = App.sRevisionD.getGroups();

    for (var i = 0; i < categorias.length; i++) {        
        //2. Crear el Panel que contrendra un TabPanel
        var pCategoria = Ext.create('Ext.panel.Panel', {
            id: 'p' + categorias[i].name,
            title: App.sCategorias.getAt(App.sCategorias.findExact('ID', categorias[i].name)).get('Descripcion')
        });

        //3. Agregar el Panel al control TabPanel
        App.tpDetalle.addTab(pCategoria);

        //4. Crear el modelo de Conceptos para la Categoria
        Ext.define('mConcepto' + categorias[i].name, {
            extend: 'Ext.data.Model',
            idProperty: 'ID',
            fields: [
                { name: 'ID', type: 'string' },
                { name: 'Modulo', type: 'string' },
                { name: 'Orden', type: 'int' },
                { name: 'Descripcion', type: 'string' },
                { name: 'Categoria', type: 'string' },
                { name: 'SubCategoria', type: 'string' }
            ]
        });

        //5. Crear el Store para los Conceptos
        var sConceptos = Ext.create('Ext.data.Store', {
            storeId: 'sConceptos' + categorias[i].name,
            model: 'mConcepto' + categorias[i].name,
            sorters: [{
                property: 'ID',
                direction: 'ASC'
            }]
        });

        //6. Construir el Modelo del Store para el GridPanel
        Ext.define('mCategoria' + categorias[i].name, {
            extend: 'Ext.data.Model',
            idProperty: 'Renglon',
            fields: [
                { name: 'Revision', type: 'int' },
                { name: 'Renglon', type: 'int' },
                { name: 'Concepto', type: 'string' },
                { name: 'SubCategoria', type: 'string' },
                { name: 'Categoria', type: 'string' },
                { name: 'SubCategoriaDesc', type: 'string' },
                { name: 'Proveedor', type: 'string' },
                { name: 'Programado', type: 'float' },
                { name: 'Real', type: 'float' }
            ]
        });

        //7. Contriur el Store del GridPanel
        var sCategoria = Ext.create('Ext.data.Store', {
            storeId: 's' + categorias[i].name,
            model: 'mCategoria' + categorias[i].name,
            groupField: 'SubCategoriaDesc',
            sorters: [{
                property: 'SubCategoria',
                direction: 'ASC'
            }],
            proxy: {
                type: 'memory',
                reader: {
                    type: 'json',
                    root: 'items'
                }
            }
        });

        //8. Filtrar el store de Conceptos por su Categoria
        store.each(function (record, index) {
            if (record.get('Categoria') == categorias[i].name) {
                var indice = App.sSubCategorias.findExact('ID', record.get('SubCategoria'));
                if (indice == -1) {
                    sCategoria.add({ Revision: record.get('Revision'), Renglon: record.get('Renglon'), Concepto: record.get('Concepto'), SubCategoria: record.get('SubCategoria'), Categoria: record.get('Categoria'), SubCategoriaDesc: '', Proveedor: record.get('Proveedor'), Programado: record.get('Programado'), Real: record.get('Real') });
                }
                else {
                    sCategoria.add({ Revision: record.get('Revision'), Renglon: record.get('Renglon'), Concepto: record.get('Concepto'), SubCategoria: record.get('SubCategoria'), Categoria: record.get('Categoria'), SubCategoriaDesc: App.sSubCategorias.getAt(indice).get('Descripcion'), Proveedor: record.get('Proveedor'), Programado: record.get('Programado'), Real: record.get('Real') });
                }

                sConceptos.add({ ID: record.get('Concepto'), Descripcion: App.sConceptos.getAt(App.sConceptos.findExact('ID', record.get('Concepto'))).get('Descripcion') });
            }
        });

        //9. Construir el gridPanel
        var gpCategoria = Ext.create('Ext.grid.Panel', {
            id: 'gpCategoria' + categorias[i].name,
            store: Ext.data.StoreManager.lookup('s' + categorias[i].name),
            columns: [
                    { id: 'ccEliminar' + categorias[i].name, width: 25, xtype: "commandcolumn", commands: [{ xtype: "button", command: "Borrar", tooltip: { text: "Borrar" }, iconCls: "#Delete"}], listeners: { command: { fn: ccAcciones_Command}} },
                    { id: 'cConcepto' + categorias[i].name, text: 'Concepto', dataIndex: 'Concepto', flex: 1, renderer: cConcepto_Renderer },
                    { id: 'cSubCategoriaDesc' + categorias[i].name, text: 'SubCategoria', dataIndex: 'SubCategoriaDesc' },
                    { id: 'cProveedor' + categorias[i].name, text: 'Proveedor', dataIndex: 'Proveedor', flex: 1, renderer: cProveedor_Renderer, editor: { id: 'cmbProveedores' + categorias[i].name, xtype: 'combobox', displayField: 'Nombre', valueField: 'ID', queryMode: 'local', store: App.sProveedores} },
                    { id: 'cProgramado' + categorias[i].name, text: 'Programado', dataIndex: 'Programado', xtype: 'numbercolumn', align: 'center', summaryType: 'sum', renderer: cProgramado_Renderer, editor: { id: 'nfProgramado' + categorias[i].name, xtype: 'numberfield', allowDecimals: true, allowExponential: false, decimalPrecision: 2, decimalSeparator: '.', step: 0.01, maxValue: 100, minValue: 0} },
                    { id: 'cReal' + categorias[i].name, text: 'Real', dataIndex: 'Real', xtype: 'numbercolumn', align: 'center', summaryType: 'sum', renderer: cReal_Renderer, editor: { id: 'nfReal' + categorias[i].name, xtype: 'numberfield', allowDecimals: true, allowExponential: false, decimalPrecision: 2, decimalSeparator: '.', step: 0.01, maxValue: 100, minValue: 0} },
                    { id: 'ccFotos' + categorias[i].name, text: 'Fotos', width: 65, xtype: "commandcolumn", commands: [{ xtype: "button", command: "cnCargarFotos", tooltip: { text: "Cargar Fotos" }, iconCls: "#ImageAdd" }, { xtype: "button", command: "cnVerFotos", tooltip: { text: "Ver Fotos" }, iconCls: "#FolderPicture"}], prepareToolbar: ccFotos_PrepareToolbar, listeners: { command: { fn: ccFotos_Command}} }
                ],
            height: 210,
            width: 870,
            enableColumnHide: false,
            enableColumnMove: false,
            enableColumnResize: false,
            header: false,
            sortableColumns: false,
            selType: 'cellmodel',
            selModel: {
                mode: 'SINGLE'
            },
            plugins: {
                id: 'ceCategoria' + categorias[i].name,
                ptype: 'cellediting',
                clicksToEdit: 1,
                listeners: {
                    beforeedit: {
                        fn: function (editor, context, opciones) { return editable; }
                    }
                }
            },
            viewConfig: {
                id: 'gvCategoria' + categorias[i].name,
                stripeRows: true
            },
            features: [{ ftype: 'groupingsummary', hideGroupedHeader: true}]
        });

        //10. Agregar el GridPanel al Panel correspondiente
        pCategoria.add(gpCategoria);
    }

    //11. Asignar la primer pestaña como activa
    App.tpDetalle.setActiveTab(0);
}

//Función que deshabilita todos los controles cuando se afecta un movimiento
function DeshabilitarControlesAfectar() {
    //1. Deshabilitar controles
    App.cmbMov.setDisabled(true);
    App.nfSemana.setDisabled(true);
    App.txtfSucursalCR.setDisabled(true);
    App.dfFechaEmision.setDisabled(true);
    App.dfFechaRevision.setDisabled(true);
    App.txtfObservaciones.setDisabled(true);
    App.txtfComentarios.setDisabled(true);
    App.imgbtnGuardar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);

    //2. Deshabilitar los GridPanel
    App.sCategorias.each(function (registro) {
        var gridpanel = Ext.getCmp('gpCategoria' + registro.get('ID'));
        if (gridpanel != undefined) {
            editable = false;
        }
    });
}