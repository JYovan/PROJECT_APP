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
    public class FacturaOrdenEstimacionDDataAccess
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de FacturaOrdenEstimacionD
        /// </summary>
        /// <param name="iFacturaOrdenEstimacionD"></param>
        public static int Insertar(FacturaOrdenEstimacionD iFacturaOrdenEstimacionD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarFacturaOrdenEstimacionD";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iFacturaOrdenEstimacionD.MovID;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@Concepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = iFacturaOrdenEstimacionD.Concepto;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iFacturaOrdenEstimacionD.Nombre;

                SqlParameter sqlpDireccion = new SqlParameter();
                sqlpDireccion.ParameterName = "@Direccion";
                sqlpDireccion.SqlDbType = SqlDbType.VarChar;
                sqlpDireccion.Value = iFacturaOrdenEstimacionD.Direccion;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iFacturaOrdenEstimacionD.Usuario;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iFacturaOrdenEstimacionD.FechaAlta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpPreciarioConcepto);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpDireccion);
                sqlcComando.Parameters.Add(sqlpUsuario);
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
                throw new Exception("Error capa de datos (public static int Insertar(FacturaOrdenEstimacionD " + iFacturaOrdenEstimacionD.MovID + ")): " + ex.Message);
            }
        }

        #endregion


        #region Borrar



        /// <summary>
        /// Método que borra Factura por concepto y por OrdenEstimacion
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarFacturasOrdenEstimacionDPorConcepto(int dID, string strIDConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarFacturaOrdenEstimacionDPorConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = dID;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@Concepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = strIDConcepto;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpPreciarioConcepto);

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
                throw new Exception("Error capa de datos (public static int BorrarFacturasOrdenEstimacionDPorConcepto(int ID " + dID + ")): " + ex.Message);
            }
        }



        /// <summary>
        /// Método que borra Factura por concepto y por OrdenEstimacion
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarFacturaOrdenEstimacionDPorConceptoYNombre(int dID, string strIDConcepto, string nIMG)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarFacturaOrdenEstimacionDPorConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = dID;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@Concepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = strIDConcepto;

                //SqlParameter sqlpNombre = new SqlParameter();
                //sqlpNombre.ParameterName = "@NombreIMG";
                //sqlpNombre.SqlDbType = SqlDbType.VarChar;
                //sqlpNombre.Value = nIMG;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpPreciarioConcepto);
                //sqlcComando.Parameters.Add(sqlpNombre);

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
                throw new Exception("Error capa de datos (public static int BorrarFacturaOrdenEstimacionDPorConceptoYNombre(int ID " + dID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que borra Facturas por Movimiento
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarFacturasOrdenesEstimacionPorID(int dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarFacturaOrdenEstimacionDPorOrdenEstimacion";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
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
                throw new Exception("Error capa de datos (public static int BorrarFacturasOrdenesEstimacionPorID(int ID " + dID + ")): " + ex.Message);
            }
        }



        #endregion


        #region Consultar

        /// <summary>
        /// Obtener los registro de as Facturas de OrdenEstimacion por su ID y PreciarioConcepto
        /// </summary>
        /// <param name="iOrdenEstimacion"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<FacturaOrdenEstimacionD> ObtenerFacturaOrdenEstimacionDPorMovPreciarioConcepto(int iOrdenEstimacion, string strPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerFacturaOrdenEstimacionDPorConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iOrdenEstimacion;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@Concepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = strPreciarioConcepto;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpPreciarioConcepto);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista
                List<FacturaOrdenEstimacionD> result = LibraryGenerics<FacturaOrdenEstimacionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<FacturaOrdenEstimacionD> ObtenerFacturaOrdenEstimacionDPorMovPreciarioConcepto(int " + iOrdenEstimacion + ", string " + strPreciarioConcepto + ")): " + ex.Message);
            }
        }
        #endregion

    }
}
