using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;
using System.Web.UI;
using System.Web.Security;
using Ext.Net;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Usuarios
    /// </summary>
    public class UsuarioBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Usuarios
        /// </summary>
        /// <param name="iUsuario"></param>
        public static int Insertar(Usuario iUsuario)
        {
            return UsuarioDataAccess.Insertar(iUsuario);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Usuarios
        /// </summary>
        /// <param name="uUsuario"></param>
        /// <returns></returns>
        public static int Actualizar(Usuario uUsuario)
        {
            return UsuarioDataAccess.Actualizar(uUsuario);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Usuario por su ID
        /// </summary>
        /// <param name="strID"></param>
        public static int Borrar(string strID)
        {
            return UsuarioDataAccess.Borrar(strID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Usuarios
        /// </summary>
        /// <returns></returns>
        public static List<Usuario> ObtenerUsuarios()
        {
            return UsuarioDataAccess.ObtenerUsuarios();
        }

        /// <summary>
        /// Obtener un registro de Usuario por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Usuario ObtenerUsuarioPorID(string strID)
        {
            return UsuarioDataAccess.ObtenerUsuarioPorID(strID);
        }


        /// <summary>
        /// Valida un registro de Usuario por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ValidarUsuarioEnUso(string strID)
        {
            return UsuarioDataAccess.ValidarUsuarioEnUso(strID);
        }

        /// <summary>
        /// Obtener un registro de Usuario por su Correo
        /// </summary>
        /// <param name="strCorreo"></param>
        /// <returns></returns>
        public static Usuario ObtenerUsuarioPorCorreo(string strCorreo)
        {
            return UsuarioDataAccess.ObtenerUsuarioPorCorreo(strCorreo);
        }

        /// <summary>
        /// Obtener un registro de Usuario por su ID o su Correo
        /// </summary>
        /// <param name="strIDCorreo"></param>
        /// <returns></returns>
        public static Usuario ObtenerUsuarioPorIDCorreo(string strIDCorreo)
        {
            return UsuarioDataAccess.ObtenerUsuarioPorIDCorreo(strIDCorreo);
        }

        /// <summary>
        /// Obtener la contraseña de un Usuario por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static string ObtenerContrasenaPorID(string strID)
        {
            return UsuarioDataAccess.ObtenerContrasenaPorID(strID);
        }

        #endregion

        #region Acción

        /// <summary>
        /// Método que valida el usuario y la contraseña para hacer login
        /// </summary>
        /// <param name="strUsuario"></param>
        /// <param name="strContrasena"></param>
        /// <returns></returns>
        public static bool ValidarUsuarioContrasena(string strUsuario, string strContrasena)
        {
            return UsuarioDataAccess.ValidarUsuarioContrasena(strUsuario, strContrasena);
        }

        /// <summary>
        /// Actualizar la sesión
        /// </summary>
        /// <param name="c"></param>
        public static void checkValidSession(Control c)
        {
            try
            {
                FormsIdentity ident = ((FormsIdentity)c.Page.User.Identity);
                FormsAuthenticationTicket ticket = ident.Ticket;

                if (c.Page.Session["Usuario"] == null)
                {
                    Usuario oUsuario = JSON.Deserialize<Usuario>(ticket.UserData);
                    c.Page.Session["Usuario"] = oUsuario;
                }
            }
            catch (Exception ex)
            {

            }
        }

        /// <summary>
        /// Cambiar contraseña de Usuario
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strContrasena"></param>
        /// <returns></returns>
        public static int CambiarContrasena(string strID, string strContrasena)
        {
            return UsuarioDataAccess.CambiarContrasena(strID, strContrasena);
        }

        /// <summary>
        /// Método que actualiza el último acceso del usuario a la aplicación
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static int ActualizarUltimoAcceso(string strID)
        {
            return UsuarioDataAccess.ActualizarUltimoAcceso(strID);
        }

        #endregion
    }
}
