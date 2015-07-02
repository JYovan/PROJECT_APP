using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;
using System.Net.Mail;
using System.Net;

namespace OSEF.ERP.APP
{
    public partial class FormaRegistroConaproch : System.Web.UI.Page
    {
        #region Eventos

        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento de clic del Botón Registrar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnRegistrar_Click(object sender, DirectEventArgs e)
        {
            try
            {
                //1. Obtener datos de la Forma
                string strRegistro = e.ExtraParams["registro"];
                string strEdad = e.ExtraParams["edad"];
                strEdad = strEdad.Split(' ')[0];
                byte iEdad = Convert.ToByte(strEdad.Substring(1));

                Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);

                //2. Inicializar los objetos
                Participante oParticipante = new Participante();
                oParticipante.Edad = iEdad;
                Empresa oEmpresa = new Empresa();
                Respuestas oRespuestas = new Respuestas();

                //3. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
                foreach (KeyValuePair<string, string> sd in dRegistro)
                {
                    switch (sd.Key)
                    {
                        //4. Para los Participantes
                        case "txtfNombre":
                            oParticipante.Nombre = sd.Value;
                            break;
                        case "txtfAPaterno":
                            oParticipante.APaterno = sd.Value;
                            break;
                        case "txtfAMaterno":
                            oParticipante.AMaterno = sd.Value;
                            break;
                        case "cmbEstado":
                            oParticipante.Estado = sd.Value;
                            break;
                        case "txtfCiudad":
                            oParticipante.Ciudad = sd.Value;
                            break;
                        case "dfFechaNacimiento":
                            oParticipante.FechaNacimiento = Convert.ToDateTime(sd.Value);
                            break;
                        case "txtfEdad":
                            oParticipante.Edad = Convert.ToByte(sd.Value);
                            break;
                        case "txtfTelefono":
                            oParticipante.Telefono = sd.Value;
                            break;
                        case "txtfTelefonoMovil":
                            oParticipante.Celular = sd.Value;
                            break;
                        case "txtfCorreo":
                            oParticipante.Email = sd.Value;
                            break;
                        case "cmbSexo":
                            oParticipante.Genero = sd.Value;
                            break;
                        case "cmbTipoParticipante":
                            oParticipante.TipoParticipante = Convert.ToByte(sd.Value);
                            break;
                        case "cmbRequiereFactura":
                            oParticipante.Factura = Convert.ToBoolean(Convert.ToByte(sd.Value));
                            break;
                        case "txtOtro":
                            oParticipante.OtroTipoParticipante = sd.Value;
                            break;
                        case "txtNombreEmpresa":
                            oParticipante.NombreEmpresa = sd.Value;
                            break;
                        case "txtPuesto":
                            oParticipante.Puesto = sd.Value;
                            break;
                        case "txtArea":
                            oParticipante.Area = sd.Value;
                            break;
                        //5. Para cuando quiere Factura
                        case "txtEmpresa":
                            oEmpresa.Nombre = sd.Value;
                            break;
                        case "txtfRFC":
                            oEmpresa.RFC = sd.Value;
                            break;
                        case "txtfCalle":
                            oEmpresa.Calle = sd.Value;
                            break;
                        case "txtfNoExt":
                            oEmpresa.NoExt = sd.Value;
                            break;
                        case "txtNoInt":
                            oEmpresa.NoInt = sd.Value;
                            break;
                        case "txtfColonia":
                            oEmpresa.Colonia = sd.Value;
                            break;
                        case "txtfCP":
                            oEmpresa.CP = Convert.ToInt32(sd.Value);
                            break;
                        case "cmbEstadoEmpresa":
                            oEmpresa.Estado = sd.Value;
                            break;
                        case "txtfCiudadEmpresa":
                            oEmpresa.Ciudad = sd.Value;
                            break;
                        case "txtfTelefonoEmpresa":
                            oEmpresa.Telefono = sd.Value;
                            break;
                        case "txtfCorreoEmpresa":
                            oEmpresa.Email = sd.Value;
                            break;
                        //6. Para las respuestas de las preguntas
                        case "txtfPregunta01":
                            oRespuestas.Respuesta01 = sd.Value;
                            break;
                        case "cmbPregunta02":
                            oRespuestas.Respuesta02 = Convert.ToBoolean(Convert.ToByte(sd.Value));
                            break;
                        case "cmbPregunta03":
                            oRespuestas.Respuesta03 = Convert.ToBoolean(Convert.ToByte(sd.Value));
                            break;
                        case "txtfPregunta04":
                            oRespuestas.Respuesta04 = sd.Value;
                            break;
                        case "cmbPregunta05":
                            oRespuestas.Respuesta05 = Convert.ToByte(sd.Value);
                            break;
                    }
                }

                //7. Validar cuando requiere factura se asigna el ID de la Empresa al Participante
                if (oParticipante.Factura)
                {
                    //8. Insertar los datos de la empresa
                    oEmpresa.ID = EmpresaBusiness.Insertar(oEmpresa);
                    oParticipante.Empresa = oEmpresa.ID;
                }

                //9. Valida si es de MICHOACAN será gratis la entrada Pagado = true
                if (oParticipante.Estado.Equals("MICHOACAN"))
                    oParticipante.Pagado = true;

                //10. Insertar el participante y sus respuestas
                oParticipante.ID = ParticipanteBusiness.Insertar(oParticipante);
                oRespuestas.Participante = oParticipante.ID;
                oRespuestas.ID = RespuestasBusiness.Insertar(oRespuestas);

                //11. Mandar mensaje con el código del participante
                var success = new JFunction { Fn = "btnRegistrar_Click_Success" };
                X.Msg.Alert("Registro completo", "<p align='center'>Has sido registrado satisfactoriamente con el código de participante <br/>" + oParticipante.ID + ".</p>", success).Show();

                //12. Mandar código por correo si ha capturado
                if (oParticipante.Email.Length > 0)
                {
                    SmtpClient servidorDeCorreo = new SmtpClient("smtp.1and1.com", 25);
                    servidorDeCorreo.EnableSsl = false;
                    servidorDeCorreo.Credentials = new NetworkCredential("orlando@salidero.com", "N8csmh3v");
                    MailMessage mailmsgMensaje = new MailMessage("registro@conaproch.com", oParticipante.Email, "Registro a convención mundial del Chile", "Tu código de participante es: " + oParticipante.ID);
                    servidorDeCorreo.Send(mailmsgMensaje);
                }
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", "<p align='center'>Se ha producido un error: <br/>" + ex.Message + ".</p>").Show();
            }
        }

        #endregion
    }
}