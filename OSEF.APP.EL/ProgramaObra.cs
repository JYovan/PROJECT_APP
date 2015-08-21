using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de ProgramasObras
    /// </summary>
    public class ProgramaObra
    {
        #region Campos

        int id;
        string sucursalid;
        DateTime fechaemision;
        string estatus;

        #endregion

        #region Propiedades

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string SucursalId
        {
            get { return sucursalid; }
            set { sucursalid = value; }
        }

        public DateTime FechaEmision
        {
            get { return fechaemision; }
            set { fechaemision = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        #endregion
    }
}
