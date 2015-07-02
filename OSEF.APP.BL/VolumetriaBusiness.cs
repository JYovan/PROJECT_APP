using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;


namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Volumetrias
    /// </summary>
    public class VolumetriaBusiness
    {
        #region insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Volumetrias
        /// </summary>
        /// <param name="iRevision"></param>
        public static int insertarVolumetria(Volumetria iVolumetria ) 
        {
           return VolumetriaDataAccess.Insertar(iVolumetria);
        }

        #endregion

        #region modificar
        /// <summary>
        /// Método que actualiza un registro en la tabla de Volumetrias
        /// </summary>
        /// <param name="iRevision"></param>
        public static int actualizarVolumetria(Volumetria uVolumetria) {
            return VolumetriaDataAccess.Actualizar(uVolumetria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Volumetria por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int Borrar(int iID)
        {
            return VolumetriaDataAccess.Borrar(iID);
        }

        #endregion


        #region consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Volumetrias
        /// </summary>
        /// <returns></returns>
        public static List<Volumetria> ObtenerVolumetrias()
        {
            //1. Obtener las Volumetrias en una lista
            List<Volumetria> lVolumetrias = VolumetriaDataAccess.ObtenerVolumetrias();

            //2. Complementarlas con sucursal
            foreach (Volumetria sd in lVolumetrias)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);
             
            }
            //2. Complementarlas con preciario
            foreach (Volumetria sd in lVolumetrias)
            {
                sd.RPreciario = PreciarioBusiness.ObtenerPreciarioPorID(sd.Preciario);
                
            }
            return lVolumetrias;
        }

        /// <summary>
        /// Obtener un registro de Volumetrias por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static Volumetria ObtenerVolumetriaPorID(int iID)
        {
            //1. Inicializar objeto, complementarlo con la Sucursal
            Volumetria oVolumetria = VolumetriaDataAccess.ObtenerVolumetriaPorID(iID);
            oVolumetria.RSucursal = SucursalBusiness.ObtenerSucursalPorID(oVolumetria.Sucursal);
            oVolumetria.RPreciario = PreciarioBusiness.ObtenerPreciarioPorID(oVolumetria.Preciario);
            if (oVolumetria.Cliente != null)
            {
                oVolumetria.RCliente = ClienteBusiness.ObtenerClientePorID(oVolumetria.Cliente);
            }
            return oVolumetria;
        }


        #endregion

        #region Acciones

        /// <summary>
        /// Método que Afecta un registro de Volumetrias
        /// </summary>
        /// <param name="aVolumetria"></param>
        public static int AfectarVolumetriaPorID(Volumetria aVolumetria)
        {
            return VolumetriaDataAccess.AfectarVolumetriaPorID(aVolumetria);
        }

        /// <summary>
        /// Método que avanza un movimiento de Volumetrias
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int AvanzarVolumetriaPorID(int iID, string strMov)
        {
            return VolumetriaDataAccess.AvanzarVolumetriaPorID(iID, strMov);
        }



        /// <summary>
        /// Método que cancela un movimiento de Volumetrias
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int CancelaVolumetriaPorID(int iID)
        {
            return VolumetriaDataAccess.CancelarVolumetriaPorID(iID);
        }

        /// <summary>
        /// Método que restablece el preciario cuando se borra una captura
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static int BorrarVolumetriaAfectaPreciario(int iID)
        {
            return VolumetriaDataAccess.BorrarVolumetriaAfectaPreciario(iID);
        }

        /// <summary>
        /// Obtener registros de Preciarios Concluidos por ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerPreciariosActivosPorID(string strID)
        {
            return VolumetriaDataAccess.ObtenerPreciariosActivosPorID(strID);
        }


        #endregion


    }
}
