using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP;
using OSEF.APP.EL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de VolumetriaD
    /// </summary>
    public class VolumetriaDDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de VolumetriaD
        /// </summary>
        /// <param name="iVolumetriaD"></param>
        /// 


        public static int Insertar(VolumetriaD iVolumetriaD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarVolumetriaD";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@Volumetria";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = iVolumetriaD.Volumetria;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = iVolumetriaD.Renglon;

                SqlParameter sqlpConceptoID = new SqlParameter();
                sqlpConceptoID.ParameterName = "@ConceptoID";
                sqlpConceptoID.SqlDbType = SqlDbType.Char;
                sqlpConceptoID.Size = 10;
                sqlpConceptoID.Value = iVolumetriaD.ConceptoID;


                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Decimal;
                sqlpCantidad.Precision = 10;
                sqlpCantidad.Scale = 2;
                sqlpCantidad.Value = iVolumetriaD.Cantidad;

                SqlParameter sqlpUtilizada = new SqlParameter();
                sqlpUtilizada.ParameterName = "@Utilizada";
                sqlpUtilizada.SqlDbType = SqlDbType.Decimal;
                sqlpUtilizada.Precision = 10;
                sqlpUtilizada.Scale = 2;
                sqlpUtilizada.Value = iVolumetriaD.Utilizada;

             

                SqlParameter sqlpFotos = new SqlParameter();
                sqlpFotos.ParameterName = "@Fotos";
                sqlpFotos.SqlDbType = SqlDbType.VarChar;
                sqlpFotos.Value = iVolumetriaD.Fotos;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);
                sqlcComando.Parameters.Add(sqlpRenglon);
                sqlcComando.Parameters.Add(sqlpConceptoID);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpUtilizada);
                sqlcComando.Parameters.Add(sqlpFotos);

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
                throw new Exception("Error capa de datos (public static int Insertar(VolumetriaD " + iVolumetriaD.ConceptoID + ")): " + ex.Message);
            }
        }


        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de VolumetriaD
        /// </summary>
        /// <param name="uVolumetriaD"></param>
        public static int Actualizar(VolumetriaD uVolumetriaD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarVolumetriaD";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@Volumetria";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = uVolumetriaD.Volumetria;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = uVolumetriaD.Renglon;

                SqlParameter sqlpConceptoID = new SqlParameter();
                sqlpConceptoID.ParameterName = "@ConceptoID";
                sqlpConceptoID.SqlDbType = SqlDbType.Char;
                sqlpConceptoID.Size = 10;
                sqlpConceptoID.Value = uVolumetriaD.ConceptoID;

                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Decimal;
                sqlpCantidad.Precision = 10;
                sqlpCantidad.Scale = 2;
                sqlpCantidad.Value = uVolumetriaD.Cantidad;


                SqlParameter sqlpUtilizada = new SqlParameter();
                sqlpUtilizada.ParameterName = "@Utilizada";
                sqlpUtilizada.SqlDbType = SqlDbType.Decimal;
                sqlpUtilizada.Precision = 10;
                sqlpUtilizada.Scale = 2;
                sqlpUtilizada.Value = uVolumetriaD.Utilizada;

                SqlParameter sqlpFotos = new SqlParameter();
                sqlpFotos.ParameterName = "@Fotos";
                sqlpFotos.SqlDbType = SqlDbType.VarChar;
                sqlpFotos.Value = uVolumetriaD.Fotos;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);
                sqlcComando.Parameters.Add(sqlpRenglon);
                sqlcComando.Parameters.Add(sqlpConceptoID);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpUtilizada);
                sqlcComando.Parameters.Add(sqlpFotos);

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
                throw new Exception("Error capa de datos (public static int Actualizar(VolumetriaD " + uVolumetriaD.ConceptoID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        

        /// <summary>
        /// Método que borrar alguna VolumetriaD por su Volumetria y Renglon
        /// </summary>
        /// <param name="iVolumetria"></param>
        /// <param name="sRenglon"></param>
        /// <returns></returns>
        public static int Borrar(int iVolumetria, short sRenglon)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarVolumetriaD";

                //2. Declarar los parametros
                SqlParameter sqlpVolumetria = new SqlParameter();
                sqlpVolumetria.ParameterName = "@Volumetria";
                sqlpVolumetria.SqlDbType = SqlDbType.Int;
                sqlpVolumetria.Value = iVolumetria;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = sRenglon;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpVolumetria);
                sqlcComando.Parameters.Add(sqlpRenglon);

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
                throw new Exception("Error capa de datos (public static int Borrar(int " + iVolumetria + ", short " + sRenglon + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que borrar VolumetriaD por su Volumetria
        /// </summary>
        /// <param name="iVolumetria"></param>
        /// <returns></returns>
        public static int BorrarPorVolumetria(int iVolumetria)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarVolumetriaDPorVolumetria";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Volumetria";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iVolumetria;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);

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
                throw new Exception("Error capa de datos (public static int Borrar(int " + iVolumetria + ")): " + ex.Message);
            }
        }

        #endregion

        #region consultar

        /// <summary>
        /// Obtener los registros de VolumetriaD por su Volumetria
        /// </summary>
        /// <param name="iVolumetria"></param>
        /// <returns></returns>
        public static List<VolumetriaD> ObtenerVolumetriaDPorVolumetria(int iVolumetria)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerVolumetriasDPorVolumetria";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Volumetria";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iVolumetria;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<VolumetriaD> result = LibraryGenerics<VolumetriaD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<VolumetriaD> ObtenerVolumetriaDPorVolumetria(int " + iVolumetria + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener los registros de VolumetriaD por su Preciario
        /// </summary>
        /// <param name="iPreciario"></param>
        /// <returns></returns>
        public static List<VolumetriaD> ObtenerVolumetriaDPorPreciario(string iPreciario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerVolumetriasDPorPreciario";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Preciario";
                sqlpRevision.SqlDbType = SqlDbType.Char;
                sqlpRevision.Size = 7;
                sqlpRevision.Value = iPreciario;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<VolumetriaD> result = LibraryGenerics<VolumetriaD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<VolumetriaD> ObtenerVolumetriaDPorPreciario(int " + iPreciario + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener los registros de VolumetriaD por su Preciario
        /// </summary>
        /// <param name="iPreciario"></param>
        /// <returns></returns>
        public static VolumetriaD ObtenerVolumetriaDDescripcionPorPreciario(string iPreciario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerVolumetriasDPorPreciario";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Preciario";
                sqlpRevision.SqlDbType = SqlDbType.Char;
                sqlpRevision.Size = 7;
                sqlpRevision.Value = iPreciario;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                VolumetriaD result = LibraryGenerics<VolumetriaD>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static VolumetriaD ObtenerVolumetriaDDescripcionPorPreciario(string " + iPreciario + ")): " + ex.Message);
            }
        }

        #endregion


    }
}
