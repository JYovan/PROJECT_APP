using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;
using System.Web.Security;
using System.Configuration;

namespace OSEF.ERP.APP
{
    public partial class Default : System.Web.UI.Page
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

            if (oUsuario == null) {
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
       
           UsuarioBusiness.checkValidSession(this);
              
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

        [DirectMethod]
        public Usuario getData()
        {
            Usuario oUsuario = (Usuario)Session["Usuario"]; 
            return oUsuario;
        }
    }
}