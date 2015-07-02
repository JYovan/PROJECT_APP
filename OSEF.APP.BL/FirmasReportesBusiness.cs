using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.DL;
using OSEF.APP.EL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de FirmasReportes
    /// </summary>
    public class FirmasReportesBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de FirmasReporte
        /// </summary>
        /// <param name="iFinalidad"></param>
        public static int Insertar(FirmasReportes iFirmasReporte)
        {
            return FirmasReportesDataAccess.Insertar(iFirmasReporte);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de FirmasReportes
        /// </summary>
        /// <param name="uFinalidad"></param>
        /// <returns></returns>
        public static int Actualizar(FirmasReportes uFirmasReportes)
        {
            return FirmasReportesDataAccess.Actualizar(uFirmasReportes);
        }

        #endregion


        #region Consultar

   

        /// <summary>
        /// Obtener un registro de FirmasReportes por su Modulo
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static FirmasReportes ObtenerFirmasReportesPorModulo(string strID)
        {
            return FirmasReportesDataAccess.ObtenerFirmaReportePorModulo(strID);
        }

        #endregion
    }
}
