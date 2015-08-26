using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.IO;
using OSEF.APP.EL;
using OSEF.APP.BL;
using System.IO.Compression;
using Ionic.Zip;


namespace OSEF.ERP.APP
{
    public partial class FormaReporteEstimacion : System.Web.UI.Page
    {

        /// <summary>
        /// Se produce al principio de la inicialización de la página.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_PreInit(object sender, EventArgs e)
        {
          
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            // Checar ticket de autenticación
            UsuarioBusiness.checkValidSession(this);
            string nReporte = Cookies.GetCookie("NReporte").Value;
            if (nReporte != null && nReporte.Trim().Length > 0)
            {
                imgbtnTodos.Enabled = true;
            }
            else
            {
                imgbtnTodos.Enabled = false;
            }
            
        }

        protected void imgbtnExportarCroquis_Click(object sender, EventArgs e)
        {
            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value; 
          
     

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso ="";
                string strAutorizo = "";

                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {


                    SqlCommand comando = new SqlCommand("web_spS_ObtenerCroquisPorIDMovimiento", conn);

                    SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                    DataTable dt = new DataTable();
                    adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                    adaptador.Fill(dt);


                    SqlCommand comando2 = new SqlCommand("web_spS_ObtenerGeneradorPorMovimiento", conn);
                    SqlDataAdapter adaptador2 = new SqlDataAdapter(comando2);

                    DataTable dt2 = new DataTable();
                    adaptador2.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adaptador2.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                    adaptador2.Fill(dt2);

                    ReportDocument reporteCroquis = new ReportDocument();
                    reporteCroquis.Load(Server.MapPath("reportess/rCroquis.rpt"));
                    reporteCroquis.SetDataSource(dt);
                    reporteCroquis.Subreports[0].SetDataSource(dt2);
                    reporteCroquis.SetParameterValue("elaboro", strElaboro);
                    reporteCroquis.SetParameterValue("reviso", strReviso);
                    reporteCroquis.SetParameterValue("autorizo", strAutorizo);
                    reporteCroquis.SetParameterValue("path", path);
                    reporteCroquis.SetParameterValue("pathlogo", Server.MapPath(" ") + "\\images\\clientes\\");

                    string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                    //2. Validar si existe el directorio donde se guardaran
                    if (Directory.Exists(strDireccion))
                    {

                        reporteCroquis.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rCroquis " + strID + ".pdf"));
                        ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rCroquis " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                        // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                    }
                    else
                    {
                        Directory.CreateDirectory(strDireccion);
                        reporteCroquis.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rCroquis " + strID + ".pdf"));
                        ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rCroquis " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                    }
                    reporteCroquis.Dispose();
                    reporteCroquis.Close();

                }
                catch (Exception ex)
                {
                    throw new Exception("Error " + ex.Message);
                }
                finally
                {
                    if (conn.State != ConnectionState.Closed)
                        conn.Close();
                    conn.Dispose();
                }

        }

        protected void imgbtnExportarFotos_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value; 

              FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;


                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {
                    using (var comando = new SqlCommand("web_spS_ObtenerImagenesPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);


                            var reporteFotos = new ReportDocument();
                            reporteFotos.Load(Server.MapPath("reportess/rFotos.rpt"));
                            reporteFotos.SetDataSource(dt);
                            reporteFotos.SetParameterValue("elaboro", strElaboro);
                            reporteFotos.SetParameterValue("reviso", strReviso);
                            reporteFotos.SetParameterValue("autorizo", strAutorizo);
                            reporteFotos.SetParameterValue("pathFotos", path);
                            reporteFotos.SetParameterValue("pathlogo", Server.MapPath(" ") + "\\images\\clientes\\");
                             
                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteFotos.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rFotos " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rFotos " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteFotos.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rFotos " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rFotos " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }
                            reporteFotos.Dispose();
                            reporteFotos.Close();
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

        protected void imgbtnExportarFactura_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value; 

              FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;

                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerFacturasPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteFacturas = new ReportDocument();
                            reporteFacturas.Load(Server.MapPath("reportess/rNotaDeBitacora.rpt"));
                            reporteFacturas.SetDataSource(dt);
                            reporteFacturas.SetParameterValue("elaboro", strElaboro);
                            reporteFacturas.SetParameterValue("reviso", strReviso);
                            reporteFacturas.SetParameterValue("autorizo", strAutorizo);
                            reporteFacturas.SetParameterValue("pathFact", path);
                            reporteFacturas.SetParameterValue("pathlogo", Server.MapPath(" ") + "\\images\\clientes\\");

                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteFacturas.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rNotaDeBitacora " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rNotaDeBitacora " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteFacturas.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rNotaDeBitacora " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rNotaDeBitacora " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }
                            reporteFacturas.Dispose();
                            reporteFacturas.Close();

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

        protected void imgbtnExportarGenerador_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value; 

            FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                //Checar ticket de autenticación
                UsuarioBusiness.checkValidSession(this);

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;
                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {



                    using (var comando = new SqlCommand("web_spS_ObtenerGeneradorPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteGenerador = new ReportDocument();
                            reporteGenerador.Load(Server.MapPath("reportess/rNumerosGeneradores.rpt"));
                            reporteGenerador.SetDataSource(dt);
                            reporteGenerador.SetParameterValue("elaboro", strElaboro);
                            reporteGenerador.SetParameterValue("reviso", strReviso);
                            reporteGenerador.SetParameterValue("autorizo", strAutorizo);
                            reporteGenerador.SetParameterValue("pathlogo", Server.MapPath(" ") + "\\images\\clientes\\");

                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteGenerador.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rNumerosGeneradores " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rNumerosGeneradores " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteGenerador.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rNumerosGeneradores " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rNumerosGeneradores " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }
                            reporteGenerador.Dispose();
                            reporteGenerador.Close();
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

        protected void imgbtnEstimacion_click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value; 
            
            
            FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;
                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {



                    using (var comando = new SqlCommand("web_spS_ObtenerREstimacion", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteEstimaciones= new ReportDocument();
                            reporteEstimaciones.Load(Server.MapPath("reportess/rCaratulaDeEstimacion.rpt"));
                            reporteEstimaciones.SetDataSource(dt);
                            reporteEstimaciones.SetParameterValue("elaboro", strElaboro);
                            reporteEstimaciones.SetParameterValue("reviso", strReviso);
                            reporteEstimaciones.SetParameterValue("autorizo", strAutorizo);
                            reporteEstimaciones.SetParameterValue("pathlogo", Server.MapPath(" ") + "\\images\\clientes\\");


                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rCaratulaDeEstimacion " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rCaratulaDeEstimacion " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rCaratulaDeEstimacion " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rCaratulaDeEstimacion " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }
                            reporteEstimaciones.Dispose();
                            reporteEstimaciones.Close();
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

        protected void imgbtnResumen_click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value; 

              FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;
                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerResumenDePartidasPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteEstimaciones = new ReportDocument();
                            reporteEstimaciones.Load(Server.MapPath("reportess/rResumenPartidas.rpt"));
                            reporteEstimaciones.SetDataSource(dt);
                            reporteEstimaciones.SetParameterValue("reviso", strReviso);
                            reporteEstimaciones.SetParameterValue("autorizo", strAutorizo);
                            reporteEstimaciones.SetParameterValue("pathlogo", Server.MapPath(" ") + "\\images\\clientes\\");
                            reporteEstimaciones.SetParameterValue("pathlogopro", Server.MapPath(" ") + "\\images\\proveedores\\");



                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rResumenPartidas " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rResumenPartidas " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rResumenPartidas " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rResumenPartidas " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }
                            reporteEstimaciones.Dispose();
                            reporteEstimaciones.Close();
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

        protected void imgbtnPresupuesto_click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

            FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");
            string strReviso = oFirmas.FirmaReviso;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {
                    using (var comando = new SqlCommand("web_spS_ObtenerREstimacion", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteEstimaciones = new ReportDocument();
                            reporteEstimaciones.Load(Server.MapPath("reportess/rPresupuesto.rpt"));
                            reporteEstimaciones.SetDataSource(dt);
                            reporteEstimaciones.SetParameterValue("reviso", strReviso);

                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rPresupuesto " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rPresupuesto " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rPresupuesto " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rPresupuesto " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }
                            reporteEstimaciones.Dispose();
                            reporteEstimaciones.Close();
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

        protected void crearZip(string url,string rutaGuarda,string ID)
        {

            try
            {
                //Listamos los archivos que trae el directorio
                DirectoryInfo directorySelected = new DirectoryInfo(url);
                List<FileInfo> fi = new List<FileInfo>(directorySelected.GetFiles());
                //Definimos le nombre que llevara nuestro archio comprimido
                string fileName = "Reportes Mov. "+ ID + ".zip";
                //Limpiamos le stream
                Response.Clear();
                //Metenmos la lista de archivos que contiene el directorio en una lista de tipo string
                List<string> lista = new List<string>();

                foreach (FileInfo fileToString in fi)
                {
                    //Le concatenamos la ruta donde se va a leer el archivo
                    lista.Add(rutaGuarda + fileToString.ToString());
                }
                //Creamos el archivo
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.ContentType = "application/x-zip-compressed";
                //Llenamos le archivo con la lista
                using (ZipFile zip = new ZipFile())
                {
                    zip.AddFiles(lista, ID);
                    zip.Save(Response.OutputStream);
                }
            }
            catch (System.Exception ex)
            {
                throw new Exception("Error " + ex.Message);
                
            }
            finally {
                Response.End();
                Response.Close();
            }
        }

        protected void imgbtnTodo(object sender, EventArgs e)
        {
            string nReporte = Cookies.GetCookie("NReporte").Value;
            if (nReporte != null)
            {
                imgbtnExportarFotos_Click(sender, e);
                imgbtnPresupuesto_click(sender, e);
                imgbtnExportarCroquis_Click(sender, e);
                imgbtnExportarFactura_Click(sender, e);
                imgbtnExportarGenerador_Click(sender, e);
                imgbtnEstimacion_click(sender, e);
                imgbtnResumen_click(sender, e);
                crearZip(Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + Cookies.GetCookie("cookieEditarOrdenEstimacion").Value, Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + Cookies.GetCookie("cookieEditarOrdenEstimacion").Value + "\\", nReporte);
            }
        }
        //END
    }
}