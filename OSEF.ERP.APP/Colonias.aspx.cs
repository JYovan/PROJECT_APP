using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Colonias : System.Web.UI.Page
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
                //List<Colonia> lColonias = ColoniaBusiness.ObtenerColonias();
                //sColonias.DataSource = lColonias;
                //sColonias.DataBind();
                sEstados.DataSource = EstadoBusiness.ObtenerEstados();
                sEstados.DataBind();
                rmColonias.RegisterIcon(Icon.Delete);
            }

        }

        protected void OnReadData_sColonias(object sender, StoreReadDataEventArgs e)
        {
            List<Colonia> lColonia = ColoniaBusiness.ObtenerColonias();
            sColonias.DataSource = lColonia;
            sColonias.DataBind();
        }



        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        protected void imgbtnBorrar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere eliminar
            string strID = e.ExtraParams["ID"];

            //2. Validar si se elimina el registro
            if (ColoniaBusiness.ObtenerRegistrosDeColoniasPorID(strID))
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));
            }
            else
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
                ColoniaBusiness.Borrar(strID);
            }
        }


        /// <summary>
        /// Evento que se lanza al escoger un elemento de Estados
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el estado seleccionado y obtener los Municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }


        protected void cmbMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strMunicipio = e.ExtraParams["valorMunicipio"];
            sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColonias.DataBind();
        }

    }
}