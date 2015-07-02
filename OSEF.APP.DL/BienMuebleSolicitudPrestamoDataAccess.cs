using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using OSEF.APP.EL;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de BienesMueblesSolicitudesPrestamos
    /// </summary>
    public class BienMuebleSolicitudPrestamoDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de BienesMueblesSolicitudesPrestamos
        /// </summary>
        /// <param name="iBienMuebleSolicitudPrestamo"></param>
        public static int Insertar(BienMuebleSolicitudPrestamo iBienMuebleSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarBienMuebleSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = iBienMuebleSolicitudPrestamo.SolicitudPrestamo;

                SqlParameter sqlpUbicacion = new SqlParameter();
                sqlpUbicacion.ParameterName = "@Ubicacion";
                sqlpUbicacion.SqlDbType = SqlDbType.VarChar;
                sqlpUbicacion.Value = iBienMuebleSolicitudPrestamo.Ubicacion;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = iBienMuebleSolicitudPrestamo.Tipo;

                SqlParameter sqlpInscripcion = new SqlParameter();
                sqlpInscripcion.ParameterName = "@Inscripcion";
                sqlpInscripcion.SqlDbType = SqlDbType.VarChar;
                sqlpInscripcion.Value = iBienMuebleSolicitudPrestamo.Inscripcion;

                SqlParameter sqlpValor = new SqlParameter();
                sqlpValor.ParameterName = "@Valor";
                sqlpValor.SqlDbType = SqlDbType.Money;
                sqlpValor.Value = iBienMuebleSolicitudPrestamo.Valor;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpUbicacion);
                sqlcComando.Parameters.Add(sqlpTipo);
                sqlcComando.Parameters.Add(sqlpInscripcion);
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
                throw new Exception("Error capa de datos (public static int Insertar(BienMuebleSolicitudPrestamo " + iBienMuebleSolicitudPrestamo.SolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de BienesMueblesSolicitudesPrestamos
        /// </summary>
        /// <param name="uBienMuebleSolicitudPrestamo"></param>
        public static int Actualizar(BienMuebleSolicitudPrestamo uBienMuebleSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarBienMuebleSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uBienMuebleSolicitudPrestamo.ID;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = uBienMuebleSolicitudPrestamo.SolicitudPrestamo;

                SqlParameter sqlpUbicacion = new SqlParameter();
                sqlpUbicacion.ParameterName = "@Ubicacion";
                sqlpUbicacion.SqlDbType = SqlDbType.VarChar;
                sqlpUbicacion.Value = uBienMuebleSolicitudPrestamo.Ubicacion;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = uBienMuebleSolicitudPrestamo.Tipo;

                SqlParameter sqlpInscripcion = new SqlParameter();
                sqlpInscripcion.ParameterName = "@Inscripcion";
                sqlpInscripcion.SqlDbType = SqlDbType.VarChar;
                sqlpInscripcion.Value = uBienMuebleSolicitudPrestamo.Inscripcion;

                SqlParameter sqlpValor = new SqlParameter();
                sqlpValor.ParameterName = "@Valor";
                sqlpValor.SqlDbType = SqlDbType.Money;
                sqlpValor.Value = uBienMuebleSolicitudPrestamo.Valor;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpUbicacion);
                sqlcComando.Parameters.Add(sqlpTipo);
                sqlcComando.Parameters.Add(sqlpInscripcion);
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
                throw new Exception("Error capa de datos (public static int Actualizar(BienMuebleSolicitudPrestamo " + uBienMuebleSolicitudPrestamo.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun BienMuebleSolicitudPrestamo por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarBienMuebleSolicitudPrestamoPorID";

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
        /// Eliminar todos los registros de BienesMueblesSolicitudesPrestamos por su SolicitudPrestamo
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
                sqlcComando.CommandText = "web_spD_BorrarBienMuebleSolicitudPrestamoPorSolicitudPrestamo";

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
        /// Obtener un registro de BienesMueblesSolicitudesPrestamos por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static BienMuebleSolicitudPrestamo ObtenerBienMuebleSolicitudPrestamoPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerBienMuebleSolicitudPrestamoPorID";

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
                BienMuebleSolicitudPrestamo result = LibraryGenerics<BienMuebleSolicitudPrestamo>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static BienMuebleSolicitudPrestamo ObtenerBienMuebleSolicitudPrestamoPorID(int " + iID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener una lista de registros de BienesMueblesSolicitudesPrestamos por su Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<BienMuebleSolicitudPrestamo> ObtenerBienMuebleSolicitudPrestamoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerBienMuebleSolicitudPrestamoPorSolicitudPrestamo";

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
                List<BienMuebleSolicitudPrestamo> result = LibraryGenerics<BienMuebleSolicitudPrestamo>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<BienMuebleSolicitudPrestamo> ObtenerBienMuebleSolicitudPrestamoPorSolicitudPrestamo(string " + strSolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
