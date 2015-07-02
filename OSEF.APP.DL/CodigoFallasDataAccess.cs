using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.LIBRARY.COMMON.Generics;
using System.Data.SqlClient;
using System.Configuration;
using System.Data; 

namespace OSEF.APP.DL
{
    public class CodigoFallasDataAccess
    {
        #region Consultar

        public static List<CodigoFalla> ObtenerCodigoFallas()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCodigoPPTA";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Codigos Fallas
                List<CodigoFalla> result = LibraryGenerics<CodigoFalla>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<CodigoFalla> ObtenerCodigoFallas()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de CodigoFallas por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static CodigoFalla ObtenerCodigoFallasPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCodigoPPTAPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la CodigoFallas
                CodigoFalla result = LibraryGenerics<CodigoFalla>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static CodigoFallas ObtenerCodigoFallasPorID(string " + strID + ")): " + ex.Message);
            }
        }




        /// <summary>
        /// Revisar si existen registros de Main Saver en Codigos PPTA por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerMainSaverEnCodigoPPTA(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerMainSaverEnCodigoPPTA";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@CodigoMainSaver";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = strID;

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
                throw new Exception("Error capa de datos (public static bool ObtenerMainSaverEnCodigoPPTA(string " + strID + ")): " + ex.Message);
            }
        }



        /// <summary>
        /// Revisar si existen registros de CodigoFallass en uso
        /// /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerRegistrosDeCodigoFallasPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCodigoPPTAEnUsoPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 50;
                sqlpID.Value = strID;

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
                throw new Exception("Error capa de datos (public static bool ObtenerRegistrosDeCodigoFallasPorID(string " + strID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Actualizar

        /// <summary>
        /// Método que modifica un registro a la tabla de xxxxx
        /// </summary>
        /// <param name="iCodigoFallas"></param>
        public static int Actualizar(CodigoFalla iCodigoFallas)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarCodigoPPTA";

                //2. Declarar los parametros  
                SqlParameter sqlpCodigoMainSaver = new SqlParameter();
                sqlpCodigoMainSaver.ParameterName = "@CodigoMainSaver";
                sqlpCodigoMainSaver.SqlDbType = SqlDbType.Char;
                sqlpCodigoMainSaver.Value = iCodigoFallas.CodigoMainSaver;
                 
                //SqlParameter sqlpEspecialidad = new SqlParameter();
                //sqlpEspecialidad.ParameterName = "@Especialidad";
                //sqlpEspecialidad.SqlDbType = SqlDbType.Char;
                //sqlpEspecialidad.Value = iCodigoFallas.Especialidad;

                //SqlParameter sqlpFamilia = new SqlParameter();
                //sqlpFamilia.ParameterName = "@Familia";
                //sqlpFamilia.SqlDbType = SqlDbType.Char;
                //sqlpFamilia.Value = iCodigoFallas.Familia;

                //SqlParameter sqlpSubEspecialidades = new SqlParameter();
                //sqlpSubEspecialidades.ParameterName = "@SubEspecialidad";
                //sqlpSubEspecialidades.SqlDbType = SqlDbType.Char;
                //sqlpSubEspecialidades.Value = iCodigoFallas.Subespecialidad;

                //SqlParameter sqlpDescripcion = new SqlParameter();
                //sqlpDescripcion.ParameterName = "@Descripcion";
                //sqlpDescripcion.SqlDbType = SqlDbType.Char;
                //sqlpDescripcion.Value = iCodigoFallas.Descripcion;

                SqlParameter sqlpDias = new SqlParameter();
                sqlpDias.ParameterName = "@Dias";
                sqlpDias.SqlDbType = SqlDbType.Char;
                sqlpDias.Value = iCodigoFallas.Dias;

                //SqlParameter sqlpPrioridad = new SqlParameter();
                //sqlpPrioridad.ParameterName = "@Prioridad";
                //sqlpPrioridad.SqlDbType = SqlDbType.Char;
                //sqlpPrioridad.Value = iCodigoFallas.Prioridad;

                //SqlParameter sqlpTiempoEstimado = new SqlParameter();
                //sqlpTiempoEstimado.ParameterName = "@TiempoEstimado";
                //sqlpTiempoEstimado.SqlDbType = SqlDbType.Char;
                //sqlpTiempoEstimado.Value = iCodigoFallas.TiempoEstimado;


                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpCodigoMainSaver);
                //sqlcComando.Parameters.Add(sqlpEspecialidad);
                //sqlcComando.Parameters.Add(sqlpFamilia);
                //sqlcComando.Parameters.Add(sqlpSubEspecialidades);
                //sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpDias);
                //sqlcComando.Parameters.Add(sqlpPrioridad);
                //sqlcComando.Parameters.Add(sqlpTiempoEstimado); 

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
                throw new Exception("Error capa de datos (public static int Modificar(CodigoFallas " + iCodigoFallas.CodigoMainSaver + ")): " + ex.Message);
            }
        }

        #endregion

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de xxxxx
        /// </summary>
        /// <param name="iCodigoFallas"></param>
        public static string Insertar(CodigoFalla iCodigoFallas)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarCodigoPPTA";

                //2. Declarar los parametros
                SqlParameter sqlpCodigoMainSaver = new SqlParameter();
                sqlpCodigoMainSaver.ParameterName = "@CodigoMainSaver";
                sqlpCodigoMainSaver.SqlDbType = SqlDbType.Char;
                sqlpCodigoMainSaver.Size = 50;
                sqlpCodigoMainSaver.Value = iCodigoFallas.CodigoMainSaver;

                //SqlParameter sqlpEspecialidad = new SqlParameter();
                //sqlpEspecialidad.ParameterName = "@Especialidad";
                //sqlpEspecialidad.SqlDbType = SqlDbType.Char;
                //sqlpEspecialidad.Value = iCodigoFallas.Especialidad;

                //SqlParameter sqlpFamilia = new SqlParameter();
                //sqlpFamilia.ParameterName = "@Familia";
                //sqlpFamilia.SqlDbType = SqlDbType.Char;
                //sqlpFamilia.Value = iCodigoFallas.Familia;

                //SqlParameter sqlpSubEspecialidad = new SqlParameter();
                //sqlpSubEspecialidad.ParameterName = "@SubEspecialidad";
                //sqlpSubEspecialidad.SqlDbType = SqlDbType.Char;
                //sqlpSubEspecialidad.Value = iCodigoFallas.Subespecialidad;

                //SqlParameter sqlpDescripcion = new SqlParameter();
                //sqlpDescripcion.ParameterName = "@Descripcion";
                //sqlpDescripcion.SqlDbType = SqlDbType.Char;
                //sqlpDescripcion.Value = iCodigoFallas.Descripcion;

                SqlParameter sqlpDias = new SqlParameter();
                sqlpDias.ParameterName = "@Dias";
                sqlpDias.SqlDbType = SqlDbType.Char;
                sqlpDias.Value = iCodigoFallas.Dias;

                //SqlParameter sqlpPrioridad = new SqlParameter();
                //sqlpPrioridad.ParameterName = "@Prioridad";
                //sqlpPrioridad.SqlDbType = SqlDbType.Char;
                //sqlpPrioridad.Value = iCodigoFallas.Prioridad;

                //SqlParameter sqlpTiempoEstimado = new SqlParameter();
                //sqlpTiempoEstimado.ParameterName = "@TiempoEstimado";
                //sqlpTiempoEstimado.SqlDbType = SqlDbType.Char;
                //sqlpTiempoEstimado.Value = iCodigoFallas.TiempoEstimado;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpCodigoMainSaver);
                //sqlcComando.Parameters.Add(sqlpEspecialidad);
                //sqlcComando.Parameters.Add(sqlpFamilia);
                //sqlcComando.Parameters.Add(sqlpSubEspecialidad);
                //sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpDias);
                //sqlcComando.Parameters.Add(sqlpPrioridad);
                //sqlcComando.Parameters.Add(sqlpTiempoEstimado);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return sqlcComando.Parameters["@CodigoMainSaver"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(CodigoFallas " + iCodigoFallas.CodigoMainSaver + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar una CodigoFallas por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarCodigoPPTA";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 50;
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
                throw new Exception("Error capa de datos (public static int Borrar(CodigoFallas " + dID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
