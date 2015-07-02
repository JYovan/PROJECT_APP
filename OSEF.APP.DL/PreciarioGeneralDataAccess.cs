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
    public class PreciarioGeneralDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Preciario
        /// </summary>
        /// <param name="iPreciario"></param>
        public static string Insertar(PreciarioGeneral iPreciario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarPreciarioGeneral";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 7;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iPreciario.Descripcion;

                SqlParameter sqlpArchivo = new SqlParameter();
                sqlpArchivo.ParameterName = "@Archivo";
                sqlpArchivo.SqlDbType = SqlDbType.VarChar;
                sqlpArchivo.Value = iPreciario.Archivo;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iPreciario.Estatus;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iPreciario.Usuario;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iPreciario.FechaAlta;


                SqlParameter sqlpTipoObra = new SqlParameter();
                sqlpTipoObra.ParameterName = "@TipoObra";
                sqlpTipoObra.SqlDbType = SqlDbType.Bit;
                sqlpTipoObra.Value = iPreciario.TipoObra;

                SqlParameter sqlpTipoMantenimiento = new SqlParameter();
                sqlpTipoMantenimiento.ParameterName = "@TipoMantenimiento";
                sqlpTipoMantenimiento.SqlDbType = SqlDbType.Bit;
                sqlpTipoMantenimiento.Value = iPreciario.TipoMantenimiento;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpArchivo);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpUsuario);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpTipoObra);
                sqlcComando.Parameters.Add(sqlpTipoMantenimiento);
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
                throw new Exception("Error capa de datos (public static int Insertar(PreciarioGeneral " + iPreciario.ID + ")): " + ex.Message);
            }
        }

        #endregion
        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Preciarios
        /// </summary>
        /// <param name="uPreciario"></param>
        public static int Actualizar(PreciarioGeneral uPreciario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarPreciarioGeneral";


                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 7;
                sqlpID.Value = uPreciario.ID;


                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = uPreciario.Descripcion;


                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpDescripcion);

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
                throw new Exception("Error capa de datos (public static int Actualizar(Preciario " + uPreciario.ID + ")): " + ex.Message);
            }
        }

        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioGeneralpor su ID
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
                sqlcComando.CommandText = "web_spD_BorrarPreciarioGeneral";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.VarChar;
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
                throw new Exception("Error capa de datos (public static int Borrar(PreciarioGeneral " + dID + ")): " + ex.Message);
            }
        }

        #endregion


        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Preciarios
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioGeneral> ObtenerPreciariosGenerales()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciariosGenerales";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<PreciarioGeneral> result = LibraryGenerics<PreciarioGeneral>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<PreciarioGeneral> ObtenerPreciariosGenerales()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Preciario por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneral ObtenerPreciarioGeneralPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciariosGeneralesPorID";

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
                PreciarioGeneral result = LibraryGenerics<PreciarioGeneral>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioGeneral ObtenerPreciarioGeneralPorID(string " + strID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener un registro de Preciario General TipoObra
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneral ObtenerPreciarioGeneralTipoObra()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioGeneralObra";

                //2. Declarar los parametros
               
                //3. Agregar los parametros al comando
           

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                PreciarioGeneral result = LibraryGenerics<PreciarioGeneral>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioGeneral ObtenerPreciarioGeneralTipoObra(): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Preciario General TipoMantenimiento
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneral ObtenerPreciarioGeneralTipoMnto()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciarioGeneralMnto";

                //2. Declarar los parametros
               

                //3. Agregar los parametros al comando
             

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                PreciarioGeneral result = LibraryGenerics<PreciarioGeneral>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static PreciarioGeneral ObtenerPreciarioGeneralTipoMnto(): " + ex.Message);
            }
        }

        /// <summary>
        /// Revisar si existen registros de Sucursales en las revisiones por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerPreciariosGeneralesRepetidos(string Descricpion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerPreciariosGeneralesRepetidos";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@Descripcion";
                sqlpID.SqlDbType = SqlDbType.VarChar;
                sqlpID.Value = Descricpion;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

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
                throw new Exception("Error capa de datos (public static bool ObtenerPreciariosGeneralesRepetidos(string " + Descricpion + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
