using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.EL;
using Ext.Net;
using OSEF.APP.BL;
using System.Web.Security;
using System.Configuration;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Default2 : System.Web.UI.Page
    {
        /// <summary>
        /// Se produce al principio de la inicialización de la página.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_PreInit(object sender, EventArgs e)
        {
            UsuarioBusiness.checkValidSession(this);
            Usuario oUsuario = (Usuario)Session["Usuario"];

            if (oUsuario == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Login.aspx", true);
            }
        }

        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //UsuarioBusiness.checkValidSession(this);
            Cookies.Set("osefTheme", ConfigurationManager.AppSettings["osefTheme"].ToString(), DateTime.Now.AddDays(30), "/", null, false);
        }

        /// <summary>
        /// Evento que se lanza al cargar el Store de Usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void sUsuario_Load(object sender, DirectEventArgs e)
        {
            Usuario oUsuario = (Usuario)Session["Usuario"];
            sUsuario.Add(new
            {
                ID = oUsuario.ID,
                Correo = oUsuario.Correo,
                Nombre = oUsuario.Nombre,
                AMaterno = oUsuario.AMaterno,
                APaterno = oUsuario.APaterno,
                Estatus = oUsuario.Estatus,
                Bloqueado = oUsuario.Bloqueado,
                EnLinea = oUsuario.EnLinea,
                FechaAlta = oUsuario.FechaAlta,
                FechaBloqueo = oUsuario.FechaBloqueo,
                UltimoAcceso = oUsuario.UltimoAcceso,
                CambioContrasena = oUsuario.CambioContrasena
            });
        }

        /// <summary>
        /// Evento de clic del botón de cerrar Sesión
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void miCerrarSesionClick(object sender, DirectEventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx", true);
        }
    }
}