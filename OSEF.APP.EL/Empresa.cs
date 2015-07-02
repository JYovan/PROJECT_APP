using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    //Clase que contiene los campos de la tabla Empresa
    public class Empresa
    {
        #region Fields

        short id;
        string nombre;
        string rfc;
        string calle;
        string noint;
        string noext;
        string colonia;
        Nullable<int> cp;
        string ciudad;
        string estado;
        string email;
        byte tipopersona;
        string amaterno;
        string apaterno;
        string telefono;

        #endregion

        #region Properties

        public short ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string RFC
        {
            get { return rfc; }
            set { rfc = value; }
        }

        public string Calle
        {
            get { return calle; }
            set { calle = value; }
        }

        public string NoInt
        {
            get { return noint; }
            set { noint = value; }
        }

        public string NoExt
        {
            get { return noext; }
            set { noext = value; }
        }

        public string Colonia
        {
            get { return colonia; }
            set { colonia = value; }
        }

        public Nullable<int> CP
        {
            get { return cp; }
            set { cp = value; }
        }

        public string Ciudad
        {
            get { return ciudad; }
            set { ciudad = value; }
        }

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public byte TipoPersona
        {
            get { return tipopersona; }
            set { tipopersona = value; }
        }

        public string AMaterno
        {
            get { return amaterno; }
            set { amaterno = value; }
        }

        public string APaterno
        {
            get { return apaterno; }
            set { apaterno = value; }
        }

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }

        #endregion
    }
}
