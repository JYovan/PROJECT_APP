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

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarSolicitudPrestamo', 'Nuevo');
    window.parent.App.wEmergente.load('FormaSolicitudPrestamo.aspx');
    window.parent.App.wEmergente.setHeight(576);
    window.parent.App.wEmergente.setWidth(825);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo préstamo');
    window.parent.App.wEmergente.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarSolicitudPrestamo', App.gpSolicitudesPrestamos.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaSolicitudPrestamo.aspx');
    window.parent.App.wEmergente.setHeight(576);
    window.parent.App.wEmergente.setWidth(825);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar préstamo ' + Ext.util.Cookies.get('cookieEditarSolicitudPrestamo'));
    window.parent.App.wEmergente.show();
};

//Para el botón de eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {
    if (result.extraParamsResponse.existe) {
        Ext.Msg.show({
            id: 'msgSolicitudPrestamos',
            title: 'Advertencia Solicitud Préstamo',
            msg: 'El préstamo esta siendo utilizado en un movimiento',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpSolicitudesPrestamos.getSelectionModel().getSelection()[0].get('ID');
        var indice = App.gpSolicitudesPrestamos.getStore().find('ID', identificador);
        var nombre = App.sSolicitudesPrestamos.getAt(indice).get('NombreCompleto');

        App.gpSolicitudesPrestamos.getStore().removeAt(indice);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Nombre completo: ' + nombre + '</p>',
            title: 'Eliminar registro'
        });
        App.gpSolicitudesPrestamos.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
    }
};

//Hacer la busqueda de información
var txtfBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sSolicitudesPrestamos.clearFilter();
    App.sSolicitudesPrestamos.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('NombreCompleto').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Concatenar la columna de Nombre Completo
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Darle formato a la columna de Cantidad
var ncCantidad_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};

//Cambio en los datos del tablero
var sSolicitudesPrestamos_DataChanged = function () {
    //Número de registros
    if (App.sSolicitudesPrestamos.getCount() > 1 || App.sSolicitudesPrestamos.getCount() == 0) {
        App.sbSolicitudesPrestamos.setText(App.sSolicitudesPrestamos.getCount() + ' ' + 'SOLICITUDES DE PRÉSTAMO');
    }
    else {
        App.sbSolicitudesPrestamos.setText(App.sSolicitudesPrestamos.getCount() + ' ' + 'SOLICITUD DE PRÉSTAMO');
    }

    //Resize column Description when records are 11
    if (App.sSolicitudesPrestamos.getCount() > 10) {
        App.gpSolicitudesPrestamos.columns[1].setWidth(330);
    }
    else {
        App.gpSolicitudesPrestamos.columns[1].setWidth(350);
    }
};

//Acciones al hacer clic en un registro
var gpSolicitudesPrestamos_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Evento que se lanza antes de cargar el Store
var sCapacidadPagoIngresos_Load = function (store, registros, successful, opciones) {
    //1. Validar si es nuevo o se va a Editar
    if (Ext.util.Cookies.get('cookieEditarSolicitudPrestamo') == 'Nuevo') {
        store.insert(0, { ID: 0, SolicitudPrestamo: '', Renglon: 0, Tipo: 'Ingreso', Concepto: 'Sueldo del solicitante:', Importe: 0 });
        store.insert(1, { ID: 1, SolicitudPrestamo: '', Renglon: 1, Tipo: 'Ingreso', Concepto: 'Sueldo del cónyuge:', Importe: 0 });
        store.insert(2, { ID: 2, SolicitudPrestamo: '', Renglon: 2, Tipo: 'Ingreso', Concepto: 'Otros ingresos:', Importe: 0 });
        store.insert(3, {});
        store.insert(4, {});
        store.insert(5, {});
        store.insert(6, {});
        store.insert(7, {});
    }
};

//Evento que se lanza antes de cargar el Store
var sCapacidadPagoEgresos_Load = function (store, registros, successful, opciones) {
    if (Ext.util.Cookies.get('cookieEditarSolicitudPrestamo') == 'Nuevo') {
        store.insert(0, { ID: 0, SolicitudPrestamo: '', Renglon: 0, Tipo: 'Egreso', Concepto: 'Alimentación:', Importe: 0 });
        store.insert(1, { ID: 1, SolicitudPrestamo: '', Renglon: 1, Tipo: 'Egreso', Concepto: 'Renta:', Importe: 0 });
        store.insert(2, { ID: 2, SolicitudPrestamo: '', Renglon: 2, Tipo: 'Egreso', Concepto: 'Vestido:', Importe: 0 });
        store.insert(3, { ID: 3, SolicitudPrestamo: '', Renglon: 3, Tipo: 'Egreso', Concepto: 'Servicios:', Importe: 0 });
        store.insert(4, { ID: 4, SolicitudPrestamo: '', Renglon: 4, Tipo: 'Egreso', Concepto: 'Colegiatura:', Importe: 0 });
        store.insert(5, { ID: 5, SolicitudPrestamo: '', Renglon: 5, Tipo: 'Egreso', Concepto: 'Diversiones:', Importe: 0 });
        store.insert(6, { ID: 6, SolicitudPrestamo: '', Renglon: 6, Tipo: 'Egreso', Concepto: 'Servidumbre:', Importe: 0 });
        store.insert(7, { ID: 7, SolicitudPrestamo: '', Renglon: 7, Tipo: 'Egreso', Concepto: 'Otros:', Importe: 0 });
    }
};

//Evento que se lanza despues de perder el focus
var nfIngresos_Blur = function (numberfield, evento, opciones) {
    App.sCapacidadPagoIngresos.getAt(0).set('Importe', numberfield.getValue());
};

//Evento que se lanza despues de perder el focus
var nfOtrosIngresos_Blur = function (numberfield, evento, opciones) {
    App.sCapacidadPagoIngresos.getAt(2).set('Importe', numberfield.getValue() + App.nfConyugeOtrosIngresos.getValue());
};

//Evento que se lanza despues de perder el focus
var nfConyugeIngresos_Blur = function (numberfield, evento, opciones) {
    App.sCapacidadPagoIngresos.getAt(1).set('Importe', numberfield.getValue());
};

//Evento que se lanza despues de perder el focus
var nfConyugeOtrosIngresos_Blur = function (numberfield, evento, opciones) {
    App.sCapacidadPagoIngresos.getAt(2).set('Importe', numberfield.getValue() + App.nfOtrosIngresos.getValue());
};

//Evento lanzado al cargar el store
var sSolicitudPrestamo_Load = function () {
    //1. Validar si es nuevo o se va a Editar
    if (Ext.util.Cookies.get('cookieEditarSolicitudPrestamo') !== 'Nuevo') {
        App.direct.sSolicitudPrestamo_Load({
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
    store = window.parent.App.pCentro.getBody().App.sSolicitudesPrestamos;
};

//Evento lanzado al agregar un registro al store
var sSolicitudPrestamo_Add = function (store, registro) {
    //Primera parte
    App.txtfID.setValue(registro[0].get('ID'));
    App.cmbCliente.select(registro[0].get('Cliente'));
    App.txtfNacionalidad.setValue(registro[0].get('Nacionalidad'));
    App.nfNumeroDependientes.setValue(registro[0].get('NumeroDependientes'));
    App.txtfEdades.setValue(registro[0].get('Edades'));
    App.nAniosDomicilio.setValue(registro[0].get('AniosDomicilio'));
    App.cmbEstatus.select(registro[0].get('Estatus'));
    App.txtfUsuarioAlta.setValue(registro[0].get('UsuarioAlta'));
    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));
    App.txtfUsuarioModificacion.setValue(registro[0].get('UsuarioModificacion'));
    App.dfFechaModificacion.setValue(registro[0].get('FechaModificacion'));
    if (registro[0].get('RegistroMatrimonial') == 'BIENES SEPARADOS') {
        App.rBienesSeparados.setValue(true);
    }
    else {
        App.rBienesMancomunados.setValue(true);
    }
    if (registro[0].get('TipoCasa') == 'PROPIA') {
        App.rPropia.setValue(true);
    }
    else if (registro[0].get('TipoCasa') == 'RENTADA') {
        App.rRentada.setValue(true);
    }
    else if (registro[0].get('TipoCasa') == 'FAMILIA') {
        App.rFamilia.setValue(true);
    }
    else {
        App.rHipoteca.setValue(true);
    }

    //Segunda parte
    App.txtfCalleAnterior.setValue(registro[0].get('CalleAnterior'));
    App.txtfEntreCallesAnterior.setValue(registro[0].get('EntreCallesAnterior'));
    App.txtfNoExteriorAnterior.setValue(registro[0].get('NoExteriorAnterior'));
    App.txtfNoInteriorAnterior.setValue(registro[0].get('NoInteriorAnterior'));
    App.txtfCodigoPostalAnterior.setValue(registro[0].get('CodigoPostalAnterior'));
    App.cmbEstadoAnterior.select(registro[0].get('EstadoAnterior'));

    //Asignar Municipios Anterior
    App.direct.AsignarMunicipioAnterior(registro[0].get('EstadoAnterior'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbMunicipioAnterior.select(registro[0].get('MunicipioAnterior'));

            //Asignar las Colonias
            App.direct.AsignarColoniaAnterior(registro[0].get('MunicipioAnterior'), {
                //Si el proceso es correcto
                success: function (result) {
                    App.cmbColoniaAnterior.select(registro[0].get('ColoniaAnterior'));
                },

                //Si existe un error
                failure: function (errorMsg) {
                    Ext.Msg.alert('Error', errorMsg);
                }
            });
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Tercera parte
    App.nfAntiguedad.setValue(registro[0].get('Antiguedad'));
    App.nfIngresos.setValue(registro[0].get('Ingresos'));
    App.nfOtrosIngresos.setValue(registro[0].get('OtrosIngresos'));
    App.txtfOtrosIngresos.setValue(registro[0].get('Concepto'));
    App.txtfEmpresaAnterior.setValue(registro[0].get('EmpresaAnterior'));
    App.txtfJefeNombre.setValue(registro[0].get('JefeNombre'));
    App.txtfJefeAPaterno.setValue(registro[0].get('JefeAPAterno'));
    App.txtfJefeAMaterno.setValue(registro[0].get('JefeAMaterno'));

    //Cuarta parte
    App.txtfConyugeNombre.setValue(registro[0].get('ConyugeNombre'));
    App.txtfConyugeAPaterno.setValue(registro[0].get('ConyugeAPaterno'));
    App.txtfConyugeAMaterno.setValue(registro[0].get('ConyugeAMaterno'));
    App.dfConyugeFechaNacimiento.setValue(registro[0].get('ConyugeFechaNacimiento'));
    if (registro[0].get('ConyugeEdad') != null)
        App.txtfConyugeEdad.setValue(registro[0].get('ConyugeEdad') + ' años');
    App.txtfConyugeRFC.setValue(registro[0].get('ConyugeRFC'));
    App.txtfConyugeTelefono.setValue(registro[0].get('ConyugeTelefono'));
    App.txtfConyugeTelefonoMovil.setValue(registro[0].get('ConyugeTelefonoMovil'));
    App.txtfConyugeCalle.setValue(registro[0].get('ConyugeCalle'));
    App.txtfConyugeEntreCalles.setValue(registro[0].get('ConyugeEntreCalles'));
    App.txtfConyugeNoExterior.setValue(registro[0].get('ConyugeNoExterior'));
    App.txtfConyugeNoInterior.setValue(registro[0].get('ConyugeNoInterior'));
    App.cmbConyugeEstado.select(registro[0].get('ConyugeEstado'));

    //Asignar Conyuge Municipios
    App.direct.AsignarConyugeMunicipio(registro[0].get('ConyugeEstado'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbConyugeMunicipio.select(registro[0].get('ConyugeMunicipio'));

            //Asignar las Colonias
            App.direct.AsignarConyugeColonia(registro[0].get('ConyugeMunicipio'), {
                //Si el proceso es correcto
                success: function (result) {
                    App.cmbConyugeColonia.select(registro[0].get('ConyugeColonia'));
                },

                //Si existe un error
                failure: function (errorMsg) {
                    Ext.Msg.alert('Error', errorMsg);
                }
            });
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    App.txtfConyugeCodigoPostal.setValue(registro[0].get('ConyugeCodigoPostal'));
    App.nfConyugeAntiguedad.setValue(registro[0].get('ConyugeAntiguedad'));
    App.nfConyugeIngresos.setValue(registro[0].get('ConyugeIngresos'));
    App.nfConyugeOtrosIngresos.setValue(registro[0].get('ConyugeOtrosIngresos'));
    App.txtfConyugeEmpresaConceptoOtrosIngresos.setValue(registro[0].get('ConyugeConcepto'));
    App.txtfConyugeEmpresa.setValue(registro[0].get('ConyugeEmpresa'));
    App.txtfConyugePuesto.setValue(registro[0].get('ConyugePuesto'));
    App.txtfConyugeEmpresaJefeNombre.setValue(registro[0].get('ConyugeEmpresaJefeNombre'));
    App.txtfConyugeEmpresaJefeAPAterno.setValue(registro[0].get('ConyugeEmpresaJefeAPaterno'));
    App.txtfConyugeEmpresaJefeAMAterno.setValue(registro[0].get('ConyugeEmpresaJefeAMaterno'));
    App.txtfConyugeEmpresaCalle.setValue(registro[0].get('ConyugeEmpresaCalle'));
    App.txtfConyugeEmpresaEntreCalles.setValue(registro[0].get('ConyugeEmpresaEntreCalles'));
    App.txtfConyugeEmpresaNoExterior.setValue(registro[0].get('ConyugeEmpresaNoExterior'));
    App.txtfConyugeEmpresaNoInterior.setValue(registro[0].get('ConyugeEmpresaNoInterior'));
    App.cmbConyugeEmpresaEstado.select(registro[0].get('ConyugeEmpresaEstado'));

    //Asignar Conyuge Municipios
    App.direct.AsignarConyugeEmpresaMunicipio(registro[0].get('ConyugeEmpresaEstado'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbConyugeEmpresaMunicipio.select(registro[0].get('ConyugeEmpresaMunicipio'));

            //Asignar las Colonias
            App.direct.AsignarConyugeEmpresaColonia(registro[0].get('ConyugeEmpresaMunicipio'), {
                //Si el proceso es correcto
                success: function (result) {
                    App.cmbConyugeEmpresaColonia.select(registro[0].get('ConyugeEmpresaColonia'));
                },

                //Si existe un error
                failure: function (errorMsg) {
                    Ext.Msg.alert('Error', errorMsg);
                }
            });
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    App.txtfConyugeEmpresaCodigoPostal.setValue(registro[0].get('ConyugeEmpresaCodigoPostal'));

    //Quinta Parte
    App.txtfAvalNombre.setValue(registro[0].get('AvalNombre'));
    App.txtfAvalApellidoPaterno.setValue(registro[0].get('AvalAPaterno'));
    App.txtfAvalApellidoMaterno.setValue(registro[0].get('AvalAMaterno'));
    App.cmbAvalEstadoCivil.select(registro[0].get('AvalEstadoCivil'));
    App.txtfAvalTelefono.setValue(registro[0].get('AvalTelefono'));
    App.txtfAvalTelefonoMovil.setValue(registro[0].get('AvalTelefonoMovil'));
    App.txtfAvalCalle.setValue(registro[0].get('AvalCalle'));
    App.txtfAvalEntreCalles.setValue(registro[0].get('AvalEntreCalles'));
    App.txtfAvalNoExterior.setValue(registro[0].get('AvalNoExterior'));
    App.txtfAvalNoInterior.setValue(registro[0].get('AvalNoInterior'));
    App.cmbAvalEstado.select(registro[0].get('AvalEstado'));
    App.txtfAvalCodigoPostal.setValue(registro[0].get('AvalCodigoPostal'));
    App.nfAntiguedadDocmicilioAval.setValue(registro[0].get('AvalAntiguedad'));

    //Asignar Conyuge Municipios
    App.direct.AsignarAvalMunicipio(registro[0].get('AvalEstado'), {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbAvalMunicipio.select(registro[0].get('AvalMunicipio'));

            //Asignar las Colonias
            App.direct.AsignarAvalColonia(registro[0].get('AvalMunicipio'), {
                //Si el proceso es correcto
                success: function (result) {
                    App.cmbAvalColonia.select(registro[0].get('AvalColonia'));
                },

                //Si existe un error
                failure: function (errorMsg) {
                    Ext.Msg.alert('Error', errorMsg);
                }
            });
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    if (registro[0].get('AvalSocio')) {
        App.rSocioSi.setValue(true);
    }
    else {
        App.rSocioNo.setValue(true);
    }
    if (registro[0].get('AvalRegistroMatrimonial') == 'BIENES SEPARADOS') {
        App.rAvalBienesSeparados.setValue(true);
    }
    else {
        App.rAvalBienesMancomunados.setValue(true);
    }
    if (registro[0].get('AvalTipoCasa') == 'PROPIA') {
        App.rAvalPropia.setValue(true);
    }
    else if (registro[0].get('AvalTipoCasa') == 'RENTADA') {
        App.rAvalRentada.setValue(true);
    }
    else if (registro[0].get('AvalTipoCasa') == 'FAMILIA') {
        App.rAvalFamilia.setValue(true);
    }
    else {
        App.rAvalHipoteca.setValue(true);
    }

    //Sexta Parte
    App.txtfAvalEmpresa.setValue(registro[0].get('AvalEmpresa'));
    App.txtfAvalEmpresaPuesto.setValue(registro[0].get('AvalEmpresaPuesto'));
    App.txtfAvalEmpresaJefeNombre.setValue(registro[0].get('AvalEmpresaJefeNombre'));
    App.txtfAvalEmpresaJefeAPaterno.setValue(registro[0].get('AvalEmpresaJefeAPaterno'));
    App.txtfAvalEmpresaJefeAMaterno.setValue(registro[0].get('AvalEmpresaJefeAMaterno'));
    App.nfAvalEmpresaAntiguedad.setValue(registro[0].get('AvalEmpresaAntiguedad'));
    App.nfAvalEmpresaIngresos.setValue(registro[0].get('AvalEmpresaIngresos'));
    App.nfAvalEmpresaOtrosIngresos.setValue(registro[0].get('AvalEmpresaOtrosIngresos'));
    App.txtfAvalEmpresaConcepto.setValue(registro[0].get('AvalEmpresaConcepto'));
    App.txtfAvalEmpresaTelefono.setValue(registro[0].get('AvalEmpresaTelefono'));
    App.nfAvalEmpresaTelefonoExt.setValue(registro[0].get('AvalEmpresaTelefonoExt'));
    App.txtfAvalEmpresaAnterior.setValue(registro[0].get('AvalEmpresaAnterior'));

    if (registro[0].get('AvalEmpresaPropietario')) {
        App.rAvalEmpresaPropietarioSi.setValue(true);
    }
    else {
        App.rAvalEmpresaPropietarioNo.setValue(true);
    }

    App.txtAvalEmpresaGiroComercial.setValue(registro[0].get('AvalEmpresaTipo'));

    //Septima parte
    App.nfCantidad.setValue(registro[0].get('Cantidad'));
    App.nfPlazo.setValue(registro[0].get('Plazo'));
    App.cmbFormaPago.select(registro[0].get('FormaPago'));
    App.txtfDestinoPrestamo.setValue(registro[0].get('DestinoPrestamo'));
    App.cmbTipo.select(registro[0].get('Tipo'));
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Clientes
var cmbCliente_Select = function (combobox, registro) {
    AsignarDatosSocio(registro[0]);
    App.txtfNacionalidad.focus(false, true);
};

//Evento que se lanza al cambiar un valor en ComboBox de Clientes
var cmbCliente_Change = function (combobox, valorNuevo, valorAnterior) {
    if (valorNuevo == null) {
        LimpiarDatosSocio();
    }
    else {
        AsignarDatosSocio(App.sCliente.findRecord('ID', valorNuevo));
    }
};

//Evento que se lanza al cambiar un valor en el ComboBox de EstadoCivil
var cmbEstadoCivil_Change = function (combobox, valorNuevo, valorAnterior, opciones) {
    if (valorNuevo == 'CASADO' || valorNuevo == 'UNIÓN LIBRE') {
        App.tbSolicitudPrestamo.addTab(App.pDatosConyugue, 3);
        App.tbSolicitudPrestamo.setActiveTab(0);
    }
    else {
        App.tbSolicitudPrestamo.closeTab(App.pDatosConyugue);
    }
};

//Evento que se lanza al quita el foco del campo de Años en el domicilio actual
var nAniosDomicilio_Change = function (numberfield, valorNuevo, valorAnterior, opciones) {
    if (valorNuevo >= 3) {
        App.fsDomicilioAnterior.hide();
    }
    else {
        App.fsDomicilioAnterior.show();
    }
};

//Dar formato monetario México columna Importe
var ncImporte_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};

//Evento clic del botón agregar campos
var btnAgregarReferencia_Click = function () {
    var ID = App.pReferencias.componentLayout.layoutCount;
    if (App.rPersona.getValue() == true) {
        //Agregar los campos
        App.pReferencias.add([
            { xtype: 'fieldset', title: 'Referencia persona ' + ID, id: 'fsReferenciaPersonal' + ID, items: [
                { xtype: 'container', id: 'cReferenciaPersona' + ID, layout: 'column', defaults: { width: 365, labelWidth: 120 }, items: [
                    { xtype: 'textfield', id: 'txtfReferenciaNombre' + ID, fieldLabel: 'Nombre', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'textfield', id: 'txtfReferenciaDomicilio' + ID, fieldLabel: 'Domicilio', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'textfield', id: 'txtfReferenciaTelefono' + ID, fieldLabel: 'Teléfono', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'textfield', id: 'txtfReferenciaActividadEconomica' + ID, fieldLabel: 'Actividad', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'button', id: 'btnReferenciaPersonaBorrar' + ID, width: 100, margin: '0 0 6 0', text: 'Borrar', listeners:
                        {
                            click:
                            {
                                fn: function (btn) {
                                    for (var i = 1; i < App.pReferencias.items.items.length; i++) {
                                        var elemento = App.pReferencias.items.items[i];
                                        if (elemento.id === 'fsReferenciaPersonal' + btn.id.substr(26, 3)) {
                                            App.pReferencias.remove(elemento.id);
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                ]
                }
            ]
            }
        ]);
    }
    else {
        //Store para los tipos de cuentas
        var tipoCuenta = Ext.create('Ext.data.Store', {
            fields: ['ID', 'DESCRIPCION'],
            data: [
                { "ID": "TARJETA DE CRÉDITO", "DESCRIPCION": "TARJETA DE CRÉDITO" },
                { "ID": "TARJETA DÉBITO", "DESCRIPCION": "TARJETA DÉBITO" },
                { "ID": "CUENTA DE CHEQUES", "DESCRIPCION": "CUENTA DE CHEQUES" },
                { "ID": "CRÉDITO HIPOTECARIO", "DESCRIPCION": "CRÉDITO HIPOTECARIO" },
                { "ID": "CRÉDITO AUTOMOTRIZ", "DESCRIPCION": "CRÉDITO AUTOMOTRIZ" },
            ]
        });

        App.pReferencias.add([
            { xtype: 'fieldset', title: 'Referencia institución ' + ID, id: 'fsReferenciaInstitucion' + ID, items: [
                { xtype: 'container', id: 'cReferenciaInstitucion' + ID, layout: 'column', defaults: { width: 365, labelWidth: 120 }, items: [
                    { xtype: 'textfield', id: 'txtfReferenciaInstitucion' + ID, fieldLabel: 'Nombre insitución', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'combobox', id: 'cmbReferenciaTipoCuenta' + ID, store: tipoCuenta, displayField: 'DESCRIPCION', valueField: 'ID', fieldLabel: 'Tipo cuenta', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'textfield', id: 'txtfReferenciaNoCuenta' + ID, fieldLabel: 'Número cuenta', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'button', id: 'btnReferenciaInstitucionBorrar' + ID, width: 100, margin: '0 0 0 6', text: 'Borrar', listeners:
                        {
                            click:
                            {
                                fn: function (btn) {
                                    for (var i = 1; i < App.pReferencias.items.items.length; i++) {
                                        var elemento = App.pReferencias.items.items[i];
                                        if (elemento.id === 'fsReferenciaInstitucion' + btn.id.substr(30, 3)) {
                                            App.pReferencias.remove(elemento.id);
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                ]
                }
            ]
            }
        ]);
    }
};

//Evento clic del botón agregar bienes
var btnAgregarBienesSocio_Click = function () {
    var ID = App.pBienes.componentLayout.layoutCount;
    if (App.rBienesMuebles.getValue() == true) {
        //Agregar los campos
        App.pBienes.add([
            { xtype: 'fieldset', title: 'Bienes muebles' + ID, id: 'fsBienesMuebles' + ID, items: [
                { xtype: 'container', id: 'cBienesMuebles' + ID, layout: 'column', defaults: { width: 365, labelWidth: 120 }, items: [
                    { xtype: 'textfield', id: 'txtfBienesMueblesTipoMueble' + ID, fieldLabel: 'Tipo mueble', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'textfield', id: 'txtfBienesMueblesNoSerie' + ID, fieldLabel: 'Número serie', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'numberfield', id: 'nfBienesMueblesValorEstimado' + ID, fieldLabel: 'Valor estimado', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'button', id: 'btnBienesMueblesBorrar' + ID, width: 100, margin: '0 0 6 0', text: 'Borrar', listeners:
                        {
                            click:
                            {
                                fn: function (btn) {
                                    for (var i = 1; i < App.pBienes.items.items.length; i++) {
                                        var elemento = App.pBienes.items.items[i];
                                        if (elemento.id === 'fsBienesMuebles' + btn.id.substr(22, 3)) {
                                            App.pBienes.remove(elemento.id);
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                ]
                }
            ]
            }
        ]);
    }
    else {
        //Store para los tipos de cuentas
        var tipoCuenta = Ext.create('Ext.data.Store', {
            fields: ['ID', 'DESCRIPCION'],
            data: [
                { "ID": "CASA", "DESCRIPCION": "CASA" },
                { "ID": "DEPARTAMENTO", "DESCRIPCION": "DEPARTAMENTO" },
                { "ID": "TERRENO", "DESCRIPCION": "TERRENO" },
                { "ID": "LOCAL", "DESCRIPCION": "LOCAL" },
                { "ID": "EDIFICIO", "DESCRIPCION": "EDIFICIO" },
                { "ID": "RANCHO", "DESCRIPCION": "RANCHO" }
            ]
        });
        App.pBienes.add([
            { xtype: 'fieldset', title: 'Bienes inmuebles ' + ID, id: 'fsBienesInmuebles' + ID, items: [
                { xtype: 'container', id: 'cBienesInmuebles' + ID, layout: 'column', defaults: { width: 365, labelWidth: 120 }, items: [
                    { xtype: 'textfield', id: 'txtfBienesInmueblesUbicacion' + ID, fieldLabel: 'Ubicación', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'combobox', id: 'cmbBienesInmueblesTipoInmueble' + ID, store: tipoCuenta, displayField: 'DESCRIPCION', valueField: 'ID', fieldLabel: 'Tipo inmueble', style: { marginRight: '6px', marginBottom: '6px'}, forceSelection: false },
                    { xtype: 'textfield', id: 'txtfBienesInmueblesInscripcion' + ID, fieldLabel: 'Inscripción', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'numberfield', id: 'nfBienesInmueblesValorInmueble' + ID, fieldLabel: 'Valor', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'button', id: 'btnBienesInmueblesBorrar' + ID, width: 100, margin: '0 0 6 0', text: 'Borrar', listeners:
                        {
                            click:
                            {
                                fn: function (btn) {
                                    for (var i = 1; i < App.pBienes.items.items.length; i++) {
                                        var elemento = App.pBienes.items.items[i];
                                        if (elemento.id === 'fsBienesInmuebles' + btn.id.substr(24, 3)) {
                                            App.pBienes.remove(elemento.id);
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                ]
                }
            ]
            }
        ]);
    }
};

//Evento clic del botón agregar bienes del aval
var btnAgregarBienesAval_Click = function () {
    var ID = App.pBienesAval.componentLayout.layoutCount;
    if (App.rBienesMueblesAval.getValue() == true) {
        //Agregar los campos
        App.pBienesAval.add([
            { xtype: 'fieldset', title: 'Bienes muebles' + ID, id: 'fsBienesMueblesAval' + ID, items: [
                { xtype: 'container', id: 'cBienesMueblesAval' + ID, layout: 'column', defaults: { width: 365, labelWidth: 120 }, items: [
                    { xtype: 'textfield', id: 'txtfBienesMueblesAvalTipoMueble' + ID, fieldLabel: 'Tipo mueble', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'textfield', id: 'txtfBienesMueblesAvalNoSerie' + ID, fieldLabel: 'Número serie', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'numberfield', id: 'nfBienesMueblesAvalValorEstimado' + ID, fieldLabel: 'Valor estimado', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'button', id: 'btnBienesMueblesAvalBorrar' + ID, width: 100, margin: '0 0 6 0', text: 'Borrar', listeners:
                        {
                            click:
                            {
                                fn: function (btn) {
                                    for (var i = 1; i < App.pBienesAval.items.items.length; i++) {
                                        var elemento = App.pBienesAval.items.items[i];
                                        if (elemento.id === 'fsBienesMueblesAval' + btn.id.substr(26, 3)) {
                                            App.pBienesAval.remove(elemento.id);
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                ]
                }
            ]
            }
        ]);
    }
    else {
        //Store para los tipos de cuentas
        var tipoCuenta = Ext.create('Ext.data.Store', {
            fields: ['ID', 'DESCRIPCION'],
            data: [
                { "ID": "CASA", "DESCRIPCION": "CASA" },
                { "ID": "DEPARTAMENTO", "DESCRIPCION": "DEPARTAMENTO" },
                { "ID": "TERRENO", "DESCRIPCION": "TERRENO" },
                { "ID": "LOCAL", "DESCRIPCION": "LOCAL" },
                { "ID": "EDIFICIO", "DESCRIPCION": "EDIFICIO" },
                { "ID": "RANCHO", "DESCRIPCION": "RANCHO" }
            ]
        });

        App.pBienesAval.add([
            { xtype: 'fieldset', title: 'Bienes inmuebles ' + ID, id: 'fsBienesInmueblesAval' + ID, items: [
                { xtype: 'container', id: 'cBienesInmueblesAval' + ID, layout: 'column', defaults: { width: 365, labelWidth: 120 }, items: [
                    { xtype: 'textfield', id: 'txtfBienesInmueblesAvalUbicacion' + ID, fieldLabel: 'Ubicación', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'combobox', id: 'cmbBienesInmueblesAvalTipoInmueble' + ID, store: tipoCuenta, displayField: 'DESCRIPCION', valueField: 'ID', fieldLabel: 'Tipo inmueble', style: { marginRight: '6px', marginBottom: '6px' }, forceSelection: false },
                    { xtype: 'textfield', id: 'txtfBienesInmueblesAvalInscripcion' + ID, fieldLabel: 'Inscripción', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'numberfield', id: 'nfBienesInmueblesAvalValorInmueble' + ID, fieldLabel: 'Valor', style: { marginRight: '6px', marginBottom: '6px'} },
                    { xtype: 'button', id: 'btnBienesInmueblesAvalBorrar' + ID, width: 100, margin: '0 0 6 0', text: 'Borrar', listeners:
                        {
                            click:
                            {
                                fn: function (btn) {
                                    for (var i = 1; i < App.pBienesAval.items.items.length; i++) {
                                        var elemento = App.pBienesAval.items.items[i];
                                        if (elemento.id === 'fsBienesInmueblesAval' + btn.id.substr(28, 3)) {
                                            App.pBienesAval.remove(elemento.id);
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                ]
                }
            ]
            }
        ]);
    }
};

//Asignar los datos del Socio
function AsignarDatosSocio(registro) {
    //Asignar datos de socio
    App.txtfNombreCompleto.setValue(registro.data.NombreCompleto);
    App.txtfRFC.setValue(registro.data.RFC);
    App.cmbEstadoCivil.select(registro.data.EstadoCivil);
    App.txtfTelefono.setValue(registro.data.Telefono);
    App.txtfTelefonoMovil.setValue(registro.data.TelefonoMovil);
    App.txtfCorreo.setValue(registro.data.Correo);

    //Datos de domicilio
    App.txtfCalle.setValue(registro.data.Calle);
    App.txtfEntreCalles.setValue(registro.data.EntreCalles);
    App.txtfNoExterior.setValue(registro.data.NoExterior);
    App.txtfNoInterior.setValue(registro.data.NoInterior);
    App.txtfCodigoPostal.setValue(registro.data.CodigoPostal);
    App.cmbEstado.select(registro.data.Estado);

    //Asignar los Municipios
    App.direct.AsignarMunicipio(registro.data.Estado, {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbMunicipio.select(registro.data.Municipio);
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Asignar la Colonia
    App.direct.AsignarColonia(registro.data.Municipio, {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbColonia.select(registro.data.Colonia);
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Datos de Empresa
    App.txtfEmpresa.setValue(registro.data.Empresa);
    App.txtfEmpresaCalle.setValue(registro.data.EmpresaCalle);
    App.txtfEmpresaEntreCalles.setValue(registro.data.EmpresaEntreCalles);
    App.txtfEmpresaNoExterior.setValue(registro.data.EmpresaNoExterior);
    App.txtfEmpresaNoInterior.setValue(registro.data.EmpresaNoInterior);
    App.txtfEmpresaCodigoPostal.setValue(registro.data.EmpresaCodigoPostal);
    App.cmbEmpresaEstado.select(registro.data.EmpresaEstado);

    App.txtfEmpresaTelefono.setValue(registro.data.EmpresaTelefono);
    App.nfEmpresaTelefonoExt.setValue(registro.data.EmpresaTelefonoExt);

    //Datos Empresa Socio
    App.txtfPuesto.setValue(registro.data.Puesto);

    //Asignar los Municipios
    App.direct.AsignarEmpresaMunicipio(registro.data.EmpresaEstado, {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbEmpresaMunicipio.select(registro.data.EmpresaMunicipio);
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //Asignar los Municipios
    App.direct.AsignarEmpresaColonia(registro.data.EmpresaMunicipio, {
        //Si el proceso es correcto
        success: function (result) {
            App.cmbEmpresaColonia.select(registro.data.EmpresaColonia);
        },

        //Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });
};

//Limpiar los datos del Socio seleccionado
function LimpiarDatosSocio() {
    App.txtfNombreCompleto.setValue('');
    App.txtfRFC.setValue('');
    App.cmbEstadoCivil.setValue('');
    App.txtfTelefono.setValue('');
    App.txtfTelefonoMovil.setValue('');
    App.txtfCorreo.setValue('');
    App.txtfCalle.setValue('');
    App.txtfEntreCalles.setValue('');
    App.txtfNoExterior.setValue('');
    App.txtfNoInterior.setValue('');
    App.txtfCodigoPostal.setValue('');
    App.cmbEstado.select(null);
    App.cmbMunicipio.select(null);
};

//Método para calcular la edad en base a la fecha de nacimiento
var CalcularFechaNacimiento = function (datefield, fecha) {
    fecha = App.dfConyugeFechaNacimiento.getValue();

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
        App.txtfConyugeEdad.setValue(edad + ' años');
        return true;
    }
    if (hoy.getMonth() + 1 - mes > 0) {
        App.txtfConyugeEdad.setValue((edad + 1) + ' años');
        return true;
    }

    //8. Entonces es que eran iguales. miro los dias 
    //Si resto los dias y me da menor que 0 entonces no ha cumplido años. Si da mayor o igual si ha cumplido 
    if (hoy.getUTCDate() - dia >= 0) {
        App.txtfConyugeEdad.setValue((edad + 1) + ' años');
        return true;
    }

    App.txtfConyugeEdad.setValue(edad + ' años');
};

//Evento que se lanza despues de guardar una solicitud de prestamo
var imgbtnGuardar_Click_Success = function (response, result) {
    if (Ext.util.Cookies.get('cookieEditarSolicitudPrestamo') === 'Nuevo') {
        Ext.Msg.show({
            id: 'msgNuevo',
            title: 'Solicitud nueva',
            msg: '<p align="center">Solicitud de préstamo con ID: ' + result.extraParamsResponse.registro + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { window.parent.App.wEmergente.hide(); window.parent.App.pCentro.getBody().App.sSolicitudesPrestamos.reload(); },
            icon: Ext.MessageBox.INFO
        });
    }
    else {
        Ext.Msg.show({
            id: 'msgActualizar',
            title: 'Actualizar Solicitud de préstamo',
            msg: '<p align="center">Información actualizada ID: ' + result.extraParamsResponse.registro + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { window.parent.App.wEmergente.hide(); window.parent.App.pCentro.getBody().App.sSolicitudesPrestamos.reload(); },
            icon: Ext.MessageBox.INFO
        });
    }
};