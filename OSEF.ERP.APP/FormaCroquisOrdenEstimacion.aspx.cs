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
    public partial class FormaCroquisOrdenEstimacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                onLoadDataImages();
            }
        }


        [DirectMethod]
        public void onLoadDataImages()
        {
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
            List<CroquisOrdenEstimacionD> lCroquisOrdenEstimacionD = CroquisOrdenEstimacionBusiness.ObtenerCroquisOrdenEstimacionDPorMovPreciarioConcepto(iID, strConcepto);

            foreach (CroquisOrdenEstimacionD sd in lCroquisOrdenEstimacionD)
            {
                sd.Direccion = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + sd.Direccion;
            }

            sImagenesOrdenEstimacionD.DataSource = lCroquisOrdenEstimacionD;
            sImagenesOrdenEstimacionD.DataBind(); 
        }

        [DirectMethod]
        public void BorrarCroquis(string conceptoID, int MovID, string nombreimg)
        {
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
            string strDireccion = Server.MapPath(" ") + "\\croquisOrdenEstimacion\\" + iID + "\\" + strConcepto;
            string url = strDireccion + "\\" + nombreimg;
            if (!(conceptoID.Equals("") && MovID.Equals("") && nombreimg.Equals("")))
            {
                CroquisOrdenEstimacionBusiness.BorrarCroquisOrdenEstimacionDPorConceptoYNombre(MovID, conceptoID, nombreimg);
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