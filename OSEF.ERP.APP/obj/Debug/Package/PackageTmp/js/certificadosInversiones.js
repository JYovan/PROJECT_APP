//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarCertificadosInversiones', 'Nuevo');
    window.parent.App.wEmergente.load('FormaCertificadoInversion.aspx');
    window.parent.App.wEmergente.setHeight(380);
    window.parent.App.wEmergente.setWidth(750);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nueva inversión');
    window.parent.App.wEmergente.show();
};

//Concatenar la columna de Nombre Completo
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Clientes
var cmbCliente_Select = function (combobox, registro) {
    App.txtfNombreCompleto.setValue(registro[0].data.Nombre + ' ' + registro[0].data.APaterno + ' ' + registro[0].data.AMaterno);
};

//Evento que se lanza al cambiar un valor en ComboBox de Clientes
var cmbCliente_Change = function (combobox, valorNuevo, valorAnterior) {
    if (valorNuevo == null) {
        App.txtfNombreCompleto.setValue('');
        return
    }

    console.log(App.sCliente.find('ID', valorNuevo));
};