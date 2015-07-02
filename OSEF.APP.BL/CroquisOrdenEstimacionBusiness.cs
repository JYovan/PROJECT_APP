using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class CroquisOrdenEstimacionBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CroquisOrdenEstimacionD
        /// </summary>
        /// <param name="iCroquisOrdenEstimacionD"></param>
        public static int Insertar(CroquisOrdenEstimacionD iCroquisOrdenEstimacionD)
        {
            return CroquisOrdenEstimacionDDataAccess.Insertar(iCroquisOrdenEstimacionD);
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borra un registro en base al concepto de la tabla de CroquisOrdenEstimacionD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarCroquisOrdenEstimacionDPorConcepto(int IdMov, string strIDConcepto)
        {
            return CroquisOrdenEstimacionDDataAccess.BorrarCroquisOrdenEstimacionDPorConcepto(IdMov, strIDConcepto);
        }


        /// <summary>
        /// Método que borra un registro en base al concepto y nombre de la tabla de CroquisOrdenEstimacionD
        /// </summary>
        /// <param name="IdMov"></param>
        /// <param name="strIDConcepto"></param>
        public static int BorrarCroquisOrdenEstimacionDPorConceptoYNombre(int IdMov, string strIDConcepto, string nIMG)
        {
            return CroquisOrdenEstimacionDDataAccess.BorrarCroquisOrdenEstimacionDPorConceptoYNombre(IdMov, strIDConcepto, nIMG);
        }

        /// <summary>
        /// Método que borra registros de la tabla Facturas OrdenEstimacion por ID de movimiento
        /// </summary>
        /// <param name="IdMov"></param>
        public static int BorrarCroquisOrdenesEstimacionPorID(int IdMov)
        {
            return CroquisOrdenEstimacionDDataAccess.BorrarCroquisOrdenesEstimacionPorID(IdMov);
        }


        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registro de las Imaganes de Volumetrias por su IDMov y PreciarioConcepto
        /// </summary>
        /// <param name="strIDMov"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<CroquisOrdenEstimacionD> ObtenerCroquisOrdenEstimacionDPorMovPreciarioConcepto(int strIDMov, string strPreciarioConcepto)
        {
            return CroquisOrdenEstimacionDDataAccess.ObtenerCroquisOrdenEstimacionDPorMovPreciarioConcepto(strIDMov, strPreciarioConcepto);
        }

        #endregion

    }
}
