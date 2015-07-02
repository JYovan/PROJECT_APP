using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaFacturasOrdenEstimacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                onLoadDataFactura();
            }
        }

        [DirectMethod]
        public void onLoadDataFactura() {
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
            List<FacturaOrdenEstimacionD> lFacturaOrdenEstimacionD = FacturaOrdenEstimacionBusiness.ObtenerFacturaOrdenEstimacionDPorMovPreciarioConcepto(iID, strConcepto);

            foreach (FacturaOrdenEstimacionD sd in lFacturaOrdenEstimacionD)
            {
                sd.Direccion = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + sd.Direccion;
            }

            sImagenesOrdenEstimacionD.DataSource = lFacturaOrdenEstimacionD;
            sImagenesOrdenEstimacionD.DataBind();
        }

        [DirectMethod]
        public void BorrarFactura(string conceptoID, int MovID, string nombreimg)
        {
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
            string strDireccion = Server.MapPath(" ") + "\\facturasOrdenEstimacion\\" + iID + "\\" + strConcepto;
            string url = strDireccion + "\\" + nombreimg;
            if (!(conceptoID.Equals("") &&  nombreimg.Equals("")) && MovID > 0)
            {
                FacturaOrdenEstimacionBusiness.BorrarFacturaOrdenEstimacionDPorConceptoYNombre(MovID, conceptoID, nombreimg);
                try
                {
                    System.IO.File.Delete(url);
                }
                catch (Exception e)
                {
                    e.Message.ToString();
                }
            }
        }
    }
}