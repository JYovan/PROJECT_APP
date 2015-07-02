using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de ReferenciasInstitucionesSolicitudesPrestamos
    /// </summary>
    public class ReferenciaInstitucionSolicitudPrestamoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ReferenciasInstitucionesSolicitudesPrestamos
        /// </summary>
        /// <param name="iReferenciaInstitucionSolicitudPrestamo"></param>
        public static int Insertar(ReferenciaInstitucionSolicitudPrestamo iReferenciaInstitucionSolicitudPrestamo)
        {
            return ReferenciaInstitucionSolicitudPrestamoDataAccess.Insertar(iReferenciaInstitucionSolicitudPrestamo);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de ReferenciaInstitucionSolicitudPrestamo
        /// </summary>
        /// <param name="uReferenciaInstitucionSolicitudPrestamo"></param>
        public static int Actualizar(ReferenciaInstitucionSolicitudPrestamo uReferenciaInstitucionSolicitudPrestamo)
        {
            return ReferenciaInstitucionSolicitudPrestamoDataAccess.Actualizar(uReferenciaInstitucionSolicitudPrestamo);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun ReferenciaInstitucionSolicitudPrestamo por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int BorrarPorID(int iID)
        {
            return ReferenciaInstitucionSolicitudPrestamoDataAccess.BorrarPorID(iID);
        }

        /// <summary>
        /// Eliminar todos los registros de ReferenciaInstitucionSolicitudPrestamo por su SolicitudPrestamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static int BorrarPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return ReferenciaInstitucionSolicitudPrestamoDataAccess.BorrarPorSolicitudPrestamo(strSolicitudPrestamo);
        }

        #endregion

        #region Consultar

        ///// <summary>
        ///// Obtener todos los registros de ReferenciaInstitucionSolicitudPrestamo
        ///// </summary>
        ///// <returns></returns>
        //public static List<BienInmuebleSolicitudPrestamo> ObtenerBienesInmueblesSolicitudesPrestamos()
        //{
        //}

        /// <summary>
        /// Obtener un registro de ReferenciaInstitucionSolicitudPrestamo por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static ReferenciaInstitucionSolicitudPrestamo ObtenerReferenciaInstitucionSolicitudPrestamoPorID(int iID)
        {
            return ReferenciaInstitucionSolicitudPrestamoDataAccess.ObtenerReferenciaInstitucionSolicitudPrestamoPorID(iID);
        }

        /// <summary>
        /// Obtener una lista de registros de ReferenciaInstitucionSolicitudPrestamo por su Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<ReferenciaInstitucionSolicitudPrestamo> ObtenerReferenciaInstitucionSolicitudPrestamoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            return ReferenciaInstitucionSolicitudPrestamoDataAccess.ObtenerReferenciaInstitucionSolicitudPrestamoPorSolicitudPrestamo(strSolicitudPrestamo);
        }

        #endregion
    }
}
