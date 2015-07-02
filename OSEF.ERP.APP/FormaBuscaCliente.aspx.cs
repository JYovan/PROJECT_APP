using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Configuration;

namespace OSEF.ERP.APP
{
    public partial class FormaBuscaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                getData();
                rmClientes.RegisterIcon(Icon.Delete);
            }
        }


        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sClientes(object sender, StoreReadDataEventArgs e)
        {
            getData();
        }
        public void getData()
        {
            sClientes.DataSource = ClienteBusiness.ObtenerClientes();
            sClientes.DataBind();
        }
    }
}