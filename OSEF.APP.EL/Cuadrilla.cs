using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class Cuadrilla
    {
        #region Campos
        string Id;
        string nombre;
        string descripcion;
        #endregion

        #region Propiedades
        public string ID
        {
            get { return Id; }
            set { Id = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        #endregion
    }
}
