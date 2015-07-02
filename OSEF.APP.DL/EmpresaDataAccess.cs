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
    /// Clase que se encarga de la manipulación de todos los datos para las Empresas
    /// </summary>
    public class EmpresaDataAccess
    {
        #region Agregar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Empresa
        /// </summary>
        /// <param name="iEvento"></param>
        public static short Insertar(Empresa iEmpresa)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarEmpresa";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.SmallInt;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iEmpresa.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.IsNullable = true;
                if (iEmpresa.APaterno == null)
                    sqlpAPaterno.Value = DBNull.Value;
                else
                    sqlpAPaterno.Value = iEmpresa.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.IsNullable = true;
                if (iEmpresa.AMaterno == null)
                    sqlpAMaterno.Value = DBNull.Value;
                else
                    sqlpAMaterno.Value = iEmpresa.AMaterno;

                SqlParameter sqlpRFC = new SqlParameter();
                sqlpRFC.ParameterName = "@RFC";
                sqlpRFC.SqlDbType = SqlDbType.VarChar;
                sqlpRFC.Value = iEmpresa.RFC;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = iEmpresa.Calle;

                SqlParameter sqlpNoInt = new SqlParameter();
                sqlpNoInt.ParameterName = "@NoInt";
                sqlpNoInt.SqlDbType = SqlDbType.VarChar;
                sqlpNoInt.IsNullable = true;
                if (iEmpresa.NoInt == null)
                    sqlpNoInt.Value = DBNull.Value;
                else
                    sqlpNoInt.Value = iEmpresa.NoInt;

                SqlParameter sqlpNoExt = new SqlParameter();
                sqlpNoExt.ParameterName = "@NoExt";
                sqlpNoExt.SqlDbType = SqlDbType.VarChar;
                sqlpNoExt.Value = iEmpresa.NoExt;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.VarChar;
                sqlpColonia.Value = iEmpresa.Colonia;

                SqlParameter sqlpCP = new SqlParameter();
                sqlpCP.ParameterName = "@CP";
                sqlpCP.SqlDbType = SqlDbType.Int;
                sqlpCP.Value = iEmpresa.CP;

                SqlParameter sqlpCiudad = new SqlParameter();
                sqlpCiudad.ParameterName = "@Ciudad";
                sqlpCiudad.SqlDbType = SqlDbType.VarChar;
                sqlpCiudad.Value = iEmpresa.Ciudad;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.VarChar;
                sqlpEstado.Value = iEmpresa.Estado;

                SqlParameter sqlpEmail = new SqlParameter();
                sqlpEmail.ParameterName = "@Email";
                sqlpEmail.SqlDbType = SqlDbType.VarChar;
                sqlpEmail.Value = iEmpresa.Email;

                SqlParameter sqlpTipoPersona = new SqlParameter();
                sqlpTipoPersona.ParameterName = "@TipoPersona";
                sqlpTipoPersona.SqlDbType = SqlDbType.TinyInt;
                sqlpTipoPersona.Value = iEmpresa.TipoPersona;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = iEmpresa.Telefono;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno);
                sqlcComando.Parameters.Add(sqlpRFC);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpNoInt);
                sqlcComando.Parameters.Add(sqlpNoExt);
                sqlcComando.Parameters.Add(sqlpCiudad);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpEmail);
                sqlcComando.Parameters.Add(sqlpCP);
                sqlcComando.Parameters.Add(sqlpTipoPersona);
                sqlcComando.Parameters.Add(sqlpEstado);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return Convert.ToInt16(sqlcComando.Parameters["@ID"].Value);
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static short Insertar(Empresa " + iEmpresa.Nombre + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todas las Empresas de la base de datos
        /// </summary>
        /// <returns></returns>
        public static List<Empresa> ObtenerTodosEmpresas()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerTodosEmpresas";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Empresa> result = LibraryGenerics<Empresa>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Empresa> ObtenerTodosEmpresas() " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        #endregion

        #region Actualizar

        #endregion
    }
}
