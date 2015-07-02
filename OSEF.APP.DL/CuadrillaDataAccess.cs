using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.LIBRARY.COMMON.Generics;
using System.Data.SqlClient;
using System.Configuration;
using System.Data; 

namespace OSEF.APP.DL
{
    public class CuadrillaDataAccess
    {
        #region Consultar

        public static List<Cuadrilla> ObtenerCuadrillas()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCuadrillas";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Cuadrilla> result = LibraryGenerics<Cuadrilla>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Cuadrilla> ObtenerCuadrillas()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Cuadrilla por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Cuadrilla ObtenerCuadrillaPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCuadrillaPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;

                if (strID == null)
                {
                    sqlpID.Value = DBNull.Value;
                }
                else {
                    sqlpID.Value = strID;
                }

                

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la Cuadrilla
                Cuadrilla result = LibraryGenerics<Cuadrilla>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Cuadrilla ObtenerCuadrillaPorID(string " + strID + ")): " + ex.Message);
            }
        } 

        /// <summary>
        /// Revisar si existen registros de Cuadrillas en uso
        /// /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerRegistrosDeCuadrillaPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCuadrillasEnUsoPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
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
                throw new Exception("Error capa de datos (public static bool ObtenerRegistrosDeCuadrillaPorID(string " + strID + ")): " + ex.Message);
            }
        }

        #endregion
         
        #region Modificar

        /// <summary>
        /// Método que modifica un registro a la tabla de xxxxx
        /// </summary>
        /// <param name="iCuadrilla"></param>
        public static int Modificar(Cuadrilla iCuadrilla)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarCuadrilla";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = iCuadrilla.ID;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.Char;
                sqlpNombre.Value = iCuadrilla.Nombre;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.Char;
                sqlpDescripcion.Value = iCuadrilla.Descripcion;


                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpDescripcion);


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
                throw new Exception("Error capa de datos (public static int Modificar(Cuadrilla " + iCuadrilla.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de xxxxx
        /// </summary>
        /// <param name="iCuadrilla"></param>
        public static string Insertar(Cuadrilla iCuadrilla)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarCuadrilla";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = iCuadrilla.ID;
                sqlpID.Size = 10;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.Char;
                sqlpNombre.Value = iCuadrilla.Nombre;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.Char;
                sqlpDescripcion.Value = iCuadrilla.Descripcion;


                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpDescripcion);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return sqlcComando.Parameters["@ID"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(Cuadrilla " + iCuadrilla.ID + ")): " + ex.Message);
            }
        }

        #endregion
         
        #region Eliminar

        /// <summary>
        /// Método que borrar una Cuadrilla por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarCuadrillas";

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
                throw new Exception("Error capa de datos (public static int Borrar(Cuadrilla " + dID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
