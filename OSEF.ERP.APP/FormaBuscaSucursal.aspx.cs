using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaBuscaSucursal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                string str = Cookies.GetCookie("cookieElijeSucursal").Value != null ? Cookies.GetCookie("cookieElijeSucursal").Value : "";
                List<Sucursal> lSucursal;
                if (str.Equals("Preciario"))
                {
                    lSucursal = SucursalBusiness.ObtenerSucursalesDisponibles();
                }
                else
                {
                    lSucursal = SucursalBusiness.ObtenerSucursales();
                }
                sBSucursales.DataSource = lSucursal;
                sBSucursales.DataBind();

                rmSucursales.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Actualiza la lista de sucursales
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sSucursales(object sender, StoreReadDataEventArgs e)
        {

            string str = Cookies.GetCookie("cookieElijeSucursal").Value != null ? Cookies.GetCookie("cookieElijeSucursal").Value : "";
            List<Sucursal> lSucursal;
            if (str.Equals("Preciario"))
            {
                lSucursal = SucursalBusiness.ObtenerSucursalesDisponibles();
            }
            else
            {
                lSucursal = SucursalBusiness.ObtenerSucursales();
            }
            sBSucursales.DataSource = lSucursal;
            sBSucursales.DataBind();
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
            if (SucursalBusiness.ObtenerSucursalesEnRevisionesPorID(strID))
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));
            }
            else
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
                SucursalBusiness.Borrar(strID);
            }
        }
    }
}