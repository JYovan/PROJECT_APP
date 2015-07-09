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
            string cliente = Cookies.GetCookie("cookieClienteID").Value;
            var success = new JFunction { Fn = "onBuscar_Sucursal" };
            if (cliente != null && !cliente.Trim().Equals(""))
            {
                List<Preciario> lPreciarios = PreciarioBusiness.ObtenerPreciariosActivosPorCliente(cliente);
                if (lPreciarios.Count() > 0)
                {
                    sPreciarios.DataSource = lPreciarios;
                    sPreciarios.DataBind();
                }
                else
                {
                    X.Msg.Alert("ATENCIÓN", "<p align='center'>EL CLIENTE: "+cliente+" ES INDEFINIDO.</p>", success).Show();
                }
            }
        }
        protected void OnReadData_sPreciarios(object sender, StoreReadDataEventArgs e)
        {
            getPreciarios();
        }
    }
}