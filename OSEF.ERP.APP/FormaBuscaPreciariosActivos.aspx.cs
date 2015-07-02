using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.EL;
using OSEF.APP.BL;
using Ext.Net;

namespace OSEF.ERP.APP
{
    public partial class FormaBuscaPreciariosActivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getPreciarios();
        }
        protected void getPreciarios()
        {
            List<Preciario> lPreciarios = PreciarioBusiness.ObtenerPreciariosActivos();
            sPreciarios.DataSource = lPreciarios;
            sPreciarios.DataBind();
        }
        protected void OnReadData_sPreciarios(object sender, StoreReadDataEventArgs e)
        {
            getPreciarios();
        }
    }
}