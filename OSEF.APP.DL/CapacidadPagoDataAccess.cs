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
    /// Clase que administra los datos de la tabla de Capacidad de Pago
    /// </summary>
    public class CapacidadPagoDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CapacidadesPagos
        /// </summary>
        /// <param name="iCapacidadPago"></param>
        public static int Insertar(CapacidadPago iCapacidadPago)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarCapacidadPago";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = iCapacidadPago.SolicitudPrestamo;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.Int;
                sqlpRenglon.Value = iCapacidadPago.Renglon;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = iCapacidadPago.Tipo;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.VarChar;
                sqlpConcepto.Value = iCapacidadPago.Concepto;

                SqlParameter sqlpImporte = new SqlParameter();
                sqlpImporte.ParameterName = "@Importe";
                sqlpImporte.SqlDbType = SqlDbType.SmallMoney;
                sqlpImporte.Value = iCapacidadPago.Importe;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpRenglon);
                sqlcComando.Parameters.Add(sqlpTipo);
                sqlcComando.Parameters.Add(sqlpConcepto);
                sqlcComando.Parameters.Add(sqlpImporte);

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
                throw new Exception("Error capa de datos (public static int Insertar(CapacidadPago " + iCapacidadPago.Concepto + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de CapacidadesPagos
        /// </summary>
        /// <param name="uCapacidadPago"></param>
        public static int Actualizar(CapacidadPago uCapacidadPago)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarCapacidadPago";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uCapacidadPago.ID;

                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = uCapacidadPago.SolicitudPrestamo;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.Int;
                sqlpRenglon.Value = uCapacidadPago.Renglon;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = uCapacidadPago.Tipo;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.VarChar;
                sqlpConcepto.Value = uCapacidadPago.Concepto;

                SqlParameter sqlpImporte = new SqlParameter();
                sqlpImporte.ParameterName = "@Importe";
                sqlpImporte.SqlDbType = SqlDbType.SmallMoney;
                sqlpImporte.Value = uCapacidadPago.Importe;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpSolicitudPrestamo);
                sqlcComando.Parameters.Add(sqlpRenglon);
                sqlcComando.Parameters.Add(sqlpTipo);
                sqlcComando.Parameters.Add(sqlpConcepto);
                sqlcComando.Parameters.Add(sqlpImporte);

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
                throw new Exception("Error capa de datos (public static int Actualizar(CapacidadPago " + uCapacidadPago.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algunas Capacidades de pago por el ID de Solicitud de Préstamo
        /// </summary>
        /// <param name="dSolicitudPrestamo"></param>
        public static int BorrarPorSolicitudPrestamo(string dSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarCapacidadPagoPorSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpSolicitudPrestamo = new SqlParameter();
                sqlpSolicitudPrestamo.ParameterName = "@SolicitudPrestamo";
                sqlpSolicitudPrestamo.SqlDbType = SqlDbType.Char;
                sqlpSolicitudPrestamo.Size = 8;
                sqlpSolicitudPrestamo.Value = dSolicitudPrestamo;

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
                throw new Exception("Error capa de datos (public static int BorrarPorSolicitudPrestamo(string " + dSolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener los registros de Capacidades de pago por la Solicitud de préstamo
        /// </summary>
        /// <param name="strSolicitudPrestamo"></param>
        /// <returns></returns>
        public static List<CapacidadPago> ObtenerCapacidadPagoPorSolicitudPrestamo(string strSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCapacidadPagoPorSolicitudPrestamo";

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
                List<CapacidadPago> result = LibraryGenerics<CapacidadPago>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<CapacidadPago> ObtenerCapacidadPagoPorSolicitudPrestamo(string " + strSolicitudPrestamo + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
