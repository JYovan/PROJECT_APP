using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Calse que se encarga de la capa de negocio de OrdenEstimacionBusiness
    /// </summary>
    public class OrdenEstimacionBusiness
    {


        #region insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de OrdenEstimacion
        /// </summary>
        /// <param name="iRevision"></param>
        public static int insertarOrdenEstimacion(OrdenEstimacion iOrdenEstimacion)
        {
            return OrdenEstimacionDataAccess.Insertar(iOrdenEstimacion);
        }

        #endregion

        #region Actualizar
        /// <summary>
        /// Método que actualiza un registro a la tabla de OrdenEstimacion
        /// </summary>
        /// <param name="iRevision"></param>
        public static int ActualizarOrdenEstimacion(OrdenEstimacion uOrdenEstimacion)
        {
            return OrdenEstimacionDataAccess.Actualizar(uOrdenEstimacion);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna OrdenEstimacion por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int Borrar(int iID)
        {
            return OrdenEstimacionDataAccess.Borrar(iID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de OrdenEstimacion
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerOrdenesEstimaciones()
        {
            //1. Obtener las OrdenesEstimaciones en una lista
            List<OrdenEstimacion> lOrdenesEstimaciones = OrdenEstimacionDataAccess.ObtenerOrdenesEstimaciones();

            //2. Complementarlas con sucursal
            foreach (OrdenEstimacion sd in lOrdenesEstimaciones)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);
                sd.RCuadrilla = CuadrillaBusiness.ObtenerCuadrillaPorID(sd.Cuadrilla);
            }
            return lOrdenesEstimaciones;
        }


        /// <summary>
        /// Método que obtiene todos los registros del Historial De OrdenEstimacion
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerHistorialDeOrdenesEstimaciones()
        {
            //1. Obtener las OrdenesEstimaciones en una lista
            List<OrdenEstimacion> lOrdenesEstimaciones = OrdenEstimacionDataAccess.ObtenerHistorialDeOrdenesEstimaciones();

            //2. Complementarlas con sucursal
            foreach (OrdenEstimacion sd in lOrdenesEstimaciones)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);
                sd.RCuadrilla = CuadrillaBusiness.ObtenerCuadrillaPorID(sd.Cuadrilla);
            }
            return lOrdenesEstimaciones;
        }


        /// <summary>
        /// Método que obtiene todos los regsitros de OrdenEstimacion
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerOrdenesCambios()
        {
            //1. Obtener las OrdenesEstimaciones en una lista
            List<OrdenEstimacion> lOrdenesEstimaciones = OrdenEstimacionDataAccess.ObtenerOrdenesCambios();

            //2. Complementarlas con sucursal
            foreach (OrdenEstimacion sd in lOrdenesEstimaciones)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);
            }
            return lOrdenesEstimaciones;
        }

        /// <summary>
        /// Método que obtiene todos los regsitros de OrdenEstimacion
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerOrdenesEstimacionesConcluidos()
        {
            //1. Obtener las OrdenesEstimaciones en una lista
            List<OrdenEstimacion> lOrdenesEstimacionesConcluidos = OrdenEstimacionDataAccess.ObtenerOrdenesEstimacionesConcluidos();

            //2. Complementarlas con sucursal
            foreach (OrdenEstimacion sd in lOrdenesEstimacionesConcluidos)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);

            }
            return lOrdenesEstimacionesConcluidos;
        }

        /// <summary>
        /// Obtener un registro de OrdenEstimacion por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static OrdenEstimacion ObtenerOrdenEstimacionPorID(int iID)
        {
            //1. Inicializar objeto, complementarlo con la Sucursal
            OrdenEstimacion oOrdenEstimacion = OrdenEstimacionDataAccess.ObtenerOrdenEstimacionaPorID(iID);
            oOrdenEstimacion.RSucursal = SucursalBusiness.ObtenerSucursalPorID(oOrdenEstimacion.Sucursal);
            oOrdenEstimacion.ROrdenEstimacionD = OrdenEstimacionDBusiness.ObtenerOrdenEstimacionDPorOrdenEstimacion(oOrdenEstimacion.Id);
            if (oOrdenEstimacion.Cliente != null)
            {
                oOrdenEstimacion.RCliente = ClienteBusiness.ObtenerClientePorID(oOrdenEstimacion.Cliente);
            }
            return oOrdenEstimacion;
        }

        /// <summary>
        /// Obtener registros de ImagenOrdenEstimacionD por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static List<ImagenOrdenEstimacionD> ObtenerOrdenEstimacionDPorID(int ID, string IDConcepto)
        {
            List<ImagenOrdenEstimacionD> oe = OrdenEstimacionDataAccess.ObtenerOrdenEstimacionDPorID(ID,IDConcepto);
            return oe;
        }

        #endregion

        #region Acciones

        /// <summary>
        /// Método que Afecta un registro de Orden
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarOrdenPorID(OrdenEstimacion aOrdenEstimacion)
        {
            return OrdenEstimacionDataAccess.AfectarOrdenPorID(aOrdenEstimacion);
        }

        /// <summary>
        /// Método que Afecta un registro de Estimacion
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarEstimacionPorID(OrdenEstimacion aOrdenEstimacion)
        {
            return OrdenEstimacionDataAccess.AfectarEstimacionPorID(aOrdenEstimacion);
        }

        /// <summary>
        /// Método que avanza un movimiento de OrdenEstimacion
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int AvanzarReportePorID(int iID, string strMov)
        {
            return OrdenEstimacionDataAccess.AvanzarReportePorID(iID, strMov);
        }


        /// <summary>
        /// Método que cancela un movimiento 
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int CancelarOrdenEstimacionPorID(int iID)
        {
            return OrdenEstimacionDataAccess.CancelarOrdenEstimacionPorID(iID);
        }

        #endregion
    }
}
