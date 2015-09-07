using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Sucursal
    /// </summary>
    public class SucursalBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Sucursales
        /// </summary>
        /// <param name="iSucursal"></param>
        public static string Insertar(Sucursal iSucursal)
        {
            return SucursalDataAccess.Insertar(iSucursal);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Sucursales
        /// </summary>
        /// <param name="uSucursal"></param>
        /// <returns></returns>
        public static int Actualizar(Sucursal uSucursal)
        {
            return SucursalDataAccess.Actualizar(uSucursal);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Sucursal por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return SucursalDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Sucursales
        /// </summary>
        /// <returns></returns>
        public static List<Sucursal> ObtenerSucursales()
        {
            //return SucursalDataAccess.ObtenerSucursales();
            List<Sucursal> lSucursal = SucursalDataAccess.ObtenerSucursales();

            foreach (Sucursal c in lSucursal)
            {
                c.RColonia = ColoniaBusiness.ObtenerColoniaPorID(c.Colonia);

            }


            return lSucursal;
        }


        /// <summary>
        /// Método que obtiene todos los regsitros de Sucursales
        /// </summary>
        /// <returns></returns>
        public static List<Sucursal> ObtenerSucursalesPorCliente(string cliente)
        {
            //return SucursalDataAccess.ObtenerSucursales();
            List<Sucursal> lSucursal = SucursalDataAccess.ObtenerSucursalesPorCliente(cliente);

            foreach (Sucursal c in lSucursal)
            {
                c.RColonia = ColoniaBusiness.ObtenerColoniaPorID(c.Colonia);

            }


            return lSucursal;
        }

        /// <summary>
        /// Método que obtiene todos los regsitros de Sucursales
        /// </summary>
        /// <returns></returns>
        public static List<Sucursal> ObtenerSucursalesEnUsoEnOrdenesDeCambio()
        {
            //return SucursalDataAccess.ObtenerSucursales();
            List<Sucursal> lSucursal = SucursalDataAccess.ObtenerSucursalesEnUsoEnOrdenesDeCambio(); 
            foreach (Sucursal c in lSucursal)
            {
                c.RColonia = ColoniaBusiness.ObtenerColoniaPorID(c.Colonia); 
            } 
            return lSucursal;
        }



        /// <summary>
        /// Método que obtiene todos los regsitros de Sucursales en uso
        /// </summary>
        /// <returns></returns>
        public static List<Sucursal> ObtenerSucursalesEnUso()
        {
            //return SucursalDataAccess.ObtenerSucursales();
            List<Sucursal> lSucursal = SucursalDataAccess.ObtenerSucursalesEnUso();

            foreach (Sucursal c in lSucursal)
            {
                c.RColonia = ColoniaBusiness.ObtenerColoniaPorID(c.Colonia);

            }


            return lSucursal;
        }



        /// <summary>
        /// Método que obtiene todos los regsitros de Sucursales en uso
        /// </summary>
        /// <returns></returns>
        public static List<Sucursal> ObtenerSucursalesEnUsoEnConcluidos()
        {
            //return SucursalDataAccess.ObtenerSucursales();
            List<Sucursal> lSucursal = SucursalDataAccess.ObtenerSucursalesEnUsoEnConcluidos();

            foreach (Sucursal c in lSucursal)
            {
                c.RColonia = ColoniaBusiness.ObtenerColoniaPorID(c.Colonia);

            }


            return lSucursal;
        }

        /// <summary>
        /// Método que obtiene todos los regsitros de Sucursales
        /// </summary>
        /// <returns></returns>
        public static List<Sucursal> ObtenerSucursalesDisponibles()
        {
            List<Sucursal> lSucursal = SucursalDataAccess.ObtenerSucursalesDisponibles();
            foreach (Sucursal c in lSucursal)
            {
                c.RColonia = ColoniaBusiness.ObtenerColoniaPorID(c.Colonia);

            }
            return lSucursal;

        }

        /// <summary>
        /// Obtener un registro de Sucursal por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Sucursal ObtenerSucursalPorID(string strID)
        {

            Sucursal oSucursal = SucursalDataAccess.ObtenerSucursalPorID(strID);
            if (oSucursal != null && oSucursal.RProvedor != null)
            {
                oSucursal.RProvedor = ProveedorBusiness.ObtenerProveedorPorID(oSucursal.Contratista);
            }
            if (oSucursal != null &&  oSucursal.RCodigopostal != null)
            {
                oSucursal.RCodigopostal = CodigoPostalBusiness.ObtenerCodigoPostalPorID(oSucursal.CodigoPostal);
                oSucursal.RColonia = ColoniaBusiness.ObtenerColoniaPorID(oSucursal.Colonia);
                oSucursal.REstado = EstadoBusiness.ObtenerEstadoPorID(oSucursal.Estado);
                oSucursal.RMunicipio = MunicipioBusiness.ObtenerMunicipioPorID(oSucursal.Municipio);
            }
            return oSucursal;

        }

        /// <summary>
        /// Revisar si existen registros de Sucursales en las revisiones por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerSucursalesEnRevisionesPorID(string strID)
        {
            return SucursalDataAccess.ObtenerSucursalesEnRevisionesPorID(strID);
        }


        /// <summary>
        /// Revisar si existen registros de Sucursales
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerCREnSucursales(int CR, string cliente)
        {
            return SucursalDataAccess.ObtenerCREnSucursales(CR, cliente);
        }


        /// <summary>
        /// Revisar si existen registros de Sucursales en los preciarios por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerSucursalesEnPreciariosPorID(string strID)
        {
            return SucursalDataAccess.ObtenerSucursalesEnPreciariosPorID(strID);
        }


        #endregion
    }
}
