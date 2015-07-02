using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de BienesInmueblesSolicitudesPrestamos
    /// </summary>
    public class BienInmuebleSolicitudPrestamo
    {
        #region Campos

        int id;
        string solicitudprestamo;
        string tipo;
        string noserie;
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

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public string NoSerie
        {
            get { return noserie; }
            set { noserie = value; }
        }

        public decimal Valor
        {
            get { return valor; }
            set { valor = value; }
        }

        #endregion
    }
}
