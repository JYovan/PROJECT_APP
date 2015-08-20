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
        string correo;
        string telefono;
        string telefonomovil;
        string calle;
        string noexterior;
        string nointerior;
        string colonia;
        string codigopostal;
        string entrecalles;
        string estado;
        string municipio;

        Nullable<DateTime> fechaalta;
        string estatus;
        string usuario;
        string rutalogo;

        Estado restado;
        Municipio rmunicipio;
        Colonia rcolonia;
        CodigoPostal rcodigopostal;

        string elaboro;
        string reviso;
        string autorizo;

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

        public string CodigoPostal
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


        public Estado REstado
        {
            get { return restado; }
            set { restado = value; }
        }

        public Municipio RMunicipio
        {
            get { return rmunicipio; }
            set { rmunicipio = value; }
        }

        public Colonia RColonia
        {
            get { return rcolonia; }
            set { rcolonia = value; }
        }

        public CodigoPostal RCodigoPostal
        {
            get { return rcodigopostal; }
            set { rcodigopostal = value; }
        }

        public string Elaboro
        {
            get { return elaboro; }
            set { elaboro = value; }
        }

        public string Reviso
        {
            get { return reviso; }
            set { reviso = value; }
        }

        public string Autorizo
        {
            get { return autorizo; }
            set { autorizo = value; }
        }

        #endregion
    }
}
