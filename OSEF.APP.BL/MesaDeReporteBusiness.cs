using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Calse que se encarga de la capa de negocio de MesaDeReporteBusiness
    /// </summary>
    public class MesaDeReporteBusiness
    {


        #region insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de MesaDeReporte
        /// </summary>
        /// <param name="iRevision"></param>
        public static int insertarMesaDeReporte(MesaDeReporte iMesaDeReporte)
        {
            return MesaDeReporteDataAccess.Insertar(iMesaDeReporte);
        }

        #endregion

        #region Actualizar
        /// <summary>
        /// Método que actualiza un registro a la tabla de MesaDeReporte
        /// </summary>
        /// <param name="iRevision"></param>
        public static int ActualizarMesaDeReporte(MesaDeReporte uMesaDeReporte)
        {
            return MesaDeReporteDataAccess.Actualizar(uMesaDeReporte);
        }

        #endregion



        #region Eliminar

        /// <summary>
        /// Método que borrar alguna MesaDeReporte por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int Borrar(int iID)
        {
            return MesaDeReporteDataAccess.Borrar(iID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de MesaDeReporte
        /// </summary>
        /// <returns></returns>
        public static List<MesaDeReporte> ObtenerMesaDeReportes()
        {
            //1. Obtener las MesaDeReportes en una lista
            List<MesaDeReporte> lMesaDeReportes = MesaDeReporteDataAccess.ObtenerMesaDeReportes();

            //2. Complementarlas con sucursal
            foreach (MesaDeReporte sd in lMesaDeReportes)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);

            }
            return lMesaDeReportes;
        }

        /// <summary>
        /// Método que obtiene todos los regsitros de MesaDeReporte
        /// </summary>
        /// <returns></returns>
        public static List<MesaDeReporte> ObtenerMesaDeReportesConcluidos()
        {
            //1. Obtener las MesaDeReportes en una lista
            List<MesaDeReporte> lMesaDeReportesConcluidos = MesaDeReporteDataAccess.ObtenerMesaDeReportesConcluidos();

            //2. Complementarlas con sucursal
            foreach (MesaDeReporte sd in lMesaDeReportesConcluidos)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);

            }
            return lMesaDeReportesConcluidos;
        }

        /// <summary>
        /// Método que obtiene todos los regsitros de MesaDeReporte
        /// </summary>
        /// <returns></returns>
        public static List<MesaDeReporte> ObtenerHistorialMesaDeReportesConcluidos()
        {
            //1. Obtener las MesaDeReportes en una lista
            List<MesaDeReporte> lMesaDeReportesConcluidos = MesaDeReporteDataAccess.ObtenerHistorialMesaDeReportesConcluidos();

            //2. Complementarlas con sucursal
            foreach (MesaDeReporte sd in lMesaDeReportesConcluidos)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);

            }
            return lMesaDeReportesConcluidos;
        }

        /// <summary>
        /// Obtener un registro de MesaDeReporte por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static MesaDeReporte ObtenerMesaDeReportePorID(int iID)
        {
            //1. Inicializar objeto, complementarlo con la Sucursal
            MesaDeReporte oMesaDeReporte = MesaDeReporteDataAccess.ObtenerMesaDeReporteaPorID(iID);
            oMesaDeReporte.RSucursal = SucursalBusiness.ObtenerSucursalPorID(oMesaDeReporte.Sucursal);

            return oMesaDeReporte;
        }


        #endregion



        #region Acciones

        /// <summary>
        /// Método que Afecta un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarMesaDeReportePorID(MesaDeReporte aMesaDeReporte)
        {
            return MesaDeReporteDataAccess.AfectarMesaDeReportePorID(aMesaDeReporte);
        }

        /// <summary>
        /// Método que Afecta un registro de Estimacion
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarEstimacionPorID(MesaDeReporte aMesaDeReporte)
        {
            return MesaDeReporteDataAccess.AfectarEstimacionPorID(aMesaDeReporte);
        }

        /// <summary>
        /// Método que avanza un movimiento de MesaDeReporte
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int AvanzarReportePorID(int iID, string strMov)
        {
            return MesaDeReporteDataAccess.AvanzarReportePorID(iID, strMov);
        }


        /// <summary>
        /// Método que cancela un movimiento 
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int CancelarMesaDeReportePorID(int iID)
        {
            return MesaDeReporteDataAccess.CancelarMesaDeReportePorID(iID);
        }

        /// <summary>
        /// Método que Factura un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int FacturarMesaDeReportePorID(MesaDeReporte ID)
        {
            return MesaDeReporteDataAccess.FacturarMesaDeReportePorID(ID);
        }

        /// <summary>
        /// Método que Revisa un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int RevisarMesaDeReportePorID(MesaDeReporte ID)
        {
            return MesaDeReporteDataAccess.RevisarMesaDeReportePorID(ID);
        }

        /// <summary>
        /// Método que Revisa un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int RevisarYFacturarMesaDeReportePorID(MesaDeReporte mdr)
        {
            return MesaDeReporteDataAccess.RevisarYFacturarMesaDeReportePorID(mdr);
        }

        #endregion
    }
}
