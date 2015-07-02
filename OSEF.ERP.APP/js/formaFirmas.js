//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
};


//Evento lanzado al cargar el store de la sucursal
var sFirmas_Load = function () {
    App.direct.sFirmas_Load();
};

//Evento lanzado al agregar un registro al store
var sFirmas_Add = function (concepto, registro) {
    App.txtReviso.setValue(registro[0].get('FirmaReviso'));
    App.txtAutorizo.setValue(registro[0].get('FirmaAutorizo'));
};