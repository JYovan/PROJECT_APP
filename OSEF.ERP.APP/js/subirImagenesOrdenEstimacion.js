//Poner icono de estatus con una imagen
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

var fileSelected = function (item, file) {

    var validaCaracteres = /^[a-zA-Z0-9-_.\s]{1,100}$/;

    if (validaCaracteres.test(file.name)) {

    }

    else {
        Ext.Msg.alert('Error', 'La imagen tiene demasiados caracteres o tiene carácteres especiales"');
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
    var rec = App.gpSubirImagenessOrdenEstimacion.store.getById(id);

    rec.set(field, value);
    rec.commit();
};

var abortUpload = function (btn) {
    var selModel = btn.up('grid').getSelectionModel(),
                records;

    if (!selModel.hasSelection()) {
        Ext.Msg.alert('Error', 'Por favor selecciona una carga para cancelar');
        return true;
    }

    records = selModel.getSelection();
    App.muSubirImagenesOrdenEstimacion.abortUpload(records[0].getId());
};

var removeUpload = function (btn) {
    var selModel = btn.up('grid').getSelectionModel(),
                records;

    if (!selModel.hasSelection()) {
        Ext.Msg.alert('Error', 'Por favor selecciona una carga para remover');
        return true;
    }

    records = selModel.getSelection();
    App.muSubirImagenesOrdenEstimacion.removeUpload(records[0].getId());
};

var uploadError = function (item, file, errorCode, message) {
    updateRecord(file.id, 'Progreso', 0);
    updateRecord(file.id, 'Estatus', 'Error');

    switch (errorCode) {
        case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
            alert("Error Code: HTTP Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
            alert("Error Code: Upload Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.IO_ERROR:
            alert("Error Code: IO Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
            alert("Error Code: Security Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
            alert("Error Code: Upload Limit Exceeded, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
            alert("Error Code: File Validation Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
            updateRecord(file.id, 'Estatus', 'Cancelado');
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
            updateRecord(file.id, 'Estatus', 'Detenido');
            break;
        default:
            updateRecord(file.id, 'Estatus', "Unhandled Error: " + errorCode);
            alert("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
    }
};

var fileSelectionError = function (item, file, errorCode, message) {
    if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
        alert("You have attempted to queue too many files.\n" + (message === 0 ? "You have reached the upload limit." : "You may select " + (message > 1 ? "up to " + message + " files." : "one file.")));
        return;
    }

    switch (errorCode) {
        case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
            alert("Error Code: File too big, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
            alert("Error Code: Zero byte file, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
            alert("Error Code: Invalid File Type, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        default:
            alert("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
    }
};

var loadFailed = function () {
    alert("Something went wrong while loading SWFUpload. If this were a real application we'd clean up and then give you an alternative");
};


var onUploadImages = function () {
    if (Ext.util.Cookies.get('cookieConceptoOrdenEstimacion') != null) {
        window.parent.App.wEmergente.getBody().App.sConceptos.reload({
            callback: function () {
                window.parent.App.wEmergente.getBody().App.direct.sOrdenMantenimiento_Load();
            }
        });
    }
}