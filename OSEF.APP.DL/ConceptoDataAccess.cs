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
    /// Clase que administra los datos de la tabla de Conceptos
    /// </summary>
    public class ConceptoDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Conceptos
        /// </summary>
        /// <param name="iConcepto"></param>
        public static string Insertar(Concepto iConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 7;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpModulo = new SqlParameter();
                sqlpModulo.ParameterName = "@Modulo";
                sqlpModulo.SqlDbType = SqlDbType.VarChar;
                sqlpModulo.Value = iConcepto.Modulo;

                SqlParameter sqlpOrden = new SqlParameter();
                sqlpOrden.ParameterName = "@Orden";
                sqlpOrden.SqlDbType = SqlDbType.SmallInt;
                sqlpOrden.Value = iConcepto.Orden;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iConcepto.Descripcion;

                SqlParameter sqlpCategoria = new SqlParameter();
                sqlpCategoria.ParameterName = "@Categoria";
                sqlpCategoria.SqlDbType = SqlDbType.Char;
                sqlpCategoria.Size = 5;
                if (iConcepto.CategoriaIdRaw == null)
                    sqlpCategoria.Value = DBNull.Value;
                else
                    sqlpCategoria.Value = iConcepto.CategoriaIdRaw;

                SqlParameter sqlpSubCategoria = new SqlParameter();
                sqlpSubCategoria.ParameterName = "@SubCategoria";
                sqlpSubCategoria.SqlDbType = SqlDbType.Char;
                sqlpSubCategoria.Size = 6;
                if (iConcepto.SubCategoriaIdRaw == null)
                    sqlpSubCategoria.Value = DBNull.Value;
                else
                    sqlpSubCategoria.Value = iConcepto.SubCategoriaIdRaw;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iConcepto.FechaAlta;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iConcepto.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpModulo);
                sqlcComando.Parameters.Add(sqlpOrden);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpCategoria);
                sqlcComando.Parameters.Add(sqlpSubCategoria);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpEstatus);

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
                throw new Exception("Error capa de datos (public static int Insertar(Concepto " + iConcepto.Descripcion + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Conceptos
        /// </summary>
        /// <param name="uConcepto"></param>
        public static int Actualizar(Concepto uConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 7;
                sqlpID.Value = uConcepto.Id;

                SqlParameter sqlpModulo = new SqlParameter();
                sqlpModulo.ParameterName = "@Modulo";
                sqlpModulo.SqlDbType = SqlDbType.VarChar;
                sqlpModulo.Value = uConcepto.Modulo;

                SqlParameter sqlpOrden = new SqlParameter();
                sqlpOrden.ParameterName = "@Orden";
                sqlpOrden.SqlDbType = SqlDbType.SmallInt;
                sqlpOrden.Value = uConcepto.Orden;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = uConcepto.Descripcion;

                SqlParameter sqlpCategoria = new SqlParameter();
                sqlpCategoria.ParameterName = "@Categoria";
                sqlpCategoria.SqlDbType = SqlDbType.Char;
                sqlpCategoria.Size = 5;
                if (uConcepto.CategoriaIdRaw == null)
                    sqlpCategoria.Value = DBNull.Value;
                else
                    sqlpCategoria.Value = uConcepto.CategoriaIdRaw;

                SqlParameter sqlpSubCategoria = new SqlParameter();
                sqlpSubCategoria.ParameterName = "@SubCategoria";
                sqlpSubCategoria.SqlDbType = SqlDbType.Char;
                sqlpSubCategoria.Size = 6;
                if (uConcepto.SubCategoriaIdRaw == null)
                    sqlpSubCategoria.Value = DBNull.Value;
                else
                    sqlpSubCategoria.Value = uConcepto.SubCategoriaIdRaw;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = uConcepto.FechaAlta;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uConcepto.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpModulo);
                sqlcComando.Parameters.Add(sqlpOrden);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpCategoria);
                sqlcComando.Parameters.Add(sqlpSubCategoria);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpEstatus);

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
                throw new Exception("Error capa de datos (public static int Actualizar(Concepto " + uConcepto.Id + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Concepto por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
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
                throw new Exception("Error capa de datos (public static int Borrar(Concepto " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Categorias
        /// </summary>
        /// <returns></returns>
        public static List<Concepto> ObtenerConceptos()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerConceptos";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Concepto> result = LibraryGenerics<Concepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Concepto> ObtenerConceptos()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Concepto por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Concepto ObtenerConceptoPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerConceptoPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 7;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Concepto result = LibraryGenerics<Concepto>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Concepto ObtenerConceptoPorID(string " + strID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Concepto por su Orden
        /// </summary>
        /// <param name="bOrden"></param>
        /// <returns></returns>
        public static Concepto ObtenerConceptoPorOrden(short bOrden)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerConceptoPorOrden";

                //2. Declarar los parametros
                SqlParameter sqlpOrden = new SqlParameter();
                sqlpOrden.ParameterName = "@Orden";
                sqlpOrden.SqlDbType = SqlDbType.SmallInt;
                sqlpOrden.Value = bOrden;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpOrden);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Concepto result = LibraryGenerics<Concepto>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Concepto ObtenerConceptoPorOrden(short " + bOrden + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener los registros de Conceptos por Sucursal en Tasks (Programa de Obra)
        /// </summary>
        /// <param name="strSucursal"></param>
        /// <returns></returns>
        public static List<Concepto> ObtenerConceptoPorSucursal(string strSucursal)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerConceptoPorSucursal";

                //2. Declarar los parametros
                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.Char;
                sqlpSucursal.Size = 10;
                sqlpSucursal.Value = strSucursal;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpSucursal);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Concepto> result = LibraryGenerics<Concepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Concepto> ObtenerConceptoPorSucursal(string " + strSucursal + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
