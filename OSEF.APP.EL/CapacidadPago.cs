using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de CapacidadesPagos
    /// </summary>
    public class CapacidadPago
    {
        #region Campos

        int id;
        string solicitudprestamo;
        int renglon;
        string tipo;
        string concepto;
        decimal importe;

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

        public int Renglon
        {
            get { return renglon; }
            set { renglon = value; }
        }

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public string Concepto
        {
            get { return concepto; }
            set { concepto = value; }
        }

        public decimal Importe
        {
            get { return importe; }
            set { importe = value; }
        }

        #endregion
    }
}
