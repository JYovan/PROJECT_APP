using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que administra la información de Solicitudes De Prestamos
    /// </summary>
    public class SolicitudPrestamoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Solicitudes de Prestamo
        /// </summary>
        /// <param name="iSolicitudPrestamo"></param>
        public static string Insertar(SolicitudPrestamo iSolicitudPrestamo)
        {
            return SolicitudPrestamoDataAccess.Insertar(iSolicitudPrestamo);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Solicitudes Prestamos
        /// </summary>
        /// <param name="uSolicitudPrestamo"></param>
        public static int Actualizar(SolicitudPrestamo uSolicitudPrestamo)
        {
            return SolicitudPrestamoDataAccess.Actualizar(uSolicitudPrestamo);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Solicitud de Préstamo por su ID
        /// </summary>
        /// <param name="strID"></param>
        public static int Borrar(string strID)
        {
            return SolicitudPrestamoDataAccess.Borrar(strID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de Solicitudes de Préstamo
        /// </summary>
        /// <returns></returns>
        public static List<SolicitudPrestamo> ObtenerSolicitudesPrestamos()
        {
            return SolicitudPrestamoDataAccess.ObtenerSolicitudesPrestamos();
        }

        /// <summary>
        /// Obtener un registro de Solicitudes de Préstamo por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static SolicitudPrestamo ObtenerSolicitudPrestamoPorID(string strID)
        {
            return SolicitudPrestamoDataAccess.ObtenerSolicitudPrestamoPorID(strID);
        }

        #endregion
    }
}
