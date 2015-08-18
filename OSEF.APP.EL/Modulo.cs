using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class Modulo
    {
        #region Campos

        int id;
        string usuarioid;
        string nombre;
        string moduloid;
        bool permiso;
        #endregion

        #region Propiedades
        public int ID
        {
            get { return id; }
            set { id = value; }
        }


        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string ModuloID
        {
            get { return moduloid; }
            set { moduloid = value; }
        }

        public string UsuarioID
        {
            get { return usuarioid; }
            set { usuarioid = value; }
        }

        public bool Permiso
        {
            get { return permiso; }
            set { permiso = value; }
        }

        #endregion
    }
}
