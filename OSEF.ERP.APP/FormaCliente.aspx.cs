using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Configuration;
using OSEF.APP.EL;
using System.IO;

namespace OSEF.ERP.APP
{
    public partial class FormaCliente : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Validar si son peticiones Ajax
            if (!X.IsAjaxRequest)
            {
           
                //3. Llenar el ComboBox de Estados 
                string strcookieEditarCliente = Cookies.GetCookie("cookieEditarCliente").Value;
                if (strcookieEditarCliente.Equals("Nuevo"))
                {
                    fbtnBuscarSucursal.Hidden = true;
                }
                else
                {
                    fbtnBuscarSucursal.Hidden = false;
                }
            }
        }
          
        /// <summary>
        /// Evento de clic al botón de Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo 

            //3. Obtener los parametros de la Forma
            string strRegistro = e.ExtraParams["registro"];
            string strUsuario = e.ExtraParams["usuario"];
            string strcookieEditarCliente = Cookies.GetCookie("cookieEditarCliente").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Cliente oCliente = new Cliente(); 

            //3. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //4. Datos del cliente
                    case "txtfNombre":
                        oCliente.Nombre = sd.Value;
                        break;
                    case "txtfAPaterno":
                        oCliente.APaterno = sd.Value;
                        break;
                    case "txtfAMaterno":
                        oCliente.AMaterno = sd.Value;
                        break; 
                    case "txtfCorreo":
                        oCliente.Correo = sd.Value;
                        break;
                    case "txtfTelefono":
                        oCliente.Telefono = sd.Value;
                        break;
                    case "txtfTelefonoMovil":
                        oCliente.TelefonoMovil = sd.Value;
                        break;
                    case "txtfCalle":
                        oCliente.Calle = sd.Value;
                        break;
                    case "txtfNoExterior":
                        oCliente.NoExterior = sd.Value;
                        break;
                    case "txtfNoInterior":
                        oCliente.NoInterior = sd.Value;
                        break;
                    case "cmbColonia":
                        oCliente.Colonia = sd.Value;
                        break;
                    case "txtfCodigoPostal":
                        oCliente.CodigoPostal = sd.Value;
                        break;
                    case "txtfEntreCalles":
                        oCliente.EntreCalles = sd.Value;
                        break;
                    case "cmbEstado":
                        oCliente.Estado = sd.Value;
                        break;
                    case "cmbMunicipio":
                        oCliente.Municipio = sd.Value;
                        break;
                    case "cmbEstatus":
                        oCliente.Estatus = sd.Value;
                        break;
                }
            }

            string logo = e.ExtraParams["logo"];
            //5. Complementar datos
            if (strcookieEditarCliente.Equals("Nuevo"))
            {
                Usuario oUsuario = (Usuario)Session["Usuario"];
                oCliente.FechaAlta = DateTime.Now;
                oCliente.Estatus = "ALTA";
                oCliente.Usuario = oUsuario.ID;
                oCliente.RutaLogo = logo != null || !logo.Equals("") ? logo : "";
                string strCP = Cookies.GetCookie("cookieCP").Value;
                if (!strCP.Trim().Equals(""))
                {
                    oCliente.RCodigoPostal = CodigoPostalBusiness.ObtenerCodigoPostalPorID(Cookies.GetCookie("cookieCP").Value);
                    oCliente.CodigoPostal = oCliente.RCodigoPostal.Id;
                }
                oCliente.ID = ClienteBusiness.Insertar(oCliente);
            } else {
                oCliente.ID = strcookieEditarCliente;
                if (!logo.Equals(""))
                {
                    oCliente.RutaLogo = logo != null || !logo.Equals("") ? logo : "";
                }
                string strCP = Cookies.GetCookie("cookieCP").Value;
                if (!strCP.Trim().Equals(""))
                {
                    oCliente.RCodigoPostal = CodigoPostalBusiness.ObtenerCodigoPostalPorID(Cookies.GetCookie("cookieCP").Value);
                    oCliente.CodigoPostal = oCliente.RCodigoPostal.Id;
                }
                ClienteBusiness.Actualizar(oCliente);
            }
            string rlogo = fuImagenCliente.FileName;
            if (rlogo != null && !rlogo.Trim().Equals(""))
            {
                string strDireccion = Server.MapPath(" ") + "\\images\\clientes\\" +oCliente.ID+"\\";
                if (Directory.Exists(strDireccion))
                {
                    fuImagenCliente.PostedFile.SaveAs(Path.Combine(strDireccion + rlogo));
                }
                else
                {
                    Directory.CreateDirectory(strDireccion);
                    fuImagenCliente.PostedFile.SaveAs(Path.Combine(strDireccion + rlogo));
                }
            }
                //6. Mandar parametro (ID del Cliente)
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("registro", oCliente.ID, ParameterMode.Value)); 
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sCliente_Load()
        {
            //1. Obtener Cookie del Cliente
            string strcookieEditarCliente = Cookies.GetCookie("cookieEditarCliente").Value;

            //2. Asignar el objeto del Cliente y llenar el Store sCliente
            Cliente oCliente = ClienteBusiness.ObtenerClientePorID(strcookieEditarCliente);
            sCliente.Add(new
            {
                ID = oCliente.ID,
                Nombre = oCliente.Nombre,
                APaterno = oCliente.APaterno,
                AMaterno = oCliente.AMaterno, 
                Correo = oCliente.Correo,
                Telefono = oCliente.Telefono,
                TelefonoMovil = oCliente.TelefonoMovil,
                Calle = oCliente.Calle,
                NoExterior = oCliente.NoExterior,
                NoInterior = oCliente.NoInterior,

                RCodigoPostal = oCliente.RCodigoPostal,
                RColonia = oCliente.RColonia,
                REstado = oCliente.REstado,
                RMunicipio = oCliente.RMunicipio,
                
                EntreCalles = oCliente.EntreCalles,
                Usuario = oCliente.Usuario,
                FechaAlta = oCliente.FechaAlta,
                Estatus = oCliente.Estatus,
                RutaLogo = oCliente.RutaLogo
            });
        }
    }
}