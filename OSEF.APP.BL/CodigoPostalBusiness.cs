using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class CodigoPostalBusiness
    {
        #region Consultar
        /// <summary>
        /// Método que obtiene todos los codigos postales por colonia id.
        /// </summary>
        /// <returns></returns>
        public static List<CodigoPostal> ObtenerCodigosPostalesPorColonia(string strRama)
        {
            return CodigoPostalDataAccess.ObtenerCodigosPostalesPorColonia(strRama);
        }

        /// <summary>
        /// Método que obtiene todos los codigos postales por colonia id.
        /// </summary>
        /// <returns></returns>
        public static List<CodigoPostal> ObtenerCodigosPostalesCompletoPorColonia(string id)
        {
            List<CodigoPostal> lCodigosPostales = CodigoPostalDataAccess.ObtenerCodigosPostalesPorColonia(id);
            foreach (CodigoPostal cp in lCodigosPostales)
            {
                cp.REstado = EstadoBusiness.ObtenerEstadoPorID(cp.Estado);
                cp.RMunicipio = MunicipioBusiness.ObtenerMunicipioPorID(cp.Municipio);
                cp.RColonia = ColoniaBusiness.ObtenerColoniaPorID(cp.Colonia);
            }
            return lCodigosPostales;
        }

        /// <summary>
        /// Método que obtiene todos los codigos postales por colonia id.
        /// </summary>
        /// <returns></returns>
        public static List<CodigoPostal> ObtenerCodigosPostalesCompletoPorNumero(int id)
        {
            List<CodigoPostal> lCodigosPostales = CodigoPostalDataAccess.ObtenerCodigosPostalesPorNumero(id);
            foreach (CodigoPostal cp in lCodigosPostales)
            {
                cp.REstado = EstadoBusiness.ObtenerEstadoPorID(cp.Estado);
                cp.RMunicipio = MunicipioBusiness.ObtenerMunicipioPorID(cp.Municipio);
                cp.RColonia = ColoniaBusiness.ObtenerColoniaPorID(cp.Colonia);
            }
            return lCodigosPostales;
        }

        /// <summary>
        /// Método que obtiene todos los codigos postales por colonia id.
        /// </summary>
        /// <returns></returns>
        public static CodigoPostal ObtenerCodigoPostalPorID(string id)
        {
            return CodigoPostalDataAccess.ObtenerCodigoPostalPorID(id);
        }

        /// <summary>
        /// Obtener registros de Colonia en Sucursales por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerRegistrosDeCodigosPostalesPorID(string strID)
        {
            return CodigoPostalDataAccess.ObtenerRegistrosDeCodigosPostalesPorID(strID);
        }

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CodigosPostales
        /// </summary>
        /// <param name="iCodigoPostal"></param>
        public static string Insertar(CodigoPostal iCodigoPostal)
        {
            return CodigoPostalDataAccess.Insertar(iCodigoPostal);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Codigo Postal por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return CodigoPostalDataAccess.Borrar(dID);
        }

        #endregion

        #region Modificar
        /// <summary>
        /// Método que actualiza algun Codigo Postal por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Actualizar(CodigoPostal cp)
        {
            return CodigoPostalDataAccess.Actualizar(cp);
        }

        #endregion
    }
}
