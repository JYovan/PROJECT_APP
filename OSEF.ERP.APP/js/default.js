//Método que abre la pantalla de cambiar contraseña
var miCambiarContrasena_Click = function () {
    window.parent.App.wEmergente.load('FormaCambiarContrasena.aspx');
    window.parent.App.wEmergente.setHeight(258);
    window.parent.App.wEmergente.setWidth(420);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Cambiar contraseña usuario: ');
    window.parent.App.wEmergente.show();
};

//Método que se lanza despues de cargar los datos del Usuario
var sUsuario_Load_Success = function (response, result) {
    App.btnUsuario.setText(App.sUsuario.getAt(0).get('Nombre') + ' ' + App.sUsuario.getAt(0).get('APaterno') + ' ' + App.sUsuario.getAt(0).get('AMaterno'));
    App.mOpciones.setWidth(App.btnUsuario.getWidth());
};

$(document).ready(function () {
    $("#pcreditos").html("© " + new Date().getFullYear() + " Osef Technology");
});

var onLogOut = function () {
    var url = "http://plantas.ibuho.mx:81/service.php?IdProcess=0";
    var win = window.open(url, '_blank').focus(); 
};
