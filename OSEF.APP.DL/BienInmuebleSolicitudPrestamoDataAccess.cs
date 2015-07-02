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
    /// Clase que administra los datos de la tabla de BienesInmueblesSolicitudesPrestamos
    /// </summary>
    public class BienInmuebleSolicitudPrestamoDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de BienesInmueblesSolicitudesPrestamos
        /// </summary>
        /// <param name="iBienInmuebleSolicitudPrestamo"></param>
        public static int Insertar(BienInmuebleSolicitudPrestamo iBienInmuebleSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarBienInmuebleSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = iBienInmuebleSolicitudPrestamo.SolicitudPrestamo;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = iBienInmuebleSolicitudPrestamo.Tipo;

                SqlParameter sqlpNoSerie = new SqlParameter();
                sqlpNoSerie.ParameterName = "@NoSerie";
                sqlpNoSerie.SqlDbType = SqlDbType.VarChar;
                sqlpNoSerie.Value = iBienInmuebleSolicitudPrestamo.NoSerie;

                SqlParameter sqlpValor = new SqlParameter();
                sqlpValor.ParameterName = "@Valor";
                sqlpValor.SqlDbType = SqlDbType.Money;
                sqlpValor.Value = iBienInmuebleSolicitudPrestamo.Valor;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpTipo);
                sqlcComando.Parameters.Add(sqlpNoSerie);
                sqlcComando.Parameters.Add(sqlpValor);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return Convert.ToInt32(sqlcComando.Parameters["@ID"].Value);
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(BienInmuebleSolicitudPrestamo " + iBienInmuebleSolicitudPrestamo.SolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de BienesInmueblesSolicitudesPrestamos
        /// </summary>
        /// <param name="uBienInmuebleSolicitudPrestamo"></param>
        public static int Actualizar(BienInmuebleSolicitudPrestamo uBienInmuebleSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarBienInmuebleSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uBienInmuebleSolicitudPrestamo.ID;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = uBienInmuebleSolicitudPrestamo.SolicitudPrestamo;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = uBienInmuebleSolicitudPrestamo.Tipo;

                SqlParameter sqlpNoSerie = new SqlParameter();
                sqlpNoSerie.ParameterName = "@NoSerie";
                sqlpNoSerie.SqlDbType = SqlDbType.VarChar;
                sqlpNoSerie.Value = uBienInmuebleSolicitudPrestamo.NoSerie;

                SqlParameter sqlpValor = new SqlParameter();
                sqlpValor.ParameterName = "@Valor";
                sqlpValor.SqlDbType = SqlDbType.Money;
                sqlpValor.Value = uBienInmuebleSolicitudPrestamo.Valor;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpTipo);
                sqlcComando.Parameters.Add(sqlpNoSerie);
                sqlcComando.Parameters.Add(sqlpValor);

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
                throw new Exception("Error capa de datos (public static int Actualizar(BienInmuebleSolicitudPrestamo " + uBienInmuebleSolicitudPrestamo.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun BienInmuebleSolicitudPrestamo por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int BorrarPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarBienInmuebleSolicitudPrestamoPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID;

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
                throw new Exception("Error capa de datos (public static int BorrarPorID(int " + iID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Eliminar todos los registros de BienesInmueblesSolicitudesPrestamos por su SolicitudPrestamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static int BorrarPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarBienInmuebleSolicitudPrestamoPorSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = strSolicitudPrestamo;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);

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
                throw new Exception("Error capa de datos (public static int BorrarPorSolicitudPrestamo(string " + strSolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        ///// <summary>
        ///// Obtener todos los registros de BienesInmueblesSolicitudesPrestamos
        ///// </summary>
        ///// <returns></returns>
        //public static List<BienInmuebleSolicitudPrestamo> ObtenerBienesInmueblesSolicitudesPrestamos()
        //{
        //    try
        //    {
        //        //1. Configurar la conexión y el tipo de comando
        //        SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
        //        SqlCommand sqlcComando = new SqlCommand();
        //        sqlcComando.Connection = sqlcConectar;
        //        sqlcComando.CommandType = CommandType.StoredProcedure;
        //        sqlcComando.CommandText = "web_spS_ObtenerArticulos";

        //        //2. Declarar los parametros

        //        //3. Agregar los parametros al comando

        //        //4. Abrir la conexión
        //        sqlcComando.Connection.Open();

        //        //5. Ejecutar la instrucción SELECT que regresa filas
        //        SqlDataReader reader = sqlcComando.ExecuteReader();

        //        //6. Asignar la lista de Clientes
        //        List<BienInmuebleSolicitudPrestamo> result = LibraryGenerics<BienInmuebleSolicitudPrestamo>.ConvertDataSetToList(reader);

        //        //7. Cerrar la conexión
        //        sqlcComando.Connection.Close();

        //        //8. Regresar el resultado
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception("Error capa de datos (public static List<BienInmuebleSolicitudPrestamo> ObtenerBienesInmueblesSolicitudesPrestamos()): " + ex.Message);
        //    }
        //}

        /// <summary>
        /// Obtener un registro de BienesInmueblesSolicitudesPrestamos por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static BienInmuebleSolicitudPrestamo ObtenerBienInmuebleSolicitudPrestamoPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerBienInmuebleSolicitudPrestamoPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                BienInmuebleSolicitudPrestamo result = LibraryGenerics<BienInmuebleSolicitudPrestamo>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static BienInmuebleSolicitudPrestamo BienInmuebleSolicitudPrestamo(int " + iID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener una lista de registros de BienesInmueblesSolicitudesPrestamos por su Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<BienInmuebleSolicitudPrestamo> ObtenerBienInmuebleSolicitudPrestamoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerBienInmuebleSolicitudPrestamoPorSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = strSolicitudPrestamo;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<BienInmuebleSolicitudPrestamo> result = LibraryGenerics<BienInmuebleSolicitudPrestamo>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<BienInmuebleSolicitudPrestamo> ObtenerBienInmuebleSolicitudPrestamoPorSolicitudPrestamo(string " + strSolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
