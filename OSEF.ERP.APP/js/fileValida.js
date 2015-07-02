
var CheckExtension = function (FileUploadField1, file) {

    var validFilesTypes = ["xls", "xlsx"];

    var filePath = file;
    var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
    var isValidFile = false;

    for (var i = 0; i < validFilesTypes.length; i++) {
        if (ext == validFilesTypes[i]) {
            isValidFile = true;
            break;
        }
    }

    if (!isValidFile) {
        file.value = null;
        FileUploadField1.reset();
        alert("Invalid File. Valid extensions are:\n\n" + validFilesTypes.join(", "));
    }
    return isValidFile;
};

