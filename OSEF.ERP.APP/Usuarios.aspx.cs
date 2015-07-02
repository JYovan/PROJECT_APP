using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.EL;
using Ext.Net;
using OSEF.APP.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Usuarios : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();
                rmUsuarios.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Actualiza la lista de usuarios
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sUsuarios(object sender, StoreReadDataEventArgs e)
        {
            sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
            sUsuarios.DataBind();
        } 
        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarUsuario(string strID)
        {
            if (UsuarioBusiness.ValidarUsuarioEnUso(strID))
            {
                UsuarioBusiness.Borrar(strID);
                X.Msg.Alert("Atención", "Usuario " + strID + " eliminado.", new JFunction { Fn = "showResult" }).Show(); 
            }
            else
            {
                X.Msg.Alert("Error", "El usuario no se puede eliminar, verifique sus dependencias y de de baja al usuario.", new JFunction { Fn = "showResult" }).Show();
            }
        }
    }
}