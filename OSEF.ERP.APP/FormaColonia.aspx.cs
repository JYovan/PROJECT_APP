using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Globalization;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaColonias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Llenar los combos de Categorias
            if (!X.IsAjaxRequest)
            {
                //sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipios();
                //sMunicipios.DataBind();
                sEstados.DataSource = EstadoBusiness.ObtenerEstados();
                sEstados.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al escoger un elemento de Estados
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el estado seleccionado y obtener los Municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
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
            string strcookieEditarColonia = Cookies.GetCookie("cookieEditarColonia").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Colonia oColonia = new Colonia();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos de la colonia
                    case "txtIDColonia":
                        oColonia.ID = sd.Value;
                        break;
                    case "txtfColonia":
                        oColonia.Descripcion = sd.Value;
                        break;
                    case "cmbEstados":
                        oColonia.Estado = sd.Value;
                        break;
                    case "cbMunicipio":
                        oColonia.Municipio = sd.Value;
                        break;
                    
                }
            }

            //4. Validar si es nuevo o es uno existente
            if (strcookieEditarColonia.Equals("Nuevo"))
            {
                //5. Insertar en la base de datos
               oColonia.ID= ColoniaBusiness.Insertar(oColonia);
                //6. Mandar mensaje con el código del proveedor
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Registro completo", "<p align='center'>Colonia registrada con ID: <br/>" + oColonia.ID + ".</p>", success).Show();
            }
            else
            {
                oColonia.ID = strcookieEditarColonia;
                //7. Actualizar los datos de la colonia
                ColoniaBusiness.Actualizar(oColonia);
                //8. Mandar mensaje con el código de la colonia
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos de la colonia <br/>" + oColonia.ID + ".</p>", success).Show();
            }
        }




        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sFirmas_Load()
        {
            string strcookieEditarColonia = Cookies.GetCookie("cookieEditarColonia").Value;
            if (!strcookieEditarColonia.Equals("Nuevo"))
            {
                
                Colonia oColonia = ColoniaBusiness.ObtenerColoniaPorID(strcookieEditarColonia);
                sColonia.Add(new
                {
                    ID = oColonia.ID,
                    Descripcion = oColonia.Descripcion,
                    Estado = oColonia.Estado,
                    Municipio = oColonia.Municipio
                });
            }
        }
    }
}