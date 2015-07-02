using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    //Clase que contiene los campos de la tabla Cuestionario
    public class Cuestionario
    {
        #region Fields

        short id;
        short nopregunta;
        string pregunta;
        string tipopregunta;

        #endregion

        #region Properties

        public short ID
        {
            get { return id; }
            set { id = value; }
        }

        public short NoPregunta
        {
            get { return nopregunta; }
            set { nopregunta = value; }
        }

        public string Pregunta
        {
            get { return pregunta; }
            set { pregunta = value; }
        }

        public string TipoPregunta
        {
            get { return tipopregunta; }
            set { tipopregunta = value; }
        }

        #endregion
    }
}
