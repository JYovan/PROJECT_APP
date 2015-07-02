using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de ImagenRevisionD
    /// </summary>
    public class ImagenRevisionDBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ImagenRevisionD
        /// </summary>
        /// <param name="iImagenRevisionD"></param>
        public static int Insertar(ImagenRevisionD iImagenRevisionD)
        {
            return ImagenRevisionDDataAccess.Insertar(iImagenRevisionD);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borra un registro en base al concepto de la tabla de ImagenRevisionD
        /// </summary>
        /// <param name="iRevision"></param>
        /// <param name="strConcepto"></param>
        /// <returns></returns>
        public static int BorrarPorRevisionConcepto(int iRevision, string strConcepto)
        {
            return ImagenRevisionDDataAccess.BorrarPorRevisionConcepto(iRevision, strConcepto);
        }

        /// <summary>
        /// Método que borra un registro en base al concepto y nombre de la tabla de ImagenesVolumetriasD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarPorRevisionConceptoNombre(int iRevision, string strConcepto, string strNombre)
        {
            return ImagenRevisionDDataAccess.BorrarPorRevisionConceptoNombre(iRevision, strConcepto, strNombre);
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
        /// Obtener los registro de las Imaganes de ImagenRevisionD por su Revision y Concepto
        /// </summary>
        /// <param name="iRevision"></param>
        /// <param name="strConcepto"></param>
        /// <returns></returns>
        public static List<ImagenRevisionD> ObtenerImagenesRevisionDPorRevisionConcepto(int iRevision, string strConcepto)
        {
            return ImagenRevisionDDataAccess.ObtenerImagenesRevisionDPorRevisionConcepto(iRevision, strConcepto);
        }

        #endregion
    }
}
