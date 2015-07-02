using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de ImagenRevisionD
    /// </summary>
    public class ImagenRevisionD
    {
        #region Campos

        int revision;
        string concepto;
        string nombre;
        string direccion;
        string usuarioalta;
        DateTime fechaalta;

        #endregion

        #region Propiedades

        public int Revision
        {
            get { return revision; }
            set { revision = value; }
        }

        public string Concepto
        {
            get { return concepto; }
            set { concepto = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        public string UsuarioAlta
        {
            get { return usuarioalta; }
            set { usuarioalta = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        #endregion
    }
}
