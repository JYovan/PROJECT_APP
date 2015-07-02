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
    public partial class FormaBuscaCodigoPPTA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sCodigosPPTA.DataSource = CodigoFallasBusiness.ObtenerCodigoFallas();
            sCodigosPPTA.DataBind();
        }

        /// <summary>
        /// Actualiza la lista 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sCodigosPPTA(object sender, StoreReadDataEventArgs e)
        {
            sCodigosPPTA.DataSource = CodigoFallasBusiness.ObtenerCodigoFallas();
            sCodigosPPTA.DataBind();
        }
    }
}