var txtBuscar_Change = function (textfield, value) {
    var store = App.sAdminRegistro;
    store.filterBy(function (record) {
        if (!(filterString(value, "Nombre", record))) {
            return false;
        }
        return true;
    });
};

var filterString = function (value, dataIndex, record) {
    var val = record.get(dataIndex);
    return val.toLowerCase().indexOf(value.toLowerCase()) > -1;
};

var submitValue = function (grid, hiddenFormat, format) {
    hiddenFormat.setValue(format);
    grid.submitData(false, { isUpload: true });
};

var edit = function (editor, e) {
    /*
    "e" is an edit event with the following properties:

    grid - The grid
    record - The record that was edited
    field - The field name that was edited
    value - The value being set
    originalValue - The original value for the field, before the edit.
    row - The grid table row
    column - The grid Column defining the column that was edited.
    rowIdx - The row index that was edited
    colIdx - The column index that was edited
    */

    // Call DirectMethod
    //CompanyX.Edit(e.record.data.ID, e.field, e.originalValue, e.value, e.record.data);
    CompanyX.Edit(e.record.data.ID, e.value);
};