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
    var rec = App.gpSubirImagenesPreciario.store.getById(id);

    rec.set(field, value);
    rec.commit();
};

var abortUpload = function (btn) {
    var selModel = btn.up('grid').getSelectionModel(),
                records;

    if (!selModel.hasSelection()) {
        Ext.Msg.alert('Error', 'Por favor selecciona al menos un registro a cancelar');
        return true;
    }

    records = selModel.getSelection();
    App.muSubirImagenesPreciario.abortUpload(records[0].getId());
};

var removeUpload = function (btn) {
    var selModel = btn.up('grid').getSelectionModel(),
                records;

    if (!selModel.hasSelection()) {
        Ext.Msg.alert('Error', 'Por favor selecciona al menos un registro.');
        return true;
    }

    records = selModel.getSelection();
    App.muSubirImagenesPreciario.removeUpload(records[0].getId());
};

var uploadError = function (item, file, errorCode, message) {
    updateRecord(file.id, 'Progreso', 0);
    updateRecord(file.id, 'Estatus', 'Error');

    switch (errorCode) {
        case SWFUpload.UPLOAD_ERROR.HTTP_ERROR: 
            Ext.Msg.alert('Error', "Error Code: HTTP Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
            Ext.Msg.alert('Error', "Error Code: Upload Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.IO_ERROR:
            Ext.Msg.alert('Error', "Error Code: IO Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
            Ext.Msg.alert('Error', "Error Code: Security Error, File name: " + file.name + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
            Ext.Msg.alert('Error', "Error Code: Upload Limit Exceeded, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
            Ext.Msg.alert('Error', "Error Code: File Validation Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
        case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
            updateRecord(file.id, 'Estatus', 'Cancelado');
            break;
        case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
            updateRecord(file.id, 'Estatus', 'Detenido');
            break;
        default:
            updateRecord(file.id, 'Estatus', "Unhandled Error: " + errorCode);
            Ext.Msg.alert('Error', "Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
    }
};

var fileSelectionError = function (item, file, errorCode, message) {
    if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
        alert("Haz subido muchos archivos.\n" + (message === 0 ? "Haz alcanzado el limite." : "Podrias seleccionar " + (message > 1 ? "up to " + message + " archivos." : "one file.")));
        return;
    }

    switch (errorCode) {
        case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
            Ext.Msg.alert('Error', "Error Code: El archivo es demasiado grande: " + file.name + ", Tamaño: " + file.size + ", Mensaje: " + message);
            break;
        case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
            alert("Error Code: Archivo vacio o ilegible: " + file.name + ", Tamaño: " + file.size + ", Mensaje: " + message);
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
    if (Ext.util.Cookies.get('cookieConceptoVolumetria') != null) {
        window.parent.App.wEmergente.getBody().App.sConceptos.reload({
            callback: function () {
                window.parent.App.wEmergente.getBody().App.direct.sVolumetria_Load();
            }
        });
    }
}