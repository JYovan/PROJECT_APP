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
    /// Clase que se encarga de la manipulación de todos los datos para los Participantes
    /// </summary>
    public class ParticipanteDataAccess
    {
        #region Agregar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Participantes
        /// </summary>
        /// <param name="iEvento"></param>
        public static string Insertar(Participante iParticipante)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarParicipante";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Direction = ParameterDirection.Output;
                sqlpID.Size = 8;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iParticipante.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.Value = iParticipante.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.Value = iParticipante.AMaterno;

                SqlParameter sqlpFechaNacimiento = new SqlParameter();
                sqlpFechaNacimiento.ParameterName = "@FechaNacimiento";
                sqlpFechaNacimiento.SqlDbType = SqlDbType.DateTime;
                sqlpFechaNacimiento.Value = iParticipante.FechaNacimiento;

                SqlParameter sqlpEdad = new SqlParameter();
                sqlpEdad.ParameterName = "@Edad";
                sqlpEdad.SqlDbType = SqlDbType.TinyInt;
                sqlpEdad.Value = iParticipante.Edad;

                SqlParameter sqlpGenero = new SqlParameter();
                sqlpGenero.ParameterName = "@Genero";
                sqlpGenero.SqlDbType = SqlDbType.Char;
                sqlpGenero.Value = iParticipante.Genero;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.VarChar;
                sqlpEstado.Value = iParticipante.Estado;

                SqlParameter sqlpCiudad = new SqlParameter();
                sqlpCiudad.ParameterName = "@Ciudad";
                sqlpCiudad.SqlDbType = SqlDbType.VarChar;
                sqlpCiudad.Value = iParticipante.Ciudad;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = iParticipante.Telefono;

                SqlParameter sqlpCelular = new SqlParameter();
                sqlpCelular.ParameterName = "@Celular";
                sqlpCelular.SqlDbType = SqlDbType.VarChar;
                sqlpCelular.Value = iParticipante.Celular;

                SqlParameter sqlpEmail = new SqlParameter();
                sqlpEmail.ParameterName = "@Email";
                sqlpEmail.SqlDbType = SqlDbType.VarChar;
                sqlpEmail.Value = iParticipante.Email;

                SqlParameter sqlpTipoParticipante = new SqlParameter();
                sqlpTipoParticipante.ParameterName = "@TipoParticipante";
                sqlpTipoParticipante.SqlDbType = SqlDbType.TinyInt;
                sqlpTipoParticipante.Value = iParticipante.TipoParticipante;

                SqlParameter sqlpOtroTipoParticipante = new SqlParameter();
                sqlpOtroTipoParticipante.ParameterName = "@OtroTipoParticipante";
                sqlpOtroTipoParticipante.SqlDbType = SqlDbType.VarChar;
                sqlpOtroTipoParticipante.IsNullable = true;
                if (iParticipante.OtroTipoParticipante == null)
                    sqlpOtroTipoParticipante.Value = DBNull.Value;
                else
                    sqlpOtroTipoParticipante.Value = iParticipante.OtroTipoParticipante;

                SqlParameter sqlpNombreEmpresa = new SqlParameter();
                sqlpNombreEmpresa.ParameterName = "@NombreEmpresa";
                sqlpNombreEmpresa.SqlDbType = SqlDbType.VarChar;
                sqlpNombreEmpresa.IsNullable = true;
                if (iParticipante.NombreEmpresa == null)
                    sqlpNombreEmpresa.Value = DBNull.Value;
                else
                    sqlpNombreEmpresa.Value = iParticipante.NombreEmpresa;

                SqlParameter sqlpPuesto = new SqlParameter();
                sqlpPuesto.ParameterName = "@Puesto";
                sqlpPuesto.SqlDbType = SqlDbType.VarChar;
                sqlpPuesto.IsNullable = true;
                if (iParticipante.Puesto == null)
                    sqlpPuesto.Value = DBNull.Value;
                else
                    sqlpPuesto.Value = iParticipante.Puesto;

                SqlParameter sqlpArea = new SqlParameter();
                sqlpArea.ParameterName = "@Area";
                sqlpArea.SqlDbType = SqlDbType.VarChar;
                sqlpArea.IsNullable = true;
                if (iParticipante.Area == null)
                    sqlpArea.Value = DBNull.Value;
                else
                    sqlpArea.Value = iParticipante.Area;

                SqlParameter sqlpFactura = new SqlParameter();
                sqlpFactura.ParameterName = "@Factura";
                sqlpFactura.SqlDbType = SqlDbType.Bit;
                sqlpFactura.Value = iParticipante.Factura;

                SqlParameter sqlpEmpresa = new SqlParameter();
                sqlpEmpresa.ParameterName = "@Empresa";
                sqlpEmpresa.SqlDbType = SqlDbType.SmallInt;
                sqlpEmpresa.IsNullable = true;
                if (iParticipante.Empresa == 0)
                    sqlpEmpresa.Value = DBNull.Value;
                else
                    sqlpEmpresa.Value = iParticipante.Empresa;


                SqlParameter sqlpPagado = new SqlParameter();
                sqlpPagado.ParameterName = "@Pagado";
                sqlpPagado.SqlDbType = SqlDbType.Bit;
                sqlpPagado.Value = iParticipante.Pagado;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno);
                sqlcComando.Parameters.Add(sqlpFechaNacimiento);
                sqlcComando.Parameters.Add(sqlpEdad);
                sqlcComando.Parameters.Add(sqlpGenero);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpCiudad);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpCelular);
                sqlcComando.Parameters.Add(sqlpEmail);
                sqlcComando.Parameters.Add(sqlpTipoParticipante);
                sqlcComando.Parameters.Add(sqlpOtroTipoParticipante);
                sqlcComando.Parameters.Add(sqlpNombreEmpresa);
                sqlcComando.Parameters.Add(sqlpPuesto);
                sqlcComando.Parameters.Add(sqlpArea);
                sqlcComando.Parameters.Add(sqlpFactura);
                sqlcComando.Parameters.Add(sqlpEmpresa);
                sqlcComando.Parameters.Add(sqlpPagado);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return sqlcComando.Parameters["@ID"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(Participante " + iParticipante.Nombre + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los participantes de la base de datos
        /// </summary>
        /// <returns></returns>
        public static List<Participante> ObtenerTodosParticipantes()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerTodosParticipantes";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Participante> result = LibraryGenerics<Participante>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Participante> ObtenerTodosParticipantes() " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        #endregion

        #region Actualizar

        /// <summary>
        /// Método que actualiza el campo de Pagado para un Participante
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="bPagado"></param>
        /// <returns></returns>
        public static int ActualizarPagado(string strID, bool bPagado)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarPagado";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Value = strID;

                SqlParameter sqlpPagado = new SqlParameter();
                sqlpPagado.ParameterName = "@Pagado";
                sqlpPagado.SqlDbType = SqlDbType.Bit;
                sqlpPagado.Value = bPagado;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpPagado);

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
                throw new Exception("Error capa de datos (public static int ActualizarPagado(string " + strID + ", bool " + bPagado + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
