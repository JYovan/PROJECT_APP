using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    //Clase que contiene los campos de la tabla Respuestas
    public class Respuestas
    {
        #region Fields

        short id;
        string participante;
        string respuesta01;
        Nullable<bool> respuesta02;
        Nullable<bool> respuesta03;
        string respuesta04;
        byte respuesta05;

        #endregion

        #region Properties

        public short ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Participante
        {
            get { return participante; }
            set { participante = value; }
        }

        public string Respuesta01
        {
            get { return respuesta01; }
            set { respuesta01 = value; }
        }

        public Nullable<bool> Respuesta02
        {
            get { return respuesta02; }
            set { respuesta02 = value; }
        }

        public Nullable<bool> Respuesta03
        {
            get { return respuesta03; }
            set { respuesta03 = value; }
        }

        public string Respuesta04
        {
            get { return respuesta04; }
            set { respuesta04 = value; }
        }

        public byte Respuesta05
        {
            get { return respuesta05; }
            set { respuesta05 = value; }
        }

        #endregion
    }
}
