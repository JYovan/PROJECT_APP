using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de ImagenesVolumetriasD
    /// </summary>
    public class ImagenVolumetriaDBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ImagenesVolumetriasD
        /// </summary>
        /// <param name="iImagenVolumetriaD"></param>
        public static int Insertar(ImagenVolumetriaD iImagenVolumetriaD)
        {
            return ImagenVolumetriaDDataAccess.Insertar(iImagenVolumetriaD);
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borra un registro en base al concepto de la tabla de ImagenesVolumetriasD
        /// </summary>
        /// <param name="iImagenVolumetriaD"></param>
        public static int BorrarImagenesVolumetria(int IdVolumetria, string strIDConcepto)
        {
            return ImagenVolumetriaDDataAccess.BorrarImagenesVolumetria(IdVolumetria, strIDConcepto);
        }


        /// <summary>
        /// Método que borra registros de la tabla Imagenes Volumetria por ID de movimiento
        /// </summary>
        /// <param name="iImagenVolumetriaD"></param>
        public static int BorrarImagenesVolumetriaPorID(int IdVolumetria)
        {
            return ImagenVolumetriaDDataAccess.BorrarImagenesVolumetriaPorID(IdVolumetria);
        }


        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registro de las Imaganes de Volumetrias por su Volumetria y PreciarioConcepto
        /// </summary>
        /// <param name="strVolumetria"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<ImagenVolumetriaD> ObtenerImagenVolumetriaDPorVolumetriaPreciarioConcepto(int iVolumetria, string strPreciarioConcepto)
        {
            return ImagenVolumetriaDDataAccess.ObtenerImagenVolumetriaDPorVolumetriaPreciarioConcepto(iVolumetria, strPreciarioConcepto);
        }

        #endregion
    }
}
