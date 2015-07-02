using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class GeneradorVolumetriaDBusiness
    {


        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de GeneradorVolumetriaD
        /// </summary>
        /// <param name="iGeneradorVolumetriaD"></param>
        public static int Insertar(GeneradorVolumetriaD iGeneradorVolumetriaD)
        {
            return GeneradorVolumetriaDataAccess.Insertar(iGeneradorVolumetriaD);
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borra un generador por concepto
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarGeneradorVolumetriaDPorConcepto(int IdMov, string strIDConcepto)
        {
            return GeneradorVolumetriaDataAccess.BorrarGeneradorVolumetriaDPorConcepto(IdMov, strIDConcepto);
        }


        /// <summary>
        /// Método que borra registros de la tabla GeneradorOrdenEstimacionD
        /// </summary>
        /// <param name="IdMov"></param>
        public static int BorrarGeneradorVolumetriaDPorID(int IdMov)
        {
            return GeneradorVolumetriaDataAccess.BorrarGeneradorVolumetriaDPorID(IdMov);
        }


        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registro de GeneradorOrdenEstimacionD por concepto
        /// </summary>
        /// <param name="strIDMov"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<GeneradorVolumetriaD> ObtenerGeneradorVolumetriaDPorMovConcepto(int strIDMov, string strPreciarioConcepto)
        {
            List<GeneradorVolumetriaD> lGeneradorVolumetriaD = GeneradorVolumetriaDataAccess.ObtenerGeneradorVolumetriaDConcepto(strIDMov, strPreciarioConcepto);

            foreach (var item in lGeneradorVolumetriaD)
            {
                item.RConcepto = PreciarioConceptoBusiness.ObtenerPreciarioConceptoPorID(item.ConceptoID);

            }
            return lGeneradorVolumetriaD;
        }



        /// <summary>
        /// Revisar si existen registros insertados por concepto Y MOVIMIENTO
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerGeneradorVolumetriaVaciosPorMovimientoConcepto(string strConcepto, int iID)
        {
            return GeneradorVolumetriaDataAccess.ObtenerGeneradorVolumetriaDVaciosPorMovimientoConcepto(strConcepto, iID);
        }


        #endregion
    }
}
