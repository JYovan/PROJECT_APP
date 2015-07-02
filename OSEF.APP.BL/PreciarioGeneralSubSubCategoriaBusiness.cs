using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que administra lo relacionado con el objeto PreciarioGeneralSubSubCategoria
    /// </summary>
    public class PreciarioGeneralSubSubCategoriaBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioGeneralSubSubCategoria
        /// </summary>
        /// <param name="iPreciarioSubSubCategoria"></param>
        public static string Insertar(PreciarioGeneralSubSubCategoria iPreciarioSubSubCategoria)
        {
            return PreciarioGeneralSubSubCategoriaDataAccess.Insertar(iPreciarioSubSubCategoria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioGeneralSubSubCategoria por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioGeneralSubSubCategoriaDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener un registro de PreciarioGeneralSubSubCategoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneralSubSubCategoria ObtenerPreciarioGeneralSubSubCategoriaPorID(string strID)
        {
            return PreciarioGeneralSubSubCategoriaDataAccess.ObtenerPreciarioGeneralSubSubCategoriaPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de PreciarioGeneralSubSubCategoria por su SubCategoria
        /// </summary>
        /// <param name="strSubCategoria"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralSubSubCategoria> ObtenerPreciarioGeneralSubSubCategoriaPorSubCategoria(string strSubCategoria)
        {
            return PreciarioGeneralSubSubCategoriaDataAccess.ObtenerPreciarioGeneralSubSubCategoriaPorSubCategoria(strSubCategoria);
        }

        /// <summary>
        /// Obtener una lista de registros de SubSubCategoria del PreciarioGeneral por el Preciario
        /// </summary>
        /// <param name="strPreciario"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralSubSubCategoria> ObtenerPreciarioGeneralSubSubCategoriaPorPreciario(string strPreciario)
        {
            return PreciarioGeneralSubSubCategoriaDataAccess.ObtenerPreciarioGeneralSubSubCategoriasPorPreciario(strPreciario);
        }

        #endregion
    }
}
