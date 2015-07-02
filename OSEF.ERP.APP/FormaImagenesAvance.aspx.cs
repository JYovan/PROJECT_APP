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
    public partial class FormaImagenesAvance : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                onLoadDataImages();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        [DirectMethod]
        public void onLoadDataImages()
        {
            //1. Obtener los datos para mostrar las imagenes
            int iRevision = Convert.ToInt32(Cookies.GetCookie("cookieEditarRevision").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoRevision").Value;
            List<ImagenRevisionD> lImagenRevisionD = ImagenRevisionDBusiness.ObtenerImagenesRevisionDPorRevisionConcepto(iRevision, strConcepto);

            //2. Por cada elemento de la lista de ImagenRevisionD
            foreach (ImagenRevisionD sd in lImagenRevisionD)
                sd.Direccion = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + sd.Direccion;

            //3. Llenar el store con los datos
            sImagenesAvance.DataSource = lImagenRevisionD;
            sImagenesAvance.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strConcepto"></param>
        /// <param name="iRevision"></param>
        /// <param name="strNombreImg"></param>
        [DirectMethod]
        public void BorrarImagen(string strConcepto, int iRevision, string strNombreImg)
        {
            //1. Obtener el ID del movimiento y el concepto
            int iRevisionCookie = Convert.ToInt32(Cookies.GetCookie("cookieEditarRevision").Value);
            string strConceptoCookie = Cookies.GetCookie("cookieConceptoRevision").Value;
            string strDireccion = Server.MapPath(" ") + "\\imagenesAvance\\" + iRevisionCookie + "\\" + strConceptoCookie;
            string url = strDireccion + "\\" + strNombreImg;

            if (!(strConcepto.Equals("") && iRevision.Equals("") && strNombreImg.Equals("")))
            {
                ImagenRevisionDBusiness.BorrarPorRevisionConceptoNombre(iRevision, strConcepto, strNombreImg);
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