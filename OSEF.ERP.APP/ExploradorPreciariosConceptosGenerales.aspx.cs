using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Text;
using System.Xml;
using Newtonsoft.Json;
using System.Xml.Xsl;

namespace OSEF.ERP.APP
{
    public partial class ExploradorPreciariosGenerales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!X.IsAjaxRequest)
            {
       
                rmExploradorConceptosPreciario.RegisterIcon(Icon.Delete);

                sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesEstimacionesConcluidos();
                sOrdenesEstimaciones.DataBind();

                sSucursales.DataSource = SucursalBusiness.ObtenerSucursales();
                sSucursales.DataBind();

                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

            }

         
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sOrdenesEstimaciones(object sender, StoreReadDataEventArgs e)
        {
            sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesEstimacionesConcluidos();
            sOrdenesEstimaciones.DataBind();
        }


    }
}