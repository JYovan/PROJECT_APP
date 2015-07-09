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



        //Exporta a Excel el grid
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



      
    }
}