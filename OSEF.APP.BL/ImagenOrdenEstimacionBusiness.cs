using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de ImagenOrdenEstimacion
    /// </summary>
    public class ImagenOrdenEstimacionBusiness
    {

         #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ImagenOrdenEstimacionD
        /// </summary>
        /// <param name="iImagenOrdenEstimacionD"></param>
        public static int Insertar(ImagenOrdenEstimacionD iImagenOrdenEstimacionD)
        {
            return ImagenOrdenEstimacionDDataAccess.Insertar(iImagenOrdenEstimacionD);
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borra un registro en base al concepto de la tabla de ImagenesVolumetriasD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarImagenesOrdenEstimacionDPorConcepto(int IdMov, string strIDConcepto)
        {
            return ImagenOrdenEstimacionDDataAccess.BorrarImagenesOrdenEstimacionDPorConcepto(IdMov, strIDConcepto);
        }

        /// <summary>
        /// Método que borra un registro en base al concepto y nombre de la tabla de ImagenesVolumetriasD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarImagenesOrdenEstimacionDPorConceptoYNombre(int IdMov, string strIDConcepto, string nIMG)
        {
            return ImagenOrdenEstimacionDDataAccess.BorrarImagenesOrdenEstimacionDPorConceptoYNombre(IdMov, strIDConcepto, nIMG);
        }


        /// <summary>
        /// Método que borra registros de la tabla Imagenes Volumetria por ID de movimiento
        /// </summary>
        /// <param name="IdMov"></param>
        public static int BorrarImagenesOrdenesEstimacionPorID(int IdMov)
        {
            return ImagenOrdenEstimacionDDataAccess.BorrarImagenesOrdenesEstimacionPorID(IdMov);
        }


        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registro de las Imaganes de OrdenEstimacion por su IDMov y PreciarioConcepto
        /// </summary>
        /// <param name="strIDMov"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<ImagenOrdenEstimacionD> ObtenerImagenOrdenEstimacionDPorMovPreciarioConcepto(int strIDMov, string strPreciarioConcepto)
        {
            return ImagenOrdenEstimacionDDataAccess.ObtenerImagenOrdenEstimacionDPorMovPreciarioConcepto(strIDMov, strPreciarioConcepto);
        }

        #endregion
    }
    
}
