using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Xml;
using System.Xml.Xsl;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class ExploradorRegistroConaproch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Método para editar y actualizar la información del Participante
        /// </summary>
        /// <param name="id"></param>
        /// <param name="newValue"></param>
        [DirectMethod(Namespace = "CompanyX")]
        public void Edit(string id, bool newValue)
        {
            string message = "<b>Campo:</b> {0}<br /><b>Valor:</b> {1}<br /><b>Valor anterior:</b> {2}";

            ParticipanteBusiness.ActualizarPagado(id, newValue);

            // Send Message...
            X.Msg.Notify(new NotificationConfig()
            {
                Title = "Registro modificado #" + id,
                Html = string.Format(message, "Pagado", newValue, !newValue),
                Width = 250,
                HideDelay = 10000
            }).Show();

            gpAdminRegistro.GetStore().GetById(id).Commit();
        }

        /// <summary>
        /// Propiedad que carga la información de los registros del evento a una tabla
        /// </summary>
        private object[] TestData3
        {
            get
            {
                List<Participante> lParticipantes = ParticipanteBusiness.ObtenerTodosParticipantes();
                List<Respuestas> lRespuestas = RespuestasBusiness.ObtenerTodosRespuestas();
                List<Empresa> lEmpresa = EmpresaBusiness.ObtenerTodosEmpresas();
                List<TipoParticipante> lTipoParticipante = TipoParticipanteBusiness.ObtenerTodosTipoParticipantes();

                object[] prueba;
                object[] prueba2 = new object[lParticipantes.Count];
                int cont = 0;

                foreach (Participante sd in lParticipantes)
                {
                    Respuestas oRespuestas = lRespuestas.Find(
                            delegate(Respuestas dRespuesta)
                            {
                                return dRespuesta.Participante == sd.ID;
                            }
                        );

                    Empresa oEmpresa = lEmpresa.Find(
                            delegate(Empresa dEmpresa)
                            {
                                return dEmpresa.ID == sd.Empresa;
                            }
                        );

                    TipoParticipante oTipoParticipante = lTipoParticipante.Find(
                            delegate(TipoParticipante dTipoParticipante)
                            {
                                return dTipoParticipante.ID == sd.TipoParticipante;
                            }
                        );

                    if (oEmpresa == null)
                        oEmpresa = new Empresa();

                    prueba = new object[] {
                        sd.ID,
                        sd.Nombre,
                        sd.APaterno,
                        sd.AMaterno,
                        sd.FechaNacimiento,
                        sd.Edad,
                        sd.Genero,
                        sd.Estado,
                        sd.Ciudad,
                        sd.Telefono,
                        sd.Celular,
                        sd.Email,
                        sd.TipoParticipante,
                        oTipoParticipante.Nombre,
                        sd.OtroTipoParticipante,
                        sd.NombreEmpresa,
                        sd.Puesto,
                        sd.Area,
                        sd.Factura,
                        sd.Pagado,
                        oRespuestas.Respuesta01,
                        oRespuestas.Respuesta02,
                        oRespuestas.Respuesta03,
                        oRespuestas.Respuesta04,
                        oRespuestas.Respuesta05,
                        oEmpresa.Nombre,
                        oEmpresa.RFC,
                        oEmpresa.Calle,
                        oEmpresa.NoExt,
                        oEmpresa.NoInt,
                        oEmpresa.Colonia,
                        oEmpresa.CP,
                        oEmpresa.Estado,
                        oEmpresa.Ciudad,
                        oEmpresa.Email,
                        oEmpresa.Telefono
                    };
                    prueba2[cont] = prueba;
                    cont++;
                }
                return prueba2;
            }
        }

        protected void sAdminRegistro_RefreshData(object sender, StoreReadDataEventArgs e)
        {
            sAdminRegistro.DataSource = TestData3;
            sAdminRegistro.DataBind();
        }

        protected void sAdminRegistro_RecordUpdated(object sender, AfterRecordUpdatedEventArgs e)
        {
            // This event is fired once for each Record that is Updated.
            string tpl = "Name: {0}, Price: {1}, LastChange: {2}<br />";
            this.Label1.Html += string.Format(tpl, e.Values["company"], e.Values["price"], e.Values["lastChange"]);
        }

        protected void sAdminRegistro_Submit(object sender, StoreSubmitDataEventArgs e)
        {
            string format = this.FormatType.Value.ToString();

            XmlNode xml = e.Xml;

            this.Response.Clear();

            switch (format)
            {
                case "xls":
                    this.Response.ContentType = "application/vnd.ms-excel";
                    this.Response.AddHeader("Content-Disposition", "attachment; filename=submittedData.xls");
                    XslCompiledTransform xtExcel = new XslCompiledTransform();
                    xtExcel.Load(Server.MapPath("Excel.xsl"));
                    xtExcel.Transform(xml, null, Response.OutputStream);
                    break;
            }
            this.Response.End();
        }
    }
}