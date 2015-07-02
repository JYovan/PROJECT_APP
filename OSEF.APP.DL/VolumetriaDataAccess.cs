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
    /// Clase que administra los datos de la tabla de Volumetrias
    /// </summary>
   public  class VolumetriaDataAccess
   {
       #region insertar

       /// <summary>
       /// Método que inserta un nuevo registro a la tabla de Volumetrias
       /// </summary>
       /// <param name="iVolumetria"></param>
       public static int Insertar(Volumetria iVolumetria)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spI_InsertarVolumetria";

               //2. Declarar los parametros
               SqlParameter sqlpID = new SqlParameter();
               sqlpID.ParameterName = "@ID";
               sqlpID.SqlDbType = SqlDbType.Int;
               sqlpID.Direction = ParameterDirection.Output;

               SqlParameter sqlpMov = new SqlParameter();
               sqlpMov.ParameterName = "@Mov";
               sqlpMov.SqlDbType = SqlDbType.VarChar;
               sqlpMov.Value = iVolumetria.Mov;

               SqlParameter sqlpMovID = new SqlParameter();
               sqlpMovID.ParameterName = "@MovID";
               sqlpMovID.SqlDbType = SqlDbType.VarChar;
               if (iVolumetria.MovID == null)
                   sqlpMovID.Value = DBNull.Value;
               else
                   sqlpMovID.Value = iVolumetria.MovID;

               SqlParameter sqlpSucursal = new SqlParameter();
               sqlpSucursal.ParameterName = "@Sucursal";
               sqlpSucursal.SqlDbType = SqlDbType.Char;
               sqlpSucursal.Size = 10;
               sqlpSucursal.Value = iVolumetria.Sucursal;

               SqlParameter sqlpFechaEmision = new SqlParameter();
               sqlpFechaEmision.ParameterName = "@FechaEmision";
               sqlpFechaEmision.SqlDbType = SqlDbType.SmallDateTime;
               sqlpFechaEmision.Value = iVolumetria.FechaEmision;

               SqlParameter sqlpObservaciones = new SqlParameter();
               sqlpObservaciones.ParameterName = "@Observaciones";
               sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
               sqlpObservaciones.Value = iVolumetria.Observaciones;

               SqlParameter sqlpEstatus = new SqlParameter();
               sqlpEstatus.ParameterName = "@Estatus";
               sqlpEstatus.SqlDbType = SqlDbType.VarChar;
               sqlpEstatus.Value = iVolumetria.Estatus;

               SqlParameter sqlpUsuario = new SqlParameter();
               sqlpUsuario.ParameterName = "@Usuario";
               sqlpUsuario.SqlDbType = SqlDbType.VarChar;
               sqlpUsuario.Value = iVolumetria.Usuario;

               SqlParameter sqlpPreciario = new SqlParameter();
               sqlpPreciario.ParameterName = "@Preciario";
               sqlpPreciario.SqlDbType = SqlDbType.Char;
               sqlpPreciario.Size = 7;
               sqlpPreciario.Value = iVolumetria.Preciario;

               SqlParameter sqlpCliente = new SqlParameter();
               sqlpCliente.ParameterName = "@Cliente";
               sqlpCliente.SqlDbType = SqlDbType.Char;
               sqlpCliente.Size = 8;
               sqlpCliente.Value = iVolumetria.RCliente.ID; 

               //3. Agregar los parametros al comando
               sqlcComando.Parameters.Add(sqlpID);
               sqlcComando.Parameters.Add(sqlpMov);
               sqlcComando.Parameters.Add(sqlpMovID);
               sqlcComando.Parameters.Add(sqlpSucursal);
               sqlcComando.Parameters.Add(sqlpFechaEmision);
               sqlcComando.Parameters.Add(sqlpObservaciones);
               sqlcComando.Parameters.Add(sqlpEstatus);
               sqlcComando.Parameters.Add(sqlpUsuario);
               sqlcComando.Parameters.Add(sqlpPreciario);
               sqlcComando.Parameters.Add(sqlpCliente);

               //4. Abrir la conexión
               sqlcComando.Connection.Open();

               //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
               int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

               //6. Cerrar la conexión
               sqlcComando.Connection.Close();

               //7. Regresar el resultado
               return Convert.ToInt32(sqlcComando.Parameters["@ID"].Value);
           }
           catch (Exception ex)
           {
               throw new Exception("Error capa de datos (public static int Insertar(Volumetria " + iVolumetria.Mov + ")): " + ex.Message);
           }
       }

       #endregion

       #region modificar
       /// <summary>
       /// Método que actualiza un nuevo registro a la tabla de Volumetrias
       /// </summary>
       /// <param name="uVolumetria"></param>
       public static int Actualizar(Volumetria uVolumetria)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spU_ActualizarVolumetria";

               //2. Declarar los parametros
               SqlParameter sqlpID = new SqlParameter();
               sqlpID.ParameterName = "@ID";
               sqlpID.SqlDbType = SqlDbType.Int;
               sqlpID.Value = uVolumetria.ID;

               SqlParameter sqlpMov = new SqlParameter();
               sqlpMov.ParameterName = "@Mov";
               sqlpMov.SqlDbType = SqlDbType.VarChar;
               sqlpMov.Value = uVolumetria.Mov;

               SqlParameter sqlpMovID = new SqlParameter();
               sqlpMovID.ParameterName = "@MovID";
               sqlpMovID.SqlDbType = SqlDbType.VarChar;
               if (uVolumetria.MovID == null)
                   sqlpMovID.Value = DBNull.Value;
               else
                   sqlpMovID.Value = uVolumetria.MovID;

               SqlParameter sqlpSucursal = new SqlParameter();
               sqlpSucursal.ParameterName = "@Sucursal";
               sqlpSucursal.SqlDbType = SqlDbType.VarChar;
               sqlpSucursal.Value = uVolumetria.Sucursal;

               SqlParameter sqlpObservaciones = new SqlParameter();
               sqlpObservaciones.ParameterName = "@Observaciones";
               sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
               sqlpObservaciones.Value = uVolumetria.Observaciones;

               SqlParameter sqlpEstatus = new SqlParameter();
               sqlpEstatus.ParameterName = "@Estatus";
               sqlpEstatus.SqlDbType = SqlDbType.VarChar;
               sqlpEstatus.Value = uVolumetria.Estatus;

               SqlParameter sqlpPreciario = new SqlParameter();
               sqlpPreciario.ParameterName = "@Preciario";
               sqlpPreciario.SqlDbType = SqlDbType.Char;
               sqlpPreciario.Size = 7;
               sqlpPreciario.Value = uVolumetria.Preciario;

               SqlParameter sqlpCliente = new SqlParameter();
               sqlpCliente.ParameterName = "@Cliente";
               sqlpCliente.SqlDbType = SqlDbType.Char; 
               if (uVolumetria.Cliente == null || uVolumetria.Cliente.Trim().Equals(""))
                   sqlpCliente.Value = DBNull.Value;
               else
                   sqlpCliente.Value = uVolumetria.RCliente.ID;

               //3. Agregar los parametros al comando
               sqlcComando.Parameters.Add(sqlpID);
               sqlcComando.Parameters.Add(sqlpMov);
               sqlcComando.Parameters.Add(sqlpMovID);
               sqlcComando.Parameters.Add(sqlpSucursal);
               sqlcComando.Parameters.Add(sqlpObservaciones);
               sqlcComando.Parameters.Add(sqlpEstatus);
               sqlcComando.Parameters.Add(sqlpPreciario);
               sqlcComando.Parameters.Add(sqlpCliente);

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
               throw new Exception("Error capa de datos (public static int Actualizar(Volumetría " + uVolumetria.ID + ")): " + ex.Message);
           }
       }
       #endregion

       #region borrar

       /// <summary>
       /// Método que borrar alguna Volumetría por su ID
       /// </summary>
       /// <param name="dID"></param>
       public static int Borrar(int dID)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spD_BorrarVolumetria";

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
               throw new Exception("Error capa de datos (public static int Borrar(Volumetría " + dID + ")): " + ex.Message);
           }
       }

       #endregion

       #region consultar

       /// <summary>
       /// Obtener todos los registros de Volumetrias
       /// </summary>
       /// <returns></returns>
       public static List<Volumetria> ObtenerVolumetrias()
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spS_ObtenerVolumetrias";

               //2. Declarar los parametros

               //3. Agregar los parametros al comando

               //4. Abrir la conexión
               sqlcComando.Connection.Open();

               //5. Ejecutar la instrucción SELECT que regresa filas
               SqlDataReader reader = sqlcComando.ExecuteReader();

               //6. Asignar la lista de Clientes
               List<Volumetria> result = LibraryGenerics<Volumetria>.ConvertDataSetToList(reader);

               //7. Cerrar la conexión
               sqlcComando.Connection.Close();

               //8. Regresar el resultado
               return result;
           }
           catch (Exception ex)
           {
               throw new Exception("Error capa de datos (public static List<Volumetria> ObtenerVolumetrias()): " + ex.Message);
           }
       }

       /// <summary>
       /// Obtener un registro de Volumetrias por su ID
       /// </summary>
       /// <param name="iID"></param>
       /// <returns></returns>
       public static Volumetria ObtenerVolumetriaPorID(int iID)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spS_ObtenerVolumetriasPorID";

               //2. Declarar los parametros
               SqlParameter sqlpID = new SqlParameter();
               sqlpID.ParameterName = "@ID";
               sqlpID.SqlDbType = SqlDbType.Int;
               sqlpID.Value = iID;

               //3. Agregar los parametros al comando
               sqlcComando.Parameters.Add(sqlpID);

               //4. Abrir la conexión
               sqlcComando.Connection.Open();

               //5. Ejecutar la instrucción SELECT que regresa filas
               SqlDataReader reader = sqlcComando.ExecuteReader();

               //6. Asignar la lista de Clientes
               Volumetria result = LibraryGenerics<Volumetria>.ConvertDataSetToList(reader).FirstOrDefault();

               //7. Cerrar la conexión
               sqlcComando.Connection.Close();

               //8. Regresar el resultado
               return result;
           }
           catch (Exception ex)
           {
               throw new Exception("Error capa de datos (public static Volumetria ObtenerVolumetriaPorID(int " + iID + ")): " + ex.Message);
           }
       }
       #endregion

       #region Acciones

       /// <summary>
       /// Método que Afecta un registro de Volumetria
       /// </summary>
       /// <param name="aVolumetria"></param>
       public static int AfectarVolumetriaPorID(Volumetria aVolumetria)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spS_AfectarVolumetriaPorID";

               //2. Declarar los parametros
               SqlParameter sqlpID = new SqlParameter();
               sqlpID.ParameterName = "@ID";
               sqlpID.SqlDbType = SqlDbType.Int;
               sqlpID.Value = aVolumetria.ID;

               //3. Agregar los parametros al comando
               sqlcComando.Parameters.Add(sqlpID);

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
               throw new Exception("Error capa de datos (public static int AfectarVolumetriaPorID(Volumetria " + aVolumetria + ")): " + ex.Message);
           }
       }

       /// <summary>
       /// Método que avanza un movimiento de Volumetria
       /// </summary>
       /// <param name="iID"></param>
       /// <param name="strMov"></param>
       /// <returns></returns>
       public static int AvanzarVolumetriaPorID(int iID, string strMov)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spS_AvanzarVolumetriaPorID";

               //2. Declarar los parametros
               SqlParameter sqlpID = new SqlParameter();
               sqlpID.ParameterName = "@ID";
               sqlpID.SqlDbType = SqlDbType.Int;
               sqlpID.Value = iID;

               SqlParameter sqlpMov = new SqlParameter();
               sqlpMov.ParameterName = "@Mov";
               sqlpMov.SqlDbType = SqlDbType.VarChar;
               sqlpMov.Value = strMov;

               SqlParameter sqlpIDNuevo = new SqlParameter();
               sqlpIDNuevo.ParameterName = "@IDNuevo";
               sqlpIDNuevo.SqlDbType = SqlDbType.Int;
               sqlpIDNuevo.Direction = ParameterDirection.Output;

               //3. Agregar los parametros al comando
               sqlcComando.Parameters.Add(sqlpID);
               sqlcComando.Parameters.Add(sqlpMov);
               sqlcComando.Parameters.Add(sqlpIDNuevo);

               //4. Abrir la conexión
               sqlcComando.Connection.Open();

               //5. Ejecutar la instrucción SCALAR que regresa un valor
               int result = sqlcComando.ExecuteNonQuery();

               //6. Cerrar la conexión
               sqlcComando.Connection.Close();

               //7. Regresar el resultado
               return Convert.ToInt32(sqlcComando.Parameters["@IDNuevo"].Value);
           }
           catch (Exception ex)
           {
               throw new Exception("Error capa de datos (public static int AvanzarVolumetriaPorID(int " + iID + ", string " + strMov + ")): " + ex.Message);
           }
       }


       /// <summary>
       /// Método que cancela un movimiento de Volumetria
       /// </summary>
       /// <param name="iID"></param>
       /// <param name="strMov"></param>
       /// <returns></returns>
       public static int CancelarVolumetriaPorID(int iID)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spS_CancelarVolumetriaPorID";

               //2. Declarar los parametros
               SqlParameter sqlpID = new SqlParameter();
               sqlpID.ParameterName = "@ID";
               sqlpID.SqlDbType = SqlDbType.Int;
               sqlpID.Value = iID;


               //3. Agregar los parametros al comando
               sqlcComando.Parameters.Add(sqlpID);

               //4. Abrir la conexión
               sqlcComando.Connection.Open();

               //5. Ejecutar la instrucción SCALAR que regresa un valor
               int result = sqlcComando.ExecuteNonQuery();

               //6. Cerrar la conexión
               sqlcComando.Connection.Close();

               //7. Regresar el resultado
               return Convert.ToInt32(sqlcComando.Parameters["@ID"].Value);
           }
           catch (Exception ex)
           {
               throw new Exception("Error capa de datos (public static int CancelarVolumetriaPorID(int " + iID + ")): " + ex.Message);
           }
       }


       /// <summary>
       /// Método que borrar alguna Volumetría por su ID
       /// </summary>
       /// <param name="dID"></param>
       public static int BorrarVolumetriaAfectaPreciario(int dID)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spD_BorrarVolumetriaAfectaPreciario";

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
               throw new Exception("Error capa de datos (public static int BorrarVolumetriaAfectaPreciario(Volumetría " + dID + ")): " + ex.Message);
           }
       }


       /// <summary>
       /// Revisar si existen registros de Preciarios Activos 
       /// </summary>
       /// <param name="strID"></param>
       /// <returns></returns>
       public static bool ObtenerPreciariosActivosPorID(string strID)
       {
           try
           {
               //1. Configurar la conexión y el tipo de comando
               SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
               SqlCommand sqlcComando = new SqlCommand();
               sqlcComando.Connection = sqlcConectar;
               sqlcComando.CommandType = CommandType.StoredProcedure;
               sqlcComando.CommandText = "web_spS_ValidaPreciariosConcluidos";

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
               bool result = Convert.ToBoolean(sqlcComando.ExecuteScalar());

               //6. Asignar la lista de objetos

               //7. Cerrar la conexión
               sqlcComando.Connection.Close();

               //8. Regresar el resultado
               return result;
           }
           catch (Exception ex)
           {
               throw new Exception("Error capa de datos (public static bool ObtenerPreciariosActivosPorID(string " + strID + ")): " + ex.Message);
           }
       }


       #endregion
   }
}
