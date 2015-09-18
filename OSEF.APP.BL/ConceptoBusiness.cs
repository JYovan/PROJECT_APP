﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Conceptos
    /// </summary>
    public class ConceptoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Conceptos
        /// </summary>
        /// <param name="iConcepto"></param>
        public static string Insertar(Concepto iConcepto)
        {
            return ConceptoDataAccess.Insertar(iConcepto);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Conceptos
        /// </summary>
        /// <param name="uConcepto"></param>
        /// <returns></returns>
        public static int Actualizar(Concepto uConcepto)
        {
            return ConceptoDataAccess.Actualizar(uConcepto);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Concepto por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return ConceptoDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Conceptos
        /// </summary>
        /// <returns></returns>
        public static List<Concepto> ObtenerConceptos()
        {
            //1. Obener una lista de conceptos
            List<Concepto> lConceptos = ConceptoDataAccess.ObtenerConceptos();
            
            //2. Complementar el objeto con Categoria y SubCategoria si es que tienen
            foreach(Concepto sd in lConceptos)
            {
                if (sd.CategoriaIdRaw == null)
                    sd.CategoriaIdRaw = string.Empty;
                if (sd.SubCategoriaIdRaw == null)
                    sd.SubCategoriaIdRaw = string.Empty;

                sd.RCategoria = CategoriaBusiness.ObtenerCategoriaPorID(sd.CategoriaIdRaw);
                sd.RSubCategoria = SubCategoriaBusiness.ObtenerSubCategoriaPorID(sd.SubCategoriaIdRaw);
            }
            
            //3. Regresar los objeto completos
            return lConceptos;
        }

        /// <summary>
        /// Obtener un registro de Concepto por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Concepto ObtenerConceptoPorID(string strID)
        {
            return ConceptoDataAccess.ObtenerConceptoPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de Concepto por su Orden
        /// </summary>
        /// <param name="bOrden"></param>
        /// <returns></returns>
        public static Concepto ObtenerConceptoPorOrden(short bOrden)
        {
            return ConceptoDataAccess.ObtenerConceptoPorOrden(bOrden);
        }

        /// <summary>
        /// Obtener una lista de objetos Concepto por Sucursal en Tasks (Programas de Obra)
        /// </summary>
        /// <param name="strSucursal"></param>
        /// <returns></returns>
        public static List<Concepto> ObtenerConceptoPorSucursal(string strSucursal)
        {
            return ConceptoDataAccess.ObtenerConceptoPorSucursal(strSucursal);
        }

        /// <summary>
        /// Obtener una lista de objetos Concepto por RevisionD
        /// </summary>
        /// <param name="iRevision"></param>
        /// <returns></returns>
        public static List<Concepto> ObtenerConceptoPorRevisionD(int iRevision)
        {
            return ConceptoDataAccess.ObtenerConceptoPorRevisionD(iRevision);
        }

        #endregion
    }
}
