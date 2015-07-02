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
    public partial class FormaAvanzarVolumetria : System.Web.UI.Page
    {
        /// <summary>
        /// 
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


            //1. Obtener ID y el movimiento seleccionado
            int iID = Convert.ToInt32(e.ExtraParams["ID"]);
            bool strFin = Convert.ToBoolean(e.ExtraParams["Fin"]);

            //2. Avanzar una revisión
            if (strFin)
            {
                int iIDNuevo = VolumetriaBusiness.AvanzarVolumetriaPorID(iID, rFin.InputValue);
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("captura", iIDNuevo.ToString(), ParameterMode.Auto));
            }
        }

        /// <summary>
        /// Obtener el objeto de la Revisión
        /// </summary>
        /// <param name="iID"></param>
        [DirectMethod]
        public static Volumetria ObtenerVolumetria(int iID)
        {
            return VolumetriaBusiness.ObtenerVolumetriaPorID(iID);
        }
    }
}