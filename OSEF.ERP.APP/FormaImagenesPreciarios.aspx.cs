using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class FormaImagenesPreciarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarVolumetria").Value);
                string strConcepto = Cookies.GetCookie("cookieConceptoVolumetria").Value;
                List<ImagenVolumetriaD> lImagenVolumetriaD = ImagenVolumetriaDBusiness.ObtenerImagenVolumetriaDPorVolumetriaPreciarioConcepto(iID, strConcepto);

                foreach (ImagenVolumetriaD sd in lImagenVolumetriaD)
                {
                    sd.Direccion = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + sd.Direccion;
                }

                sImagenesVolumetriasD.DataSource = lImagenVolumetriaD;
                sImagenesVolumetriasD.DataBind();
            }
        }
    }
}