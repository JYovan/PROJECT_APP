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
    public partial class FormaSubirCroquisOrdenEstimacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Mov = Cookies.GetCookie("cockieMovimientoCroquis").Value;


            if (Mov.Equals("Reporte"))
            {
                muSubirImagenesOrdenEstimacion.FileUploadLimit = 0;
                muSubirImagenesOrdenEstimacion.FileQueueLimit = 1;
            }
            else {
                muSubirImagenesOrdenEstimacion.FileUploadLimit = 0;
                muSubirImagenesOrdenEstimacion.FileQueueLimit = 10;
            }

        }

        /// <summary>
        /// Evento que se lanza al guardar los archivos en el servidor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void muSubirImagenesOrdenEstimacion_OnFileUpload(object sender, FileUploadEventArgs e)
        {
            //1. Obtener el ID del movimiento y el concepto
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
            string strDireccion = Server.MapPath(" ") + "\\croquisOrdenEstimacion\\" + iID + "\\" + strConcepto;

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
            CroquisOrdenEstimacionD oCroquisOrdenEstimacionD = new CroquisOrdenEstimacionD();
            oCroquisOrdenEstimacionD.MovID = iID;
            oCroquisOrdenEstimacionD.Concepto = strConcepto;
            oCroquisOrdenEstimacionD.Nombre = e.FileName;
            oCroquisOrdenEstimacionD.Direccion = "\\croquisOrdenEstimacion\\" + iID + "\\" + strConcepto + "\\" + e.FileName;
            //Traemos el usuario que realiza el movimiento
            Usuario oUsuario = (Usuario)Session["Usuario"];
            oCroquisOrdenEstimacionD.Usuario = oUsuario.ID;
            oCroquisOrdenEstimacionD.FechaAlta = DateTime.Now;

            CroquisOrdenEstimacionBusiness.Insertar(oCroquisOrdenEstimacionD);
        }
    }
}