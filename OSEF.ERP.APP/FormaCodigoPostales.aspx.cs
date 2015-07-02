using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class FormaCodigosPostales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sEstados.DataSource = EstadoBusiness.ObtenerEstados();
            sEstados.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["vEstado"];
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
            txtCP.Disabled = true;
        }
        protected void cmbMunicipio_Select(object sender, DirectEventArgs e)
        {
            txtCP.Disabled = true;
            //1. Obtener el valor seleccionado y obtener los municipios
            string strMunicipio = e.ExtraParams["vMunicipio"];
            sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColonias.DataBind();

        }
        protected void txtCP_Change(object sender, DirectEventArgs e)
        {
            txtCP.Disabled = false;
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            CodigoPostal cp = new CodigoPostal();
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    case "cmbEstado":
                        cp.Estado = sd.Value;
                        break;
                    case "cmbMunicipio":
                        cp.Municipio = sd.Value;
                        break;
                    case "cmbColonia":
                        cp.Colonia = sd.Value;
                        break;
                    case "txtCP":
                        cp.Numero = Convert.ToInt32(sd.Value);
                        break;
                }
            }

            //3. Insertar en la base de datos
            cp.Id = CodigoPostalBusiness.Insertar(cp);
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cp.Id, ParameterMode.Value));
        }


    }
}