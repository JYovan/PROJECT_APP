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
    public partial class FormaSolicitudPrestamo : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioBusiness.checkValidSession(this);

            //1. Validar que no sea una petición Ajax
            if (!X.IsAjaxRequest)
            {
                //2. Cargar el ComboBox de Clientes
                sCliente.DataSource = ClienteBusiness.ObtenerClientes();
                sCliente.DataBind();

                //3. Cargar el ComboBox de Estados
                List<Estado> lEstado = EstadoBusiness.ObtenerEstados();
                sEstados.DataSource = lEstado;
                sEstados.DataBind();

                sEstadosAnterior.DataSource = lEstado;
                sEstadosAnterior.DataBind();

                sConyugeEstado.DataSource = lEstado;
                sConyugeEstado.DataBind();

                sConyugeEmpresaEstado.DataSource = lEstado;
                sConyugeEmpresaEstado.DataBind();

                sAvalEstado.DataSource = lEstado;
                sAvalEstado.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al cambiar un Estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cambiar un municipio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbMunicipio_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strMunicipio = e.ExtraParams["valor"];
            sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColonias.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarMunicipio(string strEstado)
        {
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Colonias
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarColonia(string strMunicipio)
        {
            sColonias.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColonias.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado para Domicilio Anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstadoAnterior_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipiosAnterior.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipiosAnterior.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el Domicilio Anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbMunicipioAnterior_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sColoniasAnterior.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColoniasAnterior.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Municipios Anterior
        /// </summary>
        [DirectMethod]
        public void AsignarMunicipioAnterior(string strEstado)
        {
            //1. Listar los municipio de acuerdo al Estado
            sMunicipiosAnterior.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipiosAnterior.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al carar el store de Colonias
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarColoniaAnterior(string strMunicipio)
        {
            //1. Listar las colonias de acuerdo al Municipio
            sColoniasAnterior.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sColoniasAnterior.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEmpresaEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sEmpresaMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sEmpresaMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el domicilio de la Empresa
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEmpresaMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Empresa Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarEmpresaMunicipio(string strEstado)
        {
            sEmpresaMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sEmpresaMunicipios.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Empresa Colonia
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarEmpresaColonia(string strMunicipio)
        {
            sEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado para el domicilio del Conyuge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbConyugeEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sConyugeMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sConyugeMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el domicilio del Conyuge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbConyugeMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sConyugeColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sConyugeColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Conyuge Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarConyugeMunicipio(string strEstado)
        {
            sConyugeMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sConyugeMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Conyuge Colonia
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarConyugeColonia(string strMunicipio)
        {
            sConyugeColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sConyugeColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado para el domicilio de la Empresa del Conyuge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbConyugeEmpresaEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strEstado = e.ExtraParams["valor"];
            sConyugeEmpresaMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sConyugeEmpresaMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el domicilio de la Empresa del Conyuge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbConyugeEmpresaMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sConyugeEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sConyugeEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Conyuge Empresa Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarConyugeEmpresaMunicipio(string strEstado)
        {
            sConyugeEmpresaMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sConyugeEmpresaMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Conyuge Empresa Colonia
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarConyugeEmpresaColonia(string strMunicipio)
        {
            sConyugeEmpresaColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sConyugeEmpresaColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Estado para el domicilio del Aval
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void cmbAvalEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strEstado = e.ExtraParams["valor"];
            sAvalMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sAvalMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un Municipio para el domicilio del Aval
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbAvalMunicipio_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener todas las Colonias
            string strMunicipio = e.ExtraParams["valor"];
            sAvalColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sAvalColonia.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Aval Municipios
        /// </summary>
        [DirectMethod]
        public void AsignarAvalMunicipio(string strEstado)
        {
            sAvalMunicipio.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sAvalMunicipio.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al cargar el store de Aval Colonia
        /// </summary>
        /// <param name="strMunicipio"></param>
        [DirectMethod]
        public void AsignarAvalColonia(string strMunicipio)
        {
            sAvalColonia.DataSource = ColoniaBusiness.ObtenerColoniasPorMunicipio(strMunicipio);
            sAvalColonia.DataBind();
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma
            string strRegistro = e.ExtraParams["registro"];
            string strUsuario = e.ExtraParams["usuario"];
            string strcookieEditarSolicitudPrestamo = Cookies.GetCookie("cookieEditarSolicitudPrestamo").Value;
            string strIngresos = e.ExtraParams["ingresos"];
            string strEgresos = e.ExtraParams["egresos"];

            //2. Deserealizar datos
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Usuario oUsuario = JSON.Deserialize<List<Usuario>>(strUsuario).FirstOrDefault();
            List<CapacidadPago> lIngresos = JSON.Deserialize<List<CapacidadPago>>(strIngresos);
            List<CapacidadPago> lEgresos = JSON.Deserialize<List<CapacidadPago>>(strEgresos);

            //3. Declarar objetos a utilizar
            SolicitudPrestamo oSolicitudPrestamo = new SolicitudPrestamo();
            Cliente oCliente = new Cliente();

            //4. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //5. Datos del cliente y la solicitud de prestamo
                    case "txtfID":
                        oSolicitudPrestamo.ID = sd.Value;
                        break;
                    case "cmbCliente":
                        oSolicitudPrestamo.Cliente = sd.Value;
                        oCliente.ID = sd.Value;
                        break;
                    case "txtfRFC":
                        oCliente.RFC = sd.Value;
                        break;
                    case "cmbEstadoCivil":
                        oCliente.EstadoCivil = sd.Value;
                        break;
                    case "txtfTelefono":
                        oCliente.Telefono = sd.Value;
                        break;
                    case "txtfTelefonoMovil":
                        oCliente.TelefonoMovil = sd.Value;
                        break;
                    case "txtfCorreo":
                        oCliente.Correo = sd.Value;
                        break;
                    case "txtfNacionalidad":
                        oSolicitudPrestamo.Nacionalidad = sd.Value;
                        break;
                    case "nfNumeroDependientes":
                        if (sd.Value == null)
                            oSolicitudPrestamo.NumeroDependientes = null;
                        else
                            oSolicitudPrestamo.NumeroDependientes = Convert.ToByte(sd.Value);
                        break;
                    case "txtfEdades":
                        oSolicitudPrestamo.Edades = sd.Value;
                        break;
                    case "App.rgRegistroMatrimonial_Group":
                        switch (sd.Value)
                        {
                            case "App.rBienesSeparados":
                                oSolicitudPrestamo.RegistroMatrimonial = "BIENES SEPARADOS";
                                break;
                            case "App.rBienesMancomunados":
                                oSolicitudPrestamo.RegistroMatrimonial = "BIENES MANCOMUNADOS";
                                break;
                        }
                        break;
                    case "App.rgTipoCasa_Group":
                        switch (sd.Value)
                        {
                            case "App.rPropia":
                                oSolicitudPrestamo.TipoCasa = "PROPIA";
                                break;
                            case "App.rRentada":
                                oSolicitudPrestamo.TipoCasa = "RENTADA";
                                break;
                            case "App.rFamilia":
                                oSolicitudPrestamo.TipoCasa = "FAMILIA";
                                break;
                            case "App.rHipoteca":
                                oSolicitudPrestamo.TipoCasa = "HIPOTECA";
                                break;
                        }
                        break;
                    case "nAniosDomicilio":
                        if (sd.Value == null)
                            oSolicitudPrestamo.AniosDomicilio = null;
                        else
                            oSolicitudPrestamo.AniosDomicilio = Convert.ToByte(sd.Value);
                        break;
                    case "cmbEstatus":
                        oSolicitudPrestamo.Estatus = sd.Value;
                        break;
                    case "txtfCalle":
                        oCliente.Calle = sd.Value;
                        break;
                    case "txtfEntreCalles":
                        oCliente.EntreCalles = sd.Value;
                        break;
                    case "txtfNoExterior":
                        oCliente.NoExterior = sd.Value;
                        break;
                    case "txtfNoInterior":
                        oCliente.NoInterior = sd.Value;
                        break;
                    case "txtfCodigoPostal":
                        oCliente.CodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbEstado":
                        oCliente.Estado = sd.Value;
                        break;
                    case "cmbMunicipio":
                        oCliente.Municipio = sd.Value;
                        break;
                    case "cmbColonia":
                        oCliente.Colonia = sd.Value;
                        break;
                    case "txtfCalleAnterior":
                        oSolicitudPrestamo.CalleAnterior = sd.Value;
                        break;
                    case "txtfEntreCallesAnterior":
                        oSolicitudPrestamo.EntreCallesAnterior = sd.Value;
                        break;
                    case "txtfNoExteriorAnterior":
                        oSolicitudPrestamo.NoExteriorAnterior = sd.Value;
                        break;
                    case "txtfNoInteriorAnterior":
                        oSolicitudPrestamo.NoInteriorAnterior = sd.Value;
                        break;
                    case "txtfCodigoPostalAnterior":
                        if (sd.Value == null || sd.Value == string.Empty)
                            oSolicitudPrestamo.CodigoPostalAnterior = null;
                        else
                            oSolicitudPrestamo.CodigoPostalAnterior = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbEstadoAnterior":
                        oSolicitudPrestamo.EstadoAnterior = sd.Value;
                        break;
                    case "cmbMunicipioAnterior":
                        oSolicitudPrestamo.MunicipioAnterior = sd.Value;
                        break;
                    case "cmbColoniaAnterior":
                        oSolicitudPrestamo.ColoniaAnterior = sd.Value;
                        break;
                    case "txtfEmpresa":
                        oCliente.Empresa = sd.Value;
                        break;
                    case "txtfEmpresaCalle":
                        oCliente.EmpresaCalle = sd.Value;
                        break;
                    case "txtfEmpresaEntreCalles":
                        oCliente.EmpresaEntreCalles = sd.Value;
                        break;
                    case "txtfEmpresaNoExterior":
                        oCliente.EmpresaNoExterior = sd.Value;
                        break;
                    case "txtfEmpresaNoInterior":
                        oCliente.EmpresaNoInterior = sd.Value;
                        break;
                    case "txtfEmpresaCodigoPostal":
                        if (sd.Value == null || sd.Value == string.Empty)
                            oCliente.EmpresaCodigoPostal = null;
                        else
                            oCliente.EmpresaCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbEmpresaEstado":
                        oCliente.EmpresaEstado = sd.Value;
                        break;
                    case "cmbEmpresaMunicipio":
                        oCliente.EmpresaMunicipio = sd.Value;
                        break;
                    case "cmbEmpresaColonia":
                        oCliente.EmpresaColonia = sd.Value;
                        break;
                    case "txtfEmpresaTelefono":
                        oCliente.EmpresaTelefono = sd.Value;
                        break;
                    case "nfEmpresaTelefonoExt":
                        if (sd.Value == null)
                            oCliente.EmpresaTelefonoExt = null;
                        else
                            oCliente.EmpresaTelefonoExt = Convert.ToInt16(sd.Value);
                        break;
                    case "nfAntiguedad":
                        oSolicitudPrestamo.Antiguedad = Convert.ToByte(sd.Value);
                        break;
                    case "nfIngresos":
                        oSolicitudPrestamo.Ingresos = Convert.ToInt16(sd.Value);
                        break;
                    case "nfOtrosIngresos":
                        if (sd.Value == null)
                            oSolicitudPrestamo.OtrosIngresos = null;
                        else
                            oSolicitudPrestamo.OtrosIngresos = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfOtrosIngresos":
                        oSolicitudPrestamo.Concepto = sd.Value;
                        break;
                    case "txtfEmpresaAnterior":
                        oSolicitudPrestamo.EmpresaAnterior = sd.Value;
                        break;
                    case "txtfPuesto":
                        oCliente.Puesto = sd.Value;
                        break;
                    case "txtfJefeNombre":
                        oSolicitudPrestamo.JefeNombre = sd.Value;
                        break;
                    case "txtfJefeAPaterno":
                        oSolicitudPrestamo.JefeAPaterno = sd.Value;
                        break;
                    case "txtfJefeAMaterno":
                        oSolicitudPrestamo.JefeAMaterno = sd.Value;
                        break;
                    case "txtfConyugeNombre":
                        oSolicitudPrestamo.ConyugeNombre = sd.Value;
                        break;
                    case "txtfConyugeAPaterno":
                        oSolicitudPrestamo.ConyugeAPaterno = sd.Value;
                        break;
                    case "txtfConyugeAMaterno":
                        oSolicitudPrestamo.ConyugeAMaterno = sd.Value;
                        break;
                    case "dfConyugeFechaNacimiento":
                        if (sd.Value == null)
                            oSolicitudPrestamo.ConyugeFechaNacimiento = null;
                        else
                            oSolicitudPrestamo.ConyugeFechaNacimiento = Convert.ToDateTime(sd.Value);
                        break;
                    case "txtfConyugeRFC":
                        oSolicitudPrestamo.ConyugeRFC = sd.Value;
                        break;
                    case "txtfConyugeTelefono":
                        oSolicitudPrestamo.ConyugeTelefono = sd.Value;
                        break;
                    case "txtfConyugeTelefonoMovil":
                        oSolicitudPrestamo.ConyugeTelefonoMovil = sd.Value;
                        break;
                    case "txtfConyugeCalle":
                        oSolicitudPrestamo.ConyugeCalle = sd.Value;
                        break;
                    case "txtfConyugeEntreCalles":
                        oSolicitudPrestamo.ConyugeEntreCalles = sd.Value;
                        break;
                    case "txtfConyugeNoExterior":
                        oSolicitudPrestamo.ConyugeNoExterior = sd.Value;
                        break;
                    case "txtfConyugeNoInterior":
                        oSolicitudPrestamo.ConyugeNoInterior = sd.Value;
                        break;
                    case "cmbConyugeEstado":
                        oSolicitudPrestamo.ConyugeEstado = sd.Value;
                        break;
                    case "cmbConyugeMunicipio":
                        oSolicitudPrestamo.ConyugeMunicipio = sd.Value;
                        break;
                    case "cmbConyugeColonia":
                        oSolicitudPrestamo.ConyugeColonia = sd.Value;
                        break;
                    case "txtfConyugeCodigoPostal":
                        if (sd.Value == null || sd.Value == string.Empty)
                            oSolicitudPrestamo.ConyugeCodigoPostal = null;
                        else
                            oSolicitudPrestamo.ConyugeCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "nfConyugeAntiguedad":
                        if (sd.Value == null)
                            oSolicitudPrestamo.ConyugeAntiguedad = null;
                        else
                            oSolicitudPrestamo.ConyugeAntiguedad = Convert.ToByte(sd.Value);
                        break;
                    case "nfConyugeIngresos":
                        if (sd.Value == null)
                            oSolicitudPrestamo.ConyugeIngresos = null;
                        else
                            oSolicitudPrestamo.ConyugeIngresos = Convert.ToInt16(sd.Value);
                        break;
                    case "nfConyugeOtrosIngresos":
                        if (sd.Value == null)
                            oSolicitudPrestamo.ConyugeOtrosIngresos = null;
                        else
                            oSolicitudPrestamo.ConyugeOtrosIngresos = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfConyugeEmpresaConceptoOtrosIngresos":
                        oSolicitudPrestamo.ConyugeConcepto = sd.Value;
                        break;
                    case "txtfConyugeEmpresa":
                        oSolicitudPrestamo.ConyugeEmpresa = sd.Value;
                        break;
                    case "txtfConyugePuesto":
                        oSolicitudPrestamo.ConyugePuesto = sd.Value;
                        break;
                    case "txtfConyugeEmpresaJefeNombre":
                        oSolicitudPrestamo.ConyugeEmpresaJefeNombre = sd.Value;
                        break;
                    case "txtfConyugeEmpresaJefeAPAterno":
                        oSolicitudPrestamo.ConyugeEmpresaJefeAPaterno = sd.Value;
                        break;
                    case "txtfConyugeEmpresaJefeAMAterno":
                        oSolicitudPrestamo.ConyugeEmpresaJefeAMaterno = sd.Value;
                        break;
                    case "txtfConyugeEmpresaCalle":
                        oSolicitudPrestamo.ConyugeEmpresaCalle = sd.Value;
                        break;
                    case "txtfConyugeEmpresaEntreCalles":
                        oSolicitudPrestamo.ConyugeEmpresaEntreCalles = sd.Value;
                        break;
                    case "txtfConyugeEmpresaNoExterior":
                        oSolicitudPrestamo.ConyugeEmpresaNoExterior = sd.Value;
                        break;
                    case "txtfConyugeEmpresaNoInterior":
                        oSolicitudPrestamo.ConyugeEmpresaNoInterior = sd.Value;
                        break;
                    case "txtfConyugeEmpresaCodigoPostal":
                        if (sd.Value == null || sd.Value == string.Empty)
                            oSolicitudPrestamo.ConyugeEmpresaCodigoPostal = null;
                        else
                            oSolicitudPrestamo.ConyugeEmpresaCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbConyugeEmpresaColonia":
                        oSolicitudPrestamo.ConyugeEmpresaColonia = sd.Value;
                        break;
                    case "cmbConyugeEmpresaEstado":
                        oSolicitudPrestamo.ConyugeEmpresaEstado = sd.Value;
                        break;
                    case "cmbConyugeEmpresaMunicipio":
                        oSolicitudPrestamo.ConyugeEmpresaMunicipio = sd.Value;
                        break;
                    //*****Datos de Aval*****//
                    case "txtfAvalNombre":
                        oSolicitudPrestamo.AvalNombre = sd.Value;
                        break;
                    case "txtfAvalApellidoPaterno":
                        oSolicitudPrestamo.AvalAPaterno = sd.Value;
                        break;
                    case "txtfAvalApellidoMaterno":
                        oSolicitudPrestamo.AvalAMaterno = sd.Value;
                        break;
                    case "App.rgSocioCooperativa_Group":
                        switch (sd.Value)
                        {
                            case "App.rSocioSi":
                                oSolicitudPrestamo.AvalSocio = true;
                                break;
                            case "App.rSocioNo":
                                oSolicitudPrestamo.AvalSocio = false;
                                break;
                        }
                        break;
                    case "cmbAvalEstadoCivil":
                        oSolicitudPrestamo.AvalEstadoCivil = sd.Value;
                        break;
                    case "App.rgAvalRegistroMatrimonial_Group":
                        switch (sd.Value)
                        {
                            case "App.rAvalBienesSeparados":
                                oSolicitudPrestamo.AvalRegistroMatrimonial = "BIENES SEPARADOS";
                                break;
                            case "App.rAvalBienesMancomunados":
                                oSolicitudPrestamo.AvalRegistroMatrimonial = "BIENES MANCOMUNADOS";
                                break;
                        }
                        break;
                    case "txtfAvalTelefono":
                        oSolicitudPrestamo.AvalTelefono = sd.Value;
                        break;
                    case "txtfAvalTelefonoMovil":
                        oSolicitudPrestamo.AvalTelefonoMovil = sd.Value;
                        break;
                    case "txtfAvalCalle":
                        oSolicitudPrestamo.AvalCalle = sd.Value;
                        break;
                    case "txtfAvalEntreCalles":
                        oSolicitudPrestamo.AvalEntreCalles = sd.Value;
                        break;
                    case "txtfAvalNoExterior":
                        oSolicitudPrestamo.AvalNoExterior = sd.Value;
                        break;
                    case "txtfAvalNoInterior":
                        oSolicitudPrestamo.AvalNoInterior = sd.Value;
                        break;
                    case "txtfAvalCodigoPostal":
                        if (sd.Value == null || sd.Value == string.Empty)
                            oSolicitudPrestamo.AvalCodigoPostal = null;
                        else
                            oSolicitudPrestamo.AvalCodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "cmbAvalColonia":
                        oSolicitudPrestamo.AvalColonia = sd.Value;
                        break;
                    case "cmbAvalEstado":
                        oSolicitudPrestamo.AvalEstado = sd.Value;
                        break;
                    case "cmbAvalMunicipio":
                        oSolicitudPrestamo.AvalMunicipio = sd.Value;
                        break;
                    case "App.rgAvalTipoCasa_Group":
                        switch (sd.Value)
                        {
                            case "App.rAvalPropia":
                                oSolicitudPrestamo.AvalTipoCasa = "PROPIA";
                                break;
                            case "App.rAvalRentada":
                                oSolicitudPrestamo.AvalTipoCasa = "RENTADA";
                                break;
                            case "App.rAvalFamilia":
                                oSolicitudPrestamo.AvalTipoCasa = "FAMILIA";
                                break;
                            case "App.rAvalHipoteca":
                                oSolicitudPrestamo.AvalTipoCasa = "HIPOTECA";
                                break;
                        }
                        break;
                    case "nfAntiguedadDocmicilioAval":
                        if (sd.Value == null)
                            oSolicitudPrestamo.AvalAntiguedad = null;
                        else
                            oSolicitudPrestamo.AvalAntiguedad = Convert.ToByte(sd.Value);
                        break;
                    //*****Ocupación de Aval*****//
                    case "txtfAvalEmpresa":
                        oSolicitudPrestamo.AvalEmpresa = sd.Value;
                        break;
                    case "txtfAvalEmpresaPuesto":
                        oSolicitudPrestamo.AvalEmpresaPuesto = sd.Value;
                        break;
                    case "txtfAvalEmpresaJefeNombre":
                        oSolicitudPrestamo.AvalEmpresaJefeNombre = sd.Value;
                        break;
                    case "txtfAvalEmpresaJefeAPaterno":
                        oSolicitudPrestamo.AvalEmpresaJefeAPaterno = sd.Value;
                        break;
                    case "txtfAvalEmpresaJefeAMaterno":
                        oSolicitudPrestamo.AvalEmpresaJefeAMaterno = sd.Value;
                        break;
                    case "nfAvalEmpresaAntiguedad":
                        oSolicitudPrestamo.AvalEmpresaAntiguedad = Convert.ToByte(sd.Value);
                        break;
                    case "nfAvalEmpresaIngresos":
                        oSolicitudPrestamo.AvalEmpresaIngresos = Convert.ToInt32(sd.Value);
                        break;
                    case "nfAvalEmpresaOtrosIngresos":
                        if (sd.Value == null)
                            oSolicitudPrestamo.AvalEmpresaOtrosIngresos = null;
                        else
                            oSolicitudPrestamo.AvalEmpresaOtrosIngresos = Convert.ToInt32(sd.Value);
                        break;
                    case "txtfAvalEmpresaConcepto":
                        oSolicitudPrestamo.AvalEmpresaConcepto = sd.Value;
                        break;
                    case "App.rgAvalEmpresaPropietario_Group":
                        switch (sd.Value)
                        {
                            case "App.rAvalEmpresaPropietarioSi":
                                oSolicitudPrestamo.AvalEmpresaPropietario = true;
                                break;
                            case "App.rAvalEmpresaPropietarioNo":
                                oSolicitudPrestamo.AvalEmpresaPropietario = false;
                                break;
                        }
                        break;
                    case "txtAvalEmpresaGiroComercial":
                        oSolicitudPrestamo.AvalEmpresaTipo = sd.Value;
                        //switch (sd.Value)
                        //{
                        //    case "App.rAvalEmpresaTipoEmpleado":
                        //        oSolicitudPrestamo.AvalEmpresaTipo = "EMPLEADO";
                        //        break;
                        //    case "App.rAvalEmpresaTipoGiroComercial":
                        //        oSolicitudPrestamo.AvalEmpresaTipo = "GIRO COMERCIAL";
                        //        break;
                        //}
                        break;
                    case "txtfAvalEmpresaTelefono":
                        oSolicitudPrestamo.AvalEmpresaTelefono = sd.Value;
                        break;
                    case "nfAvalEmpresaTelefonoExt":
                        if (sd.Value == null)
                            oSolicitudPrestamo.AvalEmpresaTelefonoExt = null;
                        else
                            oSolicitudPrestamo.AvalEmpresaTelefonoExt = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfAvalEmpresaAnterior":
                        oSolicitudPrestamo.AvalEmpresaAnterior = sd.Value;
                        break;
                    case "nfCantidad":
                        oSolicitudPrestamo.Cantidad = Convert.ToInt32(sd.Value);
                        break;
                    case "nfPlazo":
                        oSolicitudPrestamo.Plazo = Convert.ToInt16(sd.Value);
                        break;
                    case "cmbFormaPago":
                        oSolicitudPrestamo.FormaPago = sd.Value;
                        break;
                    case "txtfDestinoPrestamo":
                        oSolicitudPrestamo.DestinoPrestamo = sd.Value;
                        break;
                    case "cmbTipo":
                        oSolicitudPrestamo.Tipo = sd.Value;
                        break;
                }
            }

            //6. Complementar datos
            if (e.ExtraParams["edad"].Equals(""))
                oSolicitudPrestamo.ConyugeEdad = null;
            else
                oSolicitudPrestamo.ConyugeEdad = Convert.ToByte(e.ExtraParams["edad"].Substring(0, e.ExtraParams["edad"].IndexOf(' ')));

            //7. Validaro si es Nuevo o se Edita
            if (strcookieEditarSolicitudPrestamo.Equals("Nuevo"))
            {
                oSolicitudPrestamo.Estatus = "ALTA";
                oSolicitudPrestamo.UsuarioAlta = oUsuario.ID;
                oSolicitudPrestamo.FechaAlta = DateTime.Now;
                oSolicitudPrestamo.FechaModificacion = DateTime.Now;
                oSolicitudPrestamo.UsuarioModificacion = oUsuario.ID;
                //oSolicitudPrestamo.ID = SolicitudPrestamoBusiness.Insertar(oSolicitudPrestamo);
                SolicitudPrestamoBusiness.Insertar(oSolicitudPrestamo);
            }
            else
            {
                oSolicitudPrestamo.ID = strcookieEditarSolicitudPrestamo;
                oSolicitudPrestamo.FechaModificacion = DateTime.Now;
                oSolicitudPrestamo.UsuarioModificacion = oUsuario.ID;
                SolicitudPrestamoBusiness.Actualizar(oSolicitudPrestamo);
            }

            //8. Insertar o Actualizar Ingresos y Egresos
            foreach (CapacidadPago sd in lIngresos)
            {
                if (sd.Tipo != string.Empty)
                {
                    sd.SolicitudPrestamo = oSolicitudPrestamo.ID;
                    if (strcookieEditarSolicitudPrestamo.Equals("Nuevo"))
                        sd.ID = CapacidadPagoBusiness.Insertar(sd);
                    else
                        CapacidadPagoBusiness.Actualizar(sd);
                }
            }

            foreach (CapacidadPago sd in lEgresos)
            {
                sd.SolicitudPrestamo = oSolicitudPrestamo.ID;
                if (strcookieEditarSolicitudPrestamo.Equals("Nuevo"))
                    sd.ID = CapacidadPagoBusiness.Insertar(sd);
                else
                    CapacidadPagoBusiness.Actualizar(sd);
            }

            ClienteBusiness.ActualizarSolicitud(oCliente);
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("registro", oSolicitudPrestamo.ID, ParameterMode.Value));
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sSolicitudPrestamo_Load()
        {
            //1. Obtener la Cookie
            string strCookieEditarSolicitudPrestamo = Cookies.GetCookie("cookieEditarSolicitudPrestamo").Value;

            //2. Asignar el objeto de la Solicitud de préstamo y llenar el Store sSolicitudPrestamo
            SolicitudPrestamo oSolicitudPrestamo = SolicitudPrestamoBusiness.ObtenerSolicitudPrestamoPorID(strCookieEditarSolicitudPrestamo);
            sSolicitudPrestamo.Add(new
            {
                ID = oSolicitudPrestamo.ID,
                Cliente = oSolicitudPrestamo.Cliente,
                Nacionalidad = oSolicitudPrestamo.Nacionalidad,
                NumeroDependientes = oSolicitudPrestamo.NumeroDependientes,
                Edades = oSolicitudPrestamo.Edades,
                RegistroMatrimonial = oSolicitudPrestamo.RegistroMatrimonial,
                TipoCasa = oSolicitudPrestamo.TipoCasa,
                AniosDomicilio = oSolicitudPrestamo.AniosDomicilio,
                CalleAnterior = oSolicitudPrestamo.CalleAnterior,
                NoExteriorAnterior = oSolicitudPrestamo.NoExteriorAnterior,
                NoInteriorAnterior = oSolicitudPrestamo.NoInteriorAnterior,
                ColoniaAnterior = oSolicitudPrestamo.ColoniaAnterior,
                CodigoPostalAnterior = oSolicitudPrestamo.CodigoPostalAnterior,
                EntreCallesAnterior = oSolicitudPrestamo.EntreCallesAnterior,
                EstadoAnterior = oSolicitudPrestamo.EstadoAnterior,
                MunicipioAnterior = oSolicitudPrestamo.MunicipioAnterior,
                Antiguedad = oSolicitudPrestamo.Antiguedad,
                Ingresos = oSolicitudPrestamo.Ingresos,
                OtrosIngresos = oSolicitudPrestamo.OtrosIngresos,
                Concepto = oSolicitudPrestamo.Concepto,
                JefeNombre = oSolicitudPrestamo.JefeNombre,
                JefeAPAterno = oSolicitudPrestamo.JefeAPaterno,
                JefeAMaterno = oSolicitudPrestamo.JefeAMaterno,
                EmpresaAnterior = oSolicitudPrestamo.EmpresaAnterior,
                ConyugeNombre = oSolicitudPrestamo.ConyugeNombre,
                ConyugeAPaterno = oSolicitudPrestamo.ConyugeAPaterno,
                ConyugeAMaterno = oSolicitudPrestamo.ConyugeAMaterno,
                ConyugeFechaNacimiento = oSolicitudPrestamo.ConyugeFechaNacimiento,
                ConyugeEdad = oSolicitudPrestamo.ConyugeEdad,
                ConyugeRFC = oSolicitudPrestamo.ConyugeRFC,
                ConyugeTelefono = oSolicitudPrestamo.ConyugeTelefono,
                ConyugeTelefonoMovil = oSolicitudPrestamo.ConyugeTelefonoMovil,
                ConyugeCalle = oSolicitudPrestamo.ConyugeCalle,
                ConyugeEntreCalles = oSolicitudPrestamo.ConyugeEntreCalles,
                ConyugeNoExterior = oSolicitudPrestamo.ConyugeNoExterior,
                ConyugeNoInterior = oSolicitudPrestamo.ConyugeNoInterior,
                ConyugeColonia = oSolicitudPrestamo.ConyugeColonia,
                ConyugeCodigoPostal = oSolicitudPrestamo.ConyugeCodigoPostal,
                ConyugeEstado = oSolicitudPrestamo.ConyugeEstado,
                ConyugeMunicipio = oSolicitudPrestamo.ConyugeMunicipio,
                ConyugeAntiguedad = oSolicitudPrestamo.ConyugeAntiguedad,
                ConyugeIngresos = oSolicitudPrestamo.ConyugeIngresos,
                ConyugeOtrosIngresos = oSolicitudPrestamo.ConyugeOtrosIngresos,
                ConyugeConcepto = oSolicitudPrestamo.ConyugeConcepto,
                ConyugeEmpresa = oSolicitudPrestamo.ConyugeEmpresa,
                ConyugePuesto = oSolicitudPrestamo.ConyugePuesto,
                ConyugeEmpresaCalle = oSolicitudPrestamo.ConyugeEmpresaCalle,
                ConyugeEmpresaNoExterior = oSolicitudPrestamo.ConyugeEmpresaNoExterior,
                ConyugeEmpresaNoInterior = oSolicitudPrestamo.ConyugeEmpresaNoInterior,
                ConyugeEmpresaColonia = oSolicitudPrestamo.ConyugeEmpresaColonia,
                ConyugeEmpresaCodigoPostal = oSolicitudPrestamo.ConyugeEmpresaCodigoPostal,
                ConyugeEmpresaEntreCalles = oSolicitudPrestamo.ConyugeEmpresaEntreCalles,
                ConyugeEmpresaEstado = oSolicitudPrestamo.ConyugeEmpresaEstado,
                ConyugeEmpresaMunicipio = oSolicitudPrestamo.ConyugeEmpresaMunicipio,
                ConyugeEmpresaJefeNombre = oSolicitudPrestamo.ConyugeEmpresaJefeNombre,
                ConyugeEmpresaJefeAPaterno = oSolicitudPrestamo.ConyugeEmpresaJefeAPaterno,
                ConyugeEmpresaJefeAMaterno = oSolicitudPrestamo.ConyugeEmpresaJefeAMaterno,
                AvalNombre = oSolicitudPrestamo.AvalNombre,
                AvalAPaterno = oSolicitudPrestamo.AvalAPaterno,
                AvalAMaterno = oSolicitudPrestamo.AvalAMaterno,
                AvalSocio = oSolicitudPrestamo.AvalSocio,
                AvalEstadoCivil = oSolicitudPrestamo.AvalEstadoCivil,
                AvalRegistroMatrimonial = oSolicitudPrestamo.AvalRegistroMatrimonial,
                AvalTelefono = oSolicitudPrestamo.AvalTelefono,
                AvalTelefonoMovil = oSolicitudPrestamo.AvalTelefonoMovil,
                AvalCalle = oSolicitudPrestamo.AvalCalle,
                AvalEntreCalles = oSolicitudPrestamo.AvalEntreCalles,
                AvalNoExterior = oSolicitudPrestamo.AvalNoExterior,
                AvalNoInterior = oSolicitudPrestamo.AvalNoInterior,
                AvalColonia = oSolicitudPrestamo.AvalColonia,
                AvalCodigoPostal = oSolicitudPrestamo.AvalCodigoPostal,
                AvalEstado = oSolicitudPrestamo.AvalEstado,
                AvalMunicipio = oSolicitudPrestamo.AvalMunicipio,
                AvalTipoCasa = oSolicitudPrestamo.AvalTipoCasa,
                AvalAntiguedad = oSolicitudPrestamo.AvalAntiguedad,
                AvalEmpresa = oSolicitudPrestamo.AvalEmpresa,
                AvalEmpresaPuesto = oSolicitudPrestamo.AvalEmpresaPuesto,
                AvalEmpresaJefeNombre = oSolicitudPrestamo.AvalEmpresaJefeNombre,
                AvalEmpresaJefeAPaterno = oSolicitudPrestamo.AvalEmpresaJefeAPaterno,
                AvalEmpresaJefeAMaterno = oSolicitudPrestamo.AvalEmpresaJefeAMaterno,
                AvalEmpresaAntiguedad = oSolicitudPrestamo.AvalEmpresaAntiguedad,
                AvalEmpresaIngresos = oSolicitudPrestamo.AvalEmpresaIngresos,
                AvalEmpresaOtrosIngresos = oSolicitudPrestamo.AvalEmpresaOtrosIngresos,
                AvalEmpresaConcepto = oSolicitudPrestamo.AvalEmpresaConcepto,
                AvalEmpresaPropietario = oSolicitudPrestamo.AvalEmpresaPropietario,
                AvalEmpresaTipo = oSolicitudPrestamo.AvalEmpresaTipo,
                AvalEmpresaTelefono = oSolicitudPrestamo.AvalEmpresaTelefono,
                AvalEmpresaTelefonoExt = oSolicitudPrestamo.AvalEmpresaTelefonoExt,
                AvalEmpresaAnterior = oSolicitudPrestamo.AvalEmpresaAnterior,
                Cantidad = oSolicitudPrestamo.Cantidad,
                Plazo = oSolicitudPrestamo.Plazo,
                FormaPago = oSolicitudPrestamo.FormaPago,
                DestinoPrestamo = oSolicitudPrestamo.DestinoPrestamo,
                Tipo = oSolicitudPrestamo.Tipo,
                TablaAmortizacion = oSolicitudPrestamo.TablaAmortizacion,
                Estatus = oSolicitudPrestamo.Estatus,
                UsuarioAlta = oSolicitudPrestamo.UsuarioAlta,
                FechaAlta = oSolicitudPrestamo.FechaAlta,
                UsuarioModificacion = oSolicitudPrestamo.UsuarioModificacion,
                FechaModificacion = oSolicitudPrestamo.FechaModificacion
            });

            //3. Obtener los registros de Capacidad de Pago
            List<CapacidadPago> lCapacidadPago = CapacidadPagoBusiness.ObtenerCapacidadPagoPorSolicitudPrestamo(oSolicitudPrestamo.ID);
            sCapacidadPagoEgresos.DataSource = lCapacidadPago.Where(oCapacidadPago => oCapacidadPago.Tipo.Equals("Egreso"));
            sCapacidadPagoEgresos.DataBind();

            sCapacidadPagoIngresos.DataSource = lCapacidadPago.Where(oCapacidadPago => oCapacidadPago.Tipo.Equals("Ingreso"));
            sCapacidadPagoIngresos.DataBind();

            //Capacidad de pago
            sCapacidadPagoIngresos.Insert(3, new {});
            sCapacidadPagoIngresos.Insert(4, new {});
            sCapacidadPagoIngresos.Insert(5, new {});
            sCapacidadPagoIngresos.Insert(6, new {});
            sCapacidadPagoIngresos.Insert(7, new {});
        }
    }
}