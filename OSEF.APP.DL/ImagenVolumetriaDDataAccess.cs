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
    /// Clase que administra los datos de la tabla de ImagenesVolumetriasD
    /// </summary>
    public class ImagenVolumetriaDDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ImagenesVolumetriasD
        /// </summary>
        /// <param name="iImagenVolumetriaD"></param>
        public static int Insertar(ImagenVolumetriaD iImagenVolumetriaD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarImagenVolumetriaD";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@Volumetria";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = iImagenVolumetriaD.Volumetria;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@PreciarioConcepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = iImagenVolumetriaD.PreciarioConcepto;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iImagenVolumetriaD.Nombre;

                SqlParameter sqlpDireccion = new SqlParameter();
                sqlpDireccion.ParameterName = "@Direccion";
                sqlpDireccion.SqlDbType = SqlDbType.VarChar;
                sqlpDireccion.Value = iImagenVolumetriaD.Direccion;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iImagenVolumetriaD.Usuario;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iImagenVolumetriaD.FechaAlta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);
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
                throw new Exception("Error capa de datos (public static int Insertar(ImagenVolumetriaD " + iImagenVolumetriaD.Volumetria + ")): " + ex.Message);
            }
        }

        #endregion


        #region Borrar



        /// <summary>
        /// Método que borra Imágenes por concepto y por Volumetria
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarImagenesVolumetria(int dID, string strIDConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarImagenPorConceptoVolumetria";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@Volumetria";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = dID;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@PreciarioConcepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = strIDConcepto;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);
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
                throw new Exception("Error capa de datos (public static int BorrarImagenesVolumetria(int Volumetria " + dID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que borra Imágenes por Volumetria
        /// </summary>
        /// <param name="dID"></param>
        public static int BorrarImagenesVolumetriaPorID(int dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarImagenPorVolumetria";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@Volumetria";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = dID;


                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);

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
                throw new Exception("Error capa de datos (public static int BorrarImagenesVolumetriaPorID(int Volumetria " + dID + ")): " + ex.Message);
            }
        }



        #endregion


        #region Consultar

        /// <summary>
        /// Obtener los registro de as Imaganes de Volumetrias por su Volumetria y PreciarioConcepto
        /// </summary>
        /// <param name="strVolumetria"></param>
        /// <param name="strPreciarioConcepto"></param>
        /// <returns></returns>
        public static List<ImagenVolumetriaD> ObtenerImagenVolumetriaDPorVolumetriaPreciarioConcepto(int iVolumetria, string strPreciarioConcepto)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerImagenVolumetriaDPorVolumetriaPreciarioConcepto";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@Volumetria";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = iVolumetria;

                SqlParameter sqlpPreciarioConcepto = new SqlParameter();
                sqlpPreciarioConcepto.ParameterName = "@PreciarioConcepto";
                sqlpPreciarioConcepto.SqlDbType = SqlDbType.Char;
                sqlpPreciarioConcepto.Size = 10;
                sqlpPreciarioConcepto.Value = strPreciarioConcepto;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);
                sqlcComando.Parameters.Add(sqlpPreciarioConcepto);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<ImagenVolumetriaD> result = LibraryGenerics<ImagenVolumetriaD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<ImagenVolumetriaD> ObtenerImagenVolumetriaDPorVolumetriaPreciarioConcepto(int " + iVolumetria + ", string " + strPreciarioConcepto + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
