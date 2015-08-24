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
    /// Clase que administra los datos de la tabla de Clientes
    /// </summary>
    public class ClienteDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Clientes
        /// </summary>
        /// <param name="iCliente"></param>
        public static string Insertar(Cliente iCliente)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarCliente";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iCliente.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.Value = iCliente.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.Value = iCliente.AMaterno;
                 
                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = iCliente.Correo;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = iCliente.Telefono;

                SqlParameter sqlpTelefonoMovil = new SqlParameter();
                sqlpTelefonoMovil.ParameterName = "@TelefonoMovil";
                sqlpTelefonoMovil.SqlDbType = SqlDbType.VarChar;
                sqlpTelefonoMovil.Value = iCliente.TelefonoMovil;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = iCliente.Calle;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = iCliente.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = iCliente.NoInterior;
                 
                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Char; 
                sqlpCodigoPostal.Value = iCliente.CodigoPostal;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = iCliente.EntreCalles;
                 
                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iCliente.FechaAlta;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iCliente.Estatus;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iCliente.Usuario;

                SqlParameter sqlpRutaLogo = new SqlParameter();
                sqlpRutaLogo.ParameterName = "@RutaLogo";
                sqlpRutaLogo.SqlDbType = SqlDbType.VarChar;
                sqlpRutaLogo.Value = iCliente.RutaLogo;

                SqlParameter sqlpElaboro = new SqlParameter();
                sqlpElaboro.ParameterName = "@Elaboro";
                sqlpElaboro.SqlDbType = SqlDbType.VarChar;
                sqlpElaboro.Value = iCliente.Elaboro;

                SqlParameter sqlpReviso = new SqlParameter();
                sqlpReviso.ParameterName = "@Reviso";
                sqlpReviso.SqlDbType = SqlDbType.VarChar;
                sqlpReviso.Value = iCliente.Reviso;

                SqlParameter sqlpAutorizo = new SqlParameter();
                sqlpAutorizo.ParameterName = "@Autorizo";
                sqlpAutorizo.SqlDbType = SqlDbType.VarChar;
                sqlpAutorizo.Value = iCliente.Autorizo;

                SqlParameter sqlpProveedor = new SqlParameter();
                sqlpProveedor.ParameterName = "@Proveedor";
                sqlpProveedor.SqlDbType = SqlDbType.Char;
                if (iCliente.Proveedor != null)
                {
                    sqlpProveedor.Value = iCliente.Proveedor;
                }
                else
                {
                    sqlpProveedor.Value = DBNull.Value;
                }
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno); 
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpTelefonoMovil);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior); 
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpEntreCalles); 
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpUsuario);
                sqlcComando.Parameters.Add(sqlpRutaLogo);
                sqlcComando.Parameters.Add(sqlpElaboro);
                sqlcComando.Parameters.Add(sqlpReviso);
                sqlcComando.Parameters.Add(sqlpAutorizo);
                sqlcComando.Parameters.Add(sqlpProveedor);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                string result =Convert.ToString(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(Cliente " + iCliente.Nombre + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Clientes
        /// </summary>
        /// <param name="uCliente"></param>
        public static int Actualizar(Cliente uCliente)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarCliente";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Value = uCliente.ID;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = uCliente.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.Value = uCliente.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.Value = uCliente.AMaterno; 

                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = uCliente.Correo;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = uCliente.Telefono;

                SqlParameter sqlpTelefonoMovil = new SqlParameter();
                sqlpTelefonoMovil.ParameterName = "@TelefonoMovil";
                sqlpTelefonoMovil.SqlDbType = SqlDbType.VarChar;
                sqlpTelefonoMovil.Value = uCliente.TelefonoMovil;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = uCliente.Calle;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = uCliente.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = uCliente.NoInterior;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.Char;
                sqlpColonia.Size = 10;
                if (uCliente.Colonia == null || uCliente.Colonia.Equals(string.Empty))
                    sqlpColonia.Value = DBNull.Value;
                else
                    sqlpColonia.Value = uCliente.Colonia;

                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Char;
                sqlpCodigoPostal.Value = uCliente.CodigoPostal;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = uCliente.EntreCalles; 

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uCliente.Estatus;

                SqlParameter sqlpRutaLogo = new SqlParameter();
                sqlpRutaLogo.ParameterName = "@RutaLogo";
                sqlpRutaLogo.SqlDbType = SqlDbType.VarChar;
                sqlpRutaLogo.Value = uCliente.RutaLogo;

                SqlParameter sqlpElaboro = new SqlParameter();
                sqlpElaboro.ParameterName = "@Elaboro";
                sqlpElaboro.SqlDbType = SqlDbType.VarChar;
                sqlpElaboro.Value = uCliente.Elaboro;

                SqlParameter sqlpReviso = new SqlParameter();
                sqlpReviso.ParameterName = "@Reviso";
                sqlpReviso.SqlDbType = SqlDbType.VarChar;
                sqlpReviso.Value = uCliente.Reviso;

                SqlParameter sqlpAutorizo = new SqlParameter();
                sqlpAutorizo.ParameterName = "@Autorizo";
                sqlpAutorizo.SqlDbType = SqlDbType.VarChar;
                sqlpAutorizo.Value = uCliente.Autorizo;

                SqlParameter sqlpProveedor = new SqlParameter();
                sqlpProveedor.ParameterName = "@Proveedor";
                sqlpProveedor.SqlDbType = SqlDbType.Char;
                if (uCliente.Proveedor != null)
                {
                    sqlpProveedor.Value = uCliente.Proveedor;
                }
                else {
                    sqlpProveedor.Value = DBNull.Value;
                }
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno);
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpTelefonoMovil);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior);
                //sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpEntreCalles);
                //sqlcComando.Parameters.Add(sqlpEstado);
                //sqlcComando.Parameters.Add(sqlpMunicipio);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpRutaLogo);
                sqlcComando.Parameters.Add(sqlpElaboro);
                sqlcComando.Parameters.Add(sqlpReviso);
                sqlcComando.Parameters.Add(sqlpAutorizo);
                sqlcComando.Parameters.Add(sqlpProveedor);

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
                throw new Exception("Error capa de datos (public static int Actualizar(Cliente " + uCliente.ID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Clientes para la Solicitudes de Préstamo
        /// </summary>
        /// <param name="uCliente"></param>
        public static int ActualizarSolicitud(Cliente uCliente)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarClienteSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Value = uCliente.ID;

                //SqlParameter sqlpRFC = new SqlParameter();
                //sqlpRFC.ParameterName = "@RFC";
                //sqlpRFC.SqlDbType = SqlDbType.VarChar;
                //sqlpRFC.Value = uCliente.RFC;

                //SqlParameter sqlpEstadoCivil = new SqlParameter();
                //sqlpEstadoCivil.ParameterName = "@EstadoCivil";
                //sqlpEstadoCivil.SqlDbType = SqlDbType.VarChar;
                //if (uCliente.EstadoCivil == null)
                //    sqlpEstadoCivil.Value = DBNull.Value;
                //else
                //    sqlpEstadoCivil.Value = uCliente.EstadoCivil;

                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = uCliente.Correo;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = uCliente.Telefono;

                SqlParameter sqlpTelefonoMovil = new SqlParameter();
                sqlpTelefonoMovil.ParameterName = "@TelefonoMovil";
                sqlpTelefonoMovil.SqlDbType = SqlDbType.VarChar;
                sqlpTelefonoMovil.Value = uCliente.TelefonoMovil;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = uCliente.Calle;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = uCliente.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = uCliente.NoInterior;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.Char;
                sqlpColonia.Size = 10;
                if (uCliente.Colonia == null || uCliente.Colonia.Equals(string.Empty))
                    sqlpColonia.Value = DBNull.Value;
                else
                    sqlpColonia.Value = uCliente.Colonia;

                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpCodigoPostal.Value = uCliente.CodigoPostal;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = uCliente.EntreCalles;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Size = 2;
                sqlpEstado.Value = uCliente.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Size = 4;
                sqlpMunicipio.Value = uCliente.Municipio; 
                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                //sqlcComando.Parameters.Add(sqlpRFC);
                //sqlcComando.Parameters.Add(sqlpEstadoCivil);
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpTelefonoMovil);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior);
                //sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpEntreCalles);
                //sqlcComando.Parameters.Add(sqlpEstado);
                //sqlcComando.Parameters.Add(sqlpMunicipio); 

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
                throw new Exception("Error capa de datos (public static int ActualizarSolicitud(Cliente " + uCliente.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Cliente por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Eliminar(string dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarCliente";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
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
                throw new Exception("Error capa de datos (public static int Borrar(Cliente " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Clientes
        /// </summary>
        /// <returns></returns>
        public static List<Cliente> ObtenerClientes()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerClientes";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Cliente> result = LibraryGenerics<Cliente>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Cliente> ObtenerClientes()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Cliente por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Cliente ObtenerClientePorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerClientePorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Cliente result = LibraryGenerics<Cliente>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Cliente ObtenerClientePorID(string " + strID + ")): " + ex.Message);
            }
        }



        /// <summary>
        /// Método que valida el cliente para su posible eliminación
        /// </summary>
        /// <param name="strCliente"></param> 
        /// <returns></returns>
        public static bool ValidarClienteEnUso(string strCliente)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcClienteComando = new SqlCommand();
                sqlcClienteComando.Connection = sqlcConectar;
                sqlcClienteComando.CommandType = CommandType.StoredProcedure;
                sqlcClienteComando.CommandText = "web_spS_ValidarClienteEnUso";

                //2. Declarar los parametros
                SqlParameter sqlpCliente = new SqlParameter();
                sqlpCliente.ParameterName = "@ID";
                sqlpCliente.SqlDbType = SqlDbType.VarChar;
                sqlpCliente.Value = strCliente;

                //3. Agregar los parametros al comando
                sqlcClienteComando.Parameters.Add(sqlpCliente);

                //4. Abrir la conexión
                sqlcClienteComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa un dato
                bool result = Convert.ToBoolean(sqlcClienteComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcClienteComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (ValidarClienteEnUso(string " + strCliente + ")): " + ex.Message);
            }
        }


        #endregion
    }
}
