using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de BienesMueblesSolicitudesPrestamos
    /// </summary>
    public class BienMuebleSolicitudPrestamoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de BienesMueblesSolicitudesPrestamos
        /// </summary>
        /// <param name="iBienMuebleSolicitudPrestamo"></param>
        public static int Insertar(BienMuebleSolicitudPrestamo iBienMuebleSolicitudPrestamo)
        {
            return BienMuebleSolicitudPrestamoDataAccess.Insertar(iBienMuebleSolicitudPrestamo);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de BienesMueblesSolicitudesPrestamos
        /// </summary>
        /// <param name="uBienMuebleSolicitudPrestamo"></param>
        public static int Actualizar(BienMuebleSolicitudPrestamo uBienMuebleSolicitudPrestamo)
        {
            return BienMuebleSolicitudPrestamoDataAccess.Actualizar(uBienMuebleSolicitudPrestamo);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun BienMuebleSolicitudPrestamo por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int BorrarPorID(int iID)
        {
            return BienMuebleSolicitudPrestamoDataAccess.BorrarPorID(iID);
        }

        /// <summary>
        /// Eliminar todos los registros de BienesMueblesSolicitudesPrestamos por su SolicitudPrestamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static int BorrarPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return BienMuebleSolicitudPrestamoDataAccess.BorrarPorSolicitudPrestamo(strSolicitudPrestamo);
        }

        #endregion

        #region Consultar

        ///// <summary>
        ///// Obtener todos los registros de BienesInmueblesSolicitudesPrestamos
        ///// </summary>
        ///// <returns></returns>
        //public static List<BienInmuebleSolicitudPrestamo> ObtenerBienesInmueblesSolicitudesPrestamos()
        //{
        //}

        /// <summary>
        /// Obtener un registro de BienesMueblesSolicitudesPrestamos por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static BienMuebleSolicitudPrestamo ObtenerBienMuebleSolicitudPrestamoPorID(int iID)
        {
            return BienMuebleSolicitudPrestamoDataAccess.ObtenerBienMuebleSolicitudPrestamoPorID(iID);
        }

        /// <summary>
        /// Obtener una lista de registros de BienesMueblesSolicitudesPrestamos por su Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<BienMuebleSolicitudPrestamo> ObtenerBienMuebleSolicitudPrestamoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return BienMuebleSolicitudPrestamoDataAccess.ObtenerBienMuebleSolicitudPrestamoPorSolicitudPrestamo(strSolicitudPrestamo);
        }

        #endregion
    }
}
