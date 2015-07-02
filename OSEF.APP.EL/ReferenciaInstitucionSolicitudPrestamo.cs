using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de ReferenciasInstitucionesSolicitudesPrestamos
    /// </summary>
    public class ReferenciaInstitucionSolicitudPrestamo
    {
        #region Campos

        int id;
        string solicitudprestamo;
        string nombre;
        string tipocuenta;
        string nocuenta;

        #endregion

        #region Propiedades

        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public string SolicitudPrestamo
        {
            get { return solicitudprestamo; }
            set { solicitudprestamo = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string TipoCuenta
        {
            get { return tipocuenta; }
            set { tipocuenta = value; }
        }

        public string NoCuenta
        {
            get { return nocuenta; }
            set { nocuenta = value; }
        }

        #endregion
    }
}
