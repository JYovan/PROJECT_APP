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
    public class CodigoPostalDataAccess
    {

        /// <summary>
        ///  Obtener todos los registros de Codigo Postal
        /// </summary> 
        /// <returns></returns>
        public static List<CodigoPostal> ObtenerCodigosPostalesPorColonia(string strColId)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCodigosPorColonia";

                //2. Declarar los parametros 
                SqlParameter sqlColId = new SqlParameter();
                sqlColId.ParameterName = "@IdColonia";
                sqlColId.SqlDbType = SqlDbType.VarChar;
                sqlColId.Value = strColId;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlColId);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<CodigoPostal> result = LibraryGenerics<CodigoPostal>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<CodigoPostal>  ObtenerCodigosPostalesPorColonia(" + strColId + ")): " + ex.Message);
            }
        }


        /// <summary>
        ///  Obtener todos los registros de Codigo Postal
        /// </summary> 
        /// <returns></returns>
        public static List<CodigoPostal> ObtenerCodigosPostalesPorNumero(int strNumero)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCodigoPostalPorNumero";

                //2. Declarar los parametros 
                SqlParameter sqlNumero = new SqlParameter();
                sqlNumero.ParameterName = "@Numero";
                sqlNumero.SqlDbType = SqlDbType.Int;

                if (strNumero == 0)
                    sqlNumero.Value = DBNull.Value;
                else
                    sqlNumero.Value = strNumero;

               

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlNumero);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<CodigoPostal> result = LibraryGenerics<CodigoPostal>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<CodigoPostal>  ObtenerCodigosPostalesPorNumero(" + strNumero + ")): " + ex.Message);
            }
        }

        /// <summary>
        ///  Obtener todos los registros de Codigo Postal
        /// </summary> 
        /// <returns></returns>
        public static CodigoPostal ObtenerCodigoPostalPorID(string Id)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCodigoPostalPorId";

                //2. Declarar los parametros 
                SqlParameter sqlColId = new SqlParameter();
                sqlColId.ParameterName = "@ID";
                sqlColId.SqlDbType = SqlDbType.Char;
                sqlColId.Size = 10;
                sqlColId.Value = Id;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlColId);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Codigos
                CodigoPostal result = LibraryGenerics<CodigoPostal>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static CodigoPostal ObtenerCodigoPostalPorID(" + Id + ")): " + ex.Message);
            }
        }



        /// <summary>
        /// Revisar si existen registros de CodigosPostales en uso
        /// /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerRegistrosDeCodigosPostalesPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCodigosPostalesEnUsoPorID";

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
                throw new Exception("Error capa de datos (public static bool ObtenerRegistrosDeColoniasPorID(string " + strID + ")): " + ex.Message);
            }
        }



        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CodigosPostales
        /// </summary>
        /// <param name="iCodigoPostal"></param>
        public static string Insertar(CodigoPostal iCodigoPostal)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarCodigoPostal";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = iCodigoPostal.Id;
                sqlpID.Size = 10;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Value = iCodigoPostal.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Value = iCodigoPostal.Municipio;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.Char;
                sqlpColonia.Value = iCodigoPostal.Colonia;

                SqlParameter sqlpNumero = new SqlParameter();
                sqlpNumero.ParameterName = "@Numero";
                sqlpNumero.SqlDbType = SqlDbType.Int;
                sqlpNumero.Value = iCodigoPostal.Numero;
                 
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);
                sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpNumero); 

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
                throw new Exception("Error capa de datos (public static int Insertar(CodigoPostal " + iCodigoPostal.Numero + ")): " + ex.Message);
            }
        }

        #endregion



        #region Modificar

        /// <summary>
        /// Método que actualiza algun Codigo Postal por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Actualizar(CodigoPostal icp)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarCodigoPostal";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = icp.Id;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpID.ParameterName = "@IdEstado";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 2;
                sqlpID.Value = icp.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpID.ParameterName = "@IdMunicipio";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 4;
                sqlpID.Value = icp.Municipio;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpID.ParameterName = "@IdColonia";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = icp.Colonia;

                SqlParameter sqlpNumero = new SqlParameter();
                sqlpID.ParameterName = "@Numero";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = icp.Numero;

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
                throw new Exception("Error capa de datos (public static int Actualizar(CodigoPostal " + icp + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Codigo Postal por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarCodigoPostal";

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
                throw new Exception("Error capa de datos (public static int Borrar(CodigoPostal " + dID + ")): " + ex.Message);
            }
        }

        #endregion

    }
}
