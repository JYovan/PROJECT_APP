using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.DL;
using OSEF.APP.EL;

namespace OSEF.APP.BL
{
    public class PreciarioGeneralBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Preciario
        /// </summary>
        /// <param name="iPreciario"></param>
        public static string Insertar(PreciarioGeneral iPreciario)
        {
            return PreciarioGeneralDataAccess.Insertar(iPreciario);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun PreciarioGeneral por su Preciario
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioGeneralDataAccess.Borrar(dID);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Preciarios
        /// </summary>
        /// <param name="uPreciario"></param>
        /// <returns></returns>
        public static int Actualizar(PreciarioGeneral uPreciario)
        {
            return PreciarioGeneralDataAccess.Actualizar(uPreciario);
        }
        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de Preciarios
        /// </summary>
        /// <returns></returns>
        public static List<PreciarioGeneral> ObtenerPreciariosGenerales()
        {
            return PreciarioGeneralDataAccess.ObtenerPreciariosGenerales();
           
        }


        /// <summary>
        /// Obtener un registro de Preciario por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneral ObtenerPreciarioGeneralPorID(string strID)
        {
            return PreciarioGeneralDataAccess.ObtenerPreciarioGeneralPorID(strID);
           
        }

        /// <summary>
        /// Obtener un registro de PreciarioGeneralTipoObra
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneral ObtenerPreciarioGeneralTipoObra()
        {
            return PreciarioGeneralDataAccess.ObtenerPreciarioGeneralTipoObra();

        }

        /// <summary>
        /// Obtener un registro de PreciarioGeneralTipoMnto
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static PreciarioGeneral ObtenerPreciarioGeneralTipoMnto()
        {
            return PreciarioGeneralDataAccess.ObtenerPreciarioGeneralTipoMnto();

        }

        /// <summary>
        /// Obtener Peeciarios con nombres repetidos
        /// </summary>
        /// <param name="strDescripcion"></param>
        /// <returns></returns>
        public static bool ObtenerPreciariosGeneralesRepetidos(string strDescripcion)
        {
            return PreciarioGeneralDataAccess.ObtenerPreciariosGeneralesRepetidos(strDescripcion);

        }

        #endregion
    }
}
