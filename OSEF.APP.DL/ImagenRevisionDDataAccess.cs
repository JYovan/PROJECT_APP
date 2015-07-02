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
    /// Clase que administra los datos de la tabla de ImagenRevisionD
    /// </summary>
    public class ImagenRevisionDDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ImagenRevisionD
        /// </summary>
        /// <param name="iImagenRevisionD"></param>
        public static int Insertar(ImagenRevisionD iImagenRevisionD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarImagenRevisionD";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iImagenRevisionD.Revision;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.Char;
                sqlpConcepto.Size = 7;
                sqlpConcepto.Value = iImagenRevisionD.Concepto;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iImagenRevisionD.Nombre;

                SqlParameter sqlpDireccion = new SqlParameter();
                sqlpDireccion.ParameterName = "@Direccion";
                sqlpDireccion.SqlDbType = SqlDbType.VarChar;
                sqlpDireccion.Value = iImagenRevisionD.Direccion;

                SqlParameter sqlpUsuarioAlta = new SqlParameter();
                sqlpUsuarioAlta.ParameterName = "@UsuarioAlta";
                sqlpUsuarioAlta.SqlDbType = SqlDbType.VarChar;
                sqlpUsuarioAlta.Value = iImagenRevisionD.UsuarioAlta;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iImagenRevisionD.FechaAlta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);
                sqlcComando.Parameters.Add(sqlpConcepto);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpDireccion);
                sqlcComando.Parameters.Add(sqlpUsuarioAlta);
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
                throw new Exception("Error capa de datos (public static int Insertar(ImagenRevisionD " + iImagenRevisionD.Revision + ")): " + ex.Message);
            }
        }

        #endregion

        #region Borrar

        /// <summary>
        /// Método que borra Imágenes por Concepto y por Revisión
        /// </summary>
        /// <param name="iRevision"></param>
        /// <param name="strConcepto"></param>
        /// <returns></returns>
        public static int BorrarPorRevisionConcepto(int iRevision, string strConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarPorRevisionConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iRevision;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.Char;
                sqlpConcepto.Size = 7;
                sqlpConcepto.Value = strConcepto;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);
                sqlcComando.Parameters.Add(sqlpConcepto);

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
                throw new Exception("Error capa de datos (public static int BorrarPorRevisionConcepto(int " + iRevision + ", string " + strConcepto + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Método que borra Imágenes por Revision, Concepto y Nombre de la imagen
        /// </summary>
        /// <param name="iRevision"></param>
        /// <param name="strConcepto"></param>
        /// <param name="strNombre"></param>
        /// <returns></returns>
        public static int BorrarPorRevisionConceptoNombre(int iRevision, string strConcepto, string strNombre)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarPorRevisionConceptoNombre";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iRevision;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.Char;
                sqlpConcepto.Size = 7;
                sqlpConcepto.Value = strConcepto;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = strNombre;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);
                sqlcComando.Parameters.Add(sqlpConcepto);
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
                throw new Exception("Error capa de datos (public static int BorrarPorRevisionConceptoNombre(int " + iRevision + ", string " + strConcepto + ", string " + strNombre + ")): " + ex.Message);
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
        /// Obtener los registro de las Imagenes de Revision por su ID y Concepto
        /// </summary>
        /// <param name="iRevision"></param>
        /// <param name="strConcepto"></param>
        /// <returns></returns>
        public static List<ImagenRevisionD> ObtenerImagenesRevisionDPorRevisionConcepto(int iRevision, string strConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerImagenesRevisionDPorRevisionConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iRevision;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.Char;
                sqlpConcepto.Size = 7;
                sqlpConcepto.Value = strConcepto;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);
                sqlcComando.Parameters.Add(sqlpConcepto);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista
                List<ImagenRevisionD> result = LibraryGenerics<ImagenRevisionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<ImagenRevisionD> ObtenerImagenesRevisionDPorRevisionConcepto(int " + iRevision + ", string " + strConcepto + ")): " + ex.Message);
            }
        }

        #endregion
    }
}