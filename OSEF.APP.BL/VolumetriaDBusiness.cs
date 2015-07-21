using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de VolumetriasD
    /// </summary>
    public class VolumetriaDBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de VolumetriaD
        /// </summary>
        /// <param name="iVolumetriaD"></param>
        public static int Insertar(VolumetriaD iVolumetriaD)
        {
            return VolumetriaDDataAccess.Insertar(iVolumetriaD);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de VolumetriaD
        /// </summary>
        /// <param name="uVolumetriaD"></param>
        /// <returns></returns>
        public static int Actualizar(VolumetriaD uVolumetriaD)
        {
            return VolumetriaDDataAccess.Actualizar(uVolumetriaD);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar VolumetriaD por su Volumetria
        /// </summary>
        /// <param name="iVolumetria"></param>
        public static int BorrarPorVolumetria(int iVolumetria)
        {
            return VolumetriaDDataAccess.BorrarPorVolumetria(iVolumetria);
        }

        /// <summary>
        /// Método que borrar alguna VolumetriaD por su Volumetria y Renglon
        /// </summary>
        /// <param name="iVolumetria"></param>
        /// /// <param name="sRenglon"></param>
        public static int Borrar(int iVolumetria, short sRenglon)
        {
            return VolumetriaDDataAccess.Borrar(iVolumetria, sRenglon);
        }

        #endregion

        #region Consultar

        

        /// <summary>
        /// Obtener un los registro de VolumetriaD por su Volumetria
        /// </summary>
        /// <param name="iRevision"></param>
        /// <returns></returns>
        public static List<VolumetriaD> ObtenerVolumetriaDPorVolumetria(int iVolumetria)
        {
      

            List<VolumetriaD> oVolumetriaD = VolumetriaDDataAccess.ObtenerVolumetriaDPorVolumetria(iVolumetria);
             
            return oVolumetriaD;

           // return VolumetriaDDataAccess.ObtenerVolumetriaDPorVolumetria(iVolumetria);
        }

        /// <summary>
        /// Obtener un los registro de VolumetriaD por su Preciario
        /// </summary>
        /// <param name="iPreciario"></param>
        /// <returns></returns>
        //public static List<VolumetriaD> ObtenerVolumetriaDPorPreciario(int iPreciario)
        //{
        //    return VolumetriaDDataAccess.ObtenerVolumetriaDPorPreciario(iPreciario);
        //}


        #endregion
    }
}
