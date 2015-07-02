using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Text;
using System.Xml;
using Newtonsoft.Json;
using System.Xml.Xsl;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class OrdenesCambio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //1. Si no hay AjaxRequest
            if (!X.IsAjaxRequest)
            {
                //2. Checar ticket de autenticación
                //UsuarioBusiness.checkValidSession(this);
                //3. Llenar Store de OrdenesEstimaciones, Preciarios y Usuarios
                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

                //sSucursales.DataSource = SucursalBusiness.ObtenerSucursales();
                //sSucursales.DataBind();

                sSucursales.DataSource = SucursalBusiness.ObtenerSucursalesEnUso();
                sSucursales.DataBind();

                sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesEstimaciones();
                sOrdenesEstimaciones.DataBind();

                sCuadrilla.DataSource = CuadrillaBusiness.ObtenerCuadrillas();
                sCuadrilla.DataBind();

                rmOrdenesEstimaciones.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sOrdenesEstimaciones(object sender, StoreReadDataEventArgs e)
        {
            sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesEstimaciones();
            sOrdenesEstimaciones.DataBind();

        }


      

        //Exporta a Excel el grid
        protected void ExportEt(object sender, EventArgs e)
        {

            string nombreReporte = cmbCuadrillas.Text;


            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            { 
                SqlCommand comando = new SqlCommand("web_spS_ObtenerReportePorCuadrilla", conn);

                SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                DataTable dt = new DataTable();
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptador.SelectCommand.Parameters.Add(@"CUADRILLA", SqlDbType.Char).Value = nombreReporte;
                adaptador.Fill(dt);



                ReportDocument reporteCuadrila = new ReportDocument();
                reporteCuadrila.Load(Server.MapPath("reportess/rReportesCuadrillas.rpt"));
                reporteCuadrila.SetDataSource(dt);


                reporteCuadrila.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.Excel, Response, true, "Reportes Cuadrilla " + nombreReporte);
                 

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


        /// <summary>
        /// Método para borrar las imagenes si se borra el movimiento completo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public static int VerificarImagenes(int strID, string IDConcepto)
        {
            List<ImagenOrdenEstimacionD> oeb = OrdenEstimacionBusiness.ObtenerOrdenEstimacionDPorID(strID, IDConcepto);
            if (oeb.Count > 0)
            {
                Cookies.Set("Fotos", 1, DateTime.Now.AddSeconds(30), "", "", false);
                return 1;
            }
            else
            {
                return 0;
            }

        }

        /// <summary>
        /// Método para borrar las imagenes si se borra el movimiento completo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public static int VerificarCroquis(int strID)
        {
            if (strID > 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        /// <summary>
        /// Método para borrar las imagenes si se borra el movimiento completo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public static int VerificarFacturas(int strID)
        {
            if (strID > 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
         
        [DirectMethod]
        public void ObtenerOrdenesEstimaciones()
        {
            sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesEstimaciones();
            sOrdenesEstimaciones.DataBind();
        }

        [DirectMethod]
        public void ObtenerHistorialDeOrdenesEstimaciones()
        {
            sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerHistorialDeOrdenesEstimaciones();
            sOrdenesEstimaciones.DataBind();
        }
    }
}