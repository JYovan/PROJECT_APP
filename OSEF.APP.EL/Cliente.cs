using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Clientes
    /// </summary>
    public class Cliente
    {
        #region Campos

        string id;
        string nombre;
        string apaterno;
        string amaterno;
        string rfc;
        string curp;
        Nullable<DateTime> fechanacimiento;
        byte edad;
        string sexo;
        string estadocivil;
        string profesion;
        string correo;
        string telefono;
        string telefonomovil;
        string calle;
        string noexterior;
        string nointerior;
        string colonia;
        int codigopostal;
        string entrecalles;
        string estado;
        string municipio;
        Nullable<DateTime> fechaalta;
        string estatus;
        string usuario;
        string rutalogo;


        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string APaterno
        {
            get { return apaterno; }
            set { apaterno = value; }
        }

        public string AMaterno
        {
            get { return amaterno; }
            set { amaterno = value; }
        }

        public string RFC
        {
            get { return rfc; }
            set { rfc = value; }
        }

        public string CURP
        {
            get { return curp; }
            set { curp = value; }
        }

        public Nullable<DateTime> FechaNacimiento
        {
            get { return fechanacimiento; }
            set { fechanacimiento = value; }
        }

        public byte Edad
        {
            get { return edad; }
            set { edad = value; }
        }

        public string Sexo
        {
            get { return sexo; }
            set { sexo = value; }
        }

        public string EstadoCivil
        {
            get { return estadocivil; }
            set { estadocivil = value; }
        }

        public string Profesion
        {
            get { return profesion; }
            set { profesion = value; }
        }

        public string Correo
        {
            get { return correo; }
            set { correo = value; }
        }

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }

        public string TelefonoMovil
        {
            get { return telefonomovil; }
            set { telefonomovil = value; }
        }

        public string Calle
        {
            get { return calle; }
            set { calle = value; }
        }

        public string NoExterior
        {
            get { return noexterior; }
            set { noexterior = value; }
        }

        public string NoInterior
        {
            get { return nointerior; }
            set { nointerior = value; }
        }

        public string Colonia
        {
            get { return colonia; }
            set { colonia = value; }
        }

        public int CodigoPostal
        {
            get { return codigopostal; }
            set { codigopostal = value; }
        }

        public string EntreCalles
        {
            get { return entrecalles; }
            set { entrecalles = value; }
        }

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }

        public string Municipio
        {
            get { return municipio; }
            set { municipio = value; }
        }
         
        public Nullable<DateTime> FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }


        public string RutaLogo
        {
            get { return rutalogo; }
            set { rutalogo = value; }
        }
       

        #endregion
    }
}
