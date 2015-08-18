using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaAccesosMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var success = new JFunction { Fn = "showSuccess" };
            string ID = Cookies.GetCookie("cEditarUxM").Value;
            if (ID.Equals(""))
            {
                X.Msg.Alert("Datos", "Cookie Vacia: " + ID, success).Show();
                this.sAccesos.DataSource = ModuloBusiness.ObtenerModulos();
            }
            else
            {
                this.sAccesos.DataSource = ModuloBusiness.ObtenerModulosPorUsuarioID(ID);
            }
        }

        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strPermisos = e.ExtraParams["permisos"];
            string ID = Cookies.GetCookie("cEditarUxM").Value;
            if (strPermisos != null && !strPermisos.Equals("0"))
            {
                List<Modulo> lModulo = JSON.Deserialize<List<Modulo>>(strPermisos);
                if (lModulo != null)
                {
                    foreach (Modulo m in lModulo)
                    {
                        m.UsuarioID = ID;
                        ModuloBusiness.ActualizarMxU(m);
                    }
                } 

            }
        } 

    }
}