using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio Clientes
    /// </summary>
    public class ClienteBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro de Clientes
        /// </summary>
        /// <param name="iCliente"></param>
        /// <returns></returns>
        public static string Insertar(Cliente iCliente)
        {
            return ClienteDataAccess.Insertar(iCliente);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a un Cliente
        /// </summary>
        /// <param name="uCliente"></param>
        /// <returns></returns>
        public static int Actualizar(Cliente uCliente)
        {
            return ClienteDataAccess.Actualizar(uCliente);
        }

        /// <summary>
        /// Método que actualiza un nuevo registro a un Cliente para las Solicitudes de préstamo
        /// </summary>
        /// <param name="uCliente"></param>
        /// <returns></returns>
        public static int ActualizarSolicitud(Cliente uCliente)
        {
            return ClienteDataAccess.ActualizarSolicitud(uCliente);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Clientes
        /// </summary>
        /// <returns></returns>
        public static List<Cliente> ObtenerClientes()
        {
            return ClienteDataAccess.ObtenerClientes();
        }

        /// <summary>
        /// Obtener un registro de Cliente por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Cliente ObtenerClientePorID(string strID)
        {
            return ClienteDataAccess.ObtenerClientePorID(strID);
        }

        #endregion
    }
}
