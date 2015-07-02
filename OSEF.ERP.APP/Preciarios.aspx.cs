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
    public partial class Preciarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                List<Preciario> lPreciarios = PreciarioBusiness.ObtenerPreciarios();
                sPreciarios.DataSource = lPreciarios;
                sPreciarios.DataBind();

                rmPreciarios.RegisterIcon(Icon.Delete);


                sSucursales.DataSource = SucursalBusiness.ObtenerSucursales();
                sSucursales.DataBind();

                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

            }
        }

        protected void OnReadData_sPreciarios(object sender, StoreReadDataEventArgs e)
        {
            List<Preciario> lPreciarios = PreciarioBusiness.ObtenerPreciarios();
            sPreciarios.DataSource = lPreciarios;
            sPreciarios.DataBind();
        }

       
        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        protected void imgbtnBorrar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere eliminar
            string strID = e.ExtraParams["ID"];

            //2. Validar si se elimina el registro
            if (PreciarioBusiness.ObtenerPreciariosEnVolumetriasPorID(strID))
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));
            }
            else
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
                PreciarioConceptoBusiness.Borrar(strID);
                PreciarioSubSubCategoriaBusiness.Borrar(strID);
                PreciarioSubCategoriaBusiness.Borrar(strID);
                PreciarioCategoriaBuisness.Borrar(strID);
                PreciarioBusiness.Borrar(strID);
            }
        }

    }
}