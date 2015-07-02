using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de BienesInmueblesSolicitudesPrestamos
    /// </summary>
    public class BienInmuebleSolicitudPrestamoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo objeto de BienesInmueblesSolicitudesPrestamos
        /// </summary>
        /// <param name="iBienInmuebleSolicitudPrestamo"></param>
        public static int Insertar(BienInmuebleSolicitudPrestamo iBienInmuebleSolicitudPrestamo)
        {
            return BienInmuebleSolicitudPrestamoDataAccess.Insertar(iBienInmuebleSolicitudPrestamo);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo objeto de BienesInmueblesSolicitudesPrestamos
        /// </summary>
        /// <param name="uBienInmuebleSolicitudPrestamo"></param>
        public static int Actualizar(BienInmuebleSolicitudPrestamo uBienInmuebleSolicitudPrestamo)
        {
            return BienInmuebleSolicitudPrestamoDataAccess.Actualizar(uBienInmuebleSolicitudPrestamo);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que elimina algun BienInmuebleSolicitudPrestamo por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int BorrarPorID(int iID)
        {
            return BienInmuebleSolicitudPrestamoDataAccess.BorrarPorID(iID);
        }

        /// <summary>
        /// Método que elimina todos los BienesInmueblesSolicitudesPrestamos por su SolicitudPrestamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static int BorrarPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return BienInmuebleSolicitudPrestamoDataAccess.BorrarPorSolicitudPrestamo(strSolicitudPrestamo);
        }

        #endregion

        #region Consultar

        ///// <summary>
        ///// Obtener toda la lista de objetos de BienesInmueblesSolicitudesPrestamos
        ///// </summary>
        ///// <returns></returns>
        //public static List<BienInmuebleSolicitudPrestamo> ObtenerBienesInmueblesSolicitudesPrestamos()
        //{
        //}

        /// <summary>
        /// Obtener un objeto de BienInmuebleSolicitudPrestamo por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static BienInmuebleSolicitudPrestamo ObtenerBienInmuebleSolicitudPrestamoPorID(int iID)
        {
            return BienInmuebleSolicitudPrestamoDataAccess.ObtenerBienInmuebleSolicitudPrestamoPorID(iID);
        }

        /// <summary>
        /// Obtener una lista de objetos tipo BienInmuebleSolicitudPrestamo por Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<BienInmuebleSolicitudPrestamo> ObtenerBienInmuebleSolicitudPrestamoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return BienInmuebleSolicitudPrestamoDataAccess.ObtenerBienInmuebleSolicitudPrestamoPorSolicitudPrestamo(strSolicitudPrestamo);
        }

        #endregion
    }
}
