//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarProgramaObra', 'Nuevo');
    window.parent.App.wEmergente.load('http://programaobra.ibuho.mx/index.html');
    window.parent.App.wEmergente.setHeight(Ext.getBody().getViewSize().height);
    window.parent.App.wEmergente.setWidth(Ext.getBody().getViewSize().width);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Programa de Obra');
    window.parent.App.wEmergente.show();
};