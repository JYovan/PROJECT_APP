using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaCambiarContrasena : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                //1. Dar formato al español en mensajes de la contraseña
                PasswordMask maskA = pmContrasenaActual;
                PasswordMask mask = pmContrasena;
                PasswordMask maskC = pmConfirmarContrasena;
                Ext.Net.JsonObject messages = new Ext.Net.JsonObject();

                messages["pass"] = "contraseña";
                messages["and"] = "y";
                messages["passTooShort"] = "contraseña es muy corta (tamaño mínimo: {0})";
                messages["noCharType"] = "contraseña debe contener {0}";
                messages["digits"] = "dígitos";
                messages["letters"] = "letras";
                messages["lettersUp"] = "letras en mayúsculas";
                messages["symbols"] = "símbolos";
                messages["inBlackList"] = "contraseña esta en la lista de las más utilizadas";
                messages["passRequired"] = "contraseña requerida";
                messages["equalTo"] = "contraseña es igual al usuario";
                messages["repeat"] = "contraseña consiste de caracteres repetidos";
                messages["badChars"] = "contraseña contiene caracteres no admitidos: â€œ{0}â€";

                maskA.Messages = messages;
                mask.Messages = messages;
                maskC.Messages = messages;
            }
        }

        /// <summary>
        /// Evento de click en botón guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener parametros
            string strContrasenaActual = string.Empty;
            string strContrasena = string.Empty;
            string strID = e.ExtraParams["usuario"];
            string strRegistro = e.ExtraParams["registro"];
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);

            //2. Obtener los datos
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del usuario
                    case "txtfContrasenaActual":
                        strContrasenaActual = sd.Value;
                        break;
                    case "txtfContrasena":
                        strContrasena = sd.Value;
                        break;
                }
            }

            //4. Validar si es la contraseña actual
            if (UsuarioBusiness.ObtenerContrasenaPorID(strID).Equals(strContrasenaActual))
            {
                //5. Cambiar la contraseña
                UsuarioBusiness.CambiarContrasena(strID, strContrasena);
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("correcto", "true", ParameterMode.Raw));
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("actual", "true", ParameterMode.Raw));
            }
            else
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("actual", "false", ParameterMode.Raw));
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("correcto", "false", ParameterMode.Raw));
            }
        }
    }
}