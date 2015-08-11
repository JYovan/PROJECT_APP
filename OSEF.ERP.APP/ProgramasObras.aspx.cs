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
    public partial class ProgramasObras : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Si no hay AjaxRequest
            if (!X.IsAjaxRequest)
            {
                //2. Checar ticket de autenticación
                //UsuarioBusiness.checkValidSession(this);

                //3. Llenar Store de Sucursales y Usuarios
                //sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                //sUsuarios.DataBind();

                //sSucursales.DataSource = SucursalBusiness.ObtenerSucursalesEnUsoEnOrdenesDeCambio();
                //sSucursales.DataBind();

                rmProgramasObras.RegisterIcon(Icon.Delete);
            }
        }
    }
}