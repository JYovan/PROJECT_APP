using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de PreciarioGeneral
    /// </summary>
    public class PreciarioGeneral
    {

        #region Campos

        string id;
        string descripcion;
        string archivo;
        string usuario;
        string estatus;
        DateTime fechaalta;
        bool tipoobra;
        bool tipomantenimiento;
   
       

        #endregion


        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

      
        public string Archivo
        {
            get { return archivo; }
            set { archivo = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        public bool TipoObra
        {
            get { return tipoobra; }
            set { tipoobra = value; }
        }

        public bool TipoMantenimiento
        {
            get { return tipomantenimiento; }
            set { tipomantenimiento = value; }
        }

        #endregion


    }
}
