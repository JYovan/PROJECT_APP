//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarProgramaObra', 'Nuevo');
    window.parent.App.wEmergente.load('http://programaobra.ibuho.mx/index.html');
    window.parent.App.wEmergente.setHeight(600);
    window.parent.App.wEmergente.setWidth(1100);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Programa de Obra');
    window.parent.App.wEmergente.show();
};