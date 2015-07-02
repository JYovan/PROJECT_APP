using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de imagenOrdenEstimacionD
    /// </summary>
    public class ImagenOrdenEstimacionD
    {
        #region Campos

        int id;
        string concepto;
        string nombre;
        string direccion;
        string usuario;
        DateTime fechaalta;

        #endregion

        #region Propiedades

        public int MovID
        {
            get { return id; }
            set { id = value; }
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

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        #endregion
    }
}