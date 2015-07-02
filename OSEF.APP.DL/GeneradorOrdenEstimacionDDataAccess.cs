using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.LIBRARY.COMMON.Generics;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace OSEF.APP.DL
{
    public class GeneradorOrdenEstimacionDDataAccess
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de GeneradorOrdenEstimacionD
        /// </summary>
        /// <param name="iFacturaOrdenEstimacionD"></param>
        public static int Insertar(GeneradorOrdenEstimacionD iGeneradorOrdenEstimacionD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarGeneradorOrdenEstimacionD";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iGeneradorOrdenEstimacionD.MovID;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@Concepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = iGeneradorOrdenEstimacionD.ConceptoID;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iGeneradorOrdenEstimacionD.Descripcion;

                SqlParameter sqlpEje = new SqlParameter();
                sqlpEje.ParameterName = "@Eje";
                sqlpEje.SqlDbType = SqlDbType.VarChar;
                sqlpEje.Value = iGeneradorOrdenEstimacionD.Eje;

                SqlParameter sqlpEntreEje1 = new SqlParameter();
                sqlpEntreEje1.ParameterName = "@EntreEje1";
                sqlpEntreEje1.SqlDbType = SqlDbType.VarChar;
                sqlpEntreEje1.Value = iGeneradorOrdenEstimacionD.EntreEje1;

                SqlParameter sqlpEntreEje2 = new SqlParameter();
                sqlpEntreEje2.ParameterName = "@EntreEje2";
                sqlpEntreEje2.SqlDbType = SqlDbType.VarChar;
                sqlpEntreEje2.Value = iGeneradorOrdenEstimacionD.EntreEje2;

                SqlParameter sqlpArea = new SqlParameter();
                sqlpArea.ParameterName = "@Area";
                sqlpArea.SqlDbType = SqlDbType.VarChar;
                sqlpArea.Value = iGeneradorOrdenEstimacionD.Area;

                SqlParameter sqlpLargo= new SqlParameter();
                sqlpLargo.ParameterName = "@Largo";
                sqlpLargo.SqlDbType = SqlDbType.Float;
                sqlpLargo.Value = iGeneradorOrdenEstimacionD.Largo;

                SqlParameter sqlpAncho = new SqlParameter();
                sqlpAncho.ParameterName = "@Ancho";
                sqlpAncho.SqlDbType = SqlDbType.Float;
                sqlpAncho.Value = iGeneradorOrdenEstimacionD.Ancho;

                SqlParameter sqlpAlto = new SqlParameter();
                sqlpAlto.ParameterName = "@Alto";
                sqlpAlto.SqlDbType = SqlDbType.Float;
                sqlpAlto.Value = iGeneradorOrdenEstimacionD.Alto;

                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Decimal;
                sqlpCantidad.Value = iGeneradorOrdenEstimacionD.Cantidad;
                sqlpCantidad.Precision = 10;
                sqlpCantidad.Scale = 2;

                SqlParameter sqlpTotal = new SqlParameter();
                sqlpTotal.ParameterName = "@Total";
                sqlpTotal.SqlDbType = SqlDbType.Decimal;
                sqlpTotal.Precision = 10;
                sqlpTotal.Scale = 2;
                sqlpTotal.Value = iGeneradorOrdenEstimacionD.Total;

                SqlParameter sqlpPlano = new SqlParameter();
                sqlpPlano.ParameterName = "@Plano";
                sqlpPlano.SqlDbType = SqlDbType.Char;
                sqlpPlano.Size = 20;
                sqlpPlano.Value = iGeneradorOrdenEstimacionD.Plano;
                 
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpPreciarioConcepto);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpEje);
                sqlcComando.Parameters.Add(sqlpEntreEje1);
                sqlcComando.Parameters.Add(sqlpEntreEje2);
                sqlcComando.Parameters.Add(sqlpArea);
                sqlcComando.Parameters.Add(sqlpLargo);
                sqlcComando.Parameters.Add(sqlpAncho);
                sqlcComando.Parameters.Add(sqlpAlto);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpTotal);
                sqlcComando.Parameters.Add(sqlpPlano);
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
                throw new Exception("Error capa de datos (public static int Insertar(GeneradorOrdenEstimacionD " + iGeneradorOrdenEstimacionD.ConceptoID + ")): " + ex.Message);
            }
        }

        #endregion


        #region Borrar



        /// <summary>
        /// Método que borra por concepto 
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarGeneradorOrdenEstimacionDPorConcepto(int dID, string strIDConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarGeneradorOrdenEstimacionDPorConcepto";

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
                throw new Exception("Error capa de datos (public static int BorrarGeneradorOrdenEstimacionDPorConcepto(int ID " + dID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que borra 
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarGeneradorOrdenesEstimacionPorID(int dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarGeneradorOrdenEstimacionDPorOrdenEstimacion";

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
                throw new Exception("Error capa de datos (public static int BorrarGeneradorOrdenesEstimacionPorID(int ID " + dID + ")): " + ex.Message);
            }
        }



        #endregion


        #region Consultar

        /// <summary>
        /// Obtener los registro de los generadores de OrdenEstimacion por su ID y PreciarioConcepto
        /// </summary>
        /// <param name="iOrdenEstimacion"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<GeneradorOrdenEstimacionD> ObtenerGeneradorOrdenEstimacionDConcepto(int iOrdenEstimacion, string strPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerGeneradorOrdenEstimacionDPorConcepto";

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
                List<GeneradorOrdenEstimacionD> result = LibraryGenerics<GeneradorOrdenEstimacionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<GeneradorOrdenEstimacionD> ObtenerGeneradorOrdenEstimacionDConcepto(int " + iOrdenEstimacion + ", string " + strPreciarioConcepto + ")): " + ex.Message);
            }
        }



        /// <summary>
        /// Revisar si existen registros insertados por concepto Y MOVIMIENTO
        /// </summary>
        /// <returns></returns>
        public static bool ObtenerGeneradorOrdenEstimacionVaciosPorMovimientoConcepto(string strConcepto, int id)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerGeneradorOrdenVaciosDPorConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = id;


                SqlParameter sqlpConcepto= new SqlParameter();
                sqlpConcepto.ParameterName = "@CONCEPTO";
                sqlpConcepto.SqlDbType = SqlDbType.Char;
                sqlpConcepto.Size = 10;
                sqlpConcepto.Value = strConcepto;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpConcepto);
                

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
                throw new Exception("Error capa de datos (public static bool ObtenerGeneradorOrdenEstimacionVaciosPorMovimientoConcepto(string " + strConcepto + ")): " + ex.Message);
            }
        }


        #endregion

    }
}
