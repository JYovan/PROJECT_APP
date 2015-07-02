using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    //Clase que contiene los campos de la tabla TipoParticipante
    public class TipoParticipante
    {
        #region Fields

        byte id;
        string nombre;

        #endregion

        #region Properties

        public byte ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        #endregion
    }
}
