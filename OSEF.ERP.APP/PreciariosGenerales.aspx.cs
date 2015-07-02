using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class PreciariosGenerales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
          
                rmPreciariosGenerales.RegisterIcon(Icon.Delete);


                //List<PreciarioGeneral> lPreciarios = PreciarioGeneralBusiness.ObtenerPreciariosGenerales();
                sPreciariosGenerales.DataSource = PreciarioGeneralBusiness.ObtenerPreciariosGenerales();
                sPreciariosGenerales.DataBind();

                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

            }
        }

        protected void OnReadData_sPreciariosGenerales(object sender, StoreReadDataEventArgs e)
        {
            sPreciariosGenerales.DataSource = PreciarioGeneralBusiness.ObtenerPreciariosGenerales(); 
            sPreciariosGenerales.DataBind();
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        protected void imgbtnBorrar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere eliminar
            string strID = e.ExtraParams["ID"];

        
            //2. Se borra el registro
            //PreciarioGeneralConceptoBusiness.Borrar(strID);
                PreciarioGeneralSubSubCategoriaBusiness.Borrar(strID);
                PreciarioGeneralSubCategoriaBusiness.Borrar(strID);
                PreciarioGeneralCategoriaBusiness.Borrar(strID);
                PreciarioGeneralBusiness.Borrar(strID);
            
        }
    }
}