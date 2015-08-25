using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;
using System.IO;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaProveedor : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //Llenar los combos de Estados y Municipios
            if (!X.IsAjaxRequest)
            {
                sEstados.DataSource = EstadoBusiness.ObtenerEstados();
                sEstados.DataBind();


                //sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipios();
                //sMunicipios.DataBind();

                //sColonias.DataSource = ColoniaBusiness.ObtenerColonias();
                //sColonias.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sProveedor_Load()
        {
            string strcookieEditarProveedor = Cookies.GetCookie("cookieEditarProveedor").Value;
            if (!strcookieEditarProveedor.Equals("Nuevo"))
            {
                Proveedor oProveedor = ProveedorBusiness.ObtenerProveedorPorID(strcookieEditarProveedor);
                string strDireccion = "images\\proveedores\\" + oProveedor.ID + "\\";
                sProveedor.Add(new
                {
                    ID = oProveedor.ID,
                    Nombre = oProveedor.Nombre,
                    RFC = oProveedor.RFC,
                    ContactoNombre = oProveedor.ContactoNombre,
                    ContactoAPaterno = oProveedor.ContactoAPaterno,
                    ContactoAMaterno = oProveedor.ContactoAMaterno,
                    Correo = oProveedor.Correo,
                    Calle = oProveedor.Calle,
                    EntreCalles = oProveedor.EntreCalles,
                    NoExterior = oProveedor.NoExterior,
                    NoInterior = oProveedor.NoInterior,
                    CodigoPostal = oProveedor.CodigoPostal,
                    Colonia = oProveedor.Colonia,
                    Estado = oProveedor.Estado,
                    Municipio = oProveedor.Municipio,
                    Rutalogo = oProveedor.Rutalogo
                });
                //if (oProveedor.Rutalogo != null || oProveedor.Rutalogo.ToString().Trim().Length <= 0)
                //{
                    imgLogo.ImageUrl = strDireccion + oProveedor.Rutalogo;
                //}else{   imgLogo.ImageUrl = strDireccion + oProveedor.Rutalogo;
                //}
            }
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }


        /// <summary>
        /// Evento que se lanza al seleccionar un municipio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strMunicipio = e.ExtraParams["valorMunicipio"];
            sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColonias.DataBind();
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];
            string strcookieEditarProveedor = Cookies.GetCookie("cookieEditarProveedor").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Proveedor oProveedor = new Proveedor();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del proveedor
                    case "txtfNombre":
                        oProveedor.Nombre = sd.Value;
                        break;
                    case "txtfRFC":
                        oProveedor.RFC = sd.Value;
                        break;
                    case "txtfContactoNombre":
                        oProveedor.ContactoNombre = sd.Value;
                        break;
                    case "txtfContactoAPaterno":
                        oProveedor.ContactoAPaterno = sd.Value;
                        break;
                    case "txtfContactoAMaterno":
                        oProveedor.ContactoAMaterno = sd.Value;
                        break;
                    case "txtfCorreo":
                        oProveedor.Correo = sd.Value;
                        break;
                    case "txtfCalle":
                        oProveedor.Calle = sd.Value;
                        break;
                    case "txtfEntreCalles":
                        oProveedor.EntreCalles = sd.Value;
                        break;
                    case "txtfNoExterior":
                        oProveedor.NoExterior = sd.Value;
                        break;
                    case "txtfNoInterior":
                        oProveedor.NoInterior = sd.Value;
                        break;
                    case "txtfCodigoPostal":
                        oProveedor.CodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbColonia":
                        oProveedor.Colonia = sd.Value;
                        break;
                    case "cmbEstado":
                        oProveedor.Estado = sd.Value;
                        break;
                    case "cmbMunicipio":
                        oProveedor.Municipio = sd.Value;
                        break;
                }
            }

            string logo = e.ExtraParams["logo"];
            string strImagen = fuImagenProveedor.FileName;
            string strDireccionDisplay;

            //4. Validar si es nuevo o es uno existente
            if (strcookieEditarProveedor.Equals("Nuevo"))
            {
                oProveedor.Rutalogo = logo != null || !logo.Equals("") ? logo : "";
                
                //5. Insertar en la base de datos
                oProveedor.ID = ProveedorBusiness.Insertar(oProveedor);
                if (logo != null && !logo.Trim().Equals(""))
                {
                    string strDireccion = Server.MapPath(" ") + "\\images\\proveedores\\" + oProveedor.ID + "\\";
                    if (Directory.Exists(strDireccion))
                    {
                        fuImagenProveedor.PostedFile.SaveAs(strDireccion + logo);
                    }
                    else
                    {
                        Directory.CreateDirectory(strDireccion);
                        fuImagenProveedor.PostedFile.SaveAs(strDireccion + logo);
                    }
                }
                //6. Mandar mensaje con el código del proveedor
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Registro completo", "<p align='center'>Proveedor registrado con ID: <br/>" + oProveedor.ID + ".</p>", success).Show();
            }
            else
            {
                oProveedor.ID = strcookieEditarProveedor;
                string strDireccion = Server.MapPath(" ") + "\\images\\proveedores\\" + oProveedor.ID + "\\";

                Proveedor oProveedorRef = ProveedorBusiness.ObtenerProveedorPorID(oProveedor.ID);
                //Si el upload file esta lleno cuando se actualiza se guarda la imagen en el directorio 
                if (!strImagen.Equals("") && !oProveedorRef.Rutalogo.ToString().Equals(logo))
                { 
                    if (Directory.Exists(strDireccion))
                    {
                        fuImagenProveedor.PostedFile.SaveAs(strDireccion + logo);
                    }else{ 
                        Directory.CreateDirectory(strDireccion);
                        fuImagenProveedor.PostedFile.SaveAs(strDireccion + logo);
                    }
                    if (oProveedorRef.Rutalogo != null)
                    {
                        File.Delete(strDireccion + oProveedorRef.Rutalogo);
                    }//llenamos el objeto con la ruta
                    oProveedor.Rutalogo = logo;
                    //Mostramos la imagen
                    strDireccionDisplay = "images\\proveedores\\" + oProveedor.ID + "\\";
                    imgLogo.ImageUrl = strDireccionDisplay + oProveedor.Rutalogo;
                }
                //Si no se escoge otra imagen se deja la que ya estaba
                else
                { 
                    oProveedor.Rutalogo = oProveedorRef.Rutalogo; 
                    strDireccionDisplay = "images\\proveedores\\" + oProveedor.ID + "\\";
                    imgLogo.ImageUrl = strDireccionDisplay + oProveedorRef.Rutalogo;
                }

                //7. Actualizar los datos del proveedor
                ProveedorBusiness.Actualizar(oProveedor);
                //8. Mandar mensaje con el código del proveedor
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos del proveedor <br/>" + oProveedor.ID + ".</p>", success).Show();
            }
        }
         
    }
}