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
    public partial class FormaBuscaCodigosPostales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            onLoad();
        }

        public void onLoad()
        {
            Node nRoot = new Node();
            nRoot.Text = "MEXICO";
            nRoot.NodeID = "MX";
            nRoot.Expanded = false;

            //1. Obtener los Municipios
            List<Estado> lEstado = EstadoBusiness.ObtenerEstados();

            //2. Armar el arbol de hijos
            foreach (Estado st in lEstado)
            {
                Node nEstado = new Node();
                nEstado.Text = st.Descripcion;
                nEstado.NodeID = st.ID;
                nEstado.Expanded = false;

                List<Municipio> lMunicipios = MunicipioBusiness.ObtenerMunicipiosPorEstado(st.ID);
                foreach (Municipio mun in lMunicipios)
                {
                    Node nMun = new Node();
                    nMun.Text = mun.Descripcion;
                    nMun.NodeID = mun.ID;

                    nEstado.Children.Add(nMun);

                }
                nRoot.Children.Add(nEstado);
            }
            tpCodigosPostales.Root.Add(nRoot);
        }

        /// <summary>
        /// Método que genera nodos en el TreePanel para obtener las colonias
        /// </summary>
        /// <param name="strNodoID"></param>
        /// <returns></returns>
        [DirectMethod]
        public string GenerarNodo(string strNodoID)
        {
            //1. Obtener las colonias del siguiente nivel 
            List<Colonia> lColonias = ColoniaBusiness.ObtenerColoniasPorMunicipio(strNodoID);
            NodeCollection ncNivel = new NodeCollection();

            //2. Armar el arbol de hijos
            foreach (Colonia col in lColonias)
            {
                Node nCol = new Node();
                nCol.Text = col.Descripcion;
                nCol.NodeID = col.ID;
                nCol.Expanded = false;
                nCol.Expandable = false;
                ncNivel.Add(nCol);
            }
            //3. Regresar los nodos
            return ncNivel.ToJson();
        }

        /// <summary>
        /// Método que presenta los elementos hijos al seleccionar un nodo
        /// </summary>
        /// <param name="strNodoID"></param>
        [DirectMethod]
        public void ObtenerCodigosPostales(string strNodoID)
        {
            //1. Obtener las cuentas hijas
            sCodigosPostales.DataSource = CodigoPostalBusiness.ObtenerCodigosPostalesCompletoPorColonia(strNodoID);
            sCodigosPostales.DataBind();
        }


        protected void txtCP_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor de la caja de busqueda
            string strNumero = e.ExtraParams["vNumero"];
            if (!strNumero.Equals("null"))
            {
                sCodigosPostales.DataSource = CodigoPostalBusiness.ObtenerCodigosPostalesCompletoPorNumero(Convert.ToInt32(strNumero));
                sCodigosPostales.DataBind();
            }
        }
    
    }
}