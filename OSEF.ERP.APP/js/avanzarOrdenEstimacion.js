var btnAceptar_Click_Success = function (response, result) {
    //1. Obtener datos de la nueva revisión
    App.direct.ObtenerOrdenEstimacion(result.extraParamsResponse.ordenestimacion, {
        //2. Asignar los datos a los controles
        success: function (result) {
            if (result.Mov == 'Mesa de reporte') {
                //Actualizar store de OrdenEstimacion

                Ext.util.Cookies.set('cookieEditarOrdenEstimacion', result.Id);

           

                window.parent.App.sOrdenEstimacion.getAt(0).set("ID", result.Id);
                window.parent.App.sOrdenEstimacion.getAt(0).set("Mov", result.Mov);
                window.parent.App.sOrdenEstimacion.getAt(0).set("MovID", result.MovID);
                window.parent.App.sOrdenEstimacion.getAt(0).set("Origen", result.Origen);
                window.parent.App.sOrdenEstimacion.getAt(0).set("OrigenId", result.OrigenId);
                window.parent.App.sOrdenEstimacion.getAt(0).set("Cliente", result.Cliente);
                window.parent.App.sOrdenEstimacion.getAt(0).set("FechaEmision", result.FechaEmision);
                window.parent.App.sOrdenEstimacion.getAt(0).set("Estatus", result.Estatus);

                window.parent.App.cmbMov.setValue(window.parent.App.sOrdenEstimacion.getAt(0).get('Mov'));
                window.parent.App.cmbMov.setReadOnly(true);


                window.parent.App.txtfMovID.setValue('');
                window.parent.App.dfFechaEmision.setValue(window.parent.App.sOrdenEstimacion.getAt(0).get('FechaEmision'));
                window.parent.App.sbOrdenEstimacion.setText(window.parent.App.sOrdenEstimacion.getAt(0).get('Estatus'));


                window.parent.parent.parent.App.wEmergente.setTitle('Nuevo Movimiento ' + Ext.util.Cookies.get('cookieEditarOrdenEstimacion'));

                //Obtener el Renglon anterior
                var renglonAnterior = window.parent.App.sConceptos.getAt(window.parent.App.sConceptos.getCount() - 1).get('Renglon') + 1;
                //Insertar un nuevo registro
                window.parent.App.sConceptos.insert(window.parent.App.sConceptos.getCount(), { Renglon: renglonAnterior });

                //Recargar el tablero
                window.parent.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.reload();

                HabilitarControlesAvanzar();
                window.parent.App.wEmergente.hide();


            }

            else if (result.Mov == 'Estimacion') {

                window.parent.App.sOrdenEstimacion.getAt(0).set("ID", result.Id);
                window.parent.App.sOrdenEstimacion.getAt(0).set("Mov", result.Mov);
                window.parent.App.sOrdenEstimacion.getAt(0).set("MovID", result.MovID);
                window.parent.App.sOrdenEstimacion.getAt(0).set("Origen", result.Origen);
                window.parent.App.sOrdenEstimacion.getAt(0).set("OrigenId", result.OrigenId);
                window.parent.App.sOrdenEstimacion.getAt(0).set("Cliente", result.Cliente);
                window.parent.App.sOrdenEstimacion.getAt(0).set("FechaEmision", result.FechaEmision);
                window.parent.App.sOrdenEstimacion.getAt(0).set("Estatus", result.Estatus);

                window.parent.App.cmbMov.setValue(window.parent.App.sOrdenEstimacion.getAt(0).get('Mov'));
                window.parent.App.cmbMov.setReadOnly(false);
                window.parent.App.txtfMovID.setValue('');
                window.parent.App.dfFechaEmision.setValue(window.parent.App.sOrdenEstimacion.getAt(0).get('FechaEmision'));
                window.parent.App.sbOrdenEstimacion.setText(window.parent.App.sOrdenEstimacion.getAt(0).get('Estatus'));

                window.parent.App.imgbtnGuardar.setDisabled(true);
                window.parent.App.imgbtnAfectar.setDisabled(true);


                //Recargar el tablero
                window.parent.parent.App.pCentro.getBody().App.sOrdenesEstimaciones.reload();
                window.parent.App.wEmergente.hide();
            }
        },
        failure: function (errorMessage) { },
        eventMask: { showMask: true }
    });
};

//Habilitar los controles de la FormaAvance
function HabilitarControlesAvanzar() {


    window.parent.App.gpOrdenEstimacion.setDisabled(false);
    window.parent.App.dfFechaEmision.setDisabled(false);
    window.parent.App.txtfObservaciones.setDisabled(false);
    window.parent.App.txtfObservaciones.setReadOnly(false);
    window.parent.App.imgbtnGuardar.setDisabled(false);
    window.parent.App.imgbtnBorrar.setDisabled(false);
    window.parent.App.imgbtnCancelar.setDisabled(true);
    window.parent.App.chkAtendido.setReadOnly(false);

    window.parent.App.IdCliente.setDisabled(false);
    window.parent.App.txtfSucursalCR.setDisabled(false);


    window.parent.App.dfFechaOrigen.setReadOnly(false);
    window.parent.App.dfFechaMaxima.setReadOnly(false);
    window.parent.App.nfDiasAtencion.setReadOnly(false);
    window.parent.App.nfDiasAtencion.setDisabled(false);
    window.parent.App.txtfReporta.setReadOnly(false);
    window.parent.App.txtfReporta.setDisabled(false);

    window.parent.App.txtfNoReporte.setReadOnly(false);

    window.parent.App.txtfTrabajoRequerido.setReadOnly(false);
    window.parent.App.txtfTrabajoRequerido.setDisabled(false);


    window.parent.App.txtfCodigoFalla.setDisabled(false);
    window.parent.App.txtfCodigoFalla.setReadOnly(false);

    window.parent.App.dfFechaLlegada.setReadOnly(false);
    window.parent.App.tfHoraLlegada.setReadOnly(false);
    window.parent.App.dfFechaFinActividad.setReadOnly(false);
    window.parent.App.tfHoraFinActividad.setReadOnly(false);
    window.parent.App.cmbCuadrilla.setReadOnly(false);
    window.parent.App.cmbCuadrilla.setDisabled(false);


    window.parent.App.tHoraOrigen.setReadOnly(false);
    window.parent.App.chkAtendido.setDisabled(false);
    window.parent.App.chkAtendido.setReadOnly(false);


    window.parent.App.cmbClasificacion.setReadOnly(false);
    window.parent.App.cmbDivision.setReadOnly(false);
  
    //6. Deshabilita los comandos del grid
    window.parent.App.ccFotos.commands[0].disabled = false;
    window.parent.App.ccFotos.commands[1].disabled = false;
    window.parent.App.ccCroquis.commands[0].disabled = false;
    window.parent.App.ccCroquis.commands[1].disabled = false;
    window.parent.App.ccFacturas.commands[0].disabled = false;
    window.parent.App.ccFacturas.commands[1].disabled = false;
    window.parent.App.ccConcepto.commands[0].disabled = false;
    window.parent.App.gpOrdenEstimacion.reconfigure();
}