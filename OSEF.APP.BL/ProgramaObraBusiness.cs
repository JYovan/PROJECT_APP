﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de ProgramasObras
    /// </summary>
    public class ProgramaObraBusiness
    {
        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de Programas de Obras
        /// </summary>
        /// <returns></returns>
        public static List<ProgramaObra> ObtenerProgramasObras()
        {
            //1. Obtener las OrdenesEstimaciones en una lista
            List<ProgramaObra> lProgramasObras = ProgramaObraDataAccess.ObtenerProgramasObras();

            //2. Complementarlas con sucursal
            foreach (ProgramaObra sd in lProgramasObras)
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.SucursalId);

            return lProgramasObras;
        }

        /// <summary>
        /// Obtener un registro de Categoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Categoria ObtenerCategoriaPorID(string strID)
        {
            return CategoriaDataAccess.ObtenerCategoriaPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de Categoria por su Orden
        /// </summary>
        /// <param name="bOrden"></param>
        /// <returns></returns>
        public static Categoria ObtenerCategoriaPorOrden(byte bOrden)
        {
            return CategoriaDataAccess.ObtenerCategoriaPorOrden(bOrden);
        }

        #endregion
    }
}
