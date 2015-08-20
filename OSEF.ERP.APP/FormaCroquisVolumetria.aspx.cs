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
    public partial class FormaCroquisVolumetria : System.Web.UI.Page
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
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarVolumetria").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoVolumetria").Value;
            List<CroquisVolumetriaD> lCroquisVolumetriaD = CroquisVolumetriaBusiness.ObtenerCroquisVolumetriaDPorMovPreciarioConcepto(iID, strConcepto);

            foreach (CroquisVolumetriaD sd in lCroquisVolumetriaD)
            {
                sd.Direccion = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + sd.Direccion;
            }

            sImagenesVolumetriaD.DataSource = lCroquisVolumetriaD;
            sImagenesVolumetriaD.DataBind(); 
        }

        [DirectMethod]
        public void BorrarCroquis(string conceptoID, int MovID, string nombreimg)
        {
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarVolumetria").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoVolumetria").Value;
            string strDireccion = Server.MapPath(" ") + "\\croquisVolumetria\\" + iID + "\\" + strConcepto;
            string url = strDireccion + "\\" + nombreimg;
            if (!(conceptoID.Equals("") && MovID.Equals("") && nombreimg.Equals("")))
            {
                CroquisVolumetriaBusiness.BorrarCroquisVolumetriaDPorConceptoYNombre(MovID, conceptoID, nombreimg);
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