using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaSucursales : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            ////Llenar los combos de Estados y Municipios
            if (!X.IsAjaxRequest)
            {
            //    sEstados.DataSource = EstadoBusiness.ObtenerEstados();
            //    sEstados.DataBind();

            //    //sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipios();
            //    //sMunicipios.DataBind();

            //    //sColonias.DataSource = ColoniaBusiness.ObtenerColonias();
            //    //sColonias.DataBind();

            sProveedores.DataSource = ProveedorBusiness.ObtenerProveedores();
            sProveedores.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sSucursal_Load()
        {
            string strcookieEditarSucursal = Cookies.GetCookie("cookieEditarSucursal").Value;
            if (!strcookieEditarSucursal.Equals("Nuevo"))
            {
                Sucursal oSucursal = SucursalBusiness.ObtenerSucursalPorID(strcookieEditarSucursal);
                sSucursal.Add(new
                {
                    ID = oSucursal.ID,
                    CR = oSucursal.CR,
                    Nombre = oSucursal.Nombre,
                    DireccionZona = oSucursal.Direccionzona,
                    GerenteBBVANombre = oSucursal.GerenteBBVANombre,
                    GerenteBBVAAPaterno = oSucursal.GerenteBBVAAPaterno,
                    GerenteBBVAAMaterno = oSucursal.GerenteBBVAAMaterno,
                    SupervisorNombre = oSucursal.SupervisorNombre,
                    SupervisorAPaterno = oSucursal.SupervisorAPaterno,
                    SupervisorAMaterno = oSucursal.SupervisorAMaterno,
                    ProveedorEnergia = oSucursal.ProveedorEnergia,
                    Superficie = oSucursal.Superficie,
                    CoordinadorNombre = oSucursal.CoordinadorNombre,
                    CoordinadorAPaterno = oSucursal.CoordinadorAPaterno,
                    CoordinadorAMaterno = oSucursal.CoordinadorAMaterno,
                    Calle = oSucursal.Calle,
                    EntreCalles = oSucursal.EntreCalles,
                    NoExterior = oSucursal.NoExterior,
                    NoInterior = oSucursal.NoInterior,

                    CodigoPostal = oSucursal.CodigoPostal,
                    Colonia = oSucursal.Colonia,
                    Estado = oSucursal.Estado,
                    Municipio = oSucursal.Municipio,

                    RCodigopostal = oSucursal.RCodigopostal,
                    RColonia = oSucursal.RColonia,
                    REstado =oSucursal.REstado,
                    RMunicipio = oSucursal.RMunicipio,

                    Contratista = oSucursal.Contratista,
                    InicioObra = oSucursal.InicioObra,
                    FinObra = oSucursal.FinObra,
                    SemanasObra = oSucursal.SemanasObra,
                    FechaAlta = oSucursal.FechaAlta,
                    Estatus = oSucursal.Estatus,
                    RProvedor= oSucursal.RProvedor,
                    TipoConcepto = oSucursal.TipoConcepto,
                    EmpresaSupervisora = oSucursal.EmpresaSupervisora,
                    TipoObra = oSucursal.TipoObra,
                    Cliente = oSucursal.Cliente
                }); 
            }
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            //sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            //sMunicipios.DataBind();
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
            string strEstatus = e.ExtraParams["estatus"];
            string strFinObra = e.ExtraParams["FInObra"];
            string strSemanasObra = e.ExtraParams["semanasObra"];

            string strcookieEditarSucursal = Cookies.GetCookie("cookieEditarSucursal").Value;

           

            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Sucursal oSucursal = new Sucursal();
            oSucursal.FechaAlta = DateTime.Now;


            string strcookieCP = "";
            string strcookieMunicipio = "";
            string strcookieEstado = "";
            string strcookieColonia = "";

            if (strcookieEditarSucursal.Equals("Nuevo"))
            {

                strcookieCP = Cookies.GetCookie("cookieCP").Value;
                strcookieMunicipio = Cookies.GetCookie("cookieMunicipio").Value;
                strcookieEstado = Cookies.GetCookie("cookieEstado").Value;
                strcookieColonia = Cookies.GetCookie("cookieColonia").Value;
                oSucursal.CodigoPostal = strcookieCP;
                oSucursal.Colonia = strcookieColonia;
                oSucursal.Estado = strcookieEstado;
                oSucursal.Municipio = strcookieMunicipio;
            }
            else {
                strcookieCP = Cookies.GetCookie("cookieCP").Value;
                strcookieMunicipio = Cookies.GetCookie("cookieMunicipio").Value;
                strcookieEstado = Cookies.GetCookie("cookieEstado").Value;
                strcookieColonia = Cookies.GetCookie("cookieColonia").Value; 
                if (strcookieCP.Length > 0)
                {
                    oSucursal.CodigoPostal = strcookieCP;
                    oSucursal.Colonia = strcookieColonia;
                    oSucursal.Estado = strcookieEstado;
                    oSucursal.Municipio = strcookieMunicipio;
                } else {
                    Sucursal oSucursalForma = SucursalBusiness.ObtenerSucursalPorID(strcookieEditarSucursal); 
                    if (oSucursal != null)
                    {
                        oSucursal.CodigoPostal = oSucursalForma.CodigoPostal;
                        oSucursal.Colonia = oSucursalForma.Colonia;
                        oSucursal.Estado = oSucursalForma.Estado;
                        oSucursal.Municipio = oSucursalForma.Municipio;
                    } 
                }

            }
            
            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del proveedor
                    case "nfCR":
                        oSucursal.CR = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfNombre":
                        oSucursal.Nombre = sd.Value;
                        break;
                    case "txtfDireccionZona":
                        oSucursal.Direccionzona = sd.Value;
                        break;
                    case "txtfGerenteBBVANombre":
                        oSucursal.GerenteBBVANombre = sd.Value;
                        break;
                    case "txtfGerenteBBVAAPaterno":
                        oSucursal.GerenteBBVAAPaterno = sd.Value;
                        break;
                    case "txtfGerenteBBVAAMaterno":
                        oSucursal.GerenteBBVAAMaterno = sd.Value;
                        break;
                    case "txtfSupervisorNombre":
                        oSucursal.SupervisorNombre = sd.Value;
                        break;
                    case "txtfSupervisorAPaterno":
                        oSucursal.SupervisorAPaterno = sd.Value;
                        break;
                    case "txtfSupervisorAMaterno":
                        oSucursal.SupervisorAMaterno = sd.Value;
                        break;
                    case "txtfProveedorEnergia":
                        oSucursal.ProveedorEnergia = sd.Value;
                        break;
                    case "nfSuperficie":
                        oSucursal.Superficie = Convert.ToInt32(sd.Value);
                        break;
                    case "txtfCoordinadorNombre":
                        oSucursal.CoordinadorNombre = sd.Value;
                        break;
                    case "txtfCoordinadorAPaterno":
                        oSucursal.CoordinadorAPaterno = sd.Value;
                        break;
                    case "txtfCoordinadorAMaterno":
                        oSucursal.CoordinadorAMaterno = sd.Value;
                        break;
                    case "txtfCalle":
                        oSucursal.Calle = sd.Value;
                        break;
                    case "txtfEntreCalles":
                        oSucursal.EntreCalles = sd.Value;
                        break;
                    case "txtfNoExterior":
                        oSucursal.NoExterior = sd.Value;
                        break;
                    case "txtfNoInterior":
                        oSucursal.NoInterior = sd.Value;
                        break;
                    //case "txtfCodigoPostal":
                    //    oSucursal.CodigoPostal = Convert.ToInt32(sd.Value);
                    //    break;
                    //case "cmbColonia":
                    //    oSucursal.Colonia = sd.Value;
                    //    break;
                    //case "cmbEstado":
                    //    oSucursal.Estado = sd.Value;
                    //    break;
                    //case "cmbMunicipio":
                    //    oSucursal.Municipio = sd.Value;
                    //    break;
                    case "cmbProveedor":
                        oSucursal.Contratista = sd.Value;
                        break;
                    case "dfInicioObra":
                        oSucursal.InicioObra = Convert.ToDateTime(sd.Value);
                        break;
                    case "dfFechaAlta":
                        oSucursal.FechaAlta = Convert.ToDateTime(sd.Value);
                        break;
                    case "cmbEstatus":
                        oSucursal.Estatus = sd.Value;
                        break;
                    case "cmbEmpresaSupervisora":
                        oSucursal.EmpresaSupervisora = sd.Value == null || sd.Value.Equals("") ? "" : sd.Value;
                        break;
                    case "cmbTipoConcepto":
                        oSucursal.TipoConcepto = sd.Value == null || sd.Value.Equals("") ? "" : sd.Value;
                        break;
                    case "txtTipoObra":
                        oSucursal.TipoObra = sd.Value == null || sd.Value.Equals("") ? "" : sd.Value;
                        break;
                }
            }
            oSucursal.FinObra = Convert.ToDateTime(strFinObra);
            oSucursal.SemanasObra = Convert.ToInt16(strSemanasObra);
            string strcookieCliente = Cookies.GetCookie("cookieEditarCliente").Value != null || Cookies.GetCookie("cookieEditarCliente").Value.Length > 0 ? Cookies.GetCookie("cookieEditarCliente").Value : "";
            oSucursal.Cliente = strcookieCliente;

            if(strcookieCliente != null && !strcookieCliente.Equals("")){
                oSucursal.Cliente = strcookieCliente;
            }
            //4. Validar si es nuevo o es uno existente
            if (strcookieEditarSucursal.Equals("Nuevo"))
            {
                //5. Insertar en la base de datos
                oSucursal.FechaAlta = DateTime.Now;
                oSucursal.Estatus = "ALTA";

                if (SucursalBusiness.ObtenerCREnSucursales(oSucursal.CR, strcookieCliente))
                {
                    var success = new JFunction { Fn = "imgbtnGuardar_Click_SuccessCR" };
                    X.Msg.Alert("Alerta", "<p align='center'>El cliente ya posee esta sucursal registrada con CR: <br/>" + oSucursal.CR + ".</p>", success).Show();
                }else{
                    oSucursal.ID = SucursalBusiness.Insertar(oSucursal);
                    //6. Mandar mensaje con el código del proveedor
                    var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                    X.Msg.Alert("Registro completo", "<p align='center'>Sucursal registrada con ID: <br/>" + oSucursal.ID + ".</p>", success).Show();
                }
            }
            else
            {
                oSucursal.ID = strcookieEditarSucursal;
                oSucursal.Estatus = strEstatus;
                //7. Actualizar los datos del proveedor
                SucursalBusiness.Actualizar(oSucursal);
                //8. Mandar mensaje con el código del proveedor
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos de la sucursal <br/>" + oSucursal.ID + ".</p>", success).Show();
            }
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
            //sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            //sColonias.DataBind();
        }



    }
}