using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de ReferenciasInstitucionesSolicitudesPrestamos
    /// </summary>
    public class ReferenciaInstitucionSolicitudPrestamoDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ReferenciasInstitucionesSolicitudesPrestamos
        /// </summary>
        /// <param name="iReferenciaInstitucionSolicitudPrestamo"></param>
        public static int Insertar(ReferenciaInstitucionSolicitudPrestamo iReferenciaInstitucionSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarReferenciaInstitucionSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = iReferenciaInstitucionSolicitudPrestamo.SolicitudPrestamo;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iReferenciaInstitucionSolicitudPrestamo.Nombre;

                SqlParameter sqlpTipoCuenta = new SqlParameter();
                sqlpTipoCuenta.ParameterName = "@TipoCuenta";
                sqlpTipoCuenta.SqlDbType = SqlDbType.VarChar;
                sqlpTipoCuenta.Value = iReferenciaInstitucionSolicitudPrestamo.TipoCuenta;

                SqlParameter sqlpNoCuenta = new SqlParameter();
                sqlpNoCuenta.ParameterName = "@NoCuenta";
                sqlpNoCuenta.SqlDbType = SqlDbType.VarChar;
                sqlpNoCuenta.Value = iReferenciaInstitucionSolicitudPrestamo.NoCuenta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpTipoCuenta);
                sqlcComando.Parameters.Add(sqlpNoCuenta);

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
                throw new Exception("Error capa de datos (public static int Insertar(ReferenciaInstitucionSolicitudPrestamo " + iReferenciaInstitucionSolicitudPrestamo.SolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de ReferenciaInstitucionSolicitudPrestamo
        /// </summary>
        /// <param name="uReferenciaInstitucionSolicitudPrestamo"></param>
        public static int Actualizar(ReferenciaInstitucionSolicitudPrestamo uReferenciaInstitucionSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarReferenciaInstitucionSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uReferenciaInstitucionSolicitudPrestamo.ID;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = uReferenciaInstitucionSolicitudPrestamo.SolicitudPrestamo;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = uReferenciaInstitucionSolicitudPrestamo.Nombre;

                SqlParameter sqlpTipoCuenta = new SqlParameter();
                sqlpTipoCuenta.ParameterName = "@TipoCuenta";
                sqlpTipoCuenta.SqlDbType = SqlDbType.VarChar;
                sqlpTipoCuenta.Value = uReferenciaInstitucionSolicitudPrestamo.TipoCuenta;

                SqlParameter sqlpNoCuenta = new SqlParameter();
                sqlpNoCuenta.ParameterName = "@NoCuenta";
                sqlpNoCuenta.SqlDbType = SqlDbType.VarChar;
                sqlpNoCuenta.Value = uReferenciaInstitucionSolicitudPrestamo.NoCuenta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpTipoCuenta);
                sqlcComando.Parameters.Add(sqlpNoCuenta);

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
                throw new Exception("Error capa de datos (public static int Actualizar(ReferenciaInstitucionSolicitudPrestamo " + uReferenciaInstitucionSolicitudPrestamo.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun ReferenciaInstitucionSolicitudPrestamo por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarReferenciaInstitucionSolicitudPrestamoPorID";

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
        /// Eliminar todos los registros de ReferenciaInstitucionSolicitudPrestamo por su SolicitudPrestamo
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
                sqlcComando.CommandText = "web_spD_BorrarReferenciaInstitucionSolicitudPrestamoPorSolicitudPrestamo";

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
        ///// Obtener todos los registros de ReferenciaInstitucionSolicitudPrestamo
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
        /// Obtener un registro de ReferenciaInstitucionSolicitudPrestamo por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static ReferenciaInstitucionSolicitudPrestamo ObtenerReferenciaInstitucionSolicitudPrestamoPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerReferenciaInstitucionSolicitudPrestamoPorID";

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
                ReferenciaInstitucionSolicitudPrestamo result = LibraryGenerics<ReferenciaInstitucionSolicitudPrestamo>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static ReferenciaInstitucionSolicitudPrestamo ObtenerReferenciaInstitucionSolicitudPrestamoPorID(int " + iID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener una lista de registros de ReferenciaInstitucionSolicitudPrestamo por su Solicitud de Préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<ReferenciaInstitucionSolicitudPrestamo> ObtenerReferenciaInstitucionSolicitudPrestamoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerReferenciaInstitucionSolicitudPrestamoPorSolicitudPrestamo";

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
                List<ReferenciaInstitucionSolicitudPrestamo> result = LibraryGenerics<ReferenciaInstitucionSolicitudPrestamo>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<ReferenciaInstitucionSolicitudPrestamo> ObtenerReferenciaInstitucionSolicitudPrestamoPorSolicitudPrestamo(string " + strSolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
