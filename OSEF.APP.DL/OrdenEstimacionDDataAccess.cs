using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de OrdenEstimacionD
    /// </summary>
    public class OrdenEstimacionDDataAccess
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de VolumetriaD
        /// </summary>
        /// <param name="iVolumetriaD"></param>
        /// 


        public static int Insertar(OrdenEstimacionD iOrdenEstimacionD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarOrdenEstimacionD";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@ID";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = iOrdenEstimacionD.Id;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = iOrdenEstimacionD.Renglon;

                SqlParameter sqlpConceptoID = new SqlParameter();
                sqlpConceptoID.ParameterName = "@ConceptoID";
                sqlpConceptoID.SqlDbType = SqlDbType.Char;
                sqlpConceptoID.Size = 10;
                sqlpConceptoID.Value = iOrdenEstimacionD.ConceptoID;


                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Decimal;
                sqlpCantidad.Precision = 10;
                sqlpCantidad.Scale = 6;
                if (iOrdenEstimacionD.Cantidad == 0)
                    sqlpCantidad.Value = 0;
                else
                    sqlpCantidad.Value = iOrdenEstimacionD.Cantidad; 

                SqlParameter sqlpUnidad = new SqlParameter();
                sqlpUnidad.ParameterName = "@Unidad";
                sqlpUnidad.SqlDbType = SqlDbType.VarChar;
                sqlpUnidad.Value = iOrdenEstimacionD.Unidad;

                SqlParameter sqlpPrecio = new SqlParameter();
                sqlpPrecio.ParameterName = "@Precio";
                sqlpPrecio.SqlDbType = SqlDbType.Decimal;
                sqlpPrecio.Precision = 20;
                sqlpPrecio.Scale = 6;
                sqlpPrecio.Value = iOrdenEstimacionD.Precio;

                SqlParameter sqlpImporte = new SqlParameter();
                sqlpImporte.ParameterName = "@Importe";
                sqlpImporte.SqlDbType = SqlDbType.Decimal;
                sqlpImporte.Precision = 20;
                sqlpImporte.Scale = 6;


                if (iOrdenEstimacionD.Importe == 0)
                    sqlpImporte.Value = 0;
                else
                    sqlpImporte.Value = iOrdenEstimacionD.Importe;



                SqlParameter sqlpIntExt = new SqlParameter();
                sqlpIntExt.ParameterName = "@IntExt";
                sqlpIntExt.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacionD.IntExt == null)
                    sqlpIntExt.Value = DBNull.Value;
                else
                    sqlpIntExt.Value = iOrdenEstimacionD.IntExt;

                 SqlParameter sqlpMoneda = new SqlParameter();
                 sqlpMoneda.ParameterName = "@Moneda";
                 sqlpMoneda.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacionD.Moneda == null)
                    sqlpMoneda.Value = DBNull.Value;
                else
                    sqlpMoneda.Value = iOrdenEstimacionD.Moneda;

                
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);
                sqlcComando.Parameters.Add(sqlpRenglon);
                sqlcComando.Parameters.Add(sqlpConceptoID);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpUnidad);
                sqlcComando.Parameters.Add(sqlpPrecio);
                sqlcComando.Parameters.Add(sqlpImporte);
                sqlcComando.Parameters.Add(sqlpIntExt);
                sqlcComando.Parameters.Add(sqlpMoneda);
                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(OrdenEstimacionD " + iOrdenEstimacionD.ConceptoID + ")): " + ex.Message);
            }
        }


        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de OrdenEstimacionD
        /// </summary>
        /// <param name="uVolumetriaD"></param>
        public static int Actualizar(OrdenEstimacionD uOrdenEstimacionD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarOrdenEstimacionD";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@ID";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = uOrdenEstimacionD.Id;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = uOrdenEstimacionD.Renglon;

                SqlParameter sqlpConceptoID = new SqlParameter();
                sqlpConceptoID.ParameterName = "@ConceptoID";
                sqlpConceptoID.SqlDbType = SqlDbType.Char;
                sqlpConceptoID.Size = 10;
                sqlpConceptoID.Value = uOrdenEstimacionD.ConceptoID;

                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Decimal;
                sqlpCantidad.Precision = 10;
                sqlpCantidad.Scale = 2;
                sqlpCantidad.Value = uOrdenEstimacionD.Cantidad;

                SqlParameter sqlpUnidad = new SqlParameter();
                sqlpUnidad.ParameterName = "@Unidad";
                sqlpUnidad.SqlDbType = SqlDbType.VarChar;
                sqlpUnidad.Value = uOrdenEstimacionD.Unidad;

                SqlParameter sqlpPrecio = new SqlParameter();
                sqlpPrecio.ParameterName = "@Precio";
                sqlpPrecio.SqlDbType = SqlDbType.Decimal;
                sqlpPrecio.Precision = 20;
                sqlpPrecio.Scale = 2;
                sqlpPrecio.Value = uOrdenEstimacionD.Precio;

                SqlParameter sqlpImporte = new SqlParameter();
                sqlpImporte.ParameterName = "@Importe";
                sqlpImporte.SqlDbType = SqlDbType.Decimal;
                sqlpImporte.Precision = 20;
                sqlpImporte.Scale = 2;
                sqlpImporte.Value = uOrdenEstimacionD.Importe;


                SqlParameter sqlpMoneda = new SqlParameter();
                sqlpMoneda.ParameterName = "@Moneda";
                sqlpMoneda.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacionD.Moneda == null)
                    sqlpMoneda.Value = DBNull.Value;
                else
                    sqlpMoneda.Value = uOrdenEstimacionD.Moneda;
              
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);
                sqlcComando.Parameters.Add(sqlpRenglon);
                sqlcComando.Parameters.Add(sqlpConceptoID);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpUnidad);
                sqlcComando.Parameters.Add(sqlpPrecio);
                sqlcComando.Parameters.Add(sqlpImporte);
                sqlcComando.Parameters.Add(sqlpMoneda);
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
                throw new Exception("Error capa de datos (public static int Actualizar(OrdenEstimacionD " + uOrdenEstimacionD.ConceptoID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna OrdenEstimacionD por su ID y Renglon
        /// </summary>
        /// <param name="iVolumetria"></param>
        /// <param name="sRenglon"></param>
        /// <returns></returns>
        public static int Borrar(int iID, short sRenglon)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarOrdenEstimacionD";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = sRenglon;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpRenglon);

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
                throw new Exception("Error capa de datos (public static int Borrar(int " + iID + ", short " + sRenglon + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que borrar OrdenEstimacionD por su OrdenEstimacion
        /// </summary>
        /// <param name="iVolumetria"></param>
        /// <returns></returns>
        public static int BorrarPorOrdenEstimacion(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarOrdenEstimacionDPorOrdenEstimacion";

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
                throw new Exception("Error capa de datos (public static int Borrar(int " + iID + ")): " + ex.Message);
            }
        }

        #endregion

        #region consultar

        /// <summary>
        /// Obtener los registros de OrdenEstimacionD por su OrdenEstimacion
        /// </summary>
        /// <param name="iOrdenEstimacion"></param>
        /// <returns></returns>
        public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDPorOrdenEstimacion(int iOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerOrdenEstimacionDPorOrdenEstimacion";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iOrdenEstimacion;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<OrdenEstimacionD> result = LibraryGenerics<OrdenEstimacionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDPorOrdenEstimacion(int " + iOrdenEstimacion + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener los registros de OrdenEstimacionD por su Movimiento Origen
        /// </summary>
        /// <param name="iOrdenEstimacion"></param>
        /// <returns></returns>
        public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDPorOrigen(string iOrigenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerEstimacionDPorMesaReporte";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@MOVID";
                sqlpID.SqlDbType = SqlDbType.VarChar;
                sqlpID.Value = iOrigenEstimacion;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<OrdenEstimacionD> result = LibraryGenerics<OrdenEstimacionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDPorOrigen(string " + iOrigenEstimacion + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener los registros de OrdenEstimacionD por su Movimiento Origen
        /// </summary>
        /// <param name="iOrdenEstimacion"></param>
        /// <returns></returns>
        public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDExploradorConcluidos()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerOrdenEstimacionDExploradorConcluidos";

                //2. Declarar los parametros
              

                //3. Agregar los parametros al comando
              

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<OrdenEstimacionD> result = LibraryGenerics<OrdenEstimacionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDExploradorConcluidos()): " + ex.Message);
            }
        }

        #endregion
    }
}
