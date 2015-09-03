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
                sProveedor.DataSource = ProveedorBusiness.ObtenerProveedores();
                sProveedor.DataBind();
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
                    case "txtColonia":
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
                    case "txtElaboro":
                        oCliente.Elaboro = sd.Value.ToString().Trim().Length > 0 ? sd.Value : "";
                        break;
                    case "txtReviso":
                        oCliente.Reviso = sd.Value.ToString().Trim().Length > 0 ? sd.Value : "";
                        break;
                    case "txtAutorizo":
                        oCliente.Autorizo = sd.Value.ToString().Trim().Length > 0 ? sd.Value : "";
                        break;
                    case "cmbProveedor":
                        oCliente.Proveedor = sd.Value.ToString().Trim().Length > 0 ? sd.Value : "";
                        break;
                }
            }

            string logo = e.ExtraParams["logo"];
            string strImagen = fuImagenCliente.FileName;

            //Cadena para mostrar en el display
            string strDireccionDisplay;
            UsuarioBusiness.checkValidSession(this);
            //5. Complementar datos
            if (strcookieEditarCliente.Equals("Nuevo"))
            {

                Usuario oUsuario = (Usuario)Session["Usuario"];
                oCliente.FechaAlta = DateTime.Now;
                oCliente.Estatus = "ALTA";
                oCliente.Usuario = oUsuario.ID;

                //Si el logo viene vacio lo dejamos con ""
                oCliente.RutaLogo = logo != null || !logo.Equals("") ? logo : "";

                //Valida si el campo no esta vacio para poder insertarlo de lo contrario lo deja nulo
                if (logo != null && !logo.Trim().Equals(""))
                {
                    string strDireccion = Server.MapPath(" ") + "\\images\\clientes\\" + oCliente.ID + "\\";
                    if (Directory.Exists(strDireccion))
                    {
                        fuImagenCliente.PostedFile.SaveAs(strDireccion + logo);
                    }
                    else
                    {
                        Directory.CreateDirectory(strDireccion);
                        fuImagenCliente.PostedFile.SaveAs(strDireccion + logo);
                    }
                }
               

                //Validamos que se inserte el id del codigo postal
                string strCP = Cookies.GetCookie("cookieCP").Value;
                //Si no esta vacio insertamos el cp
                if (!strCP.Trim().Equals(""))
                {
                    oCliente.RCodigoPostal = CodigoPostalBusiness.ObtenerCodigoPostalPorID(Cookies.GetCookie("cookieCP").Value);
                    oCliente.CodigoPostal = oCliente.RCodigoPostal.Id;
                }

                //Insertamos el cliente
                oCliente.ID = ClienteBusiness.Insertar(oCliente);
                //6. Mandar parametro (ID del Cliente)

            } 
            //Cuando actualizamo
            else 
            {
                //Id del cliente
                oCliente.ID = strcookieEditarCliente;
                //Referencia de los valores iniciales
                Cliente oClienteRef = ClienteBusiness.ObtenerClientePorID(strcookieEditarCliente);


                //Se valida que el codigo postal no este vacio
                string strCP = Cookies.GetCookie("cookieCP").Value;

                if (!strCP.Trim().Equals(""))
                {
                    oCliente.RCodigoPostal = CodigoPostalBusiness.ObtenerCodigoPostalPorID(Cookies.GetCookie("cookieCP").Value);
                    oCliente.CodigoPostal = oCliente.RCodigoPostal.Id;
                }



                //Si el upload file esta lleno cuando se actualiza se guarda la imagen en el directorio 
                if (!strImagen.Equals(""))
                {

                    string strDireccion = Server.MapPath(" ") + "\\images\\clientes\\" + oCliente.ID + "\\";
                    if (Directory.Exists(strDireccion))
                    {
                        fuImagenCliente.PostedFile.SaveAs(strDireccion + logo);
                    }
                    else
                    {
                        Directory.CreateDirectory(strDireccion);
                        fuImagenCliente.PostedFile.SaveAs(strDireccion + logo);
                    }
                    if (oClienteRef.RutaLogo != null)
                    {
                        File.Delete(strDireccion + oClienteRef.RutaLogo);
                    }

                    //llenamos el objeto con la ruta
                    oCliente.RutaLogo = logo;
                    //Mostramos la imagen
                    strDireccionDisplay = "images\\clientes\\" + oCliente.ID + "\\";
                    imgNormal.ImageUrl = strDireccionDisplay + oCliente.RutaLogo;
                }
                    //Si no se escoge otra imagen se deja la que ya estaba
                else {
                    oCliente.RutaLogo = oClienteRef.RutaLogo;

                    strDireccionDisplay = "images\\clientes\\" + oCliente.ID + "\\";
                    imgNormal.ImageUrl = strDireccionDisplay + oClienteRef.RutaLogo;
                }

                ClienteBusiness.Actualizar(oCliente);
                
            }

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

            string strDireccion = "images\\clientes\\" + oCliente.ID + "\\";

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
                RutaLogo = oCliente.RutaLogo,
                Elaboro = oCliente.Elaboro,
                Reviso = oCliente.Reviso,
                Autorizo = oCliente.Autorizo,
                Proveedor = oCliente.Proveedor
            }); 
            imgNormal.ImageUrl = strDireccion+oCliente.RutaLogo;
        }
    }
}