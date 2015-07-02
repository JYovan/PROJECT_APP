using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaBuscaPreciarioConcepto : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Primer solicitud
            if (!X.IsAjaxRequest)
            {
            
                string preciario = Cookies.GetCookie("cookiePreciarioBusqueda").Value;
                //2. Cargar Conceptos
                sCategoria.DataSource = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriasPorPreciario(preciario);
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
        /// Evento de click que realiza la búsqueda de los conceptos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener los valores para filtros
            string strCategoria = e.ExtraParams["categoria"].Equals("null") ? string.Empty : e.ExtraParams["categoria"];
            string strSubCategoria = e.ExtraParams["subcategoria"].Equals("null") ? string.Empty : e.ExtraParams["subcategoria"];
            string strSubSubCategoria = e.ExtraParams["subsubcategoria"].Equals("null") ? string.Empty : e.ExtraParams["subsubcategoria"];
            string preciario = Cookies.GetCookie("cookiePreciarioBusqueda").Value;

            sConceptosFiltrados.DataSource = PreciarioConceptoBusiness.ObtenerPreciarioConceptoFiltro(preciario, strCategoria, strSubCategoria, strSubSubCategoria);
            sConceptosFiltrados.DataBind();
        }
    }
}