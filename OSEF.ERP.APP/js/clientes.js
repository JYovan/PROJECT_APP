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
}

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarCliente', 'Nuevo');
    window.parent.App.wEmergente.load('FormaCliente.aspx');
    window.parent.App.wEmergente.setHeight(455);
    window.parent.App.wEmergente.setWidth(830);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo cliente');
    window.parent.App.wEmergente.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarCliente', App.gpClientes.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaCliente.aspx');
    window.parent.App.wEmergente.setHeight(455);
    window.parent.App.wEmergente.setWidth(830);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar cliente ' + Ext.util.Cookies.get('cookieEditarCliente'));
    window.parent.App.wEmergente.show();
};

//Acciones al hacer clic en un registro
var gpClientes_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Cambio en los datos del tablero
var sClientes_DataChanged = function () {
    var tipoCliente;
    //Valida que tipo de cliente es para ponerla en el contador de la estatus bar
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
        tipoCliente = "CLIENTE";
    }
    else {
        tipoCliente = "SOCIO";
    }

    if (App.sClientes.getCount() > 1 || App.sClientes.getCount() == 0) {
        App.sbClientes.setText(App.sClientes.getCount() + ' ' + tipoCliente+'S');
    }
    else {
        App.sbClientes.setText(App.sClientes.getCount() + ' ' + tipoCliente);
    }

    //Resize column Description when records are 11
    if (App.sClientes.getCount() > 10) {
        App.gpClientes.columns[1].setWidth(263);
    }
    else {
        App.gpClientes.columns[1].setWidth(280);
    }
};

//Concatenar la columna de Nombre Completo
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Antes de crear el ComboBox
var ComboBox_BeforeRender = function (combobox, opciones) {
    if (Ext.util.Cookies.get('osefTheme') == 'caja') {
        combobox.cls = 'cajaCombobox cajaComboboxFocus';
    }
    else {
        combobox.cls = 'bancomerCombobox bancomerComboboxFocus';
    }
};

//Despues de crear el Combobox de Estatus
var cmbEstatus_AfterRender = function (combobox, opciones) {
    if (Ext.util.Cookies.get('cookieEditarCliente') === 'Nuevo') {
        App.cmbEstatus.select('ALTA');
    }
};

//Antes de crear el la lista del ComboBox
var ListConfig_BeforeRender = function (boundlist, opciones) {
    if (Ext.util.Cookies.get('osefTheme') == 'caja') {
        boundlist.cls = 'cajaComboboxLista';   
    }
    else {
        boundlist.cls = 'bancomerComboboxLista';
    }
};

//Método para calcular la edad en base a la fecha de nacimiento
var CalcularFechaNacimiento = function (datefield, fecha) {
    fecha = App.dfFechaNacimiento.getValue();

    //1. Calculo la fecha de hoy
    hoy = new Date();

    //2. Calculo la fecha que recibo y la descompongo en un array 
    var array_fecha = (fecha.getDate() + "/" + (fecha.getMonth() + 1) + "/" + fecha.getFullYear()).split("/");

    //3. Si el array no tiene tres partes, la fecha es incorrecta 
    if (array_fecha.length != 3)
        return false;

    //4. Compruebo que ano, mes, dia son correctos 
    var ano;
    ano = parseInt(array_fecha[2]);
    if (isNaN(ano))
        return false;

    var mes;
    mes = parseInt(array_fecha[1]);
    if (isNaN(mes))
        return false;

    var dia;
    dia = parseInt(array_fecha[0]);
    if (isNaN(dia))
        return false;

    //5. Si el año de la fecha que recibo solo tiene 2 cifras hay que cambiarlo a 4 
    if (ano <= 99)
        ano += 1900;

    //6. Resto los años de las dos fechas 
    var edad = hoy.getFullYear() - ano - 1; //-1 porque no se si ha cumplido años ya este año

    //7. Si resto los meses y me da menor que 0 entonces no ha cumplido años. Si da mayor si ha cumplido 
    if (hoy.getMonth() + 1 - mes < 0) { //+ 1 porque los meses empiezan en 0
        App.txtfEdad.setValue(edad + ' años');
        return true;
    }
    if (hoy.getMonth() + 1 - mes > 0) {
        App.txtfEdad.setValue((edad + 1) + ' años');
        return true;
    }

    //8. Entonces es que eran iguales. miro los dias 
    //Si resto los dias y me da menor que 0 entonces no ha cumplido años. Si da mayor o igual si ha cumplido 
    if (hoy.getUTCDate() - dia >= 0) {
        App.txtfEdad.setValue((edad + 1) + ' años');
        return true;
    }

    App.txtfEdad.setValue(edad + ' años');
};

//Método que se lanza despues de guardar un registro
var imgbtnGuardar_Click_Success = function (response, result) {
    if (Ext.util.Cookies.get('cookieEditarCliente') === 'Nuevo') {
        Ext.Msg.show({
            id: 'msgNuevo',
            title: 'Registro nuevo',
            msg: '<p align="center">Socio registrado con ID: ' + result.extraParamsResponse.registro + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { window.parent.App.wEmergente.hide(); window.parent.App.pCentro.getBody().App.sClientes.reload(); },
            icon: Ext.MessageBox.INFO
        });
    }
    else {
        Ext.Msg.show({
            id: 'msgActualizar',
            title: 'Actualizar registro',
            msg: '<p align="center">Información actualizada ID: ' + result.extraParamsResponse.registro + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { window.parent.App.wEmergente.hide(); window.parent.App.pCentro.getBody().App.sClientes.reload(); },
            icon: Ext.MessageBox.INFO
        });
    }
};

//Evento lanzado al cargar el store de la sucursal
var sCliente_Load = function () {
    //1. Validar si es nuevo o se va a Editar
    if (Ext.util.Cookies.get('cookieEditarCliente') !== 'Nuevo') {
        App.direct.sCliente_Load({
            //Si el proceso es correcto
            success: function (result) {
                App.cmbEstatus.setDisabled(false);
            },

            //Si existe un error
            failure: function (errorMsg) {
                Ext.Msg.alert('Error', errorMsg);
            }
        });
    }
    else {
        App.cmbEstatus.setDisabled(true);
    }

    //2. Obtener el Store de sClientes
    store = window.parent.App.pCentro.getBody().App.sClientes;
};

//Evento lanzado al agregar un registro al store
var sCliente_Add = function (store, registro) {
    //Primera parte
    App.txtfID.setValue(registro[0].get('ID'));
    App.txtfNombre.setValue(registro[0].get('Nombre'));
    App.txtfAPaterno.setValue(registro[0].get('APaterno'));
    App.txtfAMaterno.setValue(registro[0].get('AMaterno'));
    App.txtfRFC.setValue(registro[0].get('RFC'));
    App.txtfCURP.setValue(registro[0].get('CURP'));
    App.txtfEdad.setValue(registro[0].get('Edad') + ' años');
    App.txtfTelefono.setValue(registro[0].get('Telefono'));
    App.txtfTelefonoMovil.setValue(registro[0].get('TelefonoMovil'));
    App.txtfCorreo.setValue(registro[0].get('Correo'));
    App.txtfUsuario.setValue(registro[0].get('Usuario'));

    App.cmbSexo.select(registro[0].get('Sexo'));
    App.cmbEstadoCivil.select(registro[0].get('EstadoCivil'));
    App.cmbProfesion.select(registro[0].get('Profesion'));
    App.cmbEstatus.select(registro[0].get('Estatus'));

    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));
    App.dfFechaNacimiento.setValue(registro[0].get('FechaNacimiento'));

    //Segunda parte
    App.txtfCalle.setValue(registro[0].get('Calle'));
    App.txtfEntreCalles.setValue(registro[0].get('EntreCalles'));
    App.txtfNoExterior.setValue(registro[0].get('NoExterior'));
    App.txtfNoInterior.setValue(registro[0].get('NoInterior'));
    App.txtfCodigoPostal.setValue(registro[0].get('CodigoPostal'));

    App.cmbEstado.select(registro[0].get('Estado'));

    //Tercera parte
    App.txtfEmpresa.setValue(registro[0].get('Empresa'));
    App.txtfPuesto.setValue(registro[0].get('Puesto'));
    App.txtfEmpresaCalle.setValue(registro[0].get('EmpresaCalle'));
    App.txtfEmpresaEntreCalles.setValue(registro[0].get('EmpresaEntreCalles'));
    App.txtfEmpresaNoExterior.setValue(registro[0].get('EmpresaNoExterior'));
    App.txtfEmpresaNoInterior.setValue(registro[0].get('EmpresaNoInterior'));
    App.txtfEmpresaCodigoPostal.setValue(registro[0].get('EmpresaCodigoPostal'));
    App.txtfEmpresaTelefono.setValue(registro[0].get('EmpresaTelefono'));
    App.nfEmpresaTelefonoExt.setValue(registro[0].get('EmpresaTelefonoExt'));

    App.cmbEmpresaEstado.select(registro[0].get('EmpresaEstado'));

    //Asignar los Municipio
    App.direct.AsignarMunicipio(registro[0].get('Estado'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbMunicipio.select(registro[0].get('Municipio'));
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Asignar las Colonias
    App.direct.AsignarColonia(registro[0].get('Municipio'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbColonia.select(registro[0].get('Colonia'));
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Asignar los EmpresaMunicipios
    App.direct.AsignarEmpresaMunicipio(registro[0].get('EmpresaEstado'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbEmpresaMunicipio.select(registro[0].get('EmpresaMunicipio'));
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Asignar las EmpresaColonias
    App.direct.AsignarEmpresaColonia(registro[0].get('EmpresaMunicipio'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbEmpresaColonia.select(registro[0].get('EmpresaColonia'));
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });
};

//Valida para que empresa es y muestra campos segun la variable de cookie
var fcEstadoCivilRender = function () {
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
        App.fcCliente5.hide();
        App.cmbEstadoCivil.allowBlank = true;
        App.cmbProfesion.allowBlank = true;
    }
    else {
    }
}

//Evento que se lanza antes de pintar el contenedor del RFC
var fcRFCRender = function () {
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
        App.fcRFC.hide();
    }
    else {
    }
}

//Evento que se lanza antes de pintar Grid
var gpClientesRender = function () {
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
        App.gpClientes.title = "CLIENTES";
    }
    else {
        App.gpClientes.title = "SOCIOS";
    }
}

//Evento que se lanza antes de pintar el contenedor del ID
var fcIDRender = function () {
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
        App.fcID.fieldLabel = "Cliente";
    }
    else {
        App.fcID.fieldLabel = "Socio";
    }
}

//Evento que se lanza antes de pintar el contenedor del ID
var fcFechaNac_Render = function () {
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
        App.txtfEdad.setValue('0');
        App.fcFechaNac.hide();
        App.dfFechaNacimiento.allowBlank = true;
        App.cmbSexo.allowBlank = true;
    }
    else {
    }
}

//Evento que se lanza antes de pintar el contenedor del Cliente
var fcNombre_Render = function () {
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
        App.fcNombre.fieldLabel = "Contacto";
    }
    else {
        App.fcID.fieldLabel = "Nombre(s)";
    }
}

//Oculta el panel de datos de la empresa
var pDatosEmpresa_Render = function () {
    if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
               App.tpCliente.remove(App.pDatosEmpresa.id, false);    
    }
    else {
    }
}

var txtBuscarCliente_Change = function (textfield, newValue, oldValue, e) {
    App.sClientes.clearFilter();
    App.sClientes.filter([{ filterFn: function (item) {
        if (item.get('Nombre').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Acciones al hacer clic en un registro de busqueda
var gpBuscaClientes_ItemDblClick = function (gridview, registro, gvhtml, index) {
    window.parent.App.wEmergente.getBody().App.IdCliente.setValue(App.sClientes.getAt(index).get('ID'));
    window.parent.App.wEmergente.getBody().App.txtCliente.setValue(App.sClientes.getAt(index).get('Nombre')); 
    window.parent.App.wAyudaConcepto.hide();
};


var onFUCliente = function () {
    console.log(App.fuImagenCliente);
}