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
    /// Clase que administra los datos de la tabla de Colonias
    /// </summary>
    public class ColoniaDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Colonias
        /// </summary>
        /// <param name="iColonia"></param>
        public static string Insertar(Colonia iColonia)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarColonia";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = iColonia.ID;
                sqlpID.Size = 10;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iColonia.Descripcion;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Value = iColonia.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Value = iColonia.Municipio;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT 
                sqlcComando.ExecuteScalar();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return sqlcComando.Parameters["@ID"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(Colonia " + iColonia.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Municipios
        /// </summary>
        /// <param name="uMunicipio"></param>
        public static int Actualizar(Colonia uColonia)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarColonia";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = uColonia.ID;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = uColonia.Descripcion;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Value = uColonia.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Value = uColonia.Municipio;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);
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
                throw new Exception("Error capa de datos (public static int Actualizar(Colonia " + uColonia.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Colonia por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarColonia";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = dID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción DELETE que no regresa filas
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Borrar(Colonia " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Colonias
        /// </summary>
        /// <returns></returns>
        public static List<Colonia> ObtenerColonias()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerColonia";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Colonias
                List<Colonia> result = LibraryGenerics<Colonia>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Colonia> ObtenerColonia()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Colonia por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Colonia ObtenerColoniaPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerColoniaPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
           

                if (strID == null)
                    sqlpID.Value = DBNull.Value;
                else
                    sqlpID.Value = strID;

                

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Colonia result = LibraryGenerics<Colonia>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Colonia ObtenerColoniaPorID(string " + strID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener todos los colonias por municipio
        /// </summary>
        /// <param name="strMunicipio"></param>
        /// <returns></returns>
        public static List<Colonia> ObtenerColoniasPorMunicipio(string strMunicipio)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerColoniasPorMunicipio";

                //2. Declarar los parametros
                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Size = 4;
                sqlpMunicipio.Value = strMunicipio;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpMunicipio);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Colonia> result = LibraryGenerics<Colonia>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Colonia> ObtenerColoniasPorMunicipio(string " + strMunicipio + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Revisar si existen registros de Colonias En revisiones por ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerRegistrosDeColoniasPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerColoniasEnSucursalesPorID";

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
                bool result = Convert.ToBoolean(sqlcComando.ExecuteScalar());

                //6. Asignar la lista de objetos

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static bool ObtenerRegistrosDeColoniasPorID(string " + strID + ")): " + ex.Message);
            }
        }




        #endregion
    }
}
