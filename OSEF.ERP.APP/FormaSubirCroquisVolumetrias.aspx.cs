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
    public partial class FormaSubirCroquisVolumetrias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         

        }

        /// <summary>
        /// Evento que se lanza al guardar los archivos en el servidor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void muSubirImagenesVolumetria_OnFileUpload(object sender, FileUploadEventArgs e)
        {
            //1. Obtener el ID del movimiento y el concepto
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarVolumetria").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoVolumetria").Value;
            string strDireccion = Server.MapPath(" ") + "\\croquisVolumetria\\" + iID + "\\" + strConcepto;

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
            CroquisVolumetriaD oCroquisVolumetriaD = new CroquisVolumetriaD();
            oCroquisVolumetriaD.MovID = iID;
            oCroquisVolumetriaD.Concepto = strConcepto;
            oCroquisVolumetriaD.Nombre = e.FileName;
            oCroquisVolumetriaD.Direccion = "\\croquisVolumetria\\" + iID + "\\" + strConcepto + "\\" + e.FileName;
            //Traemos el usuario que realiza el movimiento
            Usuario oUsuario = (Usuario)Session["Usuario"];
            oCroquisVolumetriaD.Usuario = oUsuario.ID;
            oCroquisVolumetriaD.FechaAlta = DateTime.Now;

            CroquisVolumetriaBusiness.Insertar(oCroquisVolumetriaD);
        }
    }
}