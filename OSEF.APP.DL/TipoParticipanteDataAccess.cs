using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de todos los datos para los Tipos de Participantes
    /// </summary>
    public class TipoParticipanteDataAccess
    {
        #region Agregar

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de Tipos de Participantes
        /// </summary>
        /// <returns></returns>
        public static List<TipoParticipante> ObtenerTodosTipoParticipantes()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerTodosTipoParticipantes";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<TipoParticipante> result = LibraryGenerics<TipoParticipante>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<TipoParticipante> ObtenerTodosTipoParticipantes() " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        #endregion

        #region Actualizar

        #endregion
    }
}
