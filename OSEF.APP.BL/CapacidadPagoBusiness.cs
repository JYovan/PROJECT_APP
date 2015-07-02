using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Capacidad de Pago
    /// </summary>
    public class CapacidadPagoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CapacidadPago
        /// </summary>
        /// <param name="iCapacidadPago"></param>
        public static int Insertar(CapacidadPago iCapacidadPago)
        {
            return CapacidadPagoDataAccess.Insertar(iCapacidadPago);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un objeto de CapacidadesPagos
        /// </summary>
        /// <param name="uCapacidadPago"></param>
        /// <returns></returns>
        public static int Actualizar(CapacidadPago uCapacidadPago)
        {
            return CapacidadPagoDataAccess.Actualizar(uCapacidadPago);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar un objeto de CapacidadPago por el ID de Solicitud de Préstamo
        /// </summary>
        /// <param name="dSolicitudPrestamo"></param>
        public static int BorrarPorSolicitudPrestamo(string dSolicitudPrestamo)
        {
            return CapacidadPagoDataAccess.BorrarPorSolicitudPrestamo(dSolicitudPrestamo);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registros de CapacidadPago por Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<CapacidadPago> ObtenerCapacidadPagoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return CapacidadPagoDataAccess.ObtenerCapacidadPagoPorSolicitudPrestamo(strSolicitudPrestamo);
        }

        #endregion
    }
}
