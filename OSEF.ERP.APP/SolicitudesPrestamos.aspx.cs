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
    public partial class SolicitudesPrestamos : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Validar si hay un requerimiento Ajax
            if (!X.IsAjaxRequest)
            {
                //2. Obtener todas las solicitudes de préstamos
                sSolicitudesPrestamos.DataSource = SolicitudPrestamoBusiness.ObtenerSolicitudesPrestamos();
                sSolicitudesPrestamos.DataBind();
                rmSolicitudesPrestamos.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sSolicitudesPrestamos(object sender, StoreReadDataEventArgs e)
        {
            //1. Obtener todas las solicitudes de préstamos
            sSolicitudesPrestamos.DataSource = SolicitudPrestamoBusiness.ObtenerSolicitudesPrestamos();
            sSolicitudesPrestamos.DataBind();
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnBorrar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere eliminar
            string strID = e.ExtraParams["ID"];

            //2. Validar si se elimina el registro
            //if (SolicitudPrestamoBusiness.ObtenerSolicitudPrestamoPorID(strID))
            //{
                //e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));
            //}
            //else
            //{
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
                CapacidadPagoBusiness.BorrarPorSolicitudPrestamo(strID);
                SolicitudPrestamoBusiness.Borrar(strID);
            //}
        }
    }
}