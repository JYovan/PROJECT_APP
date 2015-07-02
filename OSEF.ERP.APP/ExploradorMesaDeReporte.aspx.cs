using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class ExploradorMesaDeReporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {

                rmExploradorMesaDeReporte.RegisterIcon(Icon.Delete);

                ObtenerMesaDeReporte();

                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

            }
        }
         
        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sMesaDeReporte(object sender, StoreReadDataEventArgs e)
        {
            ObtenerMesaDeReporte();
        }
         
        //Exporta a Excel el grid
        protected void ExportEt(object sender, EventArgs e)
        {

            string parametro = cmbClasificacion.Value.ToString();


            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                SqlCommand comando = new SqlCommand("web_spS_ObtenerReportesPorClasificacion", conn); 
                SqlDataAdapter adaptador = new SqlDataAdapter(comando); 
                DataTable dt = new DataTable();
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptador.SelectCommand.Parameters.Add(@"CLASIFICACION", SqlDbType.VarChar).Value = parametro;
                adaptador.Fill(dt); 
                ReportDocument reporteCuadrila = new ReportDocument();
                reporteCuadrila.Load(Server.MapPath("reportess/rMantenimientosFacturador.rpt"));
                reporteCuadrila.SetDataSource(dt); 
                reporteCuadrila.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.Excel, Response, true, "Reportes Mantenimiento " + parametro);

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                if (conn.State != ConnectionState.Closed)
                    conn.Close();
                conn.Dispose();
            }
        }

        protected void setRevisar(object sender, DirectEventArgs e)
        {
            string strRevisados = e.ExtraParams["registrosactualizados"];
            int n = 0;
            if (strRevisados != null && !strRevisados.Equals("0"))
            {
                List<MesaDeReporte> lMesaDeReporte = JSON.Deserialize<List<MesaDeReporte>>(strRevisados);
                foreach (MesaDeReporte mdr in lMesaDeReporte)
                {
                    MesaDeReporte xmdr = new MesaDeReporte();
                    xmdr.Id = mdr.Id; 
                    xmdr.Revisado = mdr.Revisado;
                    MesaDeReporteBusiness.RevisarMesaDeReportePorID(xmdr);
                    n++;
                }
                X.Msg.Alert("ATENCIÓN", n + " REGISTROS REVISADOS.", new JFunction { Fn = "showResult(true)" }).Show();
            }
            else
            {
                X.Msg.Alert("ATENCIÓN", "SELECCIONE AL MENOS 1 REGISTRO.", new JFunction { Fn = "showResult(false)" }).Show();
            }
        }

        [DirectMethod]
        public void setFacturar(string data, string fmantenimiento)
        {
            //string strRevisados = e.ExtraParams["registrosactualizados"];
            string strFacturados = data;

            //string strFacturados = e.ExtraParams["rData"];
            int n = 0;
            if (strFacturados != null && !strFacturados.Equals("0"))
            {
                
                List<MesaDeReporte> lMesaDeReporte = JSON.Deserialize<List<MesaDeReporte>>(strFacturados);
                foreach (MesaDeReporte mdr in lMesaDeReporte)
                {
                    MesaDeReporte xmdr = new MesaDeReporte();
                    xmdr.Id = mdr.Id;
                    xmdr.Facturado = mdr.Facturado;
                    xmdr.Revisado = mdr.Revisado;
                    xmdr.FacturaMantenimiento = fmantenimiento;
                    MesaDeReporteBusiness.FacturarMesaDeReportePorID(xmdr);
                    n++;
                }
                X.Msg.Alert("ATENCIÓN", n + " REGISTROS FACTURADOS.", new JFunction { Fn = "showResult(true)" }).Show();
            } else {
                X.Msg.Alert("ATENCIÓN", "SELECCIONE AL MENOS 1 REGISTRO.", new JFunction { Fn = "showResult(false)" }).Show();
            }
        }

        //Exporta a Excel el grid
        protected void ExportEstimacionCostos(object sender, EventArgs e)
        {
            string parametro = cmbClasificacion.Value.ToString();
            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                SqlCommand comando = new SqlCommand("web_spS_ObtenerConceptosRevisados", conn);
                SqlDataAdapter adaptador = new SqlDataAdapter(comando); 
                DataTable dt = new DataTable();
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptador.SelectCommand.Parameters.Add(@"CLASIFICACION", SqlDbType.VarChar).Value = parametro;
                adaptador.Fill(dt); 
                ReportDocument rCaratulaEstimacionCostos = new ReportDocument();
                rCaratulaEstimacionCostos.Load(Server.MapPath("reportess/rCaratulaEstimacionDeCostos.rpt"));
                rCaratulaEstimacionCostos.SetDataSource(dt);
                rCaratulaEstimacionCostos.SetParameterValue("pProveedor", "A & R Construcciones S.A de C.V");
                rCaratulaEstimacionCostos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.Excel, Response, true, "Reportes Mantenimiento " + parametro);
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }finally{
                if (conn.State != ConnectionState.Closed)
                    conn.Close();
                    conn.Dispose();
            }
        }

        protected void packReport(object sender, EventArgs e)
        {
            try
            {
                object s = sender;
                EventArgs ee = e;
                //ExportEt();
                //ExportEstimacionCostos();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
         
        [DirectMethod]
        public void ObtenerMesaDeReporte()
        {
            sMesaDeReporte.DataSource = MesaDeReporteBusiness.ObtenerMesaDeReportesConcluidos();
            sMesaDeReporte.DataBind();
            sSucursales.DataSource = SucursalBusiness.ObtenerSucursalesEnUsoEnConcluidos();
            sSucursales.DataBind();

            this.gpExploradorMesaDeReporte.ColumnModel.Columns[1].Hidden = true;
        }

        [DirectMethod]
        public void ObtenerMesaDeReporteFacturado()
        {
            this.gpExploradorMesaDeReporte.ColumnModel.Columns[1].Hidden = false;
            sMesaDeReporte.DataSource = MesaDeReporteBusiness.ObtenerHistorialMesaDeReportesConcluidos();
            sMesaDeReporte.DataBind();
        }
    }
}