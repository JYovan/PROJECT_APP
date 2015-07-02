using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;
using System.IO;

namespace OSEF.ERP.APP
{
    public partial class FormaImagenesOrdenEstimacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                onLoadDataImages();
            }
        }

        [DirectMethod]
        public void onLoadDataImages() {
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
            List<ImagenOrdenEstimacionD> lImagenOrdenEstimacionD = ImagenOrdenEstimacionBusiness.ObtenerImagenOrdenEstimacionDPorMovPreciarioConcepto(iID, strConcepto);

            foreach (ImagenOrdenEstimacionD sd in lImagenOrdenEstimacionD)
            {
                sd.Direccion = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + sd.Direccion;
            }

            sImagenesOrdenEstimacionD.DataSource = lImagenOrdenEstimacionD;
            sImagenesOrdenEstimacionD.DataBind();
        }

        [DirectMethod]
        public void BorrarImagen(string conceptoID, int MovID, string nombreimg) {

            //1. Obtener el ID del movimiento y el concepto
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
            string strDireccion = Server.MapPath(" ") + "\\imagenesOrdenEstimacion\\" + iID + "\\" + strConcepto;
            string url = strDireccion + "\\" + nombreimg;

            if (!(conceptoID.Equals("") && MovID.Equals("") && nombreimg.Equals(""))) {
                ImagenOrdenEstimacionBusiness.BorrarImagenesOrdenEstimacionDPorConceptoYNombre(MovID, conceptoID, nombreimg);
                try
                {
                    File.Delete(url);
                }
                catch (Exception e)
                { 
                    X.Msg.Alert("Error", e.Message.ToString(), new JFunction { Fn = "showResult" }).Show();
                }
            }
        }
    }
}