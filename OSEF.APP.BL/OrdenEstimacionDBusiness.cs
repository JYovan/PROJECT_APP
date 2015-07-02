using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de OrdenesEstimacionesD
    /// </summary>
    public class OrdenEstimacionDBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de OrdenEstimacionD
        /// </summary>
        /// <param name="iVolumetriaD"></param>
        public static int Insertar(OrdenEstimacionD iOrdenEstimacionD)
        {
            return OrdenEstimacionDDataAccess.Insertar(iOrdenEstimacionD);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de OrdenEstimacionD
        /// </summary>
        /// <param name="uVolumetriaD"></param>
        /// <returns></returns>
        public static int Actualizar(OrdenEstimacionD uOrdenEstimacionD)
        {
            return OrdenEstimacionDDataAccess.Actualizar(uOrdenEstimacionD);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar uOrdenEstimacionD por su OrdenEstimacion
        /// </summary>
        /// <param name="iVolumetria"></param>
        public static int BorrarPorID(int ID)
        {
            return OrdenEstimacionDDataAccess.BorrarPorOrdenEstimacion(ID);
        }

        /// <summary>
        /// Método que borrar alguna OrdenEstimacionD por su ID y Renglon
        /// </summary>
        /// <param name="iVolumetria"></param>
        /// /// <param name="sRenglon"></param>
        public static int Borrar(int iID, short sRenglon)
        {
            return OrdenEstimacionDDataAccess.Borrar(iID, sRenglon);
        }

        #endregion

        #region Consultar



        /// <summary>
        /// Obtener un los registro de OrdenEstimacionD por su OrdenEstimacion
        /// </summary>
        /// <param name="iRevision"></param>
        /// <returns></returns>
        public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDPorOrdenEstimacion(int iID)
        {

            List<OrdenEstimacionD> OrdenEstimacionD = OrdenEstimacionDDataAccess.ObtenerOrdenEstimacionDPorOrdenEstimacion(iID);

            foreach (OrdenEstimacionD sd in OrdenEstimacionD)
                sd.RPreciarioConceptos = PreciarioGeneralConceptoBusiness.ObtenerPreciarioGeneralConceptoPorID(sd.ConceptoID);

            return OrdenEstimacionD;

        }

        /// <summary>
        /// Obtener un los registro de OrdenEstimacionD por su Movimiento Origen
        /// </summary>
        /// <param name="iRevision"></param>
        /// <returns></returns>
        public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDPorOrigen(string iID)
        {

            List<OrdenEstimacionD> OrdenEstimacionD = OrdenEstimacionDDataAccess.ObtenerOrdenEstimacionDPorOrigen(iID);

            foreach (OrdenEstimacionD sd in OrdenEstimacionD)
                sd.RPreciarioConceptos = PreciarioGeneralConceptoBusiness.ObtenerPreciarioGeneralConceptoPorID(sd.ConceptoID);

            return OrdenEstimacionD;

        }


        /// <summary>
        /// Obtener un los registro de OrdenEstimacionD para el explorador
        /// </summary>
        /// <param name="iRevision"></param>
        /// <returns></returns>
        public static List<OrdenEstimacionD> ObtenerOrdenEstimacionDExploradorConcluidos()
        {

            List<OrdenEstimacionD> OrdenEstimacionD = OrdenEstimacionDDataAccess.ObtenerOrdenEstimacionDExploradorConcluidos();

            foreach (OrdenEstimacionD sd in OrdenEstimacionD)
               
            {
                sd.RPreciarioConceptos = PreciarioGeneralConceptoBusiness.ObtenerPreciarioGeneralConceptoPorID(sd.ConceptoID);
                sd.RMovimiento = OrdenEstimacionBusiness.ObtenerOrdenEstimacionPorID(sd.Id);
            }
            return OrdenEstimacionD;



        }

        /// <summary>
        /// Obtener un los registro de VolumetriaD por su Preciario
        /// </summary>
        /// <param name="iPreciario"></param>
        /// <returns></returns>
        //public static List<VolumetriaD> ObtenerVolumetriaDPorPreciario(int iPreciario)
        //{
        //    return VolumetriaDDataAccess.ObtenerVolumetriaDPorPreciario(iPreciario);
        //}


        #endregion

    }
}
