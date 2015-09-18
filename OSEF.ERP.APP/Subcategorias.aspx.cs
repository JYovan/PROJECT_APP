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
    public partial class Subcategorias : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                sSubCategorias.DataSource = SubCategoriaBusiness.ObtenerSubCategorias();
                sSubCategorias.DataBind();
                rmSubcategorias.RegisterIcon(Icon.Delete);
                sCategorias.DataSource = CategoriaBusiness.ObtenerCategorias();
                sCategorias.DataBind();
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sSubCategorias(object sender, StoreReadDataEventArgs e)
        {
            sSubCategorias.DataSource = SubCategoriaBusiness.ObtenerSubCategorias();
            sSubCategorias.DataBind();
        }

        /// <summary>
        /// Método para agregar un registro nuevo
        /// </summary>
        /// <param name="bOrden"></param>
        /// <param name="strCategoria"></param>
        [DirectMethod]
        public string InsertarSubCategoria(byte bOrden, string strCategoria)
        {
            string strResultado;
            if (SubCategoriaBusiness.ObtenerSubCategoriaPorOrden(bOrden) == null)
            {
                Subcategoria iSubcategoria = new Subcategoria();
                iSubcategoria.Orden = bOrden;
                iSubcategoria.Descripcion = string.Empty;
                iSubcategoria.CategoriaIdRaw = strCategoria;
                iSubcategoria.Id = SubCategoriaBusiness.Insertar(iSubcategoria);
                strResultado = "false|" + iSubcategoria.Id;
                return strResultado;
            }
            else
                return "true";
        }

        /// <summary>
        /// Método para actualizar los datos de la tabla
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strCategoria"></param>
        /// <param name="bOrden"></param>
        /// <param name="strDescripcion"></param>
        [DirectMethod]
        public void ActualizarSubCategoria(string strID, string strCategoria, byte bOrden, string strDescripcion)
        {
            Subcategoria uSubcategoria = new Subcategoria();
            uSubcategoria.Id = strID;
            uSubcategoria.Orden = bOrden;
            uSubcategoria.Descripcion = strDescripcion;
            uSubcategoria.CategoriaIdRaw = strCategoria;

            SubCategoriaBusiness.Actualizar(uSubcategoria);
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarSubCategoria(string strID)
        {
            SubCategoriaBusiness.Borrar(strID);
        }
    }
}