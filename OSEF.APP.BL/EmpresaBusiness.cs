using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que adminsitra la información de las Empresas
    /// </summary>
    public class EmpresaBusiness
    {
        #region Agregar

        /// <summary>
        /// Método que agrega una Empresa
        /// </summary>
        /// <param name="iEmpresa"></param>
        /// <returns></returns>
        public static short Insertar(Empresa iEmpresa)
        {
            return EmpresaDataAccess.Insertar(iEmpresa);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todas las Empresas
        /// </summary>
        /// <returns></returns>
        public static List<Empresa> ObtenerTodosEmpresas()
        {
            return EmpresaDataAccess.ObtenerTodosEmpresas();
        }

        #endregion

        #region Eliminar

        #endregion

        #region Actualizar

        #endregion
    }
}
