using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Sucursales
    /// </summary>
    public class Sucursal
    {
        #region Campos

        string id;
        short cr;
        string nombre;
        string direccionzona;
        string gerentebbvanombre;
        string gerentebbvaapaterno;
        string gerentebbvaamaterno;
        string supervisornombre;
        string supervisorapaterno;
        string supervisoramaterno;
        string proveedorenergia;
        int superficie;
        string coordinadornombre;
        string coordinadorapaterno;
        string coordinadoramaterno;
        string calle;
        string entrecalles;
        string noexterior;
        string nointerior;
        string codigopostal;
        string colonia;
        string estado;
        string municipio;
        string contratista;
        Nullable<DateTime> inicioobra;
        Nullable<DateTime> finobra;
        short semanasobra;
        Nullable<DateTime> fechaalta;
        string estatus;
        Proveedor rprovedor;

        Estado restado;
        Municipio rmunicipio;
        Colonia rcolonia;
        CodigoPostal rcodigopostal;

        string tipoconcepto;
        string tipoobra;
        string empresasupervisora;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public short CR
        {
            get { return cr; }
            set { cr = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string GerenteBBVANombre
        {
            get { return gerentebbvanombre; }
            set { gerentebbvanombre = value; }
        }

        public string GerenteBBVAAPaterno
        {
            get { return gerentebbvaapaterno; }
            set { gerentebbvaapaterno = value; }
        }

        public string GerenteBBVAAMaterno
        {
            get { return gerentebbvaamaterno; }
            set { gerentebbvaamaterno = value; }
        }

        public string SupervisorNombre
        {
            get { return supervisornombre; }
            set { supervisornombre = value; }
        }

        public string SupervisorAPaterno
        {
            get { return supervisorapaterno; }
            set { supervisorapaterno = value; }
        }

        public string SupervisorAMaterno
        {
            get { return supervisoramaterno; }
            set { supervisoramaterno = value; }
        }

        public string ProveedorEnergia
        {
            get { return proveedorenergia; }
            set { proveedorenergia = value; }
        }

        public int Superficie
        {
            get { return superficie; }
            set { superficie = value; }
        }

        public string CoordinadorNombre
        {
            get { return coordinadornombre; }
            set { coordinadornombre = value; }
        }

        public string CoordinadorAPaterno
        {
            get { return coordinadorapaterno; }
            set { coordinadorapaterno = value; }
        }

        public string CoordinadorAMaterno
        {
            get { return coordinadoramaterno; }
            set { coordinadoramaterno = value; }
        }

        public string Calle
        {
            get { return calle; }
            set { calle = value; }
        }

        public string EntreCalles
        {
            get { return entrecalles; }
            set { entrecalles = value; }
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

        public string CodigoPostal
        {
            get { return codigopostal; }
            set { codigopostal = value; }
        }

        public string Colonia
        {
            get { return colonia; }
            set { colonia = value; }
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

        public string Contratista
        {
            get { return contratista; }
            set { contratista = value; }
        }

       

        public Nullable<DateTime> InicioObra
        {
            get { return inicioobra; }
            set { inicioobra = value; }
        }

        public Nullable<DateTime> FinObra
        {
            get { return finobra; }
            set { finobra = value; }
        }

        public short SemanasObra
        {
            get { return semanasobra; }
            set { semanasobra = value; }
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

        public string Direccionzona
        {
            get { return direccionzona; }
            set { direccionzona = value; }
        }
         
        public Proveedor RProvedor
        {
            get { return rprovedor; }
            set { rprovedor = value; }
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
        
        public CodigoPostal RCodigopostal
        {
            get { return rcodigopostal; }
            set { rcodigopostal = value; }
        }

        public string TipoConcepto
        {
            get { return tipoconcepto; }
            set { tipoconcepto = value; }
        }

        public string TipoObra
        {
            get { return tipoobra; }
            set { tipoobra = value; }
        }

        public string EmpresaSupervisora
        {
            get { return empresasupervisora; }
            set { empresasupervisora = value; }
        }
        #endregion
    }
}
