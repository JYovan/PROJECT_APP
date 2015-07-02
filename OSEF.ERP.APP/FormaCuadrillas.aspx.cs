using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaCuadrillas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcookieEditarCuadrilla = Cookies.GetCookie("cookieEditarCuadrilla").Value;
            if (!strcookieEditarCuadrilla.Equals("Nuevo"))
            {
                Cuadrilla cu = new Cuadrilla();
                cu = CuadrillaBusiness.ObtenerCuadrillaPorID(strcookieEditarCuadrilla);
                txtID.SetValue(cu.ID);
                txtNombre.SetValue(cu.Nombre);
                txtDescripcion.SetValue(cu.Descripcion);
            } 
        }


        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Cuadrilla cu = new Cuadrilla();
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    case "txtID":
                        cu.ID = sd.Value;
                        break;
                    case "txtNombre":
                        cu.Nombre = sd.Value;
                        break;
                    case "txtDescripcion":
                        cu.Descripcion = sd.Value;
                        break; 
                }
            }
            string strcookieEditarCuadrilla = Cookies.GetCookie("cookieEditarCuadrilla").Value;
            if(strcookieEditarCuadrilla.Equals("Nuevo")){
            //3. Insertar en la base de datos
            cu.ID = CuadrillaBusiness.Insertar(cu);
            //4. Mandar mensaje con el código de la cuadrilla
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cu.ID, ParameterMode.Value));
            }else{
                CuadrillaBusiness.Modificar(cu);
                cu.ID = strcookieEditarCuadrilla;
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cu.ID, ParameterMode.Value));
            }
        }

    }
}