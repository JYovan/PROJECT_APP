var cEstatusIcon_Renderer = function (value) {
    switch (value) {
        default:
            return value;
        case 'Pendiente':
            return '<img src="' + Ext.net.ResourceMgr.getIconUrl("Hourglass") + '" width=16 height=16>';
        case 'Enviando':
            return '<div src="x-loading-indicator" width=16 height=16>';
        case 'Error':
            return '<img src="' + Ext.net.ResourceMgr.getIconUrl("Decline") + '" width=16 height=16>';
        case 'Cancelado':
        case 'Abortado':
            return '<img src="' + Ext.net.ResourceMgr.getIconUrl("Decline") + '" width=16 height=16>';
        case 'Cargado':
            return '<img src="' + Ext.net.ResourceMgr.getIconUrl("Tick") + '" width=16 height=16>';
    }
};




var validaLimite_BeforeRender = function () {

    var movimiento = window.parent.App.wEmergente.getBody().App.cmbMov.getValue().trim();
    // window.parent.parent.App.pCentro.getBody().App.gpOrdenesEstimaciones.title;
    Ext.util.Cookies.set('cockieMovimientoCroquis', movimiento);


    //    if (movimiento == 'Mesa de reporte') {
    //        Ext.util.Cookies.get('cookieEditarVolumetria', movimiento)
    //    }
    //    else {

    //    }


}



var fileSelected = function (item, file) {



    var validaCaracteres = /^[a-zA-Z0-9-_.\s]{1,100}$/;

    if (validaCaracteres.test(file.name)) {

    }

    else {
        Ext.Msg.Ext.Msg.alert('Error', 'La imagen tiene demasiados caracteres o tiene carácteres especiales"');
        return false;
    } 
    this.up('grid').store.add({
        ID: file.id,
        Nombre: file.name, 
        Tamano: file.size,
        Estatus: 'Pendiente',
        Progreso: 0
    });
};

var updateRecord = function (id, field, value) {
    var rec = App.gpSubirImagenessVolumetria.store.getById(id);

    rec.set(field, value);
    rec.commit();
};

var abortUpload = function (btn) {
    var selModel = btn.up('grid').getSelectionModel(),
                records;

    if (!selModel.hasSelection()) {
        Ext.Msg.Ext.Msg.alert('Error', 'Por favor selecciona una carga para cancelar');
        return true;
    }

    records = selModel.getSelection();
    App.muSubirImagenesVolumetria.abortUpload(records[0].getId());
};

var removeUpload = function (btn) {
    var selModel = btn.up('grid').getSelectionModel(),
                records;

    if (!selModel.hasSelection()) {
        Ext.Msg.Ext.Msg.alert('Error', 'Por favor selecciona una carga para remover');
        return true;
    }

    records = selModel.getSelection();
    App.muSubirImagenesVolumetria.removeUpload(records[0].getId());
};

var uploadError = function (item, file, errorCode, message) {
    updateRecord(file.id, 'Progreso', 0);
    updateRecord(file.id, 'Estatus', 'Error');

    switch (errorCode) {
        case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
            Ext.Msg.Ext.Msg.alert('Error',"Error Code: HTTP Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
            Ext.Msg.Ext.Msg.alert('Error', "Error Code: Upload Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.IO_ERROR:
            Ext.Msg.Ext.Msg.alert('Error', "Error Code: IO Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
            Ext.Msg.Ext.Msg.alert('Error', "Error Code: Security Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
            Ext.Msg.Ext.Msg.alert('Error', "Error Code: Upload Limit Exceeded, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
            Ext.Msg.Ext.Msg.alert('Error', "Error Code: File Validation Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
            updateRecord(file.id, 'Estatus', 'Cancelado');
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
            updateRecord(file.id, 'Estatus', 'Detenido');
            break;
        default:
            updateRecord(file.id, 'Estatus', "Unhandled Error: " + errorCode);
            Ext.Msg.Ext.Msg.alert('Error', "Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
    }
};

var fileSelectionError = function (item, file, errorCode, message) {



    if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
        Ext.Msg.alert("Haz seleccionado demasiadas imagenes.\n" + (message === 0 ? "Haz excedido el límite de imágenes." : "Puedes seleccionar " + (message > 1 ? " hasta " + message + " archivos." : "sólo un archivo.")));
        return;
    }


    switch (errorCode) {
        case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
            Ext.Msg.alert("Error Code: File too big, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
            Ext.Msg.alert("Error Code: Zero byte file, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
            Ext.Msg.alert("Error Code: Invalid File Type, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        default:
            Ext.Msg.alert("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
    }
};

var loadFailed = function () {
    Ext.Msg.alert("Algo sucedio mientras se cargaban las imagenes: loading SWFUpload. Verifique la conexion a internet, habilite los scripts en el navegador e intente de nuevo.");
};
var onUploadImages = function () {
    if (Ext.util.Cookies.get('cookieConceptoVolumetria') != null) {
        window.parent.App.wEmergente.getBody().App.sConceptos.reload({
            callback: function () {
                window.parent.App.wEmergente.getBody().App.direct.sVolumetria_Load();
            }
        });
    }
}
 

function convertImgToBase64(url, callback, outputFormat) {
    var img = new Image();
    img.crossOrigin = 'Anonymous';
    img.onload = function () {
        var canvas = document.createElement('CANVAS');
        var ctx = canvas.getContext('2d');
        canvas.height = this.height;
        canvas.width = this.width;
        ctx.drawImage(this, 0, 0);
        var dataURL = canvas.toDataURL(outputFormat || 'image/png');
        callback(dataURL);
        canvas = null;
    };
    img.src = url;
}