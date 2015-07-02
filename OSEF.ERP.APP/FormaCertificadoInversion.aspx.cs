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
    public partial class FormaCertificadoInversion : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validar que no sea una petición Ajax
            if (!X.IsAjaxRequest)
            {
                //Cargar el ComboBox de Clientes
                sCliente.DataSource = ClienteBusiness.ObtenerClientes();
                sCliente.DataBind();
            }
        }
    }
}