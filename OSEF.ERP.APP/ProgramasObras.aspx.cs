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
                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

                sSucursales.DataSource = SucursalBusiness.ObtenerSucursales();
                sSucursales.DataBind();

                sProgramasObras.DataSource = ProgramaObraBusiness.ObtenerProgramasObras();
                sProgramasObras.DataBind();

                rmProgramasObras.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sProgramasObras(object sender, StoreReadDataEventArgs e)
        {
            sProgramasObras.DataSource = ProgramaObraBusiness.ObtenerProgramasObras();
            sProgramasObras.DataBind();
        }

        /// <summary>
        /// Método que elimina un registro del Programa De Obra
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnBorrar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere eliminar
            string strSucursal = e.ExtraParams["Sucursal"];
            string strID = e.ExtraParams["Id"];

            //2. Validar si se elimina el registro
            if (RevisionBusiness.ObtenerRevisionPorSucursal(strSucursal) != null)
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));
            }
            else
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
                ProgramaObraBusiness.Borrar(Convert.ToInt32(strID));
            }
        }
    }
}