using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class FormaAvanzarOrdenEstimacion : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Eveno de clic al boton aceptar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAceptar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener ID, futuro movimiento
            int iID = Convert.ToInt32(e.ExtraParams["ID"]);
            bool bMesaReporte = Convert.ToBoolean(e.ExtraParams["MesaReporte"]);
            bool bEstimacion = Convert.ToBoolean(e.ExtraParams["Estimacion"]);

            //2. Avanzar a Mesa de Reporte
            if (bMesaReporte)
            {
                int iIDNuevo = OrdenEstimacionBusiness.AvanzarReportePorID(iID, rMesaReporte.InputValue);
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("ordenestimacion", iIDNuevo.ToString(), ParameterMode.Auto));
            }
            else
            {
                int iIDNuevo = OrdenEstimacionBusiness.AvanzarReportePorID(iID, rEstimacion.InputValue);
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("ordenestimacion", iIDNuevo.ToString(), ParameterMode.Auto));
            }
        }

        /// <summary>
        /// Obtener el objeto de la OrdenEstimacion
        /// </summary>
        /// <param name="iID"></param>
        [DirectMethod]
        public static OrdenEstimacion ObtenerOrdenEstimacion(int iID)
        {
            return OrdenEstimacionBusiness.ObtenerOrdenEstimacionPorID(iID);
        }
    }
}