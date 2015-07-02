using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace OSEF.ERP.APP
{
    public partial class FormaSubirImagenesCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void muSubirImagenesCliente_OnFileUpload(object sender, FileUploadEventArgs e)
        {
            X.Msg.Notify("El archivo esta subiendose", "Nombre: " + e.FileName).Show();
        }
    }
}