using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que administra todo acerca de los Objetos PreciarioGeneralSubCategoria
    /// </summary>
    public class PreciarioGeneralSubCategoriaBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioGeneralSubCategoria
        /// </summary>
        /// <param name="iPreciarioSubCategoria"></param>
        public static string Insertar(PreciarioGeneralSubCategoria iPreciarioSubCategoria)
        {
            return PreciarioGeneralSubCategoriaDataAccess.Insertar(iPreciarioSubCategoria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioSubCategoria por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioGeneralSubCategoriaDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener un registro de PreciarioGeneralSubCategoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneralSubCategoria ObtenerPreciarioGeneralSubCategoriaPorID(string strID)
        {
            return PreciarioGeneralSubCategoriaDataAccess.ObtenerPreciarioGeneralSubCategoriaPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de PreciarioGeneralSubCategoria por su Categoria
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralSubCategoria> ObtenerPreciarioGeneralSubCategoriaPorCategoria(string strID)
        {
            return PreciarioGeneralSubCategoriaDataAccess.ObtenerPreciarioGeneralSubCategoriaPorCategoria(strID);
        }

        /// <summary>
        /// Obtener los registros de SubCategorias del Preciario General por su Preciario
        /// </summary>
        /// <param name="strPreciario"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralSubCategoria> ObtenerPreciarioGeneralSubcategoriasPorPreciario(string strPreciario)
        {
            return PreciarioGeneralSubCategoriaDataAccess.ObtenerPreciarioGeneralSubcategoriasPorPreciario(strPreciario);
        }

        #endregion
    }
}
