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
    /// Clase que se encarga de la manipulación de todos los datos para las Respuestas
    /// </summary>
    public class RespuestasDataAccess
    {
        #region Agregar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Respuestas
        /// </summary>
        /// <param name="iRespuestas"></param>
        public static short Insertar(Respuestas iRespuestas)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarRespuestas";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.SmallInt;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpParticipante = new SqlParameter();
                sqlpParticipante.ParameterName = "@Participante";
                sqlpParticipante.SqlDbType = SqlDbType.Char;
                sqlpParticipante.Size = 8;
                sqlpParticipante.Value = iRespuestas.Participante;

                SqlParameter sqlpRespuesta01 = new SqlParameter();
                sqlpRespuesta01.ParameterName = "@Respuesta01";
                sqlpRespuesta01.SqlDbType = SqlDbType.VarChar;
                sqlpRespuesta01.IsNullable = true;
                if (iRespuestas.Respuesta01 == null)
                    sqlpRespuesta01.Value = DBNull.Value;
                else
                    sqlpRespuesta01.Value = iRespuestas.Respuesta01;

                SqlParameter sqlpRespuesta02 = new SqlParameter();
                sqlpRespuesta02.ParameterName = "@Respuesta02";
                sqlpRespuesta02.SqlDbType = SqlDbType.Bit;
                sqlpRespuesta02.IsNullable = true;
                if (iRespuestas.Respuesta02 == null)
                    sqlpRespuesta02.Value = DBNull.Value;
                else
                    sqlpRespuesta02.Value = iRespuestas.Respuesta02;

                SqlParameter sqlpRespuesta03 = new SqlParameter();
                sqlpRespuesta03.ParameterName = "@Respuesta03";
                sqlpRespuesta03.SqlDbType = SqlDbType.Bit;
                sqlpRespuesta03.IsNullable = true;
                if (iRespuestas.Respuesta03 == null)
                    sqlpRespuesta03.Value = DBNull.Value;
                else
                    sqlpRespuesta03.Value = iRespuestas.Respuesta03;

                SqlParameter sqlpRespuesta04 = new SqlParameter();
                sqlpRespuesta04.ParameterName = "@Respuesta04";
                sqlpRespuesta04.SqlDbType = SqlDbType.VarChar;
                sqlpRespuesta04.IsNullable = true;
                if (iRespuestas.Respuesta04 == null)
                    sqlpRespuesta04.Value = DBNull.Value;
                else
                    sqlpRespuesta04.Value = iRespuestas.Respuesta04;

                SqlParameter sqlpRespuesta05 = new SqlParameter();
                sqlpRespuesta05.ParameterName = "@Respuesta05";
                sqlpRespuesta05.SqlDbType = SqlDbType.TinyInt;
                sqlpRespuesta05.IsNullable = true;
                if (iRespuestas.Respuesta05 == null)
                    sqlpRespuesta05.Value = DBNull.Value;
                else
                    sqlpRespuesta05.Value = iRespuestas.Respuesta05;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpParticipante);
                sqlcComando.Parameters.Add(sqlpRespuesta01);
                sqlcComando.Parameters.Add(sqlpRespuesta02);
                sqlcComando.Parameters.Add(sqlpRespuesta03);
                sqlcComando.Parameters.Add(sqlpRespuesta04);
                sqlcComando.Parameters.Add(sqlpRespuesta05);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return Convert.ToInt16(sqlcComando.Parameters["@ID"].Value);
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static short Insertar(Empresa " + iRespuestas.Participante + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todas las respuestas de la base de datos para los participantes
        /// </summary>
        /// <returns></returns>
        public static List<Respuestas> ObtenerTodosRespuestas()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerTodosRespuestas";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Respuestas> result = LibraryGenerics<Respuestas>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Respuestas> ObtenerTodosRespuestas() " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        #endregion

        #region Actualizar

        #endregion
    }
}
