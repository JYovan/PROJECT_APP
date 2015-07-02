using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class ConsultarPreciario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                //Preciario oPreciario = PreciarioBusiness.ObtenerPreciarioPorID("PRC0001");
                //oPreciario.RPreciarioCategorias = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriasPorPreciario("PRC0001");
                //sConsultarPreciario.Data = oPreciario;
            }
        }

        /// <summary>
        /// Método que llena el Store de preciario con sus Categorias, SubCategorias y SubSubCategorias
        /// </summary>
        /// <param name="strPreciario"></param>
        [DirectMethod]
        public void CargarPreciario(string strPreciario)
        {
            //1. Llenar el store de Preciario
            Preciario oPreciario = PreciarioBusiness.ObtenerPreciarioPorID(strPreciario);
            oPreciario.RPreciarioCategorias = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriasPorPreciario(strPreciario);

            sConsultarPreciario.Data = oPreciario;

            //sConsultarPreciario.Add(new { 
            //    ID = oPreciario.ID,
            //    Descripcion = oPreciario.Descripcion,
            //    Sucursal = oPreciario.Sucursal,
            //    Archivo = oPreciario.Archivo,
            //    Usuario = oPreciario.Usuario,
            //    Estatus = oPreciario.Estatus,
            //    FechaAlta = oPreciario.FechaAlta,
            //    RSucursal = oPreciario.RSucursal,
            //    RPreciarioCategorias = oPreciario.RPreciarioCategorias
            //});
        }
    }
}