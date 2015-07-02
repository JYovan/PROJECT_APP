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
    public class ImagenOrdenEstimacionDDataAccess
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ImagenOrdenEstimacionD
        /// </summary>
        /// <param name="iImagenOrdenEstimacionD"></param>
        public static int Insertar(ImagenOrdenEstimacionD iImagenOrdenEstimacionD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarImagenOrdenEstimacionD";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iImagenOrdenEstimacionD.MovID;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@Concepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = iImagenOrdenEstimacionD.Concepto;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iImagenOrdenEstimacionD.Nombre;

                SqlParameter sqlpDireccion = new SqlParameter();
                sqlpDireccion.ParameterName = "@Direccion";
                sqlpDireccion.SqlDbType = SqlDbType.VarChar;
                sqlpDireccion.Value = iImagenOrdenEstimacionD.Direccion;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iImagenOrdenEstimacionD.Usuario;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iImagenOrdenEstimacionD.FechaAlta;

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
                throw new Exception("Error capa de datos (public static int Insertar(ImagenOrdenEstimacionD " + iImagenOrdenEstimacionD.MovID + ")): " + ex.Message);
            }
        }

        #endregion


        #region Borrar



        /// <summary>
        /// Método que borra Imágenes por concepto y por OrdenEstimacion
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarImagenesOrdenEstimacionDPorConcepto(int dID, string strIDConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarImagenOrdenEstimacionDPorConcepto";

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
                throw new Exception("Error capa de datos (public static int BorrarImagenesOrdenEstimacionDPorConcepto(int ID " + dID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que borra Imágenes por concepto y por OrdenEstimacion
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarImagenesOrdenEstimacionDPorConceptoYNombre(int dID, string strIDConcepto, string nIMG)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarImagenOrdenEstimacionDPorConceptoYNombre";

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

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@NombreIMG";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = nIMG;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpPreciarioConcepto);
                sqlcComando.Parameters.Add(sqlpNombre);

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
                throw new Exception("Error capa de datos (public static int BorrarImagenesOrdenEstimacionDPorConceptoYNombre(int ID " + dID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que borra Imágenes por Movimiento
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarImagenesOrdenesEstimacionPorID(int dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarImagenOrdenEstimacionDPorOrdenEstimacion";

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
                throw new Exception("Error capa de datos (public static int BorrarImagenesOrdenesEstimacionPorID(int ID " + dID + ")): " + ex.Message);
            }
        }



        #endregion


        #region Consultar

        /// <summary>
        /// Obtener los registro de as Imaganes de OrdenEstimacion por su ID y PreciarioConcepto
        /// </summary>
        /// <param name="iOrdenEstimacion"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<ImagenOrdenEstimacionD> ObtenerImagenOrdenEstimacionDPorMovPreciarioConcepto(int iOrdenEstimacion, string strPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerImagenOrdenEstimacionDPorConcepto";

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
                List<ImagenOrdenEstimacionD> result = LibraryGenerics<ImagenOrdenEstimacionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<ImagenOrdenEstimacionD> ObtenerImagenOrdenEstimacionDPorMovPreciarioConcepto(int " + iOrdenEstimacion + ", string " + strPreciarioConcepto + ")): " + ex.Message);
            }
        }
        #endregion

    }
}
