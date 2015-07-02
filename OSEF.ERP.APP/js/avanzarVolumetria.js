var btnAceptar_Click_Success = function (response, result) {
    //1. Obtener datos de la nueva volumetria
    App.direct.ObtenerVolumetria(result.extraParamsResponse.captura, {
        //2. Asignar los datos a los controles
        success: function (result) {

            console.log(result);


            //Actualizar store de Volumetria
            window.parent.App.sVolumetria.getAt(0).set('ID', result.ID);
            window.parent.App.sVolumetria.getAt(0).set('Mov', result.Mov);
            window.parent.App.sVolumetria.getAt(0).set('MovID', result.MovID);
            window.parent.App.sVolumetria.getAt(0).set('Origen', result.Origen);
            window.parent.App.sVolumetria.getAt(0).set('OrigenID', result.OrigenID);
            window.parent.App.sVolumetria.getAt(0).set('Sucursal', result.Sucursal);
            window.parent.App.sVolumetria.getAt(0).set('Preciario', result.Preciario);
            window.parent.App.sVolumetria.getAt(0).set('FechaEmision', result.FechaEmision);
            window.parent.App.sVolumetria.getAt(0).set('Observaciones', result.Observaciones);
            window.parent.App.sVolumetria.getAt(0).set('Estatus', result.Estatus);
            window.parent.App.sVolumetria.getAt(0).set('RSucursal', result.RSucursal);
            window.parent.App.sVolumetria.getAt(0).set('RPreciario', result.RPreciario);



            window.parent.App.cmbMov.setValue(window.parent.App.sVolumetria.getAt(0).get('Mov'));
            window.parent.App.cmbMov.setReadOnly(false);
            window.parent.App.txtfMovID.setValue('');
            window.parent.App.dfFechaEmision.setValue(window.parent.App.sVolumetria.getAt(0).get('FechaEmision'));
            window.parent.App.txtfObservaciones.setValue('');
            window.parent.App.sbFormaVolumetriaDetalle.setText(window.parent.App.sVolumetria.getAt(0).get('Estatus'));

            HabilitarControlesAvanzar();
            window.parent.App.wEmergente.hide();
        },
        failure: function (errorMessage) { },
        eventMask: { showMask: true }
    });
};

//Habilitar los controles de la FormaAvance
function HabilitarControlesAvanzar() {
    window.parent.App.cmbMov.setDisabled(false);
    window.parent.App.dfFechaEmision.setDisabled(false);
    window.parent.App.txtfObservaciones.setDisabled(false);
    window.parent.App.gpVolumetriaDetalle.setDisabled(false);
    window.parent.App.imgbtnGuardar.setDisabled(false);
    window.parent.App.imgbtnBorrar.setDisabled(false);
}

