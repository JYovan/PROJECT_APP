using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class ModuloBusiness
    {

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Modulos
        /// </summary>
        /// <returns></returns>
        public static List<Modulo> ObtenerModulos()
        {
            //1. Obtener lista de Municipios
            List<Modulo> lModulo = ModuloDataAccess.ObtenerModulos(); 
            //2. Regresar la lista con los objetos completos
            return lModulo;
        }

        /// <summary>
        /// Obtener un registro de Modulo por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Modulo ObtenerModuloPorID(string strID)
        {
            return ModuloDataAccess.ObtenerModuloPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de Modulo por su UsuarioID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static List<Modulo> ObtenerModulosPorUsuarioID(string strID)
        {
            return ModuloDataAccess.ObtenerModulosPorUsuarioID(strID);
        } 

        #endregion


        #region Modificar

        /// <summary>
        /// Método que actualiza un registro en ModuloxUsuario
        /// </summary>
        /// <param name="uUsuario"></param>
        /// <returns></returns>
        public static int ActualizarMxU(Modulo m)
        {
            return ModuloDataAccess.ActualizarMxU(m);
        }

        #endregion
    }
}
