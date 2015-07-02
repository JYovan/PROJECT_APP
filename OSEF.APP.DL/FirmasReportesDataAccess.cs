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
    /// Clase que administra los datos de la tabla de FirmasReportes
    /// </summary>
    public class FirmasReportesDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Finalidades
        /// </summary>
        /// <param name="iFinalidad"></param>
        public static int Insertar(FirmasReportes iFirma)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarFirmas";

                //2. Declarar los parametros

                SqlParameter sqlpFirmaReviso = new SqlParameter();
                sqlpFirmaReviso.ParameterName = "@FirmaReviso";
                sqlpFirmaReviso.SqlDbType = SqlDbType.VarChar;
                sqlpFirmaReviso.Value = iFirma.FirmaReviso;

                SqlParameter sqlpFirmaAutorizo = new SqlParameter();
                sqlpFirmaAutorizo.ParameterName = "@FirmaAutorizo";
                sqlpFirmaAutorizo.SqlDbType = SqlDbType.VarChar;
                sqlpFirmaAutorizo.Value = iFirma.FirmaAutorizo;

                SqlParameter sqlpModulo = new SqlParameter();
                sqlpModulo.ParameterName = "@Modulo";
                sqlpModulo.SqlDbType = SqlDbType.VarChar;
                sqlpModulo.Value = iFirma.Modulo;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpFirmaReviso);
                sqlcComando.Parameters.Add(sqlpFirmaAutorizo);
                sqlcComando.Parameters.Add(sqlpModulo);

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
                throw new Exception("Error capa de datos (public static int Insertar(FirmasReportes " + iFirma.Modulo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Finalidades
        /// </summary>
        /// <param name="uFinalidad"></param>
        public static int Actualizar(FirmasReportes uFirma)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarFirmas";

                //2. Declarar los parametros
                SqlParameter sqlpFirmaReviso = new SqlParameter();
                sqlpFirmaReviso.ParameterName = "@FirmaReviso";
                sqlpFirmaReviso.SqlDbType = SqlDbType.VarChar;
                sqlpFirmaReviso.Value = uFirma.FirmaReviso;

                SqlParameter sqlpFirmaAutorizo = new SqlParameter();
                sqlpFirmaAutorizo.ParameterName = "@FirmaAutorizo";
                sqlpFirmaAutorizo.SqlDbType = SqlDbType.VarChar;
                sqlpFirmaAutorizo.Value = uFirma.FirmaAutorizo;

                SqlParameter sqlpModulo = new SqlParameter();
                sqlpModulo.ParameterName = "@Modulo";
                sqlpModulo.SqlDbType = SqlDbType.VarChar;
                sqlpModulo.Value = uFirma.Modulo;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpFirmaReviso);
                sqlcComando.Parameters.Add(sqlpFirmaAutorizo);
                sqlcComando.Parameters.Add(sqlpModulo);

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
                throw new Exception("Error capa de datos (public static int Actualizar(FirmasReportes " + uFirma.Modulo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar
        /// <summary>
        /// Obtener un registro de FirmaReporte por su Modulo
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static FirmasReportes ObtenerFirmaReportePorModulo(string strModulo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerFirmasPorModulo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@MODULO";
                sqlpID.SqlDbType = SqlDbType.VarChar;
                sqlpID.Value = strModulo;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                FirmasReportes result = LibraryGenerics<FirmasReportes>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static FirmasReportes ObtenerFirmaReportePorModulo(string " + strModulo + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
