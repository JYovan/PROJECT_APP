using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de BienesMueblesSolicitudesPrestamos
    /// </summary>
    public class BienMuebleSolicitudPrestamo
    {
        #region Campos

        int id;
        string solicitudprestamo;
        string ubicacion;
        string tipo;
        string inscripcion;
        decimal valor;

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

        public string Ubicacion
        {
            get { return ubicacion; }
            set { ubicacion = value; }
        }

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public string Inscripcion
        {
            get { return inscripcion; }
            set { inscripcion = value; }
        }

        public decimal Valor
        {
            get { return valor; }
            set { valor = value; }
        }

        #endregion
    }
}
