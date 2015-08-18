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
    public class ModuloDataAccess
    {
        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Modulos
        /// </summary>
        /// <returns></returns>
        public static List<Modulo> ObtenerModulos()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerModulos";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Modulo> result = LibraryGenerics<Modulo>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Modulo> ObtenerEstados()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Modulos por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static List<Modulo> ObtenerModulosPorUsuarioID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerModulosXUsuario";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.VarChar;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Modulo> result = LibraryGenerics<Modulo>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Modulo>  web_spS_ObtenerModulosXUsuario(string " + strID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener un registro de Modulos por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Modulo ObtenerModuloPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerModuloPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Modulo result = LibraryGenerics<Modulo>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Modulo ObtenerModuloPorID(string " + strID + ")): " + ex.Message);
            }
        }
        #endregion


        #region Modificar

        /// <summary>
        /// Método que actualiza un registro de ModuloXUsuario
        /// </summary>
        /// <param name="uUsuario"></param>
        public static int ActualizarMxU(Modulo m)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarModuloXUsuario";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = m.ID; 

                SqlParameter sqlpUsuarioID = new SqlParameter();
                sqlpUsuarioID.ParameterName = "@UsuarioID";
                sqlpUsuarioID.SqlDbType = SqlDbType.VarChar;
                sqlpUsuarioID.Value = m.UsuarioID;

                SqlParameter sqlpModuloID = new SqlParameter();
                sqlpModuloID.ParameterName = "@ModuloID";
                sqlpModuloID.SqlDbType = SqlDbType.VarChar;
                sqlpModuloID.Value = m.ModuloID;

                SqlParameter sqlpPermiso = new SqlParameter();
                sqlpPermiso.ParameterName = "@Permiso";
                sqlpPermiso.SqlDbType = SqlDbType.Int;
                sqlpPermiso.Value = m.Permiso;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpUsuarioID);
                sqlcComando.Parameters.Add(sqlpModuloID);
                sqlcComando.Parameters.Add(sqlpPermiso); 
                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción UPDATE que no regresa filas
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Actualizar(Modulo " + m.ID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
