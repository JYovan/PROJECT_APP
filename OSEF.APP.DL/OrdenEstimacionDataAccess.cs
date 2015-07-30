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
    /// Clase que administra los datos de la tabla de OrdenEstimacion
    /// </summary>
    public class OrdenEstimacionDataAccess
    {
        #region insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de OrdenEstimacion
        /// </summary>
        /// <param name="iVolumetria"></param>
        public static int Insertar(OrdenEstimacion iOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarOrdenEstimacion";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = iOrdenEstimacion.Mov;

                SqlParameter sqlpMovID = new SqlParameter();
                sqlpMovID.ParameterName = "@MovID";
                sqlpMovID.SqlDbType = SqlDbType.VarChar;
                if (iOrdenEstimacion.MovID == null)
                    sqlpMovID.Value = DBNull.Value;
                else
                    sqlpMovID.Value = iOrdenEstimacion.MovID;

                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.Char;
                sqlpSucursal.Size = 10;
                sqlpSucursal.Value = iOrdenEstimacion.Sucursal;

                SqlParameter sqlpFechaEmision = new SqlParameter();
                sqlpFechaEmision.ParameterName = "@FechaEmision";
                sqlpFechaEmision.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaEmision.Value = iOrdenEstimacion.FechaEmision;

                SqlParameter sqlpObservaciones = new SqlParameter();
                sqlpObservaciones.ParameterName = "@Observaciones";
                sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
                sqlpObservaciones.Value = iOrdenEstimacion.Observaciones;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iOrdenEstimacion.Estatus;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iOrdenEstimacion.Usuario;

                SqlParameter sqlpOrigen = new SqlParameter();
                sqlpOrigen.ParameterName = "@Origen";
                sqlpOrigen.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacion.Origen == null)
                    sqlpOrigen.Value = DBNull.Value;
                else
                    sqlpOrigen.Value = iOrdenEstimacion.Origen;

                SqlParameter sqlpOrigenID = new SqlParameter();
                sqlpOrigenID.ParameterName = "@OrigenID";
                sqlpOrigenID.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacion.OrigenId == null)
                    sqlpOrigenID.Value = DBNull.Value;
                else
                    sqlpOrigenID.Value = iOrdenEstimacion.OrigenId;


                SqlParameter sqlpReporte = new SqlParameter();
                sqlpReporte.ParameterName = "@Reporte";
                sqlpReporte.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacion.Reporte == null)
                    sqlpReporte.Value = DBNull.Value;
                else
                    sqlpReporte.Value = iOrdenEstimacion.Reporte;


                SqlParameter sqlpDivision = new SqlParameter();
                sqlpDivision.ParameterName = "@Division";
                sqlpDivision.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacion.Division == null)
                    sqlpDivision.Value = DBNull.Value;
                else
                    sqlpDivision.Value = iOrdenEstimacion.Division;

                SqlParameter sqlpFechaOrigen = new SqlParameter();
                sqlpFechaOrigen.ParameterName = "@FechaOrigen";
                sqlpFechaOrigen.SqlDbType = SqlDbType.SmallDateTime;

                if (iOrdenEstimacion.FechaOrigen == null)
                    sqlpFechaOrigen.Value = DBNull.Value;
                else
                    sqlpFechaOrigen.Value = iOrdenEstimacion.FechaOrigen;

                SqlParameter sqlpFechaMaxima = new SqlParameter();
                sqlpFechaMaxima.ParameterName = "@FechaMaximaAtencion";
                sqlpFechaMaxima.SqlDbType = SqlDbType.SmallDateTime;
                if (iOrdenEstimacion.FechaMaximaAtencion == null)
                    sqlpFechaMaxima.Value = DBNull.Value;
                else
                    sqlpFechaMaxima.Value = iOrdenEstimacion.FechaMaximaAtencion;

                SqlParameter sqlpDiasAtencion = new SqlParameter();
                sqlpDiasAtencion.ParameterName = "@DiasAtencion";
                sqlpDiasAtencion.SqlDbType = SqlDbType.Decimal;

              
                    sqlpDiasAtencion.Value = iOrdenEstimacion.DiasAtencion;

                SqlParameter sqlpReporto = new SqlParameter();
                sqlpReporto.ParameterName = "@Reporto";
                sqlpReporto.SqlDbType = SqlDbType.VarChar;

                if (iOrdenEstimacion.Reporto == null)
                    sqlpReporto.Value = DBNull.Value;
                else
                    sqlpReporto.Value = iOrdenEstimacion.Reporto;

                SqlParameter sqlpTrabajoRequerido = new SqlParameter();
                sqlpTrabajoRequerido.ParameterName = "@TrabajoRequerido";
                sqlpTrabajoRequerido.SqlDbType = SqlDbType.VarChar;
                if (iOrdenEstimacion.TrabajoRequerido == null)
                    sqlpTrabajoRequerido.Value = DBNull.Value;
                else
                    sqlpTrabajoRequerido.Value = iOrdenEstimacion.TrabajoRequerido;


                SqlParameter sqlpTrabajoRealizado = new SqlParameter();
                sqlpTrabajoRealizado.ParameterName = "@TrabajoRealizado";
                sqlpTrabajoRealizado.SqlDbType = SqlDbType.VarChar;
                if (iOrdenEstimacion.TrabajoRealizado == null)
                    sqlpTrabajoRealizado.Value = DBNull.Value;
                else
                    sqlpTrabajoRealizado.Value = iOrdenEstimacion.TrabajoRealizado;

                SqlParameter sqlpCodigoFalla = new SqlParameter();
                sqlpCodigoFalla.ParameterName = "@CodigoFalla";
                sqlpCodigoFalla.SqlDbType = SqlDbType.VarChar;
                if (iOrdenEstimacion.CodigoFalla == null)
                    sqlpCodigoFalla.Value = DBNull.Value;
                else
                    sqlpCodigoFalla.Value = iOrdenEstimacion.CodigoFalla;

                SqlParameter sqlpFechaLlegada = new SqlParameter();
                sqlpFechaLlegada.ParameterName = "@FechaLlegada";
                sqlpFechaLlegada.SqlDbType = SqlDbType.SmallDateTime;
                if (iOrdenEstimacion.FechaLlegada == null)
                    sqlpFechaLlegada.Value = DBNull.Value;
                else
                    sqlpFechaLlegada.Value = iOrdenEstimacion.FechaLlegada;

                SqlParameter sqlpHoraLlegada = new SqlParameter();
                sqlpHoraLlegada.ParameterName = "@HoraLlegada";
                sqlpHoraLlegada.SqlDbType = SqlDbType.DateTime;
                if (iOrdenEstimacion.HoraLlegada == null)
                    sqlpHoraLlegada.Value = DBNull.Value;
                else
                    sqlpHoraLlegada.Value = iOrdenEstimacion.HoraLlegada;

                SqlParameter sqlpFechaFinActividad = new SqlParameter();
                sqlpFechaFinActividad.ParameterName = "@FechaFinActividad";
                sqlpFechaFinActividad.SqlDbType = SqlDbType.SmallDateTime;
                if (iOrdenEstimacion.FechaFinActividad == null)
                    sqlpFechaFinActividad.Value = DBNull.Value;
                else
                    sqlpFechaFinActividad.Value = iOrdenEstimacion.FechaFinActividad;

                SqlParameter sqlpHoraFinActividad = new SqlParameter();
                sqlpHoraFinActividad.ParameterName = "@HoraFinActividad";
                sqlpHoraLlegada.SqlDbType = SqlDbType.DateTime;
                if (iOrdenEstimacion.HoraFinActividad == null)
                    sqlpHoraFinActividad.Value = DBNull.Value;
                else
                    sqlpHoraFinActividad.Value = iOrdenEstimacion.HoraFinActividad;

                SqlParameter sqlpCuadrilla = new SqlParameter();
                sqlpCuadrilla.ParameterName = "@Cuadrilla";
                sqlpCuadrilla.SqlDbType = SqlDbType.VarChar;
                if (iOrdenEstimacion.Cuadrilla == null)
                    sqlpCuadrilla.Value = DBNull.Value;
                else
                    sqlpCuadrilla.Value = iOrdenEstimacion.Cuadrilla;

                SqlParameter sqlpImporteTotal = new SqlParameter();
                sqlpImporteTotal.ParameterName = "@ImporteTotal";
                sqlpImporteTotal.SqlDbType = SqlDbType.Decimal;
                sqlpImporteTotal.Precision = 20;
                sqlpImporteTotal.Scale = 6;
                sqlpImporteTotal.Value = iOrdenEstimacion.ImporteTotal;
                 
                SqlParameter sqlpHoraOrigen= new SqlParameter();
                sqlpHoraOrigen.ParameterName = "@HoraOrigen";
                sqlpHoraOrigen.SqlDbType = SqlDbType.SmallDateTime;
                if (iOrdenEstimacion.HoraOrigen == null)
                    sqlpHoraOrigen.Value = DBNull.Value;
                else
                    sqlpHoraOrigen.Value = iOrdenEstimacion.HoraOrigen;

                SqlParameter sqlpRutaImagen = new SqlParameter();
                sqlpRutaImagen.ParameterName = "@RutaImagen";
                sqlpRutaImagen.SqlDbType = SqlDbType.VarChar;
                sqlpRutaImagen.Value = iOrdenEstimacion.RutaImagen;

                SqlParameter sqlpAtendido = new SqlParameter();
                sqlpAtendido.ParameterName = "@Atendido";
                sqlpAtendido.SqlDbType = SqlDbType.VarChar;
                if (iOrdenEstimacion.Atendido == null)
                    sqlpAtendido.Value = "NO";
                else
                    sqlpAtendido.Value = "SI";

                SqlParameter sqlpReferenciaOrden = new SqlParameter();
                sqlpReferenciaOrden.ParameterName = "@ReferenciaOrden";
                sqlpReferenciaOrden.SqlDbType = SqlDbType.VarChar;
                sqlpReferenciaOrden.Value = iOrdenEstimacion.ReferenciaOrden;

                SqlParameter sqlpClasificacion = new SqlParameter();
                sqlpClasificacion.ParameterName = "@Clasificacion";
                sqlpClasificacion.SqlDbType = SqlDbType.VarChar;
                sqlpClasificacion.Value = iOrdenEstimacion.Clasificacion;

                SqlParameter sqlpCliente = new SqlParameter();
                sqlpCliente.ParameterName = "@Cliente";
                sqlpCliente.SqlDbType = SqlDbType.Char;  
                if (iOrdenEstimacion.Cliente == null || iOrdenEstimacion.Cliente.Trim().Equals(""))
                    sqlpCliente.Value = DBNull.Value;
                else
                    sqlpCliente.Value = iOrdenEstimacion.Cliente;

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
                sqlcComando.Parameters.Add(sqlpTrabajoRealizado);
                sqlcComando.Parameters.Add(sqlpCodigoFalla);
                sqlcComando.Parameters.Add(sqlpFechaLlegada);
                sqlcComando.Parameters.Add(sqlpHoraLlegada);
                sqlcComando.Parameters.Add(sqlpFechaFinActividad);
                sqlcComando.Parameters.Add(sqlpHoraFinActividad);
                sqlcComando.Parameters.Add(sqlpCuadrilla);
                sqlcComando.Parameters.Add(sqlpImporteTotal);
                sqlcComando.Parameters.Add(sqlpHoraOrigen);
                sqlcComando.Parameters.Add(sqlpRutaImagen);
                sqlcComando.Parameters.Add(sqlpAtendido);
                sqlcComando.Parameters.Add(sqlpReferenciaOrden);
                sqlcComando.Parameters.Add(sqlpClasificacion);
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
                throw new Exception("Error capa de datos (public static int Insertar(OrdenEstimacion " + iOrdenEstimacion.Mov + ")): " + ex.Message);
            }
        }

        #endregion

        #region modificar
        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de OrdenEstimacion
        /// </summary>
        /// <param name="uVolumetria"></param>
        public static int Actualizar(OrdenEstimacion uOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarOrdenEstimacion";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uOrdenEstimacion.Id;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = uOrdenEstimacion.Mov;

                SqlParameter sqlpMovID = new SqlParameter();
                sqlpMovID.ParameterName = "@MovID";
                sqlpMovID.SqlDbType = SqlDbType.VarChar;
                if (uOrdenEstimacion.MovID == null)
                    sqlpMovID.Value = DBNull.Value;
                else
                    sqlpMovID.Value = uOrdenEstimacion.MovID;

                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.VarChar;
                sqlpSucursal.Value = uOrdenEstimacion.Sucursal;

                SqlParameter sqlpObservaciones = new SqlParameter();
                sqlpObservaciones.ParameterName = "@Observaciones";
                sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
                sqlpObservaciones.Value = uOrdenEstimacion.Observaciones;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uOrdenEstimacion.Estatus;

                SqlParameter sqlpOrigen = new SqlParameter();
                sqlpOrigen.ParameterName = "@Origen";
                sqlpOrigen.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacion.Origen == null)
                    sqlpOrigen.Value = DBNull.Value;
                else
                    sqlpOrigen.Value = uOrdenEstimacion.Origen;


                SqlParameter sqlpOrigenID = new SqlParameter();
                sqlpOrigenID.ParameterName = "@OrigenID";
                sqlpOrigenID.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacion.OrigenId == null)
                    sqlpOrigenID.Value = DBNull.Value;
                else
                    sqlpOrigenID.Value = uOrdenEstimacion.OrigenId;


                SqlParameter sqlpReporte = new SqlParameter();
                sqlpReporte.ParameterName = "@Reporte";
                sqlpReporte.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacion.Reporte == null)
                    sqlpReporte.Value = DBNull.Value;
                else
                    sqlpReporte.Value = uOrdenEstimacion.Reporte;


                SqlParameter sqlpDivision = new SqlParameter();
                sqlpDivision.ParameterName = "@Division";
                sqlpDivision.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacion.Division == null)
                    sqlpDivision.Value = DBNull.Value;
                else
                    sqlpDivision.Value = uOrdenEstimacion.Division;

                SqlParameter sqlpFechaOrigen = new SqlParameter();
                sqlpFechaOrigen.ParameterName = "@FechaOrigen";
                sqlpFechaOrigen.SqlDbType = SqlDbType.SmallDateTime;

                if (uOrdenEstimacion.FechaOrigen == null)
                    sqlpFechaOrigen.Value = DBNull.Value;
                else
                    sqlpFechaOrigen.Value = uOrdenEstimacion.FechaOrigen;

                SqlParameter sqlpFechaMaxima = new SqlParameter();
                sqlpFechaMaxima.ParameterName = "@FechaMaximaAtencion";
                sqlpFechaMaxima.SqlDbType = SqlDbType.SmallDateTime;

                if (uOrdenEstimacion.FechaMaximaAtencion == null)
                    sqlpFechaMaxima.Value = DBNull.Value;
                else
                    sqlpFechaMaxima.Value = uOrdenEstimacion.FechaMaximaAtencion;

                SqlParameter sqlpDiasAtencion = new SqlParameter();
                sqlpDiasAtencion.ParameterName = "@DiasAtencion";
                sqlpDiasAtencion.SqlDbType = SqlDbType.Decimal;

                //if (uOrdenEstimacion.DiasAtencion == null)
                //    sqlpDiasAtencion.Value = DBNull.Value;
                //else
                    sqlpDiasAtencion.Value = uOrdenEstimacion.DiasAtencion;

                SqlParameter sqlpReporto = new SqlParameter();
                sqlpReporto.ParameterName = "@Reporto";
                sqlpReporto.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacion.Reporto == null)
                    sqlpReporto.Value = DBNull.Value;
                else
                    sqlpReporto.Value = uOrdenEstimacion.Reporto;
                 
                SqlParameter sqlpTrabajoRequerido = new SqlParameter();
                sqlpTrabajoRequerido.ParameterName = "@TrabajoRequerido";
                sqlpTrabajoRequerido.SqlDbType = SqlDbType.VarChar;

                if (uOrdenEstimacion.TrabajoRequerido == null)
                    sqlpTrabajoRequerido.Value = DBNull.Value;
                else
                    sqlpTrabajoRequerido.Value = uOrdenEstimacion.TrabajoRequerido;
                 
                SqlParameter sqlpTrabajoRealizado = new SqlParameter();
                sqlpTrabajoRealizado.ParameterName = "@TrabajoRealizado";
                sqlpTrabajoRealizado.SqlDbType = SqlDbType.VarChar;
                if (uOrdenEstimacion.TrabajoRealizado == null)
                    sqlpTrabajoRealizado.Value = DBNull.Value;
                else
                    sqlpTrabajoRealizado.Value = uOrdenEstimacion.TrabajoRealizado;

                SqlParameter sqlpCodigoFalla = new SqlParameter();
                sqlpCodigoFalla.ParameterName = "@CodigoFalla";
                sqlpCodigoFalla.SqlDbType = SqlDbType.VarChar;
                if (uOrdenEstimacion.CodigoFalla == null || uOrdenEstimacion.CodigoFalla.Trim().Equals(""))
                    sqlpCodigoFalla.Value = DBNull.Value;
                else
                    sqlpCodigoFalla.Value = uOrdenEstimacion.CodigoFalla;

              

                SqlParameter sqlpFechaLlegada = new SqlParameter();
                sqlpFechaLlegada.ParameterName = "@FechaLlegada";
                sqlpFechaLlegada.SqlDbType = SqlDbType.SmallDateTime;
                if (uOrdenEstimacion.FechaLlegada == null)
                    sqlpFechaLlegada.Value = DBNull.Value;
                else
                    sqlpFechaLlegada.Value = uOrdenEstimacion.FechaLlegada;

                SqlParameter sqlpHoraLlegada = new SqlParameter();
                sqlpHoraLlegada.ParameterName = "@HoraLlegada";
                sqlpHoraLlegada.SqlDbType = SqlDbType.DateTime;
                if (uOrdenEstimacion.HoraLlegada == null)
                    sqlpHoraLlegada.Value = DBNull.Value;
                else
                    sqlpHoraLlegada.Value = uOrdenEstimacion.HoraLlegada;

                SqlParameter sqlpFechaFinActividad = new SqlParameter();
                sqlpFechaFinActividad.ParameterName = "@FechaFinActividad";
                sqlpFechaFinActividad.SqlDbType = SqlDbType.SmallDateTime;
                if (uOrdenEstimacion.FechaFinActividad == null)
                    sqlpFechaFinActividad.Value = DBNull.Value;
                else
                    sqlpFechaFinActividad.Value = uOrdenEstimacion.FechaFinActividad;

                SqlParameter sqlpHoraFinActividad = new SqlParameter();
                sqlpHoraFinActividad.ParameterName = "@HoraFinActividad";
                sqlpHoraFinActividad.SqlDbType = SqlDbType.DateTime;
                if (uOrdenEstimacion.HoraFinActividad == null)
                    sqlpHoraFinActividad.Value = DBNull.Value;
                else
                    sqlpHoraFinActividad.Value = uOrdenEstimacion.HoraFinActividad;
                 
                SqlParameter sqlpCuadrilla = new SqlParameter();
                sqlpCuadrilla.ParameterName = "@Cuadrilla";
                sqlpCuadrilla.SqlDbType = SqlDbType.VarChar;
                if (uOrdenEstimacion.Cuadrilla == null || uOrdenEstimacion.Cuadrilla.Trim().Equals(""))
                    sqlpCuadrilla.Value = DBNull.Value;
                else
                    sqlpCuadrilla.Value = uOrdenEstimacion.Cuadrilla;
                 
                SqlParameter sqlpImporteTotal = new SqlParameter();
                sqlpImporteTotal.ParameterName = "@ImporteTotal";
                sqlpImporteTotal.SqlDbType = SqlDbType.Decimal;
                sqlpImporteTotal.Precision = 20;
                sqlpImporteTotal.Scale = 2; 
                sqlpImporteTotal.Value = uOrdenEstimacion.ImporteTotal;

                SqlParameter sqlpHoraOrigen = new SqlParameter();
                sqlpHoraOrigen.ParameterName = "@HoraOrigen";
                sqlpHoraOrigen.SqlDbType = SqlDbType.SmallDateTime;
                if (uOrdenEstimacion.HoraOrigen == null)
                    sqlpHoraOrigen.Value = DBNull.Value;
                else
                    sqlpHoraOrigen.Value = uOrdenEstimacion.HoraOrigen;

                SqlParameter sqlpRutaImagen = new SqlParameter();
                sqlpRutaImagen.ParameterName = "@RutaImagen";
                sqlpRutaImagen.SqlDbType = SqlDbType.VarChar;
                sqlpRutaImagen.Value = uOrdenEstimacion.RutaImagen;

                SqlParameter sqlpAtendido = new SqlParameter();
                sqlpAtendido.ParameterName = "@Atendido";
                sqlpAtendido.SqlDbType = SqlDbType.VarChar;
                if (uOrdenEstimacion.Atendido == "False")
                    sqlpAtendido.Value = "No";
                else
                    sqlpAtendido.Value = "Si";

                SqlParameter sqlpReferenciaOrden = new SqlParameter();
                sqlpReferenciaOrden.ParameterName = "@ReferenciaOrden";
                sqlpReferenciaOrden.SqlDbType = SqlDbType.VarChar;
                sqlpReferenciaOrden.Value = uOrdenEstimacion.ReferenciaOrden;


                SqlParameter sqlpClasificacion = new SqlParameter();
                sqlpClasificacion.ParameterName = "@Clasificacion";
                sqlpClasificacion.SqlDbType = SqlDbType.VarChar;
                sqlpClasificacion.Value = uOrdenEstimacion.Clasificacion;

                SqlParameter sqlpCliente = new SqlParameter();
                sqlpCliente.ParameterName = "@Cliente";
                sqlpCliente.SqlDbType = SqlDbType.Char; 
                if (uOrdenEstimacion.Cliente == null || uOrdenEstimacion.Cliente.Trim().Equals(""))
                    sqlpCliente.Value = DBNull.Value;
                else
                    sqlpCliente.Value = uOrdenEstimacion.Cliente;

                //SqlParameter sqlpNoOrden = new SqlParameter();
                //sqlpNoOrden.ParameterName = "@NoOrden";
                //sqlpNoOrden.SqlDbType = SqlDbType.VarChar;
                //sqlpNoOrden.Value = uOrdenEstimacion.NoOrden;

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
                sqlcComando.Parameters.Add(sqlpTrabajoRealizado);
                sqlcComando.Parameters.Add(sqlpCodigoFalla);
                sqlcComando.Parameters.Add(sqlpFechaLlegada);
                sqlcComando.Parameters.Add(sqlpHoraLlegada);
                sqlcComando.Parameters.Add(sqlpFechaFinActividad);
                sqlcComando.Parameters.Add(sqlpHoraFinActividad);
                sqlcComando.Parameters.Add(sqlpCuadrilla);
                sqlcComando.Parameters.Add(sqlpImporteTotal);
                sqlcComando.Parameters.Add(sqlpHoraOrigen);
                sqlcComando.Parameters.Add(sqlpRutaImagen);
                sqlcComando.Parameters.Add(sqlpAtendido);
                sqlcComando.Parameters.Add(sqlpReferenciaOrden);
                sqlcComando.Parameters.Add(sqlpClasificacion);
                sqlcComando.Parameters.Add(sqlpCliente);
                //sqlcComando.Parameters.Add(sqlpNoOrden);
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
                throw new Exception("Error capa de datos (public static int Actualizar(OrdenEstimacion " + uOrdenEstimacion.Id + ")): " + ex.Message);
            }
        }
        #endregion

        #region borrar

        /// <summary>
        /// Método que borrar alguna OrdenEstimacion por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarOrdenEstimacion";

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
                throw new Exception("Error capa de datos (public static int Borrar(OrdenEstimacion " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region consultar

        /// <summary>
        /// Obtener todos los registros de OrdenesEstimaciones
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerOrdenesEstimaciones()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerOrdenesEstimaciones";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<OrdenEstimacion> result = LibraryGenerics<OrdenEstimacion>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<OrdenEstimacion> ObtenerOrdenesEstimaciones()): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener todos los registros de OrdenesEstimaciones
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerHistorialDeOrdenesEstimaciones()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerHistorialDeOrdenesEstimaciones";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<OrdenEstimacion> result = LibraryGenerics<OrdenEstimacion>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<OrdenEstimacion> ObtenerHistorialDeOrdenesEstimaciones()): " + ex.Message);
            }
        }




        /// <summary>
        /// Obtener todos los registros de OrdenesEstimaciones
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerOrdenesCambios()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerOrdenesCambios";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<OrdenEstimacion> result = LibraryGenerics<OrdenEstimacion>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<OrdenEstimacion> ObtenerOrdenesCambios()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener todos los registros de OrdenesEstimaciones
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerOrdenesEstimacionesConcluidos()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerOrdenesEstimacionesConcluidos";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<OrdenEstimacion> result = LibraryGenerics<OrdenEstimacion>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<OrdenEstimacion> ObtenerOrdenesEstimacionesConcluidos()): " + ex.Message);
            }
        }
        /// <summary>
        /// Obtener un registro de OrdenEstimacion por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static OrdenEstimacion ObtenerOrdenEstimacionaPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerOrdenEstimacionPorID";

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
                OrdenEstimacion result = LibraryGenerics<OrdenEstimacion>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static OrdenEstimacion ObtenerOrdenEstimacionaPorID(int " + iID + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Obtener todos los registros de OrdenesEstimaciones
        /// </summary>
        /// <param name="aRevision"></param>
        public static List<ImagenOrdenEstimacionD> ObtenerOrdenEstimacionDPorID(int iID, string IDConcepto)
        {
            try
            {

                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerImagenesPorMovimientoID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@IDMovimiento";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID; 

                SqlParameter sqlpIDConcepto = new SqlParameter();
                sqlpIDConcepto.ParameterName = "@IDConcepto";
                sqlpIDConcepto.SqlDbType = SqlDbType.Char;
                sqlpIDConcepto.Size = 10;
                sqlpIDConcepto.Value = IDConcepto;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpIDConcepto);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<ImagenOrdenEstimacionD> result = LibraryGenerics<ImagenOrdenEstimacionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<ImagenOrdenEstimacionD> ObtenerOrdenEstimacionDPorID(string " + iID + ")): " + ex.Message);
            }
        }
      
        #endregion

        #region Acciones

        /// <summary>
        /// Método que Afecta un registro de OrdenEstimacion
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarOrdenPorID(OrdenEstimacion aOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AfectarOrdenPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = aOrdenEstimacion.Id;

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
                throw new Exception("Error capa de datos (public static int AfectarOrdenPorID(OrdenEstimacion " + aOrdenEstimacion + ")): " + ex.Message);
            }
        }


        /// <summary>
        /// Método que Afecta un registro de OrdenEstimacion
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarEstimacionPorID(OrdenEstimacion aOrdenEstimacion)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AfectarEstimacionPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = aOrdenEstimacion.Id;

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
                throw new Exception("Error capa de datos (public static int AfectarEstimacionPorID(OrdenEstimacion " + aOrdenEstimacion + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Método que avanza un movimiento de OrdenEstimacion
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
        /// Método que cancela un movimiento de OrdenEstimacion
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int CancelarOrdenEstimacionPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_CancelarOrdenEstimacionPorID";

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
                throw new Exception("Error capa de datos (public static int CancelarOrdenEstimacionPorID(int " + iID + ")): " + ex.Message);
            }
        }

        #endregion

    }
}
