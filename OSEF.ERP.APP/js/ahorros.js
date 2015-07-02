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
    Ext.util.Cookies.set('cookieEditarAhorro', 'Nuevo');
    window.parent.App.wEmergente.load('fAhorro.aspx');
    window.parent.App.wEmergente.setHeight(511);
    window.parent.App.wEmergente.setWidth(780);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo ahorro');
    window.parent.App.wEmergente.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarAhorro', App.gpAhorros.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('fAhorro.aspx');
    window.parent.App.wEmergente.setHeight(511);
    window.parent.App.wEmergente.setWidth(780);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar ahorro ' + Ext.util.Cookies.get('cookieEditarAhorro'));
    window.parent.App.wEmergente.show();
};

//Concatenar la columna de Movimiento
var cMov_Renderer = function (valor, metaData, registro) {
    var estatus = registro.get('Estatus');

    switch (estatus) {
        case 'BORRADOR':
            return '<img class="IconColumnaEstatus" src="images/cancelar.png" alt="borrador" />' + registro.get('Mov') + registro.get('MovID');
        case 'PENDIENTE':
            return '<img class="IconColumnaEstatus" src="images/pendiente.png" alt="pendiente" /> ' + registro.get('Mov') + registro.get('MovID');
        case 'CONCLUIDO':
            return '<img class="IconColumnaEstatus" src="images/concluido.png" alt="concluido" /> ' + registro.get('Mov') + registro.get('MovID');
        case 'CANCELADO':
            return '<img class="IconColumnaEstatus" src="images/cancelar.png" alt="cancelar" /> ' + registro.get('Mov') + registro.get('MovID');
    }
};

//Regresar el Nombre Completo del Cliente 
var cCliente_Renderer = function (valor, metaData, registro) {
    return registro.get('RCliente').Nombre + ' ' + registro.get('RCliente').APaterno + ' ' + registro.get('RCliente').AMaterno;
};

//Dar formato de moneda a los campos monetarios
var ncMonetario_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "$000,000,000.00");
};