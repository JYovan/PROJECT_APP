using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class PreciarioGeneralConceptoBusiness
    {

        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de PreciarioConcepto
        /// </summary>
        /// <param name="iPreciarioConcepto"></param>
        public static int Insertar(PreciarioGeneralConcepto iPreciarioConcepto)
        {
            return PreciarioGeneralConceptoDataAccess.Insertar(iPreciarioConcepto);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioGeneralConcepto por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string ID, string clave)
        {
            return PreciarioGeneralConceptoDataAccess.Borrar(ID,clave);
        } 

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener un registro de PreciarioConcepto por su Preciario
        /// </summary>
        /// <param name="strPreciario"></param>
        /// <returns></returns>
        public static List<PreciarioGeneralConcepto> ObtenerPreciarioGeneralConceptoPorPreciario(string strPreciario)
        {
            //1. Obtener lista de conceptos
            List<PreciarioGeneralConcepto> lPreciarioConcepto = PreciarioGeneralConceptoDataAccess.ObtenerPreciarioGeneralConceptoPorPreciario(strPreciario);

            //2. Asignar a cada Colonia su correspondiente municipio
            foreach (PreciarioGeneralConcepto sd in lPreciarioConcepto)
            {
                sd.RCategoria = PreciarioGeneralCategoriaBusiness.ObtenerPreciarioGeneralCategoriaPorID(sd.Categoria);
                sd.RSubCategoria = PreciarioGeneralSubCategoriaBusiness.ObtenerPreciarioGeneralSubCategoriaPorID(sd.SubCategoria);
                sd.RSubSubCategoria = PreciarioGeneralSubSubCategoriaBusiness.ObtenerPreciarioGeneralSubSubCategoriaPorID(sd.SubSubCategoria);
            }

            return lPreciarioConcepto;
        }

        /// <summary>
        /// Método que obtiene todos los registros de PreciarioGeneralConcepto
        /// </summary>
        /// <returns></returns>
        public static PreciarioGeneralConcepto ObtenerPreciarioGeneralConceptoPorID(string IDConcepto)
        {
            return PreciarioGeneralConceptoDataAccess.ObtenerPreciarioGeneralConceptoPorId(IDConcepto);
        }

        /// <summary>
        /// Método que obtiene todos los registros de PreciarioGeneralConcepto filtrandolos
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioGeneralConcepto> ObtenerPreciarioConceptoFiltro(string strPreciario, string strCategoria, string strSubCategoria, string strSubsubCategoria)
        {
            return PreciarioGeneralConceptoDataAccess.ObtenerPreciarioGeneralConceptoFiltro(strPreciario, strCategoria, strSubCategoria, strSubsubCategoria);
        }

        /// <summary>
        /// Método que obtiene el ultimo ID de PreciarioGeneralConcepto
        /// </summary>
        /// <returns></returns>
        public static string ObtenerUltimoConceptoAdicional()
        {
            return PreciarioGeneralConceptoDataAccess.ObtenerUltimoConceptoAdicional();
        }


        /// <summary>
        /// Obtener registros de conceptos en uso en OrdenesEstimacionesD
        /// </summary>
        /// <param name="strID"></param> 
        public static bool ObtenerConceptosEnUsoPorIDyClave(string ID, string clave)
        {
            return PreciarioGeneralConceptoDataAccess.ObtenerConceptosEnUsoPorIDyClave(ID, clave);
        }

        #endregion

        #region Actualizar

        /// <summary>
        /// Método que actualiza algun PreciarioGeneralConcepto por su ID
        /// </summary>
        /// <param name="iPreciarioConcepto"></param> 
       public static int Actualizar(PreciarioGeneralConcepto iPreciarioConcepto)
        {
            return PreciarioGeneralConceptoDataAccess.Actualizar(iPreciarioConcepto);
        }

        #endregion

    }
}
