using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using System.IO;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaSubirImagenesPreciario : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que se lanza al guardar los archivos en el servidor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void muSubirImagenesPreciario_OnFileUpload(object sender, FileUploadEventArgs e)
        {
            //1. Obtener el ID del movimiento y el concepto
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarVolumetria").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoVolumetria").Value;
            string strDireccion = Server.MapPath(" ") + "\\imagesVolumetrias\\" + iID + "\\" + strConcepto;

            //2. Validar si existe el directorio donde se guardaran las imagenes
            if (Directory.Exists(strDireccion))
            {
                e.PostedFile.SaveAs(strDireccion + "\\" + e.FileName);
            }
            else
            {
                Directory.CreateDirectory(strDireccion);
                e.PostedFile.SaveAs(strDireccion + "\\" + e.FileName);
            }

         

            //3. Realizar el objeto e insertar en la base de datos
            ImagenVolumetriaD oImagenVolumetriaD = new ImagenVolumetriaD();
            oImagenVolumetriaD.Volumetria = iID;
            oImagenVolumetriaD.PreciarioConcepto = strConcepto;
            oImagenVolumetriaD.Nombre = e.FileName;
            oImagenVolumetriaD.Direccion = "\\imagesVolumetrias\\" + iID + "\\" + strConcepto + "\\" + e.FileName;
            //Traemos el usuario que realiza el movimiento
            Usuario oUsuario = (Usuario)Session["Usuario"];
            oImagenVolumetriaD.Usuario = oUsuario.ID;
            oImagenVolumetriaD.FechaAlta = DateTime.Now;

            ImagenVolumetriaDBusiness.Insertar(oImagenVolumetriaD);
        }
    }
}