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
    public partial class FormaGenerador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;

            if (!X.IsAjaxRequest)
            {
                if (GeneradorOrdenEstimacionDBusiness.ObtenerGeneradorOrdenEstimacionVaciosPorMovimientoConcepto(strConcepto, iID))
                {
                    sFormaGenerador.DataSource = GeneradorOrdenEstimacionDBusiness.ObtenerGeneradorOrdenEstimacionDPorMovConcepto(iID, strConcepto);
                    sFormaGenerador.DataBind();
                    rmFormaGenerador.RegisterIcon(Icon.Delete);
                }
            }
        }

        protected void imgbtnAceptar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo

            string strDescripcion = e.ExtraParams["DescripcionCorta"].Trim().Equals("") || e.ExtraParams["DescripcionCorta"] ==null?"":e.ExtraParams["DescripcionCorta"];
            string strGeneradorD = e.ExtraParams["GeneradorD"];
            string strPlano = e.ExtraParams["vPlano"];
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;

            //2. Serializar el detalle

            List<GeneradorOrdenEstimacionD> lGeneradorD = JSON.Deserialize<List<GeneradorOrdenEstimacionD>>(strGeneradorD);

            //3. Guardar o Actuaizar el Movimiento

            //4. Lo que sucede cuando no es nuevo y ya se habia guardado

            //Se revisa que no este en la bd si devuelve falso se inserta pro primera vez
            if (GeneradorOrdenEstimacionDBusiness.ObtenerGeneradorOrdenEstimacionVaciosPorMovimientoConcepto(strConcepto, iID))
            {

                //1. Borrar todo el detalle e insertarlo de nuevo
                GeneradorOrdenEstimacionDBusiness.BorrarGeneradorOrdenEstimacionDPorConcepto(iID, strConcepto);

                //2. Insertar los datos del detalle
                foreach (GeneradorOrdenEstimacionD sd in lGeneradorD)
                {
                    //2. Validar que el objeto no venga en blanco
                    if (sd.Area.Equals(string.Empty) || sd.Total == 0)
                        continue;
                    else
                    {
                        sd.ConceptoID = strConcepto;
                        sd.MovID = iID;
                        sd.Descripcion = strDescripcion;
                        sd.Plano = strPlano;
                        GeneradorOrdenEstimacionDBusiness.Insertar(sd);
                    }
                }
            }
            else
            {
                //1. Insertar los datos del detalle y regresar valor
                foreach (GeneradorOrdenEstimacionD sd in lGeneradorD)
                {
                    //2. Validar que el objeto no venga en blanco
                    if (sd.Area.Equals(string.Empty) || sd.Total == 0)
                        continue;
                    else
                    {
                        sd.ConceptoID = strConcepto;
                        sd.MovID = iID;
                        sd.Descripcion = strDescripcion;
                        sd.Plano = strPlano;
                        GeneradorOrdenEstimacionDBusiness.Insertar(sd);
                    }
                }
            }
        }
    }
}