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
    public partial class CodigoFallas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (!X.IsAjaxRequest)
            {
                onLoad();
            }
        }

        #region Consultar
        
        public void onLoad()
        {
            sCodigoPPTA.DataSource = CodigoFallasBusiness.ObtenerCodigoFallas();
            sCodigoPPTA.DataBind();
        } 

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sCodigosPPTA(object sender, StoreReadDataEventArgs e)
        {
            onLoad();
        }
       

        #endregion
         
        #region Eliminar

        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        protected void imgbtnBorrar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere eliminar
            string strID = e.ExtraParams["ID"];

            //2. Validar si se elimina el registro
            if (CodigoFallasBusiness.ObtenerRegistrosDeCodigoFallasPorID(strID))
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));
            }
            else
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
                CodigoFallasBusiness.Borrar(strID);

            }
        }
        
        #endregion
    }
}