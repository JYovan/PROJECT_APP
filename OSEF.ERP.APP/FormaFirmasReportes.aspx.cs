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
    public partial class FormaFirmasReportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            //string strcookieEditarColonia = Cookies.GetCookie("cookieEditarColonia").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            FirmasReportes oFirmasReportes = new FirmasReportes();


            FirmasReportes oFirmaComprobar=  FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");
         

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos de la colonia
                    case "txtReviso":
                        oFirmasReportes.FirmaReviso = sd.Value;
                        break;
                    case "txtAutorizo":
                        oFirmasReportes.FirmaAutorizo = sd.Value;
                        break;

                }
            }

            oFirmasReportes.Modulo="Reportes";
            //4. Validar si es nuevo o es uno existente
            if (oFirmaComprobar == null)
            {
                //5. Insertar en la base de datos
                FirmasReportesBusiness.Insertar(oFirmasReportes);
                //6. Mandar mensaje con el código del proveedor
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Registro completo", "<p align='center'>Firmas registradas.</p>", success).Show();
            }
            else
            {
                oFirmasReportes.Modulo = "Reportes";
                //7. Actualizar los datos de la colonia
                FirmasReportesBusiness.Actualizar(oFirmasReportes);
                //8. Mandar mensaje con el código de la colonia
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado las firmas</p>", success).Show();
            }
        }




        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sFirmas_Load()
        {

            FirmasReportes oFirmasReportesC = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");


            if (oFirmasReportesC != null)
            {

                FirmasReportes oFirmasReportes = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");
                sFirmasReportes.Add(new
                {
                    FirmaReviso = oFirmasReportes.FirmaReviso,
                    FirmaAutorizo = oFirmasReportes.FirmaAutorizo,
                    Modulo = oFirmasReportes.Modulo
                });
            }
        }

    }
}