using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que adminsitra la información de las Respuestas
    /// </summary>
    public class RespuestasBusiness
    {
        #region Agregar

        /// <summary>
        /// Método que agrega las respuestas a las preguntas del registro de un participante
        /// </summary>
        /// <param name="iRespuestas"></param>
        public static short Insertar(Respuestas iRespuestas)
        {
            return RespuestasDataAccess.Insertar(iRespuestas);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de respuestas
        /// </summary>
        /// <returns></returns>
        public static List<Respuestas> ObtenerTodosRespuestas()
        {
            return RespuestasDataAccess.ObtenerTodosRespuestas();
        }

        #endregion

        #region Eliminar

        #endregion

        #region Actualizar

        #endregion
    }
}
