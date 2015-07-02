using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

namespace OSEF.ERP.APP
{
    public partial class Previa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //Nos traemos la variable de sesion que contiene al reporte
           //ReportDocument reporte= (ReportDocument)Session["imprimir"];
           //crvVisor.ToolPanelView = ToolPanelViewType.None;
           //crvVisor.ReportSource = reporte;
           
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