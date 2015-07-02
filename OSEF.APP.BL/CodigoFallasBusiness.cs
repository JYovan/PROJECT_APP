using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class CodigoFallasBusiness
    {
        #region Consultar

        /// <summary>
        /// Obtener registros de CodigoFalla
        /// </summary> 
        /// <returns>List<CodigoFalla></returns>
        public static List<CodigoFalla> ObtenerCodigoFallas()
        {
            List<CodigoFalla> lCodigosFallas = CodigoFallasDataAccess.ObtenerCodigoFallas();
            //foreach (CodigoFalla cp in lCodigosFallas)
            //{
            //    cp.REspecialidad = EspecialidadesBusiness.ObtenerEspecialidadesPorID(cp.Especialidad);
            //    cp.RFamilias = FamiliasBusiness.ObtenerFamiliasPorID(cp.Familia);
            //    cp.RSubespecialidad = SubEspecialidadesBusiness.ObtenerSubEspecialidadesPorID(cp.Subespecialidad);
            //}
            return lCodigosFallas;
        }

        /// <summary>
        /// Obtener registros de CodigoFalla
        /// </summary> 
        /// <returns>CodigoFalla</returns>
        public static CodigoFalla ObtenerCodigoFallaPorID(string ID)
        {
            CodigoFalla cf = CodigoFallasDataAccess.ObtenerCodigoFallasPorID(ID); 
            //cf.REspecialidad = EspecialidadesBusiness.ObtenerEspecialidadesPorID(cf.Especialidad);
            //cf.RFamilias = FamiliasBusiness.ObtenerFamiliasPorID(cf.Familia);
            //cf.RSubespecialidad = SubEspecialidadesBusiness.ObtenerSubEspecialidadesPorID(cf.Subespecialidad);
            return cf;
        }

        /// <summary>
        /// Obtener registros de cuadrillas por su ID
        /// </summary>
        /// <param name="strID"></param> 
        public static bool ObtenerRegistrosDeCodigoFallasPorID(string strID)
        {
            return CodigoFallasDataAccess.ObtenerRegistrosDeCodigoFallasPorID(strID);
        }



        /// <summary>
        /// Revisar si existen registros de Main Saver
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerMainSaverEnCodigoPPTA(string MS)
        {
            return CodigoFallasDataAccess.ObtenerMainSaverEnCodigoPPTA(MS);
        }

        #endregion

        #region Insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CodigoFallas
        /// </summary>
        /// <param name="iCodigoFallas"></param>
        public static string Insertar(CodigoFalla iCodigoFallas)
        {
            return CodigoFallasDataAccess.Insertar(iCodigoFallas);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Codigo De Falla por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return CodigoFallasDataAccess.Borrar(dID);
        }

        #endregion

        #region Modificar
        /// <summary>
        /// Método que actualiza algun Codigo De Falla por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Actualizar(CodigoFalla cp)
        {
            return CodigoFallasDataAccess.Actualizar(cp);
        }

        #endregion
    }
}
