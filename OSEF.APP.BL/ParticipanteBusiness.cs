using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que adminsitra la información de los Paricipantes
    /// </summary>
    public class ParticipanteBusiness
    {
        #region Agregar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Participantes
        /// </summary>
        /// <param name="iEvento"></param>
        public static string Insertar(Participante iParticipante)
        {
            return ParticipanteDataAccess.Insertar(iParticipante);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los participantes
        /// </summary>
        /// <returns></returns>
        public static List<Participante> ObtenerTodosParticipantes()
        {
            return ParticipanteDataAccess.ObtenerTodosParticipantes();
        }

        #endregion

        #region Eliminar

        #endregion

        #region Actualizar

        /// <summary>
        /// Método que actualiza el campo de Pagado a un Participante
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="bPagado"></param>
        /// <returns></returns>
        public static int ActualizarPagado(string strID, bool bPagado)
        {
            return ParticipanteDataAccess.ActualizarPagado(strID, bPagado);
        }

        #endregion
    }
}
