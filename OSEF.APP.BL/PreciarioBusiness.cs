using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class PreciarioBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Preciario
        /// </summary>
        /// <param name="iPreciario"></param>
        public static string Insertar(Preciario iPreciario)
        {
            return PreciarioDataAccess.Insertar(iPreciario);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Preciarios
        /// </summary>
        /// <param name="uPreciario"></param>
        /// <returns></returns>
        public static int Actualizar(Preciario uPreciario)
        {
            return PreciarioDataAccess.Actualizar(uPreciario);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Preciario por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return PreciarioDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de Preciarios
        /// </summary>
        /// <returns></returns>
        public static List<Preciario> ObtenerPreciarios()
        {
            List<Preciario> lPreciario = PreciarioDataAccess.ObtenerPreciarios();
            foreach (Preciario sd in lPreciario)
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);

            return lPreciario;
        }


        /// <summary>
        /// Método que obtiene todos los registros de Preciarios con estatus Activo
        /// </summary>
        /// <returns></returns>
        public static List<Preciario> ObtenerPreciariosActivos()
        {
            List<Preciario> lPreciario = PreciarioDataAccess.ObtenerPreciariosActivos();
            foreach (Preciario sd in lPreciario)
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);

            return lPreciario;
        }

        /// <summary>
        /// Método que obtiene todos los registros de Preciarios con estatus Activo
        /// </summary>
        /// <returns></returns>
        public static List<Preciario> ObtenerPreciariosActivosPorCliente(string cliente)
        {
            List<Preciario> lPreciario = PreciarioDataAccess.ObtenerPreciariosActivosPorCliente(cliente);
            foreach (Preciario sd in lPreciario)
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);

            return lPreciario;
        }

        /// <summary>
        /// Obtener un registro de Preciario por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Preciario ObtenerPreciarioPorID(string strID)
        {
            Preciario oPreciario = PreciarioDataAccess.ObtenerPreciarioPorID(strID);
            oPreciario.RSucursal = SucursalBusiness.ObtenerSucursalPorID(oPreciario.Sucursal);
            return oPreciario;
        }

        /// <summary>
        /// Obtener un registro de Preciario por su Sucursal
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Preciario ObtenerPreciarioPorSucursal(string strSucursal)
        {
            return PreciarioDataAccess.ObtenerPreciarioPorSucursal(strSucursal);
        }

        /// <summary>
        /// Obtener registros de Preciario en Volumetrias por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerPreciariosEnVolumetriasPorID(string strID)
        {
            return PreciarioDataAccess.ObtenerPreciariosEnVolumetriasPorID(strID);
        }

        #endregion
    }
}
