//Método que se lanza despues de mandar la información de reestablecer contraseña
var txtfEnviarCorreo_SpecialKey_Success = function (response, result) {


    if (result.extraParamsResponse.existe) {
        App.cErrorOlvidasteContrasena.hide();
        if (result.extraParamsResponse.correcto) {
            App.fpOlvidarContrasena.hide();
            App.cCorreoEnviado.show();
        }
        else {
            App.lblError.setText(result.extraParamsResponse.mensaje);
            App.cErrorOlvidasteContrasena.show();
        }
    }
    else {
        App.lblError.setText('Error, nombre de usuario o dirección incorrecta');
        App.cErrorOlvidasteContrasena.show();
    }
};


//Evento que se lanza al seleccionar un elemento del nodo
var txtffEnviarCorreo_SpecialKey_Click = function (field, eventArgs) {

//Se valida que sea la tecla enter la que ejecute el metodo
    if (eventArgs.getKey() == eventArgs.ENTER) {
        //Inicializa el loader hasta que entr la funcion
        Ext.net.Mask.show({ msg: 'Enviando correo' }); 

        eventArgs.stopEvent();
        //Se manda llamar el metodo del lado del servidor
        App.direct.txtfEnviarCorreo_SpecialKey(field.getValue(), {

            //1. Si e proceso es correcto
            success: function (result) {
            //Se detiene el loader cuando entra a la funcion
            Ext.net.Mask.hide(); 

            //Si el metodo devuelve algun valor aqui lo recibe y lo decodifica
                var data = Ext.decode(result);
            //Si trae un 1 es correcto y entra a la funcion
                if (data == 1) {
                                    App.fpOlvidarContrasena.hide();
                                    App.cCorreoEnviado.show();
                                    App.cErrorOlvidasteContrasena.hide();
                                }
                //Caso contrario manda el mensaje de error
                else {
                    App.lblError.setText('Error, nombre de usuario o dirección incorrecta');
                    App.cErrorOlvidasteContrasena.show();
                }

               

            },
            //2. Si existe un error
            failure: function (errorMsg) {
                Ext.Msg.alert('Error al mandar llamar la funcion', errorMsg);
            }
        });


    }



};



















