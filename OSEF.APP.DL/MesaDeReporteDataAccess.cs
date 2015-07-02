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
    /// Clase que administra los datos de la tabla de MesaDeReporte
    /// </summary>
    public class MesaDeReporteDataAccess
    {
        #region insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de MesaDeReporte
        /// </summary>
        /// <param name="iVolumetria"></param>
        public static int Insertar(MesaDeReporte iMesaDeReporte)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarMesaDeReporte";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = iMesaDeReporte.Mov;

                SqlParameter sqlpMovID = new SqlParameter();
                sqlpMovID.ParameterName = "@MovID";
                sqlpMovID.SqlDbType = SqlDbType.VarChar;
                if (iMesaDeReporte.MovID == null)
                    sqlpMovID.Value = DBNull.Value;
                else
                    sqlpMovID.Value = iMesaDeReporte.MovID;

                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.Char;
                sqlpSucursal.Size = 10;
                sqlpSucursal.Value = iMesaDeReporte.Sucursal;

                SqlParameter sqlpFechaEmision = new SqlParameter();
                sqlpFechaEmision.ParameterName = "@FechaEmision";
                sqlpFechaEmision.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaEmision.Value = iMesaDeReporte.FechaEmision;

                SqlParameter sqlpObservaciones = new SqlParameter();
                sqlpObservaciones.ParameterName = "@Observaciones";
                sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
                sqlpObservaciones.Value = iMesaDeReporte.Observaciones;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iMesaDeReporte.Estatus;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iMesaDeReporte.Usuario;

                SqlParameter sqlpOrigen = new SqlParameter();
                sqlpOrigen.ParameterName = "@Origen";
                sqlpOrigen.SqlDbType = SqlDbType.VarChar;

                if (iMesaDeReporte.Origen == null)
                    sqlpOrigen.Value = DBNull.Value;
                else
                    sqlpOrigen.Value = iMesaDeReporte.Origen;

                SqlParameter sqlpOrigenID = new SqlParameter();
                sqlpOrigenID.ParameterName = "@OrigenID";
                sqlpOrigenID.SqlDbType = SqlDbType.VarChar;

                if (iMesaDeReporte.OrigenId == null)
                    sqlpOrigenID.Value = DBNull.Value;
                else
                    sqlpOrigenID.Value = iMesaDeReporte.OrigenId;


                SqlParameter sqlpReporte = new SqlParameter();
                sqlpReporte.ParameterName = "@Reporte";
                sqlpReporte.SqlDbType = SqlDbType.VarChar;

                if (iMesaDeReporte.Reporte == null)
                    sqlpReporte.Value = DBNull.Value;
                else
                    sqlpReporte.Value = iMesaDeReporte.Reporte;


                SqlParameter sqlpDivision = new SqlParameter();
                sqlpDivision.ParameterName = "@Division";
                sqlpDivision.SqlDbType = SqlDbType.VarChar;

                if (iMesaDeReporte.Division == null)
                    sqlpDivision.Value = DBNull.Value;
                else
                    sqlpDivision.Value = iMesaDeReporte.Division;

                SqlParameter sqlpFechaOrigen = new SqlParameter();
                sqlpFechaOrigen.ParameterName = "@FechaOrigen";
                sqlpFechaOrigen.SqlDbType = SqlDbType.SmallDateTime;

                if (iMesaDeReporte.FechaOrigen == null)
                    sqlpFechaOrigen.Value = DBNull.Value;
                else
                    sqlpFechaOrigen.Value = iMesaDeReporte.FechaOrigen;

                SqlParameter sqlpFechaMaxima = new SqlParameter();
                sqlpFechaMaxima.ParameterName = "@FechaMaximaAtencion";
                sqlpFechaMaxima.SqlDbType = SqlDbType.SmallDateTime;
                if (iMesaDeReporte.FechaMaximaAtencion == null)
                    sqlpFechaMaxima.Value = DBNull.Value;
                else
                    sqlpFechaMaxima.Value = iMesaDeReporte.FechaMaximaAtencion;

                SqlParameter sqlpDiasAtencion = new SqlParameter();
                sqlpDiasAtencion.ParameterName = "@DiasAtencion";
                sqlpDiasAtencion.SqlDbType = SqlDbType.Decimal;


                sqlpDiasAtencion.Value = iMesaDeReporte.DiasAtencion;

                SqlParameter sqlpReporto = new SqlParameter();
                sqlpReporto.ParameterName = "@Reporto";
                sqlpReporto.SqlDbType = SqlDbType.VarChar;

                if (iMesaDeReporte.Reporto == null)
                    sqlpReporto.Value = DBNull.Value;
                else
                    sqlpReporto.Value = iMesaDeReporte.Reporto;

                SqlParameter sqlpTrabajoRequerido = new SqlParameter();
                sqlpTrabajoRequerido.ParameterName = "@TrabajoRequerido";
                sqlpTrabajoRequerido.SqlDbType = SqlDbType.VarChar;
                if (iMesaDeReporte.TrabajoRequerido == null)
                    sqlpTrabajoRequerido.Value = DBNull.Value;
                else
                    sqlpTrabajoRequerido.Value = iMesaDeReporte.TrabajoRequerido;

                SqlParameter sqlpAtiende = new SqlParameter();
                sqlpAtiende.ParameterName = "@Atiende";
                sqlpAtiende.SqlDbType = SqlDbType.VarChar;

                if (iMesaDeReporte.Atiende == null)
                    sqlpAtiende.Value = DBNull.Value;
                else
                    sqlpAtiende.Value = iMesaDeReporte.Atiende;




                SqlParameter sqlpTrabajoRealizado = new SqlParameter();
                sqlpTrabajoRealizado.ParameterName = "@TrabajoRealizado";
                sqlpTrabajoRealizado.SqlDbType = SqlDbType.VarChar;
                if (iMesaDeReporte.TrabajoRealizado == null)
                    sqlpTrabajoRealizado.Value = DBNull.Value;
                else
                    sqlpTrabajoRealizado.Value = iMesaDeReporte.TrabajoRealizado;

                SqlParameter sqlpCodigoFalla = new SqlParameter();
                sqlpCodigoFalla.ParameterName = "@CodigoFalla";
                sqlpCodigoFalla.SqlDbType = SqlDbType.VarChar;
                if (iMesaDeReporte.CodigoFalla == null)
                    sqlpCodigoFalla.Value = DBNull.Value;
                else
                    sqlpCodigoFalla.Value = iMesaDeReporte.CodigoFalla;

                SqlParameter sqlpTieneFotos = new SqlParameter();
                sqlpTieneFotos.ParameterName = "@TieneFotos";
                sqlpTieneFotos.SqlDbType = SqlDbType.VarChar;
                if (iMesaDeReporte.TieneFotos == null)
                    sqlpTieneFotos.Value = DBNull.Value;
                else
                    sqlpTieneFotos.Value = iMesaDeReporte.TieneFotos;

                SqlParameter sqlpTieneReporte = new SqlParameter();
                sqlpTieneReporte.ParameterName = "@TieneReporte";
                sqlpTieneReporte.SqlDbType = SqlDbType.VarChar;
                if (iMesaDeReporte.TieneReporte == null)
                    sqlpTieneReporte.Value = DBNull.Value;
                else
                    sqlpTieneReporte.Value = iMesaDeReporte.TieneReporte;

                SqlParameter sqlpFechaLlegada = new SqlParameter();
                sqlpFechaLlegada.ParameterName = "@FechaLlegada";
                sqlpFechaLlegada.SqlDbType = SqlDbType.SmallDateTime;
                if (iMesaDeReporte.FechaLlegada == null)
                    sqlpFechaLlegada.Value = DBNull.Value;
                else
                    sqlpFechaLlegada.Value = iMesaDeReporte.FechaLlegada;

                SqlParameter sqlpHoraLlegada = new SqlParameter();
                sqlpHoraLlegada.ParameterName = "@HoraLlegada";
                sqlpHoraLlegada.SqlDbType = SqlDbType.DateTime;
                if (iMesaDeReporte.HoraLlegada == null)
                    sqlpHoraLlegada.Value = DBNull.Value;
                else
                    sqlpHoraLlegada.Value = iMesaDeReporte.HoraLlegada;

                SqlParameter sqlpFechaFinActividad = new SqlParameter();
                sqlpFechaFinActividad.ParameterName = "@FechaFinActividad";
                sqlpFechaFinActividad.SqlDbType = SqlDbType.SmallDateTime;
                if (iMesaDeReporte.FechaFinActividad == null)
                    sqlpFechaFinActividad.Value = DBNull.Value;
                else
                    sqlpFechaFinActividad.Value = iMesaDeReporte.FechaFinActividad;

                SqlParameter sqlpHoraFinActividad = new SqlParameter();
                sqlpHoraFinActividad.ParameterName = "@HoraFinActividad";
                sqlpHoraLlegada.SqlDbType = SqlDbType.DateTime;
                if (iMesaDeReporte.HoraFinActividad == null)
                    sqlpHoraFinActividad.Value = DBNull.Value;
                else
                    sqlpHoraFinActividad.Value = iMesaDeReporte.HoraFinActividad;

                SqlParameter sqlpCuadrilla = new SqlParameter();
                sqlpCuadrilla.ParameterName = "@Cuadrilla";
                sqlpCuadrilla.SqlDbType = SqlDbType.VarChar;
                if (iMesaDeReporte.Cuadrilla == null)
                    sqlpCuadrilla.Value = DBNull.Value;
                else
                    sqlpCuadrilla.Value = iMesaDeReporte.Cuadrilla;

                SqlParameter sqlpImporteTotal = new SqlParameter();
                sqlpImporteTotal.ParameterName = "@ImporteTotal";
                sqlpImporteTotal.SqlDbType = SqlDbType.Decimal;
                sqlpImporteTotal.Precision = 20;
                sqlpImporteTotal.Scale = 2;
                sqlpImporteTotal.Value = iMesaDeReporte.ImporteTotal;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpMov);
                sqlcComando.Parameters.Add(sqlpMovID);
                sqlcComando.Parameters.Add(sqlpSucursal);
                sqlcComando.Parameters.Add(sqlpFechaEmision);
                sqlcComando.Parameters.Add(sqlpObservaciones);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpUsuario);
                sqlcComando.Parameters.Add(sqlpOrigen);
                sqlcComando.Parameters.Add(sqlpOrigenID);
                sqlcComando.Parameters.Add(sqlpReporte);
                sqlcComando.Parameters.Add(sqlpDivision);
                sqlcComando.Parameters.Add(sqlpFechaOrigen);
                sqlcComando.Parameters.Add(sqlpFechaMaxima);
                sqlcComando.Parameters.Add(sqlpDiasAtencion);
                sqlcComando.Parameters.Add(sqlpReporto);
                sqlcComando.Parameters.Add(sqlpTrabajoRequerido);
                sqlcComando.Parameters.Add(sqlpAtiende);
                sqlcComando.Parameters.Add(sqlpTrabajoRealizado);
                sqlcComando.Parameters.Add(sqlpCodigoFalla);
                sqlcComando.Parameters.Add(sqlpTieneFotos);
                sqlcComando.Parameters.Add(sqlpTieneReporte);
                sqlcComando.Parameters.Add(sqlpFechaLlegada);
                sqlcComando.Parameters.Add(sqlpHoraLlegada);
                sqlcComando.Parameters.Add(sqlpFechaFinActividad);
                sqlcComando.Parameters.Add(sqlpHoraFinActividad);
                sqlcComando.Parameters.Add(sqlpCuadrilla);
                sqlcComando.Parameters.Add(sqlpImporteTotal);
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
                throw new Exception("Error capa de datos (public static int Insertar(MesaDeReporte " + iMesaDeReporte.Mov + ")): " + ex.Message);
            }
        }

        #endregion

        #region modificar
        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de MesaDeReporte
        /// </summary>
        /// <param name="uVolumetria"></param>
        public static int Actualizar(MesaDeReporte uMesaDeReporte)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarMesaDeReporte";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uMesaDeReporte.Id;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = uMesaDeReporte.Mov;

                SqlParameter sqlpMovID = new SqlParameter();
                sqlpMovID.ParameterName = "@MovID";
                sqlpMovID.SqlDbType = SqlDbType.VarChar;
                if (uMesaDeReporte.MovID == null)
                    sqlpMovID.Value = DBNull.Value;
                else
                    sqlpMovID.Value = uMesaDeReporte.MovID;

                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.VarChar;
                sqlpSucursal.Value = uMesaDeReporte.Sucursal;

                SqlParameter sqlpObservaciones = new SqlParameter();
                sqlpObservaciones.ParameterName = "@Observaciones";
                sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
                sqlpObservaciones.Value = uMesaDeReporte.Observaciones;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uMesaDeReporte.Estatus;

                SqlParameter sqlpOrigen = new SqlParameter();
                sqlpOrigen.ParameterName = "@Origen";
                sqlpOrigen.SqlDbType = SqlDbType.VarChar;

                if (uMesaDeReporte.Origen == null)
                    sqlpOrigen.Value = DBNull.Value;
                else
                    sqlpOrigen.Value = uMesaDeReporte.Origen;


                SqlParameter sqlpOrigenID = new SqlParameter();
                sqlpOrigenID.ParameterName = "@OrigenID";
                sqlpOrigenID.SqlDbType = SqlDbType.VarChar;

                if (uMesaDeReporte.OrigenId == null)
                    sqlpOrigenID.Value = DBNull.Value;
                else
                    sqlpOrigenID.Value = uMesaDeReporte.OrigenId;


                SqlParameter sqlpReporte = new SqlParameter();
                sqlpReporte.ParameterName = "@Reporte";
                sqlpReporte.SqlDbType = SqlDbType.VarChar;

                if (uMesaDeReporte.Reporte == null)
                    sqlpReporte.Value = DBNull.Value;
                else
                    sqlpReporte.Value = uMesaDeReporte.Reporte;


                SqlParameter sqlpDivision = new SqlParameter();
                sqlpDivision.ParameterName = "@Division";
                sqlpDivision.SqlDbType = SqlDbType.VarChar;

                if (uMesaDeReporte.Division == null)
                    sqlpDivision.Value = DBNull.Value;
                else
                    sqlpDivision.Value = uMesaDeReporte.Division;

                SqlParameter sqlpFechaOrigen = new SqlParameter();
                sqlpFechaOrigen.ParameterName = "@FechaOrigen";
                sqlpFechaOrigen.SqlDbType = SqlDbType.SmallDateTime;

                if (uMesaDeReporte.FechaOrigen == null)
                    sqlpFechaOrigen.Value = DBNull.Value;
                else
                    sqlpFechaOrigen.Value = uMesaDeReporte.FechaOrigen;

                SqlParameter sqlpFechaMaxima = new SqlParameter();
                sqlpFechaMaxima.ParameterName = "@FechaMaximaAtencion";
                sqlpFechaMaxima.SqlDbType = SqlDbType.SmallDateTime;

                if (uMesaDeReporte.FechaMaximaAtencion == null)
                    sqlpFechaMaxima.Value = DBNull.Value;
                else
                    sqlpFechaMaxima.Value = uMesaDeReporte.FechaMaximaAtencion;

                SqlParameter sqlpDiasAtencion = new SqlParameter();
                sqlpDiasAtencion.ParameterName = "@DiasAtencion";
                sqlpDiasAtencion.SqlDbType = SqlDbType.Decimal;

                //if (uMesaDeReporte.DiasAtencion == null)
                //    sqlpDiasAtencion.Value = DBNull.Value;
                //else
                sqlpDiasAtencion.Value = uMesaDeReporte.DiasAtencion;

                SqlParameter sqlpReporto = new SqlParameter();
                sqlpReporto.ParameterName = "@Reporto";
                sqlpReporto.SqlDbType = SqlDbType.VarChar;

                if (uMesaDeReporte.Reporto == null)
                    sqlpReporto.Value = DBNull.Value;
                else
                    sqlpReporto.Value = uMesaDeReporte.Reporto;


                SqlParameter sqlpAtiende = new SqlParameter();
                sqlpAtiende.ParameterName = "@Atiende";
                sqlpAtiende.SqlDbType = SqlDbType.VarChar;

                if (uMesaDeReporte.Atiende == null)
                    sqlpAtiende.Value = DBNull.Value;
                else
                    sqlpAtiende.Value = uMesaDeReporte.Atiende;


                SqlParameter sqlpTrabajoRequerido = new SqlParameter();
                sqlpTrabajoRequerido.ParameterName = "@TrabajoRequerido";
                sqlpTrabajoRequerido.SqlDbType = SqlDbType.VarChar;

                if (uMesaDeReporte.TrabajoRequerido == null)
                    sqlpTrabajoRequerido.Value = DBNull.Value;
                else
                    sqlpTrabajoRequerido.Value = uMesaDeReporte.TrabajoRequerido;


                SqlParameter sqlpTrabajoRealizado = new SqlParameter();
                sqlpTrabajoRealizado.ParameterName = "@TrabajoRealizado";
                sqlpTrabajoRealizado.SqlDbType = SqlDbType.VarChar;
                if (uMesaDeReporte.TrabajoRealizado == null)
                    sqlpTrabajoRealizado.Value = DBNull.Value;
                else
                    sqlpTrabajoRealizado.Value = uMesaDeReporte.TrabajoRealizado;

                SqlParameter sqlpCodigoFalla = new SqlParameter();
                sqlpCodigoFalla.ParameterName = "@CodigoFalla";
                sqlpCodigoFalla.SqlDbType = SqlDbType.VarChar;
                if (uMesaDeReporte.CodigoFalla == null)
                    sqlpCodigoFalla.Value = DBNull.Value;
                else
                    sqlpCodigoFalla.Value = uMesaDeReporte.CodigoFalla;

                SqlParameter sqlpTieneFotos = new SqlParameter();
                sqlpTieneFotos.ParameterName = "@TieneFotos";
                sqlpTieneFotos.SqlDbType = SqlDbType.VarChar;
                if (uMesaDeReporte.TieneFotos == null)
                    sqlpTieneFotos.Value = DBNull.Value;
                else
                    sqlpTieneFotos.Value = uMesaDeReporte.TieneFotos;

                SqlParameter sqlpTieneReporte = new SqlParameter();
                sqlpTieneReporte.ParameterName = "@TieneReporte";
                sqlpTieneReporte.SqlDbType = SqlDbType.VarChar;
                if (uMesaDeReporte.TieneReporte == null)
                    sqlpTieneReporte.Value = DBNull.Value;
                else
                    sqlpTieneReporte.Value = uMesaDeReporte.TieneReporte;

                SqlParameter sqlpFechaLlegada = new SqlParameter();
                sqlpFechaLlegada.ParameterName = "@FechaLlegada";
                sqlpFechaLlegada.SqlDbType = SqlDbType.SmallDateTime;
                if (uMesaDeReporte.FechaLlegada == null)
                    sqlpFechaLlegada.Value = DBNull.Value;
                else
                    sqlpFechaLlegada.Value = uMesaDeReporte.FechaLlegada;

                SqlParameter sqlpHoraLlegada = new SqlParameter();
                sqlpHoraLlegada.ParameterName = "@HoraLlegada";
                sqlpHoraLlegada.SqlDbType = SqlDbType.DateTime;
                if (uMesaDeReporte.HoraLlegada == null)
                    sqlpHoraLlegada.Value = DBNull.Value;
                else
                    sqlpHoraLlegada.Value = uMesaDeReporte.HoraLlegada;

                SqlParameter sqlpFechaFinActividad = new SqlParameter();
                sqlpFechaFinActividad.ParameterName = "@FechaFinActividad";
                sqlpFechaFinActividad.SqlDbType = SqlDbType.SmallDateTime;
                if (uMesaDeReporte.FechaFinActividad == null)
                    sqlpFechaFinActividad.Value = DBNull.Value;
                else
                    sqlpFechaFinActividad.Value = uMesaDeReporte.FechaFinActividad;

                SqlParameter sqlpHoraFinActividad = new SqlParameter();
                sqlpHoraFinActividad.ParameterName = "@HoraFinActividad";
                sqlpHoraFinActividad.SqlDbType = SqlDbType.DateTime;
                if (uMesaDeReporte.HoraFinActividad == null)
                    sqlpHoraFinActividad.Value = DBNull.Value;
                else
                    sqlpHoraFinActividad.Value = uMesaDeReporte.HoraFinActividad;

                SqlParameter sqlpCuadrilla = new SqlParameter();
                sqlpCuadrilla.ParameterName = "@Cuadrilla";
                sqlpCuadrilla.SqlDbType = SqlDbType.VarChar;
                if (uMesaDeReporte.Cuadrilla == null)
                    sqlpCuadrilla.Value = DBNull.Value;
                else
                    sqlpCuadrilla.Value = uMesaDeReporte.Cuadrilla;


                SqlParameter sqlpImporteTotal = new SqlParameter();
                sqlpImporteTotal.ParameterName = "@ImporteTotal";
                sqlpImporteTotal.SqlDbType = SqlDbType.Decimal;
                sqlpImporteTotal.Precision = 20;
                sqlpImporteTotal.Scale = 2;

                sqlpImporteTotal.Value = uMesaDeReporte.ImporteTotal;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpMov);
                sqlcComando.Parameters.Add(sqlpMovID);
                sqlcComando.Parameters.Add(sqlpSucursal);
                sqlcComando.Parameters.Add(sqlpObservaciones);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpOrigen);
                sqlcComando.Parameters.Add(sqlpOrigenID);
                sqlcComando.Parameters.Add(sqlpReporte);
                sqlcComando.Parameters.Add(sqlpDivision);
                sqlcComando.Parameters.Add(sqlpFechaOrigen);
                sqlcComando.Parameters.Add(sqlpFechaMaxima);
                sqlcComando.Parameters.Add(sqlpDiasAtencion);
                sqlcComando.Parameters.Add(sqlpReporto);
                sqlcComando.Parameters.Add(sqlpTrabajoRequerido);
                sqlcComando.Parameters.Add(sqlpAtiende);
                sqlcComando.Parameters.Add(sqlpTrabajoRealizado);
                sqlcComando.Parameters.Add(sqlpCodigoFalla);
                sqlcComando.Parameters.Add(sqlpTieneFotos);
                sqlcComando.Parameters.Add(sqlpTieneReporte);
                sqlcComando.Parameters.Add(sqlpFechaLlegada);
                sqlcComando.Parameters.Add(sqlpHoraLlegada);
                sqlcComando.Parameters.Add(sqlpFechaFinActividad);
                sqlcComando.Parameters.Add(sqlpHoraFinActividad);
                sqlcComando.Parameters.Add(sqlpCuadrilla);
                sqlcComando.Parameters.Add(sqlpImporteTotal);
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
                throw new Exception("Error capa de datos (public static int Actualizar(MesaDeReporte " + uMesaDeReporte.Id + ")): " + ex.Message);
            }
        }
        #endregion

        #region borrar

        /// <summary>
        /// Método que borrar alguna MesaDeReporte por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarMesaDeReporte";

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
                throw new Exception("Error capa de datos (public static int Borrar(MesaDeReporte " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region consultar

        /// <summary>
        /// Obtener todos los registros de MesaDeReportes
        /// </summary>
        /// <returns></returns>
        public static List<MesaDeReporte> ObtenerMesaDeReportes()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerMesaDeReportes";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<MesaDeReporte> result = LibraryGenerics<MesaDeReporte>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<MesaDeReporte> ObtenerMesaDeReportes()): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener todos los registros de MesaDeReportes
        /// </summary>
        /// <returns></returns>
        public static List<MesaDeReporte> ObtenerMesaDeReportesConcluidos()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerMesaDeReportesConcluidos";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<MesaDeReporte> result = LibraryGenerics<MesaDeReporte>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<MesaDeReporte> ObtenerMesaDeReportesConcluidos()): " + ex.Message);
            }
        }




        /// <summary>
        /// Obtener todos los registros de MesaDeReportes
        /// </summary>
        /// <returns></returns>
        public static List<MesaDeReporte> ObtenerHistorialMesaDeReportesConcluidos()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerHistorialMesaDeReportesConcluidos";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<MesaDeReporte> result = LibraryGenerics<MesaDeReporte>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<MesaDeReporte> ObtenerHistorialMesaDeReportesConcluidos()): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener un registro de MesaDeReporte por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static MesaDeReporte ObtenerMesaDeReporteaPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerMesaDeReportePorID";

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
                MesaDeReporte result = LibraryGenerics<MesaDeReporte>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static MesaDeReporte ObtenerMesaDeReporteaPorID(int " + iID + ")): " + ex.Message);
            }
        }



        #endregion

        #region Acciones

        /// <summary>
        /// Método que Afecta un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarMesaDeReportePorID(MesaDeReporte aMesaDeReporte)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AfectarMesaDeReportePorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = aMesaDeReporte.Id;

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
                throw new Exception("Error capa de datos (public static int AfectarMesaDeReportePorID(MesaDeReporte " + aMesaDeReporte + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que Afecta un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int FacturarMesaDeReportePorID(MesaDeReporte mr)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_FacturarMesaDeReporte";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = mr.Id;

                SqlParameter sqlpFacturado = new SqlParameter();
                sqlpFacturado.ParameterName = "@Facturado";
                sqlpFacturado.SqlDbType = SqlDbType.Int;
                sqlpFacturado.Value = mr.Facturado;


                SqlParameter sqlpRevisado = new SqlParameter();
                sqlpRevisado.ParameterName = "@Revisado";
                sqlpRevisado.SqlDbType = SqlDbType.Int;
                sqlpRevisado.Value = mr.Revisado;

                SqlParameter sqlpFacturaMantenimiento = new SqlParameter();
                sqlpFacturaMantenimiento.ParameterName = "@FacturaMantenimiento";
                sqlpFacturaMantenimiento.SqlDbType = SqlDbType.VarChar;
                sqlpFacturaMantenimiento.Value = mr.FacturaMantenimiento;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpFacturado);
                sqlcComando.Parameters.Add(sqlpRevisado);
                sqlcComando.Parameters.Add(sqlpFacturaMantenimiento);

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
                throw new Exception("Error capa de datos (public static int FacturarMesaDeReportePorID(MesaDeReporte " + mr.Id + ")): " + ex.Message);
            }
        }



        /// <summary>
        /// Método que Afecta un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int RevisarMesaDeReportePorID(MesaDeReporte mr)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_RevisarMesaDeReporte";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = mr.Id;

                SqlParameter sqlpRevisado = new SqlParameter();
                sqlpRevisado.ParameterName = "@Revisado";
                sqlpRevisado.SqlDbType = SqlDbType.Bit;
                sqlpRevisado.Value = mr.Revisado; 

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpRevisado);

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
                throw new Exception("Error capa de datos (public static int RevisarMesaDeReportePorID(MesaDeReporte " + mr.Id + ")): " + ex.Message);
            }
        }




        /// <summary>
        /// Método que Afecta un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int RevisarYFacturarMesaDeReportePorID(MesaDeReporte mdr)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_RevisarYFacturarMesaDeReporte";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = mdr.Id;

                SqlParameter sqlpRevisado = new SqlParameter();
                sqlpRevisado.ParameterName = "@Revisado";
                sqlpRevisado.SqlDbType = SqlDbType.Bit;
                sqlpRevisado.Value = mdr.Revisado; 

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpRevisado); 

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
                throw new Exception("Error capa de datos (public static int RevisarYFacturarMesaDeReportePorID(MesaDeReporte " + mdr.Id + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que Afecta un registro de MesaDeReporte
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarEstimacionPorID(MesaDeReporte aMesaDeReporte)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AfectarMesaDeReportePorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = aMesaDeReporte.Id;

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
                throw new Exception("Error capa de datos (public static int AfectarMesaDeReportePorID(MesaDeReporte " + aMesaDeReporte + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Método que avanza un movimiento de MesaDeReporte
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int AvanzarReportePorID(int iID, string strMov)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AvanzarMesaReportePorID";

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
                throw new Exception("Error capa de datos (public static int AvanzarReportePorID(int " + iID + ", string " + strMov + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que cancela un movimiento de MesaDeReporte
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int CancelarMesaDeReportePorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_CancelarMesaDeReportePorID";

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
                throw new Exception("Error capa de datos (public static int CancelarMesaDeReportePorID(int " + iID + ")): " + ex.Message);
            }
        }

        #endregion

    }
}
