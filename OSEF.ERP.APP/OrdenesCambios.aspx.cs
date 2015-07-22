using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;

namespace OSEF.ERP.APP
{
    public partial class OrdenesCambios : System.Web.UI.Page
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

                sSucursales.DataSource = SucursalBusiness.ObtenerSucursalesEnUsoEnOrdenesDeCambio();
                sSucursales.DataBind();


                sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesCambios();
                sOrdenesEstimaciones.DataBind();

                sSucursal.DataSource = SucursalBusiness.ObtenerSucursalesEnUsoEnOrdenesDeCambio();
                sSucursales.DataBind();

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
            sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesCambios();
            sOrdenesEstimaciones.DataBind();
        }



        //Exporta a Excel el grid
        protected void ExportEt(object sender, EventArgs e)
        {

            string sucursal = cmbSucursal.Value.ToString();


            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                SqlCommand comando = new SqlCommand("web_spS_ObtenerRItemsAdicionales", conn);

                SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                DataTable dt = new DataTable();
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptador.SelectCommand.Parameters.Add(@"Sucursal", SqlDbType.Char).Value = sucursal;
                adaptador.Fill(dt);



                ReportDocument reporteCuadrila = new ReportDocument();
                reporteCuadrila.Load(Server.MapPath("reportess/ResumenOC.rpt"));
                reporteCuadrila.SetDataSource(dt);


                reporteCuadrila.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Resumen de OC: " + sucursal);


                reporteCuadrila.Close();
                reporteCuadrila.Dispose();

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


    }
}