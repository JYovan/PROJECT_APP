using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaAyudaBusquedaConceptoPreciario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Primer solicitud
            if (!X.IsAjaxRequest)
            {
               
                string idPReciario = Cookies.GetCookie("cookieEditarPreciarioGeneral").Value;
               
                    //2. Cargar Categorias
                    sCategoria.DataSource = PreciarioGeneralCategoriaBusiness.ObtenerPreciarioGeneralCategoriaPorPreciario(idPReciario);
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
            //1. Obtener la categoria seleccionada y obtener la subcategoria
            string strCategoria = e.ExtraParams["categoria"];
            sSubCategoria.DataSource = PreciarioGeneralSubCategoriaBusiness.ObtenerPreciarioGeneralSubCategoriaPorCategoria(strCategoria);
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
            sSubSubCategorias.DataSource = PreciarioGeneralSubSubCategoriaBusiness.ObtenerPreciarioGeneralSubSubCategoriaPorSubCategoria(strSubCategoria);
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
            string idPReciario = Cookies.GetCookie("cookieEditarPreciarioGeneral").Value;

            sConceptosFiltrados.DataSource = PreciarioGeneralConceptoBusiness.ObtenerPreciarioConceptoFiltro(idPReciario, strCategoria, strSubCategoria, strSubSubCategoria);
            sConceptosFiltrados.DataBind();
        }
    }
}