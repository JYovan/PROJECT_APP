using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using Ext.Net;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace OSEF.ERP.APP
{
    public partial class Previa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
     
           
        }


        protected void imgbtnExportarReporteVolumetrias_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieConceptoID").Value;
            string strPreciario = Cookies.GetCookie("cookiePreciario").Value;
            

          
            string path = AppDomain.CurrentDomain.BaseDirectory;
            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                using (var comando = new SqlCommand("web_spS_ObtenerCambiosPreciario", conn))
                {
                    using (var adaptador = new SqlDataAdapter(comando))
                    {
                        DataTable dt = new DataTable();
                        adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                        adaptador.SelectCommand.Parameters.Add(@"idconcepto", SqlDbType.NVarChar).Value = strID;
                        adaptador.SelectCommand.Parameters.Add(@"idpreciario", SqlDbType.NVarChar).Value = strPreciario;
                        adaptador.Fill(dt);


                        var reporte = new ReportDocument();
                        reporte.Load(Server.MapPath("reportess/CPreciario.rpt"));
                        reporte.SetDataSource(dt);
                        reporte.SetParameterValue("path", path);
                        reporte.SetParameterValue("pathlogo", Server.MapPath(" ")+"\\images\\clientes\\");

                        string strDireccion = Server.MapPath(" ") + "\\reportess\\Volumetrias\\" + strID;

                        //2. Validar si existe el directorio donde se guardaran
                        if (Directory.Exists(strDireccion))
                        {

                            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Volumetrias/" + strID + "/Volumetria " + strID + ".pdf"));
                            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Volumetrias/" + strID + "/Volumetria " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

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


        protected void imgbtnExportarReporteGeneradorVolumetrias_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieConceptoID").Value;
            string strPreciario = Cookies.GetCookie("cookiePreciario").Value;



            string path = AppDomain.CurrentDomain.BaseDirectory;
            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                using (var comando = new SqlCommand("web_spS_ObtenerRGeneradorPorVolumetriaConcepto", conn))
                {
                    using (var adaptador = new SqlDataAdapter(comando))
                    {
                        DataTable dt = new DataTable();
                        adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                        adaptador.SelectCommand.Parameters.Add(@"idconcepto", SqlDbType.NVarChar).Value = strID;
                        adaptador.SelectCommand.Parameters.Add(@"idpreciario", SqlDbType.NVarChar).Value = strPreciario;
                        adaptador.Fill(dt);


                        var reporte = new ReportDocument();
                        reporte.Load(Server.MapPath("reportess/rGeneradorVolumetriasConcepto.rpt"));
                        reporte.SetDataSource(dt);
                        reporte.SetParameterValue("pathlogo", Server.MapPath(" ") + "\\images\\clientes\\");
                       

                        string strDireccion = Server.MapPath(" ") + "\\reportess\\Volumetrias\\" + strID;

                        //2. Validar si existe el directorio donde se guardaran
                        if (Directory.Exists(strDireccion))
                        {

                            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Volumetrias/" + strID + "/VolumetriaGeneradorConcepto " + strID + ".pdf"));
                            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Volumetrias/" + strID + "/VolumetriaGeneradorConcepto " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                        }
                        else
                        {
                            Directory.CreateDirectory(strDireccion);
                            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Volumetrias/" + strID + "/VolumetriaGeneradorConcepto " + strID + ".pdf"));
                            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Volumetrias/" + strID + "/VolumetriaGeneradorConcepto " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
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



        protected void imgbtnVistaPreviaCroquisVolumetriasConcepto_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieConceptoID").Value;
            string strPreciario = Cookies.GetCookie("cookiePreciario").Value;



            string path = AppDomain.CurrentDomain.BaseDirectory;
            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                using (var comando = new SqlCommand("web_spS_ObtenerRCroquisPorVolumetriaConcepto", conn))
                {
                    using (var adaptador = new SqlDataAdapter(comando))
                    {
                        DataTable dt = new DataTable();
                        adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                        adaptador.SelectCommand.Parameters.Add(@"idconcepto", SqlDbType.NVarChar).Value = strID;
                        adaptador.SelectCommand.Parameters.Add(@"idpreciario", SqlDbType.NVarChar).Value = strPreciario;
                        adaptador.Fill(dt);


                        var reporte = new ReportDocument();
                        reporte.Load(Server.MapPath("reportess/rCroquisVolumetria.rpt"));
                        reporte.SetDataSource(dt);
                        reporte.SetParameterValue("path", path);
                        reporte.SetParameterValue("pathlogo", Server.MapPath(" ") + "\\images\\clientes\\");

                        string strDireccion = Server.MapPath(" ") + "\\reportess\\Volumetrias\\" + strID;

                        //2. Validar si existe el directorio donde se guardaran
                        if (Directory.Exists(strDireccion))
                        {

                            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Volumetrias/" + strID + "/rCroquisVolumetriaConcepto " + strID + ".pdf"));
                            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Volumetrias/" + strID + "/rCroquisVolumetriaConcepto " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                        }
                        else
                        {
                            Directory.CreateDirectory(strDireccion);
                            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Volumetrias/" + strID + "/rCroquisVolumetriaConcepto " + strID + ".pdf"));
                            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Volumetrias/" + strID + "/rCroquisVolumetriaConcepto " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
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
        
    }
}