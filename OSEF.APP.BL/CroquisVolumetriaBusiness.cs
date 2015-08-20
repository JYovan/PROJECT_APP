using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class CroquisVolumetriaBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CroquisVolumetriaD
        /// </summary>
        /// <param name="iCroquisVolumetriaD"></param>
        public static int Insertar(CroquisVolumetriaD iCroquisVolumetriaD)
        {
            return CroquisVolumetriaDDataAccess.Insertar(iCroquisVolumetriaD);
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borra un registro en base al concepto de la tabla de CroquisVolumetriaD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarCroquisVolumetriaDPorConcepto(int IdMov, string strIDConcepto)
        {
            return CroquisVolumetriaDDataAccess.BorrarCroquisVolumetriaDPorConcepto(IdMov, strIDConcepto);
        }


        /// <summary>
        /// Método que borra un registro en base al concepto y nombre de la tabla de CroquisVolumetriaD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarCroquisVolumetriaDPorConceptoYNombre(int IdMov, string strIDConcepto, string nIMG)
        {
            return CroquisVolumetriaDDataAccess.BorrarCroquisVolumetriaDPorConceptoYNombre(IdMov, strIDConcepto, nIMG);
        }

        /// <summary>
        /// Método que borra registros de la tabla Facturas Volumetria por ID de movimiento
        /// </summary>
        /// <param name="IdMov"></param>
        public static int BorrarCroquisOrdenesEstimacionPorID(int IdMov)
        {
            return CroquisVolumetriaDDataAccess.BorrarCroquisOrdenesEstimacionPorID(IdMov);
        }


        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registro de las Imaganes de Volumetrias por su IDMov y PreciarioConcepto
        /// </summary>
        /// <param name="strIDMov"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<CroquisVolumetriaD> ObtenerCroquisVolumetriaDPorMovPreciarioConcepto(int strIDMov, string strPreciarioConcepto)
        {
            return CroquisVolumetriaDDataAccess.ObtenerCroquisVolumetriaDPorMovPreciarioConcepto(strIDMov, strPreciarioConcepto);
        }

        #endregion

    }
}
