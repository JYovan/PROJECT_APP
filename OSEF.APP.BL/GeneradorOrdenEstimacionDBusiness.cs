using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class GeneradorOrdenEstimacionDBusiness
    {


        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de GeneradorOrdenEstimacion
        /// </summary>
        /// <param name="iCroquisOrdenEstimacionD"></param>
        public static int Insertar(GeneradorOrdenEstimacionD iGeneradorOrdenEstimacionD)
        {
            return GeneradorOrdenEstimacionDDataAccess.Insertar(iGeneradorOrdenEstimacionD);
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borra un generador por concepto
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarGeneradorOrdenEstimacionDPorConcepto(int IdMov, string strIDConcepto)
        {
            return GeneradorOrdenEstimacionDDataAccess.BorrarGeneradorOrdenEstimacionDPorConcepto(IdMov, strIDConcepto);
        }


        /// <summary>
        /// Método que borra registros de la tabla GeneradorOrdenEstimacionD
        /// </summary>
        /// <param name="IdMov"></param>
        public static int BorrarGeneradorOrdenesEstimacionPorID(int IdMov)
        {
            return GeneradorOrdenEstimacionDDataAccess.BorrarGeneradorOrdenesEstimacionPorID(IdMov);
        }


        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registro de GeneradorOrdenEstimacionD por concepto
        /// </summary>
        /// <param name="strIDMov"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<GeneradorOrdenEstimacionD> ObtenerGeneradorOrdenEstimacionDPorMovConcepto(int strIDMov, string strPreciarioConcepto)
        {
            List<GeneradorOrdenEstimacionD> lGeneradorOrdenEstimacionD = GeneradorOrdenEstimacionDDataAccess.ObtenerGeneradorOrdenEstimacionDConcepto(strIDMov, strPreciarioConcepto);

            foreach (var item in lGeneradorOrdenEstimacionD)
	            {
                    item.RConcepto = PreciarioGeneralConceptoBusiness.ObtenerPreciarioGeneralConceptoPorID(item.ConceptoID);
		 
	            }
            return lGeneradorOrdenEstimacionD;
        }



        /// <summary>
        /// Revisar si existen registros insertados por concepto Y MOVIMIENTO
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerGeneradorOrdenEstimacionVaciosPorMovimientoConcepto(string strConcepto,int iID)
        {
            return GeneradorOrdenEstimacionDDataAccess.ObtenerGeneradorOrdenEstimacionVaciosPorMovimientoConcepto(strConcepto,iID);
        }


        #endregion

    }
}
