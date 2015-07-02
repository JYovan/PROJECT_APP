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
    public class PreciarioConceptosDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="iPreciarioConcepto"></param>
        public static int Insertar(PreciarioConcepto iPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarPreciarioConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Direction = ParameterDirection.Output;

                //2. Declarar los parametros
                SqlParameter sqlpClave = new SqlParameter();
                sqlpClave.ParameterName = "@Clave";
                sqlpClave.SqlDbType = SqlDbType.Char;
                sqlpClave.Size = 7;
                sqlpClave.Value = iPreciarioConcepto.Clave;

                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.VarChar;
                sqlpPreciario.Value = iPreciarioConcepto.Preciario;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iPreciarioConcepto.Descripcion;

                SqlParameter sqlpCategoria = new SqlParameter();
                sqlpCategoria.ParameterName = "@Categoria";
                sqlpCategoria.SqlDbType = SqlDbType.Char;
                sqlpCategoria.Size = 10;
                sqlpCategoria.Value = iPreciarioConcepto.Categoria;

                SqlParameter sqlpSubCategoria = new SqlParameter();
                sqlpSubCategoria.ParameterName = "@SubCategoria";
                sqlpSubCategoria.SqlDbType = SqlDbType.Char;
                sqlpSubCategoria.Size = 10;
                sqlpSubCategoria.Value = iPreciarioConcepto.SubCategoria;

                SqlParameter sqlpSubSubCategoria = new SqlParameter();
                sqlpSubSubCategoria.ParameterName = "@SubSubCategoria";
                sqlpSubSubCategoria.SqlDbType = SqlDbType.Char;
                sqlpSubSubCategoria.Size = 10;
                sqlpSubSubCategoria.Value = iPreciarioConcepto.SubSubCategoria;

                SqlParameter sqlpUnidad = new SqlParameter();
                sqlpUnidad.ParameterName = "@Unidad";
                sqlpUnidad.SqlDbType = SqlDbType.VarChar;
                sqlpUnidad.Value = iPreciarioConcepto.Unidad;

                SqlParameter sqlpCosto = new SqlParameter();
                sqlpCosto.ParameterName = "@Costo";
                sqlpCosto.SqlDbType = SqlDbType.Decimal;
                sqlpCosto.Value = iPreciarioConcepto.Costo;


                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Decimal;
                sqlpCantidad.Value = iPreciarioConcepto.Cantidad;

                SqlParameter sqlpUtilizada = new SqlParameter();
                sqlpUtilizada.ParameterName = "@Utilizada";
                sqlpUtilizada.SqlDbType = SqlDbType.Decimal;
                sqlpUtilizada.Value = iPreciarioConcepto.Utilizada;

                SqlParameter sqlpImporte = new SqlParameter();
                sqlpImporte.ParameterName = "@Importe";
                sqlpImporte.SqlDbType = SqlDbType.Decimal;
                sqlpImporte.Value = iPreciarioConcepto.Importe;

                SqlParameter sqlpImporteFinal = new SqlParameter();
                sqlpImporteFinal.ParameterName = "@ImporteFinal";
                sqlpImporteFinal.SqlDbType = SqlDbType.Decimal;
                sqlpImporteFinal.Value = iPreciarioConcepto.Importefinal;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iPreciarioConcepto.Usuario;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iPreciarioConcepto.Estatus;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iPreciarioConcepto.FechaAlta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpClave);
                sqlcComando.Parameters.Add(sqlpPreciario);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpCategoria);
                sqlcComando.Parameters.Add(sqlpSubCategoria);
                sqlcComando.Parameters.Add(sqlpSubSubCategoria);
                sqlcComando.Parameters.Add(sqlpUnidad);
                sqlcComando.Parameters.Add(sqlpCosto);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpUtilizada);
                sqlcComando.Parameters.Add(sqlpImporte);
                sqlcComando.Parameters.Add(sqlpImporteFinal);
                sqlcComando.Parameters.Add(sqlpUsuario);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpFechaAlta);

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
                throw new Exception("Error capa de datos (public static int Insertar(PreciarioConcepto " + iPreciarioConcepto.Clave + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="uPreciarioConcepto"></param>
        public static int Actualizar(string strConcepto, decimal utilizada, int volumetria)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarPreciarioConcepto";


                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = strConcepto;

                SqlParameter sqlpUtilizada = new SqlParameter();
                sqlpUtilizada.ParameterName = "@Utilizada";
                sqlpUtilizada.SqlDbType = SqlDbType.Decimal;
                sqlpUtilizada.Value = utilizada;

                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@Volumetria";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = volumetria;

         

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpUtilizada);
                sqlcComando.Parameters.Add(sqlpVolumetria);

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
                throw new Exception("Error capa de datos (public static int Actualizar(PreciarioConcepto " + strConcepto + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioConcepto por su Preciario
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
                sqlcComando.CommandText = "web_spD_BorrarPreciarioConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.VarChar;
                sqlpPreciario.Value = dID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpPreciario);

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
                throw new Exception("Error capa de datos (public static int Borrar(PreciarioConcepto " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de PreciarioConcepto
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConcepto()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioConceptos";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<PreciarioConcepto> result = LibraryGenerics<PreciarioConcepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<PreciarioConcepto> ObtenerPreciarioConcepto()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener todos los registros de PreciarioConcepto filtrando su Preciario, Categoria, SubCategoria y SubSubCategoria
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConceptoFiltro(string strPreciario, string strCategoria,string strSubCategoria, string strSubsubCategoria)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioConceptosFiltro";

                //2. Declarar los parametros
                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.Char;
                sqlpPreciario.Size = 7;
                sqlpPreciario.Value = strPreciario;

                SqlParameter sqlpCategoria = new SqlParameter();
                sqlpCategoria.ParameterName = "@Categoria";
                sqlpCategoria.SqlDbType = SqlDbType.Char;
                sqlpCategoria.Size = 10;
                sqlpCategoria.Value = strCategoria;

                SqlParameter sqlpSubCategoria = new SqlParameter();
                sqlpSubCategoria.ParameterName = "@SubCategoria";
                sqlpSubCategoria.SqlDbType = SqlDbType.Char;
                sqlpSubCategoria.Size = 10;
                sqlpSubCategoria.Value = strSubCategoria;

                SqlParameter sqlpSubSubCategoria = new SqlParameter();
                sqlpSubSubCategoria.ParameterName = "@SubSubCategoria";
                sqlpSubSubCategoria.SqlDbType = SqlDbType.Char;
                sqlpSubSubCategoria.Size = 10;
                sqlpSubSubCategoria.Value = strSubsubCategoria;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpPreciario);
                sqlcComando.Parameters.Add(sqlpCategoria);
                sqlcComando.Parameters.Add(sqlpSubCategoria);
                sqlcComando.Parameters.Add(sqlpSubSubCategoria);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<PreciarioConcepto> result = LibraryGenerics<PreciarioConcepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<PreciarioConcepto> ObtenerPreciarioConceptoFiltro(string " + strPreciario + ", string " + strCategoria + ", string " + strSubCategoria + ", string " + strSubsubCategoria + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de PreciarioSubSubCategoria por su Preciario
        /// </summary>
        /// <param name="strPreciario"></param>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConceptoPorPreciario(string strPreciario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioConceptoPorPreciario";

                //2. Declarar los parametros
                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.Char;
                sqlpPreciario.Size = 7;
                sqlpPreciario.Value = strPreciario;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpPreciario);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista 
                List<PreciarioConcepto> result = LibraryGenerics<PreciarioConcepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioConcepto ObtenerPreciarioConceptoPorPreciario(string " + strPreciario + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener todos los registros de PreciarioConcepto
        /// </summary>
        /// <returns></returns>
        public static PreciarioConcepto ObtenerPreciarioConceptoPorId(string IDConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioConceptoPorId";

                //2. Declarar los parametros
                SqlParameter sqlpConceptoId = new SqlParameter();
                sqlpConceptoId.ParameterName = "@ID";
                sqlpConceptoId.SqlDbType = SqlDbType.Char;
                sqlpConceptoId.Size = 10;
                sqlpConceptoId.Value = IDConcepto;
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpConceptoId);
                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                PreciarioConcepto result = LibraryGenerics<PreciarioConcepto>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioConcepto ObtenerPreciarioConceptoPorId()): " + ex.Message);
            }
        }


        #endregion
    }
}
