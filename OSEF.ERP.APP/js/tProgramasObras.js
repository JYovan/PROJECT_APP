var indice;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function (imagebutton, evento, opciones) {
    Ext.util.Cookies.set('cookieEditarProgramaObra', 'Nuevo');
    window.parent.App.wEmergente.load('http://localhost:27994/index.html');
    window.parent.App.wEmergente.setHeight(window.parent.Ext.getBody().getViewSize().height);
    window.parent.App.wEmergente.setWidth(window.parent.Ext.getBody().getViewSize().width);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Programa de Obra');
    window.parent.App.wEmergente.show();
};

//Evento de clic botón Editar
var imgbtnEditar_Click = function (imagebutton, evento, opciones) {
    Ext.util.Cookies.set('cookieEditarProgramaObra', App.gpProgramasObras.getSelectionModel().getSelection()[0].get('Id'));
    window.parent.App.wEmergente.load('http://localhost:27994/index.html');
    window.parent.App.wEmergente.setHeight(window.parent.Ext.getBody().getViewSize().height);
    window.parent.App.wEmergente.setWidth(window.parent.Ext.getBody().getViewSize().width);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar Programa de Obra ' + Ext.util.Cookies.get('cookieEditarProgramaObra'));
    window.parent.App.wEmergente.show();
};

//Acciones al hacer clic en un registro
var gpProgramasObras_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};