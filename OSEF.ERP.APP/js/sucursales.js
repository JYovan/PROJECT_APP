//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieCP', '');
    Ext.util.Cookies.set('cookieEstado', '');
    Ext.util.Cookies.set('cookieMunicipio', '');
    Ext.util.Cookies.set('cookieColonia', '');
    Ext.util.Cookies.set('cookieEditarSucursal', 'Nuevo');
    var wsssm = window.parent.App.wSubSubSubModulo;
    wsssm.load('FormaSucursal.aspx');
    wsssm.setHeight(520);
    wsssm.setWidth(800);
    wsssm.center();
    wsssm.setTitle('Nueva sucursal');
    wsssm.show();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wSubSubSubModulo.hide();
    //    window.parent.App.pCentro.getBody().App.sSucursales.reload();
    window.parent.App.wSubSubModulo.getBody().App.sSucursales.reload();
    
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_SuccessCR = function () { 
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieCP', '');
    Ext.util.Cookies.set('cookieEstado', '');
    Ext.util.Cookies.set('cookieMunicipio', '');
    Ext.util.Cookies.set('cookieColonia', '');
    Ext.util.Cookies.set('cookieEditarSucursal', App.gpSucursales.getSelectionModel().getSelection()[0].get('ID'));
    var wsssm = window.parent.App.wSubSubSubModulo;
    wsssm.load('FormaSucursal.aspx');
    wsssm.setHeight(520);
    wsssm.setWidth(800);
    wsssm.center();
    wsssm.setTitle('Editar sucursal ' + Ext.util.Cookies.get('cookieEditarSucursal'));
    wsssm.show();
};



//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {
    if (result.extraParamsResponse.existe) {
        Ext.Msg.show({
            id: 'msgSucursales',
            title: 'Advertencia Sucursal',
            msg: 'La sucursal esta siendo utilizada en un movimiento',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpSucursales.getSelectionModel().getSelection()[0].get('ID');


        var indice = App.gpSucursales.getStore().find('ID', identificador);
        var nombre = App.sSucursales.getAt(indice).get('Nombre');
        App.gpSucursales.getStore().removeAt(indice);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Nombre: ' + nombre + '</p>',
            title: 'Eliminar registro'
        });
        App.gpSucursales.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
    }
};

//Acciones al hacer clic en un registro
var gpSucursales_ItemClick = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};



//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sSucursales.clearFilter();
    App.sSucursales.filter([{ filterFn: function (item) {

        console.log(item);
        console.log(newValue);
        if (item.get('CR').toString().indexOf(newValue) >-1 || item.get('Nombre').toUpperCase().indexOf(newValue.toUpperCase()) > -1) {
            return true;
        }
        else {
            return false;
        }
    }
    }]);
};


//Concatenar la columna de contacto
var Gerente_Convert = function (value, record) {
    return record.get('GerenteBBVANombre') + ' ' + record.get('GerenteBBVAAPaterno') + ' ' + record.get('GerenteBBVAAMaterno');
};

//Cambio en los datos del tablero
var sSucursales_DataChanged = function () {
    if (App.sSucursales.getCount() > 1) {
        App.sbSucursales.setText(App.sSucursales.getCount() + ' ' + 'SUCURSALES');
    }
    else {
        App.sbSucursales.setText(App.sSucursales.getCount() + ' ' + 'SUCURSAL');
    }

    //Resize column Description when records are 11
    if (App.sSucursales.getCount() > 10) {
        App.gpSucursales.columns[2].setWidth(260);
    }
    else {
        App.gpSucursales.columns[2].setWidth(280);
    }
};


//Evento lanzado al cargar el store de la sucursal
var sSucursal_Load = function () {
    App.direct.sSucursal_Load();
};

//Evento lanzado al agregar un registro al store
var sSucursal_Add = function (sucursal, registro) {
    //Calculo de dias para que el texfield de dias 
    var f1 = registro[0].get('FinObra');
    var f2 = registro[0].get('InicioObra');

    fechaFormateada1 = f1.getDate() + '/' + (f1.getMonth() + 1) + '/' + f1.getFullYear();
    fechaFormateada2 = f2.getDate() + '/' + (f2.getMonth() + 1) + '/' + f2.getFullYear();

    var aFecha1 = fechaFormateada1.split('/');
    var aFecha2 = fechaFormateada2.split('/');

    var fFecha1 = Date.UTC(aFecha1[2], aFecha1[1] - 1, aFecha1[0]);
    var fFecha2 = Date.UTC(aFecha2[2], aFecha2[1] - 1, aFecha2[0]);

    var dif = fFecha1 - fFecha2;
    var dias = Math.floor(dif / (1000 * 60 * 60 * 24));

    App.txtfID.setValue(registro[0].get('ID'));
    App.nfCR.setValue(registro[0].get('CR'));
    App.txtfNombre.setValue(registro[0].get('Nombre'));
    App.txtfDireccionZona.setValue(registro[0].get('DireccionZona'));
    App.txtfGerenteBBVANombre.setValue(registro[0].get('GerenteBBVANombre'));
    App.txtfGerenteBBVAAPaterno.setValue(registro[0].get('GerenteBBVAAPaterno'));
    App.txtfGerenteBBVAAMaterno.setValue(registro[0].get('GerenteBBVAAMaterno'));
    App.txtfSupervisorNombre.setValue(registro[0].get('SupervisorNombre'));
    App.txtfSupervisorAPaterno.setValue(registro[0].get('SupervisorAPaterno'));
    App.txtfSupervisorAMaterno.setValue(registro[0].get('SupervisorAMaterno'));
    App.txtfProveedorEnergia.setValue(registro[0].get('ProveedorEnergia'));
    App.nfSuperficie.setValue(registro[0].get('Superficie'));
    App.txtfCoordinadorNombre.setValue(registro[0].get('CoordinadorNombre'));
    App.txtfCoordinadorAPaterno.setValue(registro[0].get('CoordinadorAPaterno'));
    App.txtfCoordinadorAMaterno.setValue(registro[0].get('CoordinadorAMaterno'));
    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));
    App.cmbEstatus.setValue(registro[0].get('Estatus'));
    App.txtfCalle.setValue(registro[0].get('Calle'));
    App.txtfEntreCalles.setValue(registro[0].get('EntreCalles'));
    App.txtfNoExterior.setValue(registro[0].get('NoExterior'));
    App.txtfNoInterior.setValue(registro[0].get('NoInterior'));

    App.txtfCodigoPostal.setValue(registro[0].get('RCodigopostal').Numero);
    App.txtColonia.setValue(registro[0].get('RColonia').Descripcion);
    App.txtEstado.setValue(registro[0].get('REstado').Descripcion);
    App.txtMunicipio.setValue(registro[0].get('RMunicipio').Descripcion);

    App.cmbEmpresaSupervisora.setValue(registro[0].get('EmpresaSupervisora'));
    App.cmbTipoConcepto.setValue(registro[0].get('TipoConcepto'));
    App.txtTipoObra.setValue(registro[0].get('TipoObra'));

    App.cmbProveedor.setValue(registro[0].get('RProvedor').ID);
    App.dfInicioObra.setValue(registro[0].get('InicioObra'));
    App.dfFinObra.setValue(registro[0].get('FinObra'));
    App.nfSemanasObra.setValue(registro[0].get('SemanasObra'));

    //llena el campo de fecha
    App.txtDiasObra.setValue(dias);


    App.cmbEstatus.setDisabled(false);
};

//Evento al cargar el store de municipios
var sMunicipios_Load = function () {
    if (App.sSucursal.getAt(0) != undefined) {

        App.cmbMunicipio.setValue(App.sSucursal.getAt(0).get('Municipio'));
       
    }
};

//Evento al cargar el store de municipios
var sColonias_Load = function () {

    if (App.sSucursal.getAt(0) != undefined) {

        App.cmbColonia.setValue(App.sSucursal.getAt(0).get('Colonia'));
    }
};

//Suma dias
function sumarDias(d, fecha) {


    //Auxiliar para realizar la conversión
    var date = new Date(fecha);
    fecha = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    var Fecha = new Date();
    var sFecha = fecha || (Fecha.getDate() + "/" + (Fecha.getMonth() + 1) + "/" + Fecha.getFullYear());
    var sep = sFecha.indexOf('/') != -1 ? '/' : '-';
    var aFecha = sFecha.split(sep);
    var fecha = aFecha[2] + '/' + aFecha[1] + '/' + aFecha[0];
    fecha = new Date(fecha);
    fecha.setDate(fecha.getDate() + parseInt(d));
    var anno = fecha.getFullYear();
    var mes = fecha.getMonth() + 1;
    var dia = fecha.getDate();
    mes = (mes < 10) ? ("0" + mes) : mes;
    dia = (dia < 10) ? ("0" + dia) : dia;
    var fechaFinal = dia + sep + mes + sep + anno;

    var semanas = d / 7;

    App.nfSemanasObra.setValue(semanas);
    App.dfFinObra.setValue(fechaFinal);
}

function validarFechaInicio(valor, evento, registro ) {

    if (valor.rawValue != '') {

        App.txtDiasObra.setDisabled(false);
      
    }
}


//Evento de click del botón Buscar
var imgbtnBuscar_Click = function () {
    Ext.util.Cookies.set('cookieElijeCodigoPostal', 'Sucursales');
    var wssssm = window.parent.App.wSubSubSubSubModulo;
    wssssm.load('FormaBuscaCodigosPostales.aspx');
    wssssm.setHeight(350);
    wssssm.setWidth(980);
    wssssm.center();
    wssssm.setTitle('BUSCAR CODIGO POSTAL');
    wssssm.show();
};
 