using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que adminsitra la información de los Tipos de Paricipantes
    /// </summary>
    public class TipoParticipanteBusiness
    {
        #region Agregar

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los objetos de Tipos de Participantes
        /// </summary>
        /// <returns></returns>
        public static List<TipoParticipante> ObtenerTodosTipoParticipantes()
        {
            return TipoParticipanteDataAccess.ObtenerTodosTipoParticipantes();
        }

        #endregion

        #region Eliminar

        #endregion

        #region Actualizar

        #endregion
    }
}
