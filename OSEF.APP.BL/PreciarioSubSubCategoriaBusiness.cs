using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class PreciarioSubSubCategoriaBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioSubSubCategoria
        /// </summary>
        /// <param name="iPreciarioSubSubCategoria"></param>
        public static string Insertar(PreciarioSubSubCategoria iPreciarioSubSubCategoria)
        {
            return PreciarioSubSubCategoriaDataAccess.Insertar(iPreciarioSubSubCategoria);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de PreciarioSubSubCategoria
        /// </summary>
        /// <param name="uPreciarioSubSubCategoria"></param>
        /// <returns></returns>
        public static int Actualizar(PreciarioSubSubCategoria uPreciarioSubSubCategoria)
        {
            return PreciarioSubSubCategoriaDataAccess.Actualizar(uPreciarioSubSubCategoria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioSubSubCategoria por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioSubSubCategoriaDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de PreciarioSubSubCategoria
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioSubCategoria> ObtenerPreciariosSubCategoria()
        {
            return PreciarioSubCategoriasDataAccess.ObtenerPreciarioSubCategoria();
        }

        /// <summary>
        /// Obtener un registro de PreciarioSubSubCategoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioSubSubCategoria ObtenerPreciarioSubSubCategoriaPorID(string strID)
        {
            return PreciarioSubSubCategoriaDataAccess.ObtenerPreciarioSubSubCategoriaPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de PreciarioSubSubCategoria por su SubCategoria
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static List<PreciarioSubSubCategoria> ObtenerPreciarioSubSubCategoriaPorSubCategoria(string strID)
        {
            return PreciarioSubSubCategoriaDataAccess.ObtenerPreciarioSubSubCategoriaPorSubCategoria(strID);
        }

        #endregion

    }
}
