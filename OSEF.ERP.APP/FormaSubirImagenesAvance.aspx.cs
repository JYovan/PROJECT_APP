using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.IO;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaSubirImagenesAvance : System.Web.UI.Page
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
        protected void muSubirImagenesAvance_OnFileUpload(object sender, FileUploadEventArgs e)
        {
            //1. Obtener el ID del movimiento y el concepto
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarRevision").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoRevision").Value;
            string strDireccion = Server.MapPath(" ") + "\\imagenesAvance\\" + iID + "\\" + strConcepto;

            //2. Validar si existe el directorio donde se guardaran las imagenes
            if (Directory.Exists(strDireccion))
                e.PostedFile.SaveAs(strDireccion + "\\" + e.FileName);
            else
            {
                Directory.CreateDirectory(strDireccion);
                e.PostedFile.SaveAs(strDireccion + "\\" + e.FileName);
            }

            //3. Realizar el objeto e insertar en la base de datos
            ImagenRevisionD oImagenRevisionD = new ImagenRevisionD();
            oImagenRevisionD.Revision = iID;
            oImagenRevisionD.Concepto = strConcepto;
            oImagenRevisionD.Nombre = e.FileName;
            oImagenRevisionD.Direccion = "\\imagenesAvance\\" + iID + "\\" + strConcepto + "\\" + e.FileName;
            
            //4. Traemos el usuario que realiza el movimiento
            Usuario oUsuario = (Usuario)Session["Usuario"];
            oImagenRevisionD.UsuarioAlta = oUsuario.ID;
            oImagenRevisionD.FechaAlta = DateTime.Now;
            ImagenRevisionDBusiness.Insertar(oImagenRevisionD);
        }
    }
}