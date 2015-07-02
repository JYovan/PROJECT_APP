using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.Web.Configuration;
using System.Net.Configuration;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaOlvidoContrasena : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento del TextField que detecta teclas especiales
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        [DirectMethod]
        public string txtfEnviarCorreo_SpecialKey(string strIDCorreo)
        {
            Usuario oUsuario = UsuarioBusiness.ObtenerUsuarioPorIDCorreo(strIDCorreo);
            string banderaValida = "";
            if (oUsuario == null)
            {
                banderaValida = "0";
            }
             
            else
            {
             
                try
                {
                    Configuration c = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                    MailSettingsSectionGroup settings = (MailSettingsSectionGroup)c.GetSectionGroup("system.net/mailSettings");

                    SmtpClient servidorDeCorreo = new SmtpClient(settings.Smtp.Network.Host, settings.Smtp.Network.Port);
                    servidorDeCorreo.EnableSsl = settings.Smtp.Network.EnableSsl;
                    servidorDeCorreo.Credentials = new NetworkCredential(settings.Smtp.Network.UserName, settings.Smtp.Network.Password);

                    MailMessage mmMensaje = new MailMessage();
                    mmMensaje.To.Add(oUsuario.Correo);
                    mmMensaje.Subject = "Asunto";
                    mmMensaje.Body = "Tu contraseña es: " + UsuarioBusiness.ObtenerContrasenaPorID(oUsuario.ID);

                    //10. Remitente
                    MailAddress maFrom = new MailAddress("no-reply@osef.com.mx");
                    mmMensaje.From = maFrom;

                    mmMensaje.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure | DeliveryNotificationOptions.OnSuccess;
                    servidorDeCorreo.Send(mmMensaje);

                  
                }
                catch (Exception ex)
                {
                 
                }
                banderaValida = "1";
            }

            return banderaValida;
        }

        /// <summary>
        /// Evento de click del botón Enviar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imbtnLogin_Click(object sender, DirectEventArgs e)
        {
            string strIDCorreo = e.ExtraParams["dato"];
            Usuario oUsuario = UsuarioBusiness.ObtenerUsuarioPorIDCorreo(strIDCorreo);

            if (oUsuario == null)
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
            }
            else
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));

                try
                {

                    Configuration c = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                    MailSettingsSectionGroup settings = (MailSettingsSectionGroup)c.GetSectionGroup("system.net/mailSettings");

                    SmtpClient servidorDeCorreo = new SmtpClient(settings.Smtp.Network.Host, settings.Smtp.Network.Port);
                    servidorDeCorreo.EnableSsl = settings.Smtp.Network.EnableSsl;
                    servidorDeCorreo.Credentials = new NetworkCredential(settings.Smtp.Network.UserName, settings.Smtp.Network.Password);

                    MailMessage mmMensaje = new MailMessage();
                    mmMensaje.To.Add(oUsuario.Correo);
                    mmMensaje.Subject = "Asunto";
                    mmMensaje.Body = "Tu contraseña es: " + UsuarioBusiness.ObtenerContrasenaPorID(oUsuario.ID);

                    //10. Remitente
                    MailAddress maFrom = new MailAddress("no-reply@ibuho.mx");
                    mmMensaje.From = maFrom;

                    mmMensaje.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure | DeliveryNotificationOptions.OnSuccess;
                    servidorDeCorreo.Send(mmMensaje);

                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("correcto", "true", ParameterMode.Raw));
                }
                catch (Exception ex)
                {
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("correcto", "false", ParameterMode.Raw));
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("mensaje", ex.Message, ParameterMode.Raw));
                }
            }
        }
    }
}