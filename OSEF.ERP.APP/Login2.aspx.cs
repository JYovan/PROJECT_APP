using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;
using System.Web.Security;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Login2 : System.Web.UI.Page
    {
        #region Global variables

        //Variable para saber si dejar la mascara o quitarla
        bool bMascara = false;

        #endregion

        #region Eventos

        /// <summary>
        /// Se produce al principio de la inicialización de la página.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_PreInit(object sender, EventArgs e)
        {
            string ReturnUrl = Request.QueryString["ReturnUrl"];

            if (ReturnUrl == null) { }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.parent.location.href = 'Login.aspx';", true);
            }

            if (Request.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx", true);
            }
        }

        /// <summary>
        /// Evento de carga de la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Evento de autenticación del control Login
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            //1. Declaración de variables
            FormsAuthenticationTicket tkt;
            String cookiestr;
            HttpCookie ck;
            Usuario oUsuario;

            //2. Obtener nombre de usuario y passsword
            string strUsuario = lLogin.UserName;
            string strContrasena = lLogin.Password;

            //3. Obtener control TextField del password
            TextField txtfPassword = (TextField)lLogin.FindControl("Password");

            //4. Validar si el nombre de usuario y el password son correctos
            if (UsuarioBusiness.ValidarUsuarioContrasena(strUsuario, strContrasena))
            {
                //5. Autenticar verdadero y redireccionar a la pantalla principal
                FormsAuthentication.SetAuthCookie(strUsuario, true);
                e.Authenticated = true;
                bMascara = true;
                oUsuario = UsuarioBusiness.ObtenerUsuarioPorID(strUsuario);
                if (oUsuario == null)
                    oUsuario = UsuarioBusiness.ObtenerUsuarioPorCorreo(strUsuario);

                //7. Asignar variable de Session y Ticket de Session
                Session["Usuario"] = oUsuario;
                string id = JSON.Serialize(oUsuario);
                tkt = new FormsAuthenticationTicket(1, strUsuario, DateTime.Now, DateTime.Now.AddMinutes(60), true, id);
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                ck.Expires = tkt.Expiration;
                ck.Path = FormsAuthentication.FormsCookiePath;
                Response.Cookies.Add(ck);
            }
            else
            {
                //8. Sino la contraseña es incorrecta
                txtfPassword.SelectOnFocus = true;
                txtfPassword.Focus(true);
                bMascara = false;
            }
        }

        /// <summary>
        /// Evento que se lanza al presionar la tecla "Enter" en el TextField Password
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Password_SpecialKey(object sender, DirectEventArgs e)
        {
            //1. Objeto de autenticación
            AuthenticateEventArgs auth = new AuthenticateEventArgs();
            //2. Mandar a llamar el evento de autenticación
            lLogin_Authenticate(this, auth);
            //3. Asignar ExtraParamsResponse para saber si quitar la mascara o dejarla
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("showMask", bMascara.ToString().ToLower(), ParameterMode.Raw));
            //4. Direccionar a la página de Default si la autenticación fue true
            if (bMascara)
            {
                UsuarioBusiness.ActualizarUltimoAcceso(((Usuario)Session["Usuario"]).ID);
                Response.Redirect("~/Default.aspx", true);
            }
        }

        /// <summary>
        /// Evento Click del botón de entrar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnLogin_Click(object sender, DirectEventArgs e)
        {
            //1. Objeto de autenticación
            AuthenticateEventArgs auth = new AuthenticateEventArgs();
            //2. Mandar a llamar el evento de autenticación
            lLogin_Authenticate(this, auth);
            //3. Asignar ExtraParamsResponse para saber si quitar la mascara o dejarla
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("showMask", bMascara.ToString().ToLower(), ParameterMode.Raw));
            //4. Direccionar a la página de Default si la autenticación fue true
            if (bMascara)
            {
                UsuarioBusiness.ActualizarUltimoAcceso(((Usuario)Session["Usuario"]).ID);
                Response.Redirect("~/Default.aspx", true);
            }
        }

        #endregion
    }
}