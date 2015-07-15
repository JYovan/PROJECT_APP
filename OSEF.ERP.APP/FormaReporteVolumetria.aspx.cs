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




        //Metodo que exporta a un documento de PDF
        protected void toPDF(object sender, EventArgs e)
        {

            ReportDocument reporte = (ReportDocument)Session["imprimir"];
            string namereport = Session["ReportName"].ToString();
            string strClave = Session["Clave"].ToString();
            reporte.Load(Server.MapPath("reportess/" + namereport + ".rpt"));
            reporte.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, strClave);

        }
        //Metodo que exporta a un documento de excel
        protected void toXls(object sender, EventArgs e)
        {

            ReportDocument reporte = (ReportDocument)Session["imprimir"];
            string namereport = Session["ReportName"].ToString();
            string strClave = Session["Clave"].ToString();
            reporte.Load(Server.MapPath("reportess/" + namereport + ".rpt"));
            reporte.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.Excel, Response, true, strClave);

        }

        protected void toPopUp(object sender, EventArgs e) {

            string namereport = Session["ReportName"].ToString();
            string strClave = Session["Clave"].ToString();
            ReportDocument reporte = (ReportDocument)Session["imprimir"];
            reporte.Load(Server.MapPath("reportess/" + namereport + ".rpt"));
            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/" + strClave + ".pdf"));
            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/" + strClave + ".pdf',null,'height=700,width=660');popup.focus();", true);

        }
    }
}