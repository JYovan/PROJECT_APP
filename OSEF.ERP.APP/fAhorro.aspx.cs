using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;

namespace OSEF.ERP.APP
{
    public partial class fAhorro : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Revisa variables de Session
            UsuarioBusiness.checkValidSession(this);

            //2. Validar que no sea una petición Ajax
            if (!X.IsAjaxRequest)
            {
                //3. Cargar el ComboBox de Clientes, Artículos
                sCliente.DataSource = ClienteBusiness.ObtenerClientes();
                sCliente.DataBind();

                sArticulos.DataSource = ArticuloBusiness.ObtenerArticulos();
                sArticulos.DataBind();
            }
        }

        /// <summary>
        /// Evento clic para guardar el Movimiento
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strAhorroForma = e.ExtraParams["AhorroForma"];
            string strAhorro = e.ExtraParams["Ahorro"];
            string strAhorroD = e.ExtraParams["AhorroD"];
            string strcookieEditarAhorro = Cookies.GetCookie("cookieEditarAhorro").Value;
        }
    }
}