var cmbRequiereFactura_Select = function (combo, records) {
    //Validación para mostrar los datos de Facturación
    if (records[0].get('field1') === '1') {
        //Hablitar los controles
        App.txtEmpresa.enable();
        App.txtfRFC.enable();
        App.txtfCalle.enable();
        App.txtfNoExt.enable();
        App.txtNoInt.enable();
        App.txtfColonia.enable();
        App.txtfCP.enable();
        App.cmbEstadoEmpresa.enable();
        App.txtfCiudadEmpresa.enable();
        App.txtfTelefonoEmpresa.enable();
        App.txtfCorreoEmpresa.enable();

        //Mostrar el Contenedor de Campos
        App.cIzquierdo3.show();
        App.cDerecho3.show();
        App.fcDatosFacturacion.show();

        //Validar los campos
        App.txtEmpresa.validate();
        App.txtfRFC.validate();
        App.txtfCalle.validate();
        App.txtfNoExt.validate();
        App.txtNoInt.validate();
        App.txtfColonia.validate();
        App.txtfCP.validate();
        App.cmbEstadoEmpresa.validate();
        App.txtfCiudadEmpresa.validate();
        App.txtfTelefonoEmpresa.validate();
        App.txtfCorreoEmpresa.validate();
    }
    else {
        //Esconder el contenedor de campos
        App.fcDatosFacturacion.hide();
        App.cIzquierdo3.hide();
        App.cDerecho3.hide();

        //Deshabilitar los campos
        App.txtEmpresa.disable();
        App.txtfRFC.disable();
        App.txtfCalle.disable();
        App.txtfNoExt.disable();
        App.txtNoInt.disable();
        App.txtfColonia.disable();
        App.txtfCP.disable();
        App.cmbEstadoEmpresa.disable();
        App.txtfCiudadEmpresa.disable();
        App.txtfTelefonoEmpresa.disable();
        App.txtfCorreoEmpresa.disable();
    }
};

var cmbTipoParticipante_Select = function (combo, records) {

    //1. Esconder los controles
    App.fcPreguntas.hide();
    App.fcDatosLaborales.hide();
    App.txtOtro.hide();
    App.txtfPregunta01.hide();
    App.cmbPregunta02.hide();
    App.cmbPregunta03.hide();
    App.txtfPregunta04.hide();
    App.cmbPregunta05.hide();
    App.cIzquierdo4.hide();
    App.cDerecho4.hide();

    //2. Deshabilitar los controles
    App.txtOtro.disable();
    App.txtfPregunta01.disable();
    App.cmbPregunta02.disable();
    App.cmbPregunta03.disable();
    App.txtfPregunta04.disable();
    App.cmbPregunta05.disable();
    App.txtNombreEmpresa.disable();
    App.txtPuesto.disable();
    App.txtArea.disable();

    //2. Validación para mostrar los datos laborales
    if (records[0].get('field1') === '2' || records[0].get('field1') === '3' || records[0].get('field1') === '5') {
        App.txtNombreEmpresa.enable();
        App.txtPuesto.enable();
        App.txtArea.enable();
        App.fcDatosLaborales.show();
        App.txtNombreEmpresa.validate();
    }

    //3. Validación para mostrar las preguntas 1, 2 y 3
    if (records[0].get('field1') === '1') {
        App.txtfPregunta01.enable();
        App.cmbPregunta02.enable();
        App.cmbPregunta03.enable();

        App.txtfPregunta01.show();
        App.cmbPregunta02.show();
        App.cmbPregunta03.show();

        App.txtfPregunta01.validate();
        App.cmbPregunta02.validate();
        App.cmbPregunta03.validate();
    }

    //4. Validación para mostrar la pregunta 5
    if (records[0].get('field1') === '1' || records[0].get('field1') === '2' || records[0].get('field1') === '3' || records[0].get('field1') === '5' || records[0].get('field1') === '6' || records[0].get('field1') === '7') {
        App.cmbPregunta05.enable();
        App.cmbPregunta05.show();
        App.cmbPregunta05.validate();
    }

    //5. Mostrar la pregunta 4
    App.fcPreguntas.show();
    App.cIzquierdo4.show();
    App.cDerecho4.show();
    App.txtfPregunta04.enable();
    App.txtfPregunta04.show();
    App.txtfPregunta04.validate();

    //6. Validación para mostrar el campo de especificar otro tipo de participante
    if (records[0].get('field1') === '7') {
        App.txtOtro.enable();
        App.txtOtro.show();
        App.txtOtro.focus(false, 50);
        App.txtOtro.validate();
    }
};

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

//-----Evento que ocurre al dar clic en imgbtnGuardar-----//
var btnRegistrar_Click_Success = function () {
    //App.txtfEdad.selectable = false;
    window.open('http://www.conaproch.com/11aconvencionmundialdelchile.html', '_self');
};