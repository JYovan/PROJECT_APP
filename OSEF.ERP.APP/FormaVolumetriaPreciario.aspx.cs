using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;
using System.IO;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Configuration;

namespace OSEF.ERP.APP
{
    public partial class FormaVolumetriaPreciario : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Primer solicitud
            if (!X.IsAjaxRequest)
            {
                //2. Cargar sucursales
                //sPreciario.DataSource = PreciarioBusiness.ObtenerPreciarios();
                //sPreciario.DataBind();
            }
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strVolumetriaForma = e.ExtraParams["VolumetriaForma"];
            //string strVolumetria = e.ExtraParams["Volumetria"];
            string strID = e.ExtraParams["IDVolumetria"];
            string strSucursal = e.ExtraParams["Sucursal"];
            string strVolumetriaD = e.ExtraParams["VolumetriaD"];
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;

            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strVolumetriaForma);
            Volumetria oFormaVolumetria = ObtenerObjetoDesdeForma(dRegistro, strSucursal);
            //Volumetria oVolumetria = JSON.Deserialize<List<Volumetria>>(strVolumetria).FirstOrDefault();
            Volumetria oVolumetria = null;
            if (!strID.Equals("null"))
            {
                oVolumetria = VolumetriaBusiness.ObtenerVolumetriaPorID(Convert.ToInt32(strID));
            }
            List<VolumetriaD> lVolumetriaD = JSON.Deserialize<List<VolumetriaD>>(strVolumetriaD);

            //3. Guardar o Actuaizar el Movimiento
            string strAccion = GuardarMovimiento(ref oFormaVolumetria, oVolumetria, lVolumetriaD);

            //4. Validar que efecto realizará para Guardar o Afectar
            switch (strAccion)
            {
                case "insertar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "insertar", ParameterMode.Value));
                    break;
                case "modificar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "modificar", ParameterMode.Value));
                    break;
            }
        }





        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        [DirectMethod]
        public void imgbtnGuardarDirect_Click(string strID, string strVolumetriaD)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo  
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;

            //2. Serializar el encabezado y el detalle 
            //Volumetria oVolumetria = JSON.Deserialize<List<Volumetria>>(strVolumetria).FirstOrDefault();
            Volumetria oVolumetria = null;
            if (!strID.Equals("null"))
            {
                oVolumetria = VolumetriaBusiness.ObtenerVolumetriaPorID(Convert.ToInt32(strID));
                List<VolumetriaD> lVolumetriaD = JSON.Deserialize<List<VolumetriaD>>(strVolumetriaD);
                GuardarDetalleVolumetria(lVolumetriaD, oVolumetria);
            } 
        }


        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void sConceptos_OnReadData(object sender, StoreReadDataEventArgs e)
        {
            //Obtener la cookie al cargar
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;
            if (!strcookieEditarVolumetria.Equals("Nuevo"))
            {
                Volumetria oVolumetria = VolumetriaBusiness.ObtenerVolumetriaPorID(Convert.ToInt32(strcookieEditarVolumetria));
                sConceptos.DataSource = VolumetriaDBusiness.ObtenerVolumetriaDPorVolumetria(oVolumetria.ID);
                sConceptos.DataBind();
            }

        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sVolumetria_Load()
        {
            //Obtener la cookie al cargar
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;

            //Validar si es diferente de Nuevo
            if (!strcookieEditarVolumetria.Equals("Nuevo"))
            {
                //Cargar el encabezado del movimiento
                Volumetria oVolumetria = VolumetriaBusiness.ObtenerVolumetriaPorID(Convert.ToInt32(strcookieEditarVolumetria));

                //Cargar el detalle del movimiento
                  //Cargar el detalle del movimiento
                sConceptos.DataSource = VolumetriaDBusiness.ObtenerVolumetriaDPorVolumetria(oVolumetria.ID);
                sConceptos.DataBind();

                sVolumetria.Add(new
                {
                    ID = oVolumetria.ID,
                    Mov = oVolumetria.Mov,
                    MovID = oVolumetria.MovID,
                    Sucursal = oVolumetria.Sucursal,
                    FechaEmision = oVolumetria.FechaEmision,
                    Observaciones = oVolumetria.Observaciones,
                    Estatus = oVolumetria.Estatus,
                    Usuario = oVolumetria.Usuario,
                    Preciario = oVolumetria.Preciario,
                    RPreciario= oVolumetria.RPreciario,
                    RSucursal = oVolumetria.RSucursal,
                    Origen= oVolumetria.Origen,
                    OrigenID = oVolumetria.Origenid,
                    Cliente = oVolumetria.Cliente,
                    RCliente = oVolumetria.RCliente
                });
            }
        }

        /// <summary>
        /// Evento de clic del botón Afectar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnAfectar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strVolumetriaForma = e.ExtraParams["VolumetriaForma"];
            //string strVolumetria = e.ExtraParams["Volumetria"];
            string strID = e.ExtraParams["IDVolumetria"];
            string strSucursal = e.ExtraParams["sucursal"];
            string strVolumetriaD = e.ExtraParams["VolumetriaD"];
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;

            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strVolumetriaForma);
            Volumetria oVolumetriaForma = ObtenerObjetoDesdeForma(dRegistro, strSucursal);
            //Volumetria oVolumetria = JSON.Deserialize<List<Volumetria>>(strVolumetria).FirstOrDefault();
            Volumetria oVolumetria = null;
            if (!strID.Equals("null"))
            {
                oVolumetria = VolumetriaBusiness.ObtenerVolumetriaPorID(Convert.ToInt32(strID));
            }
            List<VolumetriaD> lVolumetriaD = JSON.Deserialize<List<VolumetriaD>>(strVolumetriaD);

            //3. Guardar o Actuaizar el Movimiento
            string strAccion = GuardarMovimiento(ref oVolumetriaForma, oVolumetria, lVolumetriaD);

            //4. Validar que efecto realizará para Guardar o Afectar
            switch (strAccion)
            {
                case "insertar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "insertar", ParameterMode.Value));
                    break;
                case "modificar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "modificar", ParameterMode.Value));
                    break;
            }

            //4. Lanzar la afectación del Movimiento
            VolumetriaBusiness.AfectarVolumetriaPorID(oVolumetriaForma);
            
            //Actualiza las cantidades despues de afectar
            foreach (VolumetriaD sd in lVolumetriaD)
            {
                PreciarioConceptoBusiness.Actualizar(sd.ConceptoID, sd.Utilizada, sd.Volumetria);
            }

            oVolumetria = VolumetriaBusiness.ObtenerVolumetriaPorID(oVolumetriaForma.ID);
            //7. Actualizar store de Revision
            sVolumetria.GetAt(0).Set("MovID", oVolumetria.MovID);
            sVolumetria.GetAt(0).Set("Estatus", oVolumetria.Estatus);
        }

        /// <summary>
        /// Método que transforma los datos Control-Valor a objeto Volumetria
        /// </summary>
        /// <param name="dRegistro"></param>
        /// <returns></returns>
        private Volumetria ObtenerObjetoDesdeForma(Dictionary<string, string> dRegistro, string strSucursal)
        {
            //1. Declarar objeto Volumetria donde se guardarán los valores
            Volumetria oVolumetriaForma = new Volumetria();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //4. Datos de la revisión
                    case "cmbMov":
                        oVolumetriaForma.Mov = sd.Value;
                        break;
                    case "cmbPreciario":
                        oVolumetriaForma.Preciario = sd.Value;
                        break;
                    case "dfFechaEmision":
                        oVolumetriaForma.FechaEmision = Convert.ToDateTime(sd.Value);
                        break;
                    case "txtfObservaciones":
                        oVolumetriaForma.Observaciones = sd.Value;
                        break;
                    case "IdCliente":
                        oVolumetriaForma.RCliente = ClienteBusiness.ObtenerClientePorID(sd.Value);
                        break;
                    case "txtCliente":
                        oVolumetriaForma.Cliente = sd.Value;
                        break;
                }
            }
            oVolumetriaForma.Estatus = "BORRADOR";
            oVolumetriaForma.Sucursal = strSucursal;
            //3. Regresar la Revision
            return oVolumetriaForma;
        }


        /// <summary>
        /// Evento que Guarda o actualiza un Movimiento
        /// </summary>
        /// <param name="oVolumetriaForma"></param>
        /// <param name="oVolumetria"></param>
        /// <param name="lVolumetriaD"></param>
        private string GuardarMovimiento(ref Volumetria oVolumetriaForma, Volumetria oVolumetria, List<VolumetriaD> lVolumetriaD)
        {
            
            //1. Lo que sucede cuando es nuevo y no se habia guardado
            if (oVolumetria == null)
            {
                //Checar ticket de autenticación
                UsuarioBusiness.checkValidSession(this);
                //2. Traemeos el objeto de sesion para llenr el objeto con los datos de usuario
                Usuario oUsuario = (Usuario)Session["Usuario"];
                oVolumetriaForma.Usuario = oUsuario.ID;

                //3. Actualizamos el Estatus e Insertar en la base de datos
                oVolumetriaForma.Estatus = "BORRADOR";
                oVolumetriaForma.ID = VolumetriaBusiness.insertarVolumetria(oVolumetriaForma);

                //4. Agregar el objeto al Store de Revisión
                sVolumetria.Add(new
                {
                    ID = oVolumetriaForma.ID,
                    Mov = oVolumetriaForma.Mov,
                    MovID = oVolumetriaForma.MovID,
                    Sucursal = oVolumetriaForma.Sucursal,
                    FechaEmision = oVolumetriaForma.FechaEmision,
                    Observaciones = oVolumetriaForma.Observaciones,
                    Preciario = oVolumetriaForma.Preciario,
                    RPreciario = oVolumetriaForma.RPreciario,
                    RSucursal = oVolumetriaForma.RSucursal,
                    Estatus = oVolumetriaForma.Estatus,
                    Usuario = oVolumetriaForma.Usuario,
                    //Cliente = oVolumetriaForma.Cliente,
                    RCliente = oVolumetriaForma.RCliente
                });

                //5. Guardar Detalle y regresar valor
                GuardarDetalleVolumetria(lVolumetriaD, oVolumetriaForma);
                return "insertar";
            }
            else
            {
                //6. Complementar datos y actualizar encabezado

                oVolumetriaForma.ID = oVolumetria.ID;
                //if (oVolumetriaForma.Cliente == null)
                //{
                //    oVolumetriaForma.Cliente = "";
                //    oVolumetria.RCliente.ID = "";
                //}
                VolumetriaBusiness.actualizarVolumetria(oVolumetriaForma);

                //7. Actualizar store de Revision
                sVolumetria.GetAt(0).Set("Mov", oVolumetriaForma.Mov);
                sVolumetria.GetAt(0).Set("Sucursal", oVolumetriaForma.Sucursal);
                sVolumetria.GetAt(0).Set("Preciario", oVolumetriaForma.Preciario);
                sVolumetria.GetAt(0).Set("FechaEmision", oVolumetriaForma.FechaEmision);
                sVolumetria.GetAt(0).Set("Observaciones", oVolumetriaForma.Observaciones);
                //sVolumetria.GetAt(0).Set("Cliente", oVolumetriaForma.Cliente);

                //8. Borrar todo el detalle e insertarlo de nuevo
                VolumetriaDBusiness.BorrarPorVolumetria(oVolumetriaForma.ID);
                GuardarDetalleVolumetria(lVolumetriaD, oVolumetriaForma);

                //9. Regresar valor
                return "modificar";
            }
        }

        /// <summary>
        /// Evento que Guarda el detalle de Volumetrias
        /// </summary>
        /// <param name="lRevisionD"></param>
        /// <param name="oRevisionForma"></param>
        private void GuardarDetalleVolumetria(List<VolumetriaD> lVolumetriaD, Volumetria oVolumetriaForma)
        {
            //1. Insertar los datos del detalle
            foreach (VolumetriaD sd in lVolumetriaD)
            {
                //2. Validar que el objeto no venga en blanco
                if (sd.ConceptoID.Equals(string.Empty) && sd.Cantidad == 0 && sd.Utilizada == 0)
                    continue;
                else
                {
                    sd.Volumetria = oVolumetriaForma.ID;
                    VolumetriaDBusiness.Insertar(sd);
                    PreciarioConceptoBusiness.Actualizar(sd.ConceptoID,sd.Utilizada,sd.Volumetria);
                }
            }
        }

        /// <summary>
        /// Evento que se lanza al escoger un elemento de Preciarios
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbPreciarios_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el Preciario seleccionado y obtener sus datos junto con su sucursal
            string strPreciarios = e.ExtraParams["valor"];

            //2. Validar si se escocoge una usucursal ya usada
            //if (VolumetriaBusiness.ObtenerPreciariosActivosPorID(strPreciarios))
            //{
            //    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));
            //}
            //else
            //{
                //e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
            if (strPreciarios != null & !strPreciarios.Trim().Equals(""))
            {
                Preciario oPreciario = PreciarioBusiness.ObtenerPreciarioPorID(strPreciarios);
                //sPreciarioConcepto.DataSource = PreciarioConceptoBusiness.ObtenerPreciarioConceptoPorPreciario(strPreciarios);
                //sPreciarioConcepto.DataBind();
                //}
            }
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        protected void imgbtnBorrar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere eliminar
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;
            int strID = Convert.ToInt32(strcookieEditarVolumetria);
            //Borra de la base de datos el encabezado, detalle y fotos
            borrarImagenesPorMovimiento(strID);
            //VolumetriaBusiness.BorrarVolumetriaAfectaPreciario(strID);
            VolumetriaDBusiness.BorrarPorVolumetria(strID);
            VolumetriaBusiness.Borrar(strID);           
        }

        /// <summary>
        /// Método para cancelar un registro
        /// </summary>
        /// <param name="strID"></param>
        protected void imgbtnCancelar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere cancelar
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;
            int strID = Convert.ToInt32(strcookieEditarVolumetria);
            //Cambia el estatus del movimiento
            VolumetriaBusiness.CancelaVolumetriaPorID(strID);
            //Aqui se mandaria llamar el mismo sp para cancelar el preciario y devolverlo a sus cantidades iniciales
        }

        /// <summary>
        /// Método para obtener las fotos del renglon y borrarlas cuando se cambie el concepto o se elimine
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void obtenerImagenesPorConcepto()
        {
            //1. Obtener el ID del movimiento y el concepto
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieIDBorrarFotosVolumetria").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoFotosVolumetria").Value;
            string strDireccion = Server.MapPath(" ") + "\\imagesVolumetrias\\" + iID + "\\" + strConcepto;

            //2. Validar si existe el directorio donde se guardaran las imagenes
            if (Directory.Exists(strDireccion))
            {
                try
                {
                    System.IO.Directory.Delete(strDireccion, true);
                }

                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                }
            }    
                //3. Borrar en la base de datos
                ImagenVolumetriaDBusiness.BorrarImagenesVolumetria(iID, strConcepto);
                GeneradorVolumetriaDBusiness.BorrarGeneradorVolumetriaDPorConcepto(iID, strConcepto);
        }

        /// <summary>
        /// Método para borrar las imagenes si se borra el movimiento completo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void borrarImagenesPorMovimiento(int strID)
        {
            //1. Obtener el ID del movimiento
            string strDireccion = Server.MapPath(" ") + "\\imagesVolumetrias\\" + strID;

            //2. Validar si existe el directorio donde se guardaran las imagenes
            if (Directory.Exists(strDireccion))
            {
                try
                {
                    System.IO.Directory.Delete(strDireccion, true);
                }

                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                }
            }

            //3. Borrar en la base de datos
            ImagenVolumetriaDBusiness.BorrarImagenesVolumetriaPorID(strID);
            GeneradorVolumetriaDBusiness.BorrarGeneradorVolumetriaDPorID(strID);
            
        }

        //CargaConceptosAyuda
        protected void imgBtnPreciarioPrueba_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener el Preciario seleccionado y obtener sus datos junto con su sucursal
            string strPreciarios = e.ExtraParams["preciario"];
            Session["preciario"] = strPreciarios;
        }

        [DirectMethod]
        public bool onLoadPreciarios(string cliente)
        {
            List<Preciario> lPreciarios = PreciarioBusiness.ObtenerPreciariosActivosPorCliente(cliente);
            var success = new JFunction { Fn = "onBuscar_Sucursal" };
            if (lPreciarios.Count() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Método para obtener el PreciarioConcepto
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public static PreciarioConcepto ObtenerPreciarioConceptoPorID(string strID)
        {
            PreciarioConcepto pc = PreciarioConceptoBusiness.ObtenerPreciarioConceptoPorID(strID);
            if (pc != null)
            {
                return pc;
            }
            else
            {
                return null;
            }
        }

        [DirectMethod]
        public void PDirect(string strID)
        {
            var success = new JFunction { Fn = "onResult_From_Direct" };
            X.Msg.Alert("ATENCIÓN", "<p align='center'>EVENTO DESDE UN DIRECT CHILD: "+strID+"</p>", success).Show();

        }

        #region VistaPrevia

        protected void imgbtnVistaPreviaReporteVolumetrias_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarVolumetria").Value;
            string strPreciario = Cookies.GetCookie("cookiePreciario").Value;

      

        

            string path = AppDomain.CurrentDomain.BaseDirectory;
            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                using (var comando = new SqlCommand("web_spS_ObtenerCambiosPreciarioPorVolumetria", conn))
                {
                    using (var adaptador = new SqlDataAdapter(comando))
                    {
                        DataTable dt = new DataTable();
                        adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                        adaptador.SelectCommand.Parameters.Add(@"idpreciario", SqlDbType.NVarChar).Value = strPreciario;
                        adaptador.SelectCommand.Parameters.Add(@"Volumetria", SqlDbType.Int).Value = Convert.ToInt32(strID);
                        adaptador.Fill(dt);


                        var reporte = new ReportDocument();
                        reporte.Load(Server.MapPath("reportess/CPreciarioV.rpt"));
                        reporte.SetDataSource(dt);
                        reporte.SetParameterValue("path", path);
                        reporte.SetParameterValue("pathlogo", path+"\\images\\clientes\\");
                      
                        string strDireccion = Server.MapPath(" ") + "\\reportess\\Volumetrias\\" + strID;

                        //2. Validar si existe el directorio donde se guardaran
                        if (Directory.Exists(strDireccion))
                        {
                            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Volumetrias/" + strID + "/Volumetria " + strID + ".pdf"));

                            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Volumetrias/" + strID + "/Volumetria " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                           // reporte.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Resumen de OC: ");

                        }
                        else
                        {
                            Directory.CreateDirectory(strDireccion);
                            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Volumetrias/" + strID + "/Volumetria " + strID + ".pdf"));
                            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Volumetrias/" + strID + "/Volumetria " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                        }
                        reporte.Dispose();
                        reporte.Close();
                    } // end using adaptador
                } // end using comando

            }

            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                if (conn.State != ConnectionState.Closed)
                    conn.Close();
                conn.Dispose();
            }
        }

        #endregion
    }
}