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
    public class PreciarioGeneralConceptoDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="iPreciarioConcepto"></param>
        public static int Insertar(PreciarioGeneralConcepto iPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarPreciarioGeneralConcepto";

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
                sqlpClave.Size = 30;
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

                SqlParameter sqlpMoneda = new SqlParameter();
                sqlpMoneda.ParameterName = "@Moneda";
                sqlpMoneda.SqlDbType = SqlDbType.VarChar;
                sqlpMoneda.Value = iPreciarioConcepto.Moneda;

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
                sqlcComando.Parameters.Add(sqlpUsuario);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
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
                throw new Exception("Error capa de datos (public static int Insertar(PreciarioGeneralConcepto " + iPreciarioConcepto.Clave + ")): " + ex.Message);
            }
        }

        #endregion


        #region Eliminar

        ///// <summary>
        ///// Método que borrar algun PreciarioGeneralConcepto por su Preciario
        ///// </summary>
        ///// <param name="dID"></param>
        //public static int Borrar(string dID)
        //{
        //    try
        //    {
        //        //1. Configurar la conexión y el tipo de comando
        //        SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
        //        SqlCommand sqlcComando = new SqlCommand();
        //        sqlcComando.Connection = sqlcConectar;
        //        sqlcComando.CommandType = CommandType.StoredProcedure;
        //        sqlcComando.CommandText = "web_spD_BorrarPreciarioGeneralConcepto";

        //        //2. Declarar los parametros
        //        SqlParameter sqlpPreciario = new SqlParameter();
        //        sqlpPreciario.ParameterName = "@Preciario";
        //        sqlpPreciario.SqlDbType = SqlDbType.VarChar;
        //        sqlpPreciario.Value = dID;

        //        //3. Agregar los parametros al comando
        //        sqlcComando.Parameters.Add(sqlpPreciario);

        //        //4. Abrir la conexión
        //        sqlcComando.Connection.Open();

        //        //5. Ejecutar la instrucción DELETE que no regresa filas
        //        int result = sqlcComando.ExecuteNonQuery();

        //        //6. Cerrar la conexión
        //        sqlcComando.Connection.Close();

        //        //7. Regresar el resultado
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception("Error capa de datos (public static int Borrar(PreciarioGeneralConcepto " + dID + ")): " + ex.Message);
        //    }
        //}


        /// <summary>
        /// Método que borrar algun PreciarioGeneralConcepto por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string ID, string clave)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarPreciarioGeneralConceptoAdicional";

                //2. Declarar los parametros
                SqlParameter sqlpIdConcepto = new SqlParameter();
                sqlpIdConcepto.ParameterName = "@ID";
                sqlpIdConcepto.SqlDbType = SqlDbType.Char;
                sqlpIdConcepto.Size = 10;
                sqlpIdConcepto.Value = ID;

                SqlParameter sqlpIdClave = new SqlParameter();
                sqlpIdClave.ParameterName = "@CLAVE";
                sqlpIdClave.SqlDbType = SqlDbType.Char;
                sqlpIdClave.Size = 30;
                sqlpIdClave.Value = clave;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpIdConcepto);
                sqlcComando.Parameters.Add(sqlpIdClave);

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
                throw new Exception("Error capa de datos (public static int Borrar(PreciarioGeneralConcepto " + ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar
        /// <summary>
        /// Obtener un registro de PreciarioGeneralConcepto por su Preciario
        /// </summary>
        /// <param name="strPreciario"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralConcepto> ObtenerPreciarioGeneralConceptoPorPreciario(string strPreciario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioGeneralConceptoPorPreciario";

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
                List<PreciarioGeneralConcepto> result = LibraryGenerics<PreciarioGeneralConcepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioGeneralConcepto ObtenerPreciarioGeneralConceptoPorPreciario(string " + strPreciario + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener un registro de PreciarioGeneralConcepto por su Preciario
        /// </summary>
        /// <param name="strPreciario"></param>
        /// <returns></returns>
        public static string ObtenerUltimoConceptoAdicional()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerUltimoPreciarioGeneralConcepto";

                //2. Declarar los parametros
                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                string result = Convert.ToString(sqlcComando.ExecuteScalar());

                //6. Asignar la lista 
                
                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioGeneralConcepto ObtenerUltimoConceptoAdicional()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener todos los registros de PreciarioGeneralConcepto por su ID
        /// </summary>
        /// <returns></returns>
        public static PreciarioGeneralConcepto ObtenerPreciarioGeneralConceptoPorId(string IDConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioGeneralConceptoPorId";

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

                //6. Asignar la lista 
                PreciarioGeneralConcepto result = LibraryGenerics<PreciarioGeneralConcepto>.ConvertDataSetToList(reader).FirstOrDefault();

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

        /// <summary>
        /// Obtener todos los registros de PreciarioGeneralConcepto filtrando su Preciario, Categoria, SubCategoria y SubSubCategoria
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioGeneralConcepto> ObtenerPreciarioGeneralConceptoFiltro(string strPreciario, string strCategoria, string strSubCategoria, string strSubsubCategoria)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioGeneralConceptosFiltro";

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
                List<PreciarioGeneralConcepto> result = LibraryGenerics<PreciarioGeneralConcepto>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<PreciarioGeneralConcepto> ObtenerPreciarioGeneralConceptoFiltro(string " + strPreciario + ", string " + strCategoria + ", string " + strSubCategoria + ", string " + strSubsubCategoria + ")): " + ex.Message);
            }
        }


        #endregion


        #region Actualizar

        /// <summary>
        /// Método que actualiza un registro en la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="iPreciarioConcepto"></param>
        public static int Actualizar(PreciarioGeneralConcepto iPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarPreciarioGeneralConceptoAdicional";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = iPreciarioConcepto.ID;

                //2. Declarar los parametros
                SqlParameter sqlpClave = new SqlParameter();
                sqlpClave.ParameterName = "@Clave";
                sqlpClave.SqlDbType = SqlDbType.Char;
                sqlpClave.Size = 30;
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
                 
                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iPreciarioConcepto.Usuario;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iPreciarioConcepto.Estatus; 

                SqlParameter sqlpMoneda = new SqlParameter();
                sqlpMoneda.ParameterName = "@Moneda";
                sqlpMoneda.SqlDbType = SqlDbType.VarChar;
                sqlpMoneda.Value = iPreciarioConcepto.Moneda;

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
                sqlcComando.Parameters.Add(sqlpUsuario);
                sqlcComando.Parameters.Add(sqlpEstatus); 
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
                throw new Exception("Error capa de datos (public static int Actualizar(PreciarioGeneralConcepto " + iPreciarioConcepto.Clave + ")): " + ex.Message);
            }
        }




        /// <summary>
        /// Revisar si existen registros de Conceptos en uso
        /// /// </summary>
        /// <param name="ID"></param>
        /// <param name="clave"></param>
        /// <returns></returns>
        public static bool ObtenerConceptosEnUsoPorIDyClave(string ID, string clave)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioGeneralConceptoAdicionalEnUsoPorIDyClave";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = ID;

                SqlParameter sqlpClave = new SqlParameter();
                sqlpClave.ParameterName = "@CLAVE";
                sqlpClave.SqlDbType = SqlDbType.Char;
                sqlpClave.Size = 30;
                sqlpClave.Value = clave;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpClave);

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
                throw new Exception("Error capa de datos (public static bool ObtenerConceptosEnUsoPorIDyClave(string " + ID + ", string "+clave+")): " + ex.Message);
            }
        }


        #endregion

    }
}
