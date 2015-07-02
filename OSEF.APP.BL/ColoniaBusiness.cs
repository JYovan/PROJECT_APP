using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Colonias
    /// </summary>
    public class ColoniaBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Colonias
        /// </summary>
        /// <param name="iMunicipio"></param>
        public static string Insertar(Colonia iColonia)
        {
            return ColoniaDataAccess.Insertar(iColonia);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Colonias
        /// </summary>
        /// <param name="uMunicipio"></param>
        /// <returns></returns>
        public static int Actualizar(Colonia uColonias)
        {
            return ColoniaDataAccess.Actualizar(uColonias);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Colonias por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return ColoniaDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Colonia
        /// </summary>
        /// <returns></returns>
        public static List<Colonia> ObtenerColonias()
        {
            //1. Obtener lista de Colonias
            List<Colonia> lColonia = ColoniaDataAccess.ObtenerColonias();
            //2. Asignar a cada Colonia su correspondiente municipio
            foreach (Colonia sd in lColonia)
                sd.RMunicipio = MunicipioBusiness.ObtenerMunicipioPorID(sd.Municipio);

            foreach(Colonia sd in lColonia)
                sd.REstado =EstadoBusiness.ObtenerEstadoPorID(sd.Estado);
            //3. Regresar la lista con los objetos completos
            return lColonia;
        }

        /// <summary>
        /// Obtener un registro de Colonia por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Colonia ObtenerColoniaPorID(string strID)
        {
            return ColoniaDataAccess.ObtenerColoniaPorID(strID);
        }

        /// <summary>
        /// Obtener registros de Colonia en Sucursales por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerRegistrosDeColoniasPorID(string strID)
        {
            return ColoniaDataAccess.ObtenerRegistrosDeColoniasPorID(strID);
        }



        /// <summary>
        /// Obtener todos los colonias por municipio
        /// </summary>
        /// <param name="strEstado"></param>
        /// <returns></returns>
        public static List<Colonia> ObtenerColoniasPorMunicipio(string strMunicipio)
        {
            return ColoniaDataAccess.ObtenerColoniasPorMunicipio(strMunicipio);
        }


        #endregion
    }
}