using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;
using System.Xml;
using System.Xml.Xsl;
using System.Text;
using Newtonsoft.Json;

namespace OSEF.ERP.APP
{
    public partial class ExploradorVolumetrias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sPreciarios.DataSource = PreciarioBusiness.ObtenerPreciarios();
            sPreciarios.DataBind();
        }


        /// <summary>
        /// Evento que se lanza al escoger un elemento de Preciarios
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbPreciarios_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el Preciario seleccionado y obtener sus datos junto con su sucursal
            string strPreciarios = e.ExtraParams["valor"];
            if (strPreciarios != null)
            {
                sPreciarioConcepto.DataSource = PreciarioConceptoBusiness.ObtenerPreciarioConceptoPorPreciario(strPreciarios);
                sPreciarioConcepto.DataBind();
                sCategoria.DataSource = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriasPorPreciario(strPreciarios);
                sCategoria.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al escoger una categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbCategoria_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el estado seleccionado y obtener los Municipios
            string strCategoria = e.ExtraParams["categoria"];
            sSubCategoria.DataSource = PreciarioSubCategoriaBusiness.ObtenerPreciarioSubCategoriaPorCategoria(strCategoria);
            sSubCategoria.DataBind();
        }


        /// <summary>
        /// Evento que se lanza al seleccionar una subcategoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbSubCategoria_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado 
            string strSubCategoria = e.ExtraParams["subcategoria"];
            sSubSubCategorias.DataSource = PreciarioSubSubCategoriaBusiness.ObtenerPreciarioSubSubCategoriaPorSubCategoria(strSubCategoria);
            sSubSubCategorias.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar una subbsubcategoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbSubSubCategoria_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado 
            string strPreciario = e.ExtraParams["preciario"].Equals("null") ? string.Empty : e.ExtraParams["preciario"];
            string strCategoria = e.ExtraParams["categoria"].Equals("null") ? string.Empty : e.ExtraParams["categoria"];
            string strSubCategoria = e.ExtraParams["subcategoria"].Equals("null") ? string.Empty : e.ExtraParams["subcategoria"];
            string strSubSubCategoria = e.ExtraParams["subsubcategoria"].Equals("null") ? string.Empty : e.ExtraParams["subsubcategoria"];   

            sPreciarioConcepto.DataSource = PreciarioConceptoBusiness.ObtenerPreciarioConceptoFiltro(strPreciario, strCategoria, strSubCategoria, strSubSubCategoria);
            sPreciarioConcepto.DataBind();
        }

        protected void OnReadData_sConceptos(object sender, StoreReadDataEventArgs e)
        {
            //sSubCategoria.DataSource = PreciarioSubCategoriaBusiness.ObtenerPreciarioSubCategoriaPorCategoria(strCategoria);
            //sSubCategoria.DataBind();
        }

        protected void ExportEt(object sender, DirectEventArgs e)
        {
            try
            {
                string name = "Preciario Conceptos";

                #region Convert Data JSON
                object o = JSON.Deserialize<object>(e.ExtraParams["data"]);
                #endregion

                #region JSON for use XML
                StringBuilder SB = new StringBuilder();
                SB.Append("{");
                SB.Append("\"?xml\":");
                SB.Append("{");
                SB.Append("\"@version\": \"1.0\",");
                SB.Append("\"@standalone\": \"no\"");
                SB.Append("},");
                SB.Append("\"records\":");
                SB.Append("{");
                SB.Append("\"record\":");
                SB.Append(o.ToString());
                SB.Append("}}");
                #endregion

                #region Convert JSON to XML
                XmlDocument XD = (XmlDocument)JsonConvert.DeserializeXmlNode(@SB.ToString());
                XmlNode XN = XD as XmlNode;
                #endregion

                #region Clear Buffer
                Response.Clear();
                #endregion

                switch (e.ExtraParams["format"].ToString())
                {
               

                    #region Document Type XLS
                    case "xls":
                        Response.ContentType = "application/vnd.ms-excel";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + name + ".xls");
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        XslCompiledTransform XCT1 = new XslCompiledTransform();
                        XCT1.Load(Server.MapPath("Excel.xsl"));
                        XCT1.Transform(XN, null, Response.OutputStream);
                        break;
                    #endregion

                    
                }

                #region Close Buffer
                Response.End();
                #endregion
            }
            catch
            {
            }
        }


    }
}