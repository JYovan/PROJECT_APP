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
    public partial class FormaGeneradorVolumetriaD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarVolumetria").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoVolumetriaD").Value;

            if (!X.IsAjaxRequest)
            {
                if (GeneradorVolumetriaDBusiness.ObtenerGeneradorVolumetriaVaciosPorMovimientoConcepto(strConcepto, iID))
                {


                    sFormaGenerador.DataSource = GeneradorVolumetriaDBusiness.ObtenerGeneradorVolumetriaDPorMovConcepto(iID, strConcepto);
                    sFormaGenerador.DataBind();
                    rmFormaGenerador.RegisterIcon(Icon.Delete);
                }

            }

        }

        protected void imgbtnAceptar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo

            string strDescripcion = e.ExtraParams["DescripcionCorta"];
            string strGeneradorD = e.ExtraParams["GeneradorD"];
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarVolumetria").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoVolumetriaD").Value;

            //2. Serializar el detalle

            List<GeneradorVolumetriaD> lGeneradorD = JSON.Deserialize<List<GeneradorVolumetriaD>>(strGeneradorD);

            //3. Guardar o Actuaizar el Movimiento

            //4. Lo que sucede cuando no es nuevo y ya se habia guardado

            //Se revisa que no este en la bd si devuelve falso se inserta pro primera vez
            if (GeneradorVolumetriaDBusiness.ObtenerGeneradorVolumetriaVaciosPorMovimientoConcepto(strConcepto, iID))
            {

                //1. Borrar todo el detalle e insertarlo de nuevo
                GeneradorVolumetriaDBusiness.BorrarGeneradorVolumetriaDPorConcepto(iID, strConcepto);

                //2. Insertar los datos del detalle
                foreach (GeneradorVolumetriaD sd in lGeneradorD)
                {

                    //2. Validar que el objeto no venga en blanco
                    if (sd.Area.Equals(string.Empty) || sd.Total == 0)
                        continue;
                    else
                    {

                        sd.ConceptoID = strConcepto;
                        sd.MovID = iID;
                        sd.Descripcion = strDescripcion;
                        GeneradorVolumetriaDBusiness.Insertar(sd);
                    }


                }


            }
            else
            {
                //1. Insertar los datos del detalle y regresar valor
                foreach (GeneradorVolumetriaD sd in lGeneradorD)
                {

                    //2. Validar que el objeto no venga en blanco
                    if (sd.Area.Equals(string.Empty) || sd.Total == 0)
                        continue;
                    else
                    {
                        sd.ConceptoID = strConcepto;
                        sd.MovID = iID;
                        sd.Descripcion = strDescripcion;
                        GeneradorVolumetriaDBusiness.Insertar(sd);
                    }
                }
            }


        }
    }
}