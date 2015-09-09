using System;
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

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Programa de Obra por su Id
        /// </summary>
        /// <param name="iID"></param>
        public static int Borrar(int iId)
        {
            return ProgramaObraDataAccess.Borrar(iId);
        }

        #endregion
    }
}
