using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;
using System.IO;

namespace OSEF.ERP.APP
{
    public partial class FormaImagenesPreciarios : System.Web.UI.Page
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

        [DirectMethod]
        public void BorrarImagen(string IdPreciarioConcepto, int IdVolumetria, string Nombre)
        {

            //1. Obtener el ID del movimiento y el concepto
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarVolumetria").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoVolumetria").Value;
            string strDireccion = Server.MapPath(" ") + "\\imagesVolumetrias\\" + iID + "\\" + strConcepto;
            string url = strDireccion + "\\" + Nombre;

            if (!(IdPreciarioConcepto.Equals("") && IdVolumetria.Equals("") && Nombre.Equals("")))
            {
                //X.Msg.Alert("Eliminando", "Borrando..." + IdPreciarioConcepto+","+IdVolumetria+","+Nombre, new JFunction { Fn = "showResult" }).Show();
                ImagenVolumetriaDBusiness.BorrarImagenesVolumetriaPorIDPorConceptoYPorNombre(IdVolumetria, IdPreciarioConcepto, Nombre);
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