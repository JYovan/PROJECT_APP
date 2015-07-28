using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class PreciarioConceptoBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="iPreciarioConcepto"></param>
        public static int Insertar(PreciarioConcepto iPreciarioConcepto)
        {
            return PreciarioConceptosDataAccess.Insertar(iPreciarioConcepto);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="uPreciarioConcepto"></param>
        /// <returns></returns>
        public static int Actualizar(string strConcepto, decimal utilizada, int Volumetria)
        {
            return PreciarioConceptosDataAccess.Actualizar(strConcepto, utilizada, Volumetria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioConcepto por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioConceptosDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de PreciarioConcepto
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConcepto()
        {
            return PreciarioConceptosDataAccess.ObtenerPreciarioConcepto();
        }


        /// <summary>
        /// Método que obtiene todos los registros de PreciarioConcepto filtrandolos
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConceptoFiltro(string strPreciario, string strCategoria, string strSubCategoria, string strSubsubCategoria)
        {
            List<PreciarioConcepto> lpc = PreciarioConceptosDataAccess.ObtenerPreciarioConceptoFiltro(strPreciario, strCategoria,strSubCategoria,strSubsubCategoria);

            foreach (PreciarioConcepto sd in lpc)
            {
                if (sd.Cliente != null)
                {
                    sd.RCliente = ClienteBusiness.ObtenerClientePorID(sd.Cliente);
                } 
            }
            return lpc;
        }

        /// <summary>
        /// Obtener un registro de PreciarioConcepto por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static List<PreciarioConcepto> ObtenerPreciarioConceptoPorPreciario(string strPreciario)
        {

            //1. Obtener lista de conceptos
            List<PreciarioConcepto> lPreciarioConcepto = PreciarioConceptosDataAccess.ObtenerPreciarioConceptoPorPreciario(strPreciario);
            //2. Asignar a categorias
            foreach (PreciarioConcepto sd in lPreciarioConcepto)
            {
                sd.RCategoria = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriaPorID(sd.Categoria);
                sd.RSubcategoria = PreciarioSubCategoriaBusiness.ObtenerPreciarioSubCategoriaPorID(sd.SubCategoria);
                sd.RSubsubcategoria = PreciarioSubSubCategoriaBusiness.ObtenerPreciarioSubSubCategoriaPorID(sd.SubSubCategoria);
            }
            return lPreciarioConcepto;

        }


        /// <summary>
        /// Método que obtiene todos los registros de PreciarioConcepto
        /// </summary>
        /// <returns></returns>
        public static PreciarioConcepto ObtenerPreciarioConceptoPorID(string IDConcepto)
        {
            return PreciarioConceptosDataAccess.ObtenerPreciarioConceptoPorId(IDConcepto);
        }

        #endregion
    }
}
