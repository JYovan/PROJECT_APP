using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de ReferenciasPersonasSolicitudesPrestamos
    /// </summary>
    public class ReferenciaPersonaSolicitudPrestamoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ReferenciasPersonasSolicitudesPrestamos
        /// </summary>
        /// <param name="iReferenciaPersonaSolicitudPrestamo"></param>
        public static int Insertar(ReferenciaPersonaSolicitudPrestamo iReferenciaPersonaSolicitudPrestamo)
        {
            return ReferenciaPersonaSolicitudPrestamoDataAccess.Insertar(iReferenciaPersonaSolicitudPrestamo);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de ReferenciasPersonasSolicitudesPrestamos
        /// </summary>
        /// <param name="uReferenciaPersonaSolicitudPrestamo"></param>
        public static int Actualizar(ReferenciaPersonaSolicitudPrestamo uReferenciaPersonaSolicitudPrestamo)
        {
            return ReferenciaPersonaSolicitudPrestamoDataAccess.Actualizar(uReferenciaPersonaSolicitudPrestamo);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun ReferenciasPersonasSolicitudesPrestamos por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int BorrarPorID(int iID)
        {
            return ReferenciaPersonaSolicitudPrestamoDataAccess.BorrarPorID(iID);
        }

        /// <summary>
        /// Eliminar todos los registros de ReferenciasPersonasSolicitudesPrestamos por su SolicitudPrestamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static int BorrarPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return ReferenciaPersonaSolicitudPrestamoDataAccess.BorrarPorSolicitudPrestamo(strSolicitudPrestamo);
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
        /// Obtener un registro de ReferenciasPersonasSolicitudesPrestamos por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static ReferenciaPersonaSolicitudPrestamo ObtenerReferenciaPersonaSolicitudPrestamoPorID(int iID)
        {
            return ReferenciaPersonaSolicitudPrestamoDataAccess.ObtenerReferenciaPersonaSolicitudPrestamoPorID(iID);
        }

        /// <summary>
        /// Obtener una lista de registros de ReferenciasPersonasSolicitudesPrestamos por su Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<ReferenciaPersonaSolicitudPrestamo> ObtenerReferenciaPersonaSolicitudPrestamoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return ReferenciaPersonaSolicitudPrestamoDataAccess.ObtenerReferenciaPersonaSolicitudPrestamoPorSolicitudPrestamo(strSolicitudPrestamo);
        }

        #endregion
    }
}
