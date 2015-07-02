using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class VolumetriasPreciario : System.Web.UI.Page
    {

        /// <summary>
        /// Se produce al principio de la inicialización de la página.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_PreInit(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Si no hay AjaxRequest
            if (!X.IsAjaxRequest)
            {
                //2. Checar ticket de autenticación
                //UsuarioBusiness.checkValidSession(this);

                //3. Llenar Store de Revisiones, Preciarios y Usuarios
                sVolumetrias.DataSource = VolumetriaBusiness.ObtenerVolumetrias();
                sVolumetrias.DataBind();

                sPreciarios.DataSource = PreciarioBusiness.ObtenerPreciarios();
                sPreciarios.DataBind();

                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

                rmVolumetrias.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sVolumetrias(object sender, StoreReadDataEventArgs e)
        {
            sVolumetrias.DataSource = VolumetriaBusiness.ObtenerVolumetrias();
            sVolumetrias.DataBind();
        }


    }
}