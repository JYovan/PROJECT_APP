using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class FacturaOrdenEstimacionBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de FacturaOrdenEstimacionD
        /// </summary>
        /// <param name="iFacturaOrdenEstimacionD"></param>
        public static int Insertar(FacturaOrdenEstimacionD iFacturaOrdenEstimacionD)
        {
            return FacturaOrdenEstimacionDDataAccess.Insertar(iFacturaOrdenEstimacionD);
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borra un registro en base al concepto de la tabla de FacturaOrdenEstimacionD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarFacturaOrdenEstimacionDPorConcepto(int IdMov, string strIDConcepto)
        {
            return FacturaOrdenEstimacionDDataAccess.BorrarFacturasOrdenEstimacionDPorConcepto(IdMov, strIDConcepto);
        }

        /// <summary>
        /// Método que borra un registro en base al concepto y imagen de la tabla de FacturaOrdenEstimacionD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarFacturaOrdenEstimacionDPorConceptoYNombre(int IdMov, string strIDConcepto, string nIMG)
        {
            return FacturaOrdenEstimacionDDataAccess.BorrarFacturaOrdenEstimacionDPorConceptoYNombre(IdMov, strIDConcepto, nIMG);
        }


        /// <summary>
        /// Método que borra registros de la tabla Facturas OrdenEstimacion por ID de movimiento
        /// </summary>
        /// <param name="IdMov"></param>
        public static int BorrarFacturasOrdenesEstimacionPorID(int IdMov)
        {
            return FacturaOrdenEstimacionDDataAccess.BorrarFacturasOrdenesEstimacionPorID(IdMov);
        }


        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registro de las Imaganes de Volumetrias por su IDMov y PreciarioConcepto
        /// </summary>
        /// <param name="strIDMov"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<FacturaOrdenEstimacionD> ObtenerFacturaOrdenEstimacionDPorMovPreciarioConcepto(int strIDMov, string strPreciarioConcepto)
        {
            return FacturaOrdenEstimacionDDataAccess.ObtenerFacturaOrdenEstimacionDPorMovPreciarioConcepto(strIDMov, strPreciarioConcepto);
        }

        #endregion

    }
}
