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
using Ionic.Zip;

namespace OSEF.ERP.APP
{
    public partial class FormaReporteOrdenCambioD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       
        }

        protected void imgbtnExportarCroquis_Click(object sender, EventArgs e)
        {
            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

          
                //Firmas documento(Parametros)
                string strElaboro = "";
                string strReviso = "";
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

                    ReportDocument reporteCroquis = new ReportDocument();
                    reporteCroquis.Load(Server.MapPath("reportess/rCroquisOC.rpt"));
                    reporteCroquis.SetDataSource(dt);
                    reporteCroquis.SetParameterValue("elaboro", strElaboro);
                    reporteCroquis.SetParameterValue("reviso", strReviso);
                    reporteCroquis.SetParameterValue("autorizo", strAutorizo);
                    reporteCroquis.SetParameterValue("path", path);

                    string strDireccion = Server.MapPath(" ") + "\\reportess\\OrdenesDeCambio\\" + strID;

                    //2. Validar si existe el directorio donde se guardaran
                    if (Directory.Exists(strDireccion))
                    {

                        reporteCroquis.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rCroquisOC " + strID + ".pdf"));
                        ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rCroquisOC " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                        // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                    }
                    else
                    {
                        Directory.CreateDirectory(strDireccion);
                        reporteCroquis.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rCroquisOC " + strID + ".pdf"));
                        ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rCroquisOC " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                    }


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

        protected void imgbtnExportarFotos_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;



            //Firmas documento(Parametros)
            string strElaboro = "";
            string strReviso = "";
            string strAutorizo = "";
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
                            reporteFotos.Load(Server.MapPath("reportess/rFotosOC.rpt"));
                            reporteFotos.SetDataSource(dt);
                            reporteFotos.SetParameterValue("elaboro", strElaboro);
                            reporteFotos.SetParameterValue("reviso", strReviso);
                            reporteFotos.SetParameterValue("autorizo", strAutorizo);
                            reporteFotos.SetParameterValue("pathFotos", path);

                            string strDireccion = Server.MapPath(" ") + "\\reportess\\OrdenesDeCambio\\" + strID;

                                 //2. Validar si existe el directorio donde se guardaran
                              if (Directory.Exists(strDireccion))
                              {

                                  reporteFotos.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rFotos " + strID + ".pdf"));
                                  ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rFotos " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                  // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);
                              
                              }
                              else
                              {
                                  Directory.CreateDirectory(strDireccion);
                                  reporteFotos.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rFotos " + strID + ".pdf"));
                                  ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rFotos " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                              }
                    
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


                //Firmas documento(Parametros)
                string strElaboro = "";
                string strReviso = "";
                string strAutorizo = "";
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

                            string strDireccion = Server.MapPath(" ") + "\\reportess\\OrdenesDeCambio\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteFacturas.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rNotaDeBitacora " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rNotaDeBitacora " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteFacturas.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rNotaDeBitacora " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rNotaDeBitacora " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }



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


                //Firmas documento(Parametros)
                string strElaboro = "";
                string strReviso = "";
                string strAutorizo = "";
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


                            string strDireccion = Server.MapPath(" ") + "\\reportess\\OrdenesDeCambio\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteGenerador.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rNumerosGeneradores " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rNumerosGeneradores " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteGenerador.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rNumerosGeneradores " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rNumerosGeneradores " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }

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

        protected void ExportarFin_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;


            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                SqlCommand comando = new SqlCommand("web_spS_ObtenerRCaratulaOC", conn);

                SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                DataTable dt = new DataTable();
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptador.SelectCommand.Parameters.Add(@"ID", SqlDbType.Int).Value = Convert.ToInt32(strID);
                           
                adaptador.Fill(dt);

                ReportDocument reporteCuadrila = new ReportDocument();
                reporteCuadrila.Load(Server.MapPath("reportess/PortadaOC.rpt"));
                reporteCuadrila.SetDataSource(dt);



                string strDireccion = Server.MapPath(" ") + "\\reportess\\OrdenesDeCambio\\" + strID;

                //2. Validar si existe el directorio donde se guardaran
                if (Directory.Exists(strDireccion))
                {

                    reporteCuadrila.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rFin49 " + strID + ".pdf"));
                    ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rFin49 " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                    // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                }
                else
                {
                    Directory.CreateDirectory(strDireccion);
                    reporteCuadrila.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/OrdenesDeCambio/" + strID + "/rFin49 " + strID + ".pdf"));
                    ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/OrdenesDeCambio/" + strID + "/rFin49 " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                }


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

        protected void crearZip(string url, string rutaGuarda, string ID)
        {

            try
            {
                //Listamos los archivos que trae el directorio
                DirectoryInfo directorySelected = new DirectoryInfo(url);
                List<FileInfo> fi = new List<FileInfo>(directorySelected.GetFiles());
                //Definimos le nombre que llevara nuestro archio comprimido
                string fileName = "OC Mov. " + ID + ".zip";
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
            finally
            {
                Response.End();
                Response.Close();
            }
        }

        protected void imgbtnTodo(object sender, EventArgs e)
        {
            string nOrden = Cookies.GetCookie("NOrden").Value;
            if (nOrden != null)
            {
                imgbtnExportarFotos_Click(sender, e);
                imgbtnExportarCroquis_Click(sender, e);
                imgbtnExportarFactura_Click(sender, e);
                imgbtnExportarGenerador_Click(sender, e);
                ExportarFin_Click(sender, e);

                crearZip(
                    Server.MapPath(" ") + "\\reportess\\OrdenesDeCambio\\" + Cookies.GetCookie("cookieEditarOrdenEstimacion").Value,
                    Server.MapPath(" ") + "\\reportess\\OrdenesDeCambio\\" + Cookies.GetCookie("cookieEditarOrdenEstimacion").Value + "\\", nOrden);
            }
        }

      
    }
}