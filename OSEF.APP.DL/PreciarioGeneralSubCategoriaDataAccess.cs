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
    /// Clase que administra todo el acceso de datos de PreciarioGeneralSubCategoria
    /// </summary>
    public class PreciarioGeneralSubCategoriaDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioSubCategoria
        /// </summary>
        /// <param name="iPreciarioSubCategorias"></param>
        public static string Insertar(PreciarioGeneralSubCategoria iPreciarioSubCategoria)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarPreciarioGeneralSubCategorias";

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
                sqlpClave.Value = iPreciarioSubCategoria.Clave;

                SqlParameter sqlpPreciario = new SqlParameter();
                sqlpPreciario.ParameterName = "@Preciario";
                sqlpPreciario.SqlDbType = SqlDbType.Char;
                sqlpPreciario.Size = 7;
                sqlpPreciario.Value = iPreciarioSubCategoria.Preciario;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iPreciarioSubCategoria.Descripcion;

                SqlParameter sqlpCategoria = new SqlParameter();
                sqlpCategoria.ParameterName = "@Categoria";
                sqlpCategoria.SqlDbType = SqlDbType.Char;
                sqlpCategoria.Size = 10;
                sqlpCategoria.Value = iPreciarioSubCategoria.Categoria;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iPreciarioSubCategoria.Usuario;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iPreciarioSubCategoria.Estatus;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iPreciarioSubCategoria.FechaAlta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpClave);
                sqlcComando.Parameters.Add(sqlpPreciario);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpCategoria);
                sqlcComando.Parameters.Add(sqlpUsuario);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpFechaAlta);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                sqlcComando.ExecuteScalar();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return sqlcComando.Parameters["@ID"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(PreciarioGeneralSubCategoria " + iPreciarioSubCategoria.Clave + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioSubCategoria por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarPreciarioGeneralSubCategorias";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@Preciario";
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
                throw new Exception("Error capa de datos (public static int Borrar(PreciarioGeneralSubCategoria " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener un registro de la SubCategoria del PreciarioGeneral por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneralSubCategoria ObtenerPreciarioGeneralSubCategoriaPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciariosGeneralesSubCategoriaPorID";

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
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                PreciarioGeneralSubCategoria result = LibraryGenerics<PreciarioGeneralSubCategoria>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioGeneralSubCategoria ObtenerPreciarioGeneralSubCategoriaPorID(string " + strID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener una lista de registros de las SubCategorias del Preciario General por el ID de una Categoria
        /// </summary>
        /// <param name="strCategoria"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralSubCategoria> ObtenerPreciarioGeneralSubCategoriaPorCategoria(string strCategoria)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioGeneralSubCategoriasPorCategoria";

                //2. Declarar los parametros
                SqlParameter sqlpCategoria = new SqlParameter();
                sqlpCategoria.ParameterName = "@Categoria";
                sqlpCategoria.SqlDbType = SqlDbType.Char;
                sqlpCategoria.Size = 10;
                sqlpCategoria.Value = strCategoria;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpCategoria);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<PreciarioGeneralSubCategoria> result = LibraryGenerics<PreciarioGeneralSubCategoria>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public List<PreciarioGeneralSubCategoria> ObtenerPreciarioGeneralSubCategoriaPorCategoria(string " + strCategoria + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtiene una lista de todas las SubCategorias del PreciarioGeneral por el ID del Preciario
        /// </summary>
        /// <param name="strPreciario"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralSubCategoria> ObtenerPreciarioGeneralSubcategoriasPorPreciario(string strPreciario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioGeneralSubCategoriasPorPreciario";

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

                //6. Asignar la lista de Clientes

                List<PreciarioGeneralSubCategoria> result = LibraryGenerics<PreciarioGeneralSubCategoria>.ConvertDataSetToList(reader);
                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public List<PreciarioGeneralSubCategoria> ObtenerPreciarioGeneralSubcategoriasPorPreciario(string " + strPreciario + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
