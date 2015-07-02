using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.DL;
using OSEF.APP.EL;

namespace OSEF.APP.BL
{
    public class PreciarioSubCategoriaBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioSubCategoria
        /// </summary>
        /// <param name="iPreciarioSubCategoria"></param>
        public static string Insertar(PreciarioSubCategoria iPreciarioSubCategoria)
        {
            return PreciarioSubCategoriasDataAccess.Insertar(iPreciarioSubCategoria);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de PreciarioSubCategoria
        /// </summary>
        /// <param name="uPreciarioSubCategoria"></param>
        /// <returns></returns>
        public static int Actualizar(PreciarioSubCategoria uPreciarioSubCategoria)
        {
            return PreciarioSubCategoriasDataAccess.Actualizar(uPreciarioSubCategoria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioSubCategoria por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioSubCategoriasDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de PreciarioSubCategoria
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioSubCategoria> ObtenerPreciariosSubCategoria()
        {
            return PreciarioSubCategoriasDataAccess.ObtenerPreciarioSubCategoria();
        }

        /// <summary>
        /// Obtener un registro de PreciarioSubCategoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioSubCategoria ObtenerPreciarioSubCategoriaPorID(string strID)
        {
            return PreciarioSubCategoriasDataAccess.ObtenerPreciarioSubCategoriaPorID(strID);
        }


        /// <summary>
        /// Obtener un registro de PreciarioSubCategoria por su Categoria
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static List<PreciarioSubCategoria> ObtenerPreciarioSubCategoriaPorCategoria(string strID)
        {
            return PreciarioSubCategoriasDataAccess.ObtenerPreciarioSubCategoriaPorCategoria(strID);
        }

        #endregion

    }
}
