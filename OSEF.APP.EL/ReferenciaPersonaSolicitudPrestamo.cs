using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de ReferenciasPersonasSolicitudesPrestamos
    /// </summary>
    public class ReferenciaPersonaSolicitudPrestamo
    {
        #region Campos

        int id;
        string solicitudprestamo;
        string nombre;
        string domicilio;
        string telefono;
        string actividad;

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

        public string Domicilio
        {
            get { return domicilio; }
            set { domicilio = value; }
        }

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }

        public string Actividad
        {
            get { return actividad; }
            set { actividad = value; }
        }

        #endregion
    }
}
