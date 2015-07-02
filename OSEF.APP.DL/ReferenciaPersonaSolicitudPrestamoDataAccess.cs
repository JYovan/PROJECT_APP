using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using OSEF.APP.EL;
using System.Data;
using System.Configuration;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de ReferenciasPersonasSolicitudesPrestamos
    /// </summary>
    public class ReferenciaPersonaSolicitudPrestamoDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ReferenciasPersonasSolicitudesPrestamos
        /// </summary>
        /// <param name="iReferenciaPersonaSolicitudPrestamo"></param>
        public static int Insertar(ReferenciaPersonaSolicitudPrestamo iReferenciaPersonaSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarReferenciaPersonaSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = iReferenciaPersonaSolicitudPrestamo.SolicitudPrestamo;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iReferenciaPersonaSolicitudPrestamo.Nombre;

                SqlParameter sqlpDomicilio = new SqlParameter();
                sqlpDomicilio.ParameterName = "@Domicilio";
                sqlpDomicilio.SqlDbType = SqlDbType.VarChar;
                sqlpDomicilio.Value = iReferenciaPersonaSolicitudPrestamo.Domicilio;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = iReferenciaPersonaSolicitudPrestamo.Telefono;

                SqlParameter sqlpActividad = new SqlParameter();
                sqlpActividad.ParameterName = "@Actividad";
                sqlpActividad.SqlDbType = SqlDbType.VarChar;
                sqlpActividad.Value = iReferenciaPersonaSolicitudPrestamo.Actividad;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpDomicilio);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpActividad);

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
                throw new Exception("Error capa de datos (public static int Insertar(ReferenciaPersonaSolicitudPrestamo " + iReferenciaPersonaSolicitudPrestamo.SolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de ReferenciasPersonasSolicitudesPrestamos
        /// </summary>
        /// <param name="uReferenciaPersonaSolicitudPrestamo"></param>
        public static int Actualizar(ReferenciaPersonaSolicitudPrestamo uReferenciaPersonaSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarReferenciaPersonaSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uReferenciaPersonaSolicitudPrestamo.ID;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = uReferenciaPersonaSolicitudPrestamo.SolicitudPrestamo;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = uReferenciaPersonaSolicitudPrestamo.Nombre;

                SqlParameter sqlpDomicilio = new SqlParameter();
                sqlpDomicilio.ParameterName = "@Domicilio";
                sqlpDomicilio.SqlDbType = SqlDbType.VarChar;
                sqlpDomicilio.Value = uReferenciaPersonaSolicitudPrestamo.Domicilio;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = uReferenciaPersonaSolicitudPrestamo.Telefono;

                SqlParameter sqlpActividad = new SqlParameter();
                sqlpActividad.ParameterName = "@Actividad";
                sqlpActividad.SqlDbType = SqlDbType.VarChar;
                sqlpActividad.Value = uReferenciaPersonaSolicitudPrestamo.Actividad;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpDomicilio);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpActividad);

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
                throw new Exception("Error capa de datos (public static int Actualizar(ReferenciaPersonaSolicitudPrestamo " + uReferenciaPersonaSolicitudPrestamo.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun ReferenciasPersonasSolicitudesPrestamos por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarReferenciaPersonaSolicitudPrestamoPorID";

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
        /// Eliminar todos los registros de ReferenciasPersonasSolicitudesPrestamos por su SolicitudPrestamo
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
                sqlcComando.CommandText = "web_spD_BorrarReferenciaPersonaSolicitudPrestamoPorSolicitudPrestamo";

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
        /// Obtener un registro de ReferenciasPersonasSolicitudesPrestamos por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static ReferenciaPersonaSolicitudPrestamo ObtenerReferenciaPersonaSolicitudPrestamoPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerReferenciaPersonaSolicitudPrestamoPorID";

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
                ReferenciaPersonaSolicitudPrestamo result = LibraryGenerics<ReferenciaPersonaSolicitudPrestamo>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static ReferenciaPersonaSolicitudPrestamo ObtenerReferenciaPersonaSolicitudPrestamoPorID(int " + iID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener una lista de registros de ReferenciasPersonasSolicitudesPrestamos por su Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<ReferenciaPersonaSolicitudPrestamo> ObtenerReferenciaPersonaSolicitudPrestamoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerReferenciaPersonaSolicitudPrestamoPorSolicitudPrestamo";

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
                List<ReferenciaPersonaSolicitudPrestamo> result = LibraryGenerics<ReferenciaPersonaSolicitudPrestamo>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<ReferenciaPersonaSolicitudPrestamo> ObtenerReferenciaPersonaSolicitudPrestamoPorSolicitudPrestamo(string " + strSolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
