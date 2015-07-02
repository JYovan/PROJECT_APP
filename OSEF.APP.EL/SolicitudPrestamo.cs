using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Solicitudes prestamos
    /// </summary>
    public class SolicitudPrestamo
    {
        #region Campos

        string id;
        string cliente;
        string nacionalidad;
        string registromatrimonial;
        Nullable<byte> numerodependientes;
        string edades;
        string tipocasa;
        Nullable<byte> aniosdomicilio;
        string calleanterior;
        string entrecallesanterior;
        string noexterioranterior;
        string nointerioranterior;
        string estadoanterior;
        string municipioanterior;
        string coloniaanterior;
        Nullable<int> codigopostalanterior;
        byte antiguedad;
        short ingresos;
        Nullable<short> otrosingresos;
        string concepto;
        string jefenombre;
        string jefeapaterno;
        string jefeamaterno;
        string empresaanterior;
        string conyugenombre;
        string conyugeapaterno;
        string conyugeamaterno;
        Nullable<DateTime> conyugefechanacimiento;
        Nullable<byte> conyugeedad;
        string conyugerfc;
        string conyugetelefono;
        string conyugetelefonomovil;
        string conyugecalle;
        string conyugeentrecalles;
        string conyugenoexterior;
        string conyugenointerior;
        string conyugeestado;
        string conyugemunicipio;
        string conyugecolonia;
        Nullable<int> conyugecodigopostal;
        Nullable<byte> conyugeantiguedad;
        Nullable<short> conyugeingresos;
        Nullable<short> conyugeotrosingresos;
        string conyugeconcepto;
        string conyugeempresa;
        string conyugepuesto;
        string conyugeempresacalle;
        string conyugeempresaentrecalles;
        string conyugeempresanoexterior;
        string conyugeempresanointerior;
        string conyugeempresacolonia;
        Nullable<int> conyugeempresacodigopostal;
        string conyugeempresaestado;
        string conyugeempresamunicipio;
        string conyugeempresajefenombre;
        string conyugeempresajefeapaterno;
        string conyugeempresajefeamaterno;
        string avalnombre;
        string avalapaterno;
        string avalamaterno;
        bool avalsocio;
        string avalestadocivil;
        string avalregistromatrimonial;
        string avalcalle;
        string avalentrecalles;
        string avalnoexterior;
        string avalnointerior;
        string avalcolonia;
        Nullable<int> avalcodigopostal;
        string avalestado;
        string avalmunicipio;
        string avaltelefono;
        string avaltelefonomovil;
        Nullable<byte> avalantiguedad;
        bool avalcasapropia;
        string avaltipocasa;
        string avalcalleanterior;
        string avalnoexterioranterior;
        string avalnointerioranterior;
        string avalcoloniaanterior;
        Nullable<int> avalcodigopostalanterior;
        string avalentrecallesanterior;
        string avalempresa;
        string avalempresajefenombre;
        string avalempresajefeapaterno;
        string avalempresajefeamaterno;
        string avalempresapuesto;
        byte avalempresaantiguedad;
        int avalempresaingresos;
        Nullable<int> avalempresaotrosingresos;
        string avalempresaconcepto;
        string avalempresatelefono;
        Nullable<short> avalempresatelefonoext;
        bool avalempresapropietario;
        string avalempresagiro;
        string avalempresaanterior;
        int cantidad;
        short plazo;
        string formapago;
        string destinoprestamo;
        string tipo;
        string tablaamortizacion;
        string estatus;
        DateTime fechaalta;
        string usuarioalta;
        DateTime fechamodificacion;
        string usuariomodificacion;

        string nombre;
        string amaterno;
        string apaterno;
        DateTime inicio;
        DateTime fin;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Cliente
        {
            get { return cliente; }
            set { cliente = value; }
        }

        public string Nacionalidad
        {
            get { return nacionalidad; }
            set { nacionalidad = value; }
        }

        public string RegistroMatrimonial
        {
            get { return registromatrimonial; }
            set { registromatrimonial = value; }
        }

        public Nullable<byte> NumeroDependientes
        {
            get { return numerodependientes; }
            set { numerodependientes = value; }
        }

        public string Edades
        {
            get { return edades; }
            set { edades = value; }
        }

        public string TipoCasa
        {
            get { return tipocasa; }
            set { tipocasa = value; }
        }

        public Nullable<byte> AniosDomicilio
        {
            get { return aniosdomicilio; }
            set { aniosdomicilio = value; }
        }

        public string CalleAnterior
        {
            get { return calleanterior; }
            set { calleanterior = value; }
        }

        public string NoExteriorAnterior
        {
            get { return noexterioranterior; }
            set { noexterioranterior = value; }
        }

        public string NoInteriorAnterior
        {
            get { return nointerioranterior; }
            set { nointerioranterior = value; }
        }

        public string EstadoAnterior
        {
            get { return estadoanterior; }
            set { estadoanterior = value; }
        }

        public string MunicipioAnterior
        {
            get { return municipioanterior; }
            set { municipioanterior = value; }
        }

        public string ColoniaAnterior
        {
            get { return coloniaanterior; }
            set { coloniaanterior = value; }
        }

        public Nullable<int> CodigoPostalAnterior
        {
            get { return codigopostalanterior; }
            set { codigopostalanterior = value; }
        }

        public string EntreCallesAnterior
        {
            get { return entrecallesanterior; }
            set { entrecallesanterior = value; }
        }

        public byte Antiguedad
        {
            get { return antiguedad; }
            set { antiguedad = value; }
        }

        public short Ingresos
        {
            get { return ingresos; }
            set { ingresos = value; }
        }

        public Nullable<short> OtrosIngresos
        {
            get { return otrosingresos; }
            set { otrosingresos = value; }
        }

        public string Concepto
        {
            get { return concepto; }
            set { concepto = value; }
        }

        public string JefeNombre
        {
            get { return jefenombre; }
            set { jefenombre = value; }
        }

        public string JefeAPaterno
        {
            get { return jefeapaterno; }
            set { jefeapaterno = value; }
        }

        public string JefeAMaterno
        {
            get { return jefeamaterno; }
            set { jefeamaterno = value; }
        }

        public string EmpresaAnterior
        {
            get { return empresaanterior; }
            set { empresaanterior = value; }
        }

        public string ConyugeNombre
        {
            get { return conyugenombre; }
            set { conyugenombre = value; }
        }

        public string ConyugeAPaterno
        {
            get { return conyugeapaterno; }
            set { conyugeapaterno = value; }
        }

        public string ConyugeAMaterno
        {
            get { return conyugeamaterno; }
            set { conyugeamaterno = value; }
        }

        public Nullable<DateTime> ConyugeFechaNacimiento
        {
            get { return conyugefechanacimiento; }
            set { conyugefechanacimiento = value; }
        }

        public Nullable<byte> ConyugeEdad
        {
            get { return conyugeedad; }
            set { conyugeedad = value; }
        }

        public string ConyugeRFC
        {
            get { return conyugerfc; }
            set { conyugerfc = value; }
        }

        public string ConyugeTelefono
        {
            get { return conyugetelefono; }
            set { conyugetelefono = value; }
        }

        public string ConyugeTelefonoMovil
        {
            get { return conyugetelefonomovil; }
            set { conyugetelefonomovil = value; }
        }

        public string ConyugeCalle
        {
            get { return conyugecalle; }
            set { conyugecalle = value; }
        }

        public string ConyugeEntreCalles
        {
            get { return conyugeentrecalles; }
            set { conyugeentrecalles = value; }
        }

        public string ConyugeNoExterior
        {
            get { return conyugenoexterior; }
            set { conyugenoexterior = value; }
        }

        public string ConyugeNoInterior
        {
            get { return conyugenointerior; }
            set { conyugenointerior = value; }
        }

        public string ConyugeEstado
        {
            get { return conyugeestado; }
            set { conyugeestado = value; }
        }

        public string ConyugeMunicipio
        {
            get { return conyugemunicipio; }
            set { conyugemunicipio = value; }
        }

        public string ConyugeColonia
        {
            get { return conyugecolonia; }
            set { conyugecolonia = value; }
        }

        public Nullable<int> ConyugeCodigoPostal
        {
            get { return conyugecodigopostal; }
            set { conyugecodigopostal = value; }
        }

        public Nullable<byte> ConyugeAntiguedad
        {
            get { return conyugeantiguedad; }
            set { conyugeantiguedad = value; }
        }

        public Nullable<short> ConyugeIngresos
        {
            get { return conyugeingresos; }
            set { conyugeingresos = value; }
        }

        public Nullable<short> ConyugeOtrosIngresos
        {
            get { return conyugeotrosingresos; }
            set { conyugeotrosingresos = value; }
        }

        public string ConyugeConcepto
        {
            get { return conyugeconcepto; }
            set { conyugeconcepto = value; }
        }

        public string ConyugeEmpresa
        {
            get { return conyugeempresa; }
            set { conyugeempresa = value; }
        }

        public string ConyugePuesto
        {
            get { return conyugepuesto; }
            set { conyugepuesto = value; }
        }

        public string ConyugeEmpresaCalle
        {
            get { return conyugeempresacalle; }
            set { conyugeempresacalle = value; }
        }

        public string ConyugeEmpresaEntreCalles
        {
            get { return conyugeempresaentrecalles; }
            set { conyugeempresaentrecalles = value; }
        }

        public string ConyugeEmpresaNoExterior
        {
            get { return conyugeempresanoexterior; }
            set { conyugeempresanoexterior = value; }
        }

        public string ConyugeEmpresaNoInterior
        {
            get { return conyugeempresanointerior; }
            set { conyugeempresanointerior = value; }
        }

        public string ConyugeEmpresaColonia
        {
            get { return conyugeempresacolonia; }
            set { conyugeempresacolonia = value; }
        }

        public Nullable<int> ConyugeEmpresaCodigoPostal
        {
            get { return conyugeempresacodigopostal; }
            set { conyugeempresacodigopostal = value; }
        }

        public string ConyugeEmpresaEstado
        {
            get { return conyugeempresaestado; }
            set { conyugeempresaestado = value; }
        }

        public string ConyugeEmpresaMunicipio
        {
            get { return conyugeempresamunicipio; }
            set { conyugeempresamunicipio = value; }
        }

        public string ConyugeEmpresaJefeNombre
        {
            get { return conyugeempresajefenombre; }
            set { conyugeempresajefenombre = value; }
        }

        public string ConyugeEmpresaJefeAPaterno
        {
            get { return conyugeempresajefeapaterno; }
            set { conyugeempresajefeapaterno = value; }
        }

        public string ConyugeEmpresaJefeAMaterno
        {
            get { return conyugeempresajefeamaterno; }
            set { conyugeempresajefeamaterno = value; }
        }

        public string AvalNombre
        {
            get { return avalnombre; }
            set { avalnombre = value; }
        }

        public string AvalAPaterno
        {
            get { return avalapaterno; }
            set { avalapaterno = value; }
        }

        public string AvalAMaterno
        {
            get { return avalamaterno; }
            set { avalamaterno = value; }
        }

        public bool AvalSocio
        {
            get { return avalsocio; }
            set { avalsocio = value; }
        }

        public string AvalEstadoCivil
        {
            get { return avalestadocivil; }
            set { avalestadocivil = value; }
        }

        public string AvalRegistroMatrimonial
        {
            get { return avalregistromatrimonial; }
            set { avalregistromatrimonial = value; }
        }

        public string AvalCalle
        {
            get { return avalcalle; }
            set { avalcalle = value; }
        }

        public string AvalEntreCalles
        {
            get { return avalentrecalles; }
            set { avalentrecalles = value; }
        }

        public string AvalNoExterior
        {
            get { return avalnoexterior; }
            set { avalnoexterior = value; }
        }

        public string AvalNoInterior
        {
            get { return avalnointerior; }
            set { avalnointerior = value; }
        }

        public string AvalColonia
        {
            get { return avalcolonia; }
            set { avalcolonia = value; }
        }

        public Nullable<int> AvalCodigoPostal
        {
            get { return avalcodigopostal; }
            set { avalcodigopostal = value; }
        }

        public string AvalEstado
        {
            get { return avalestado; }
            set { avalestado = value; }
        }

        public string AvalMunicipio
        {
            get { return avalmunicipio; }
            set { avalmunicipio = value; }
        }

        public string AvalTelefono
        {
            get { return avaltelefono; }
            set { avaltelefono = value; }
        }

        public string AvalTelefonoMovil
        {
            get { return avaltelefonomovil; }
            set { avaltelefonomovil = value; }
        }

        public Nullable<byte> AvalAntiguedad
        {
            get { return avalantiguedad; }
            set { avalantiguedad = value; }
        }

        public bool AvalCasaPropia
        {
            get { return avalcasapropia; }
            set { avalcasapropia = value; }
        }

        public string AvalTipoCasa
        {
            get { return avaltipocasa; }
            set { avaltipocasa = value; }
        }

        public string AvalCalleAnterior
        {
            get { return avalcalleanterior; }
            set { avalcalleanterior = value; }
        }

        public string AvalNoExteriorAnterior
        {
            get { return avalnoexterioranterior; }
            set { avalnoexterioranterior = value; }
        }

        public string AvalNoInteriorAnterior
        {
            get { return avalnointerioranterior; }
            set { avalnointerioranterior = value; }
        }

        public string AvalColoniaAnterior
        {
            get { return avalcoloniaanterior; }
            set { avalcoloniaanterior = value; }
        }

        public Nullable<int> AvalCodigoPostalAnterior
        {
            get { return avalcodigopostalanterior; }
            set { avalcodigopostalanterior = value; }
        }

        public string AvalEntreCallesAnterior
        {
            get { return avalentrecallesanterior; }
            set { avalentrecallesanterior = value; }
        }

        public string AvalEmpresa
        {
            get { return avalempresa; }
            set { avalempresa = value; }
        }

        public string AvalEmpresaJefeNombre
        {
            get { return avalempresajefenombre; }
            set { avalempresajefenombre = value; }
        }

        public string AvalEmpresaJefeAPaterno
        {
            get { return avalempresajefeapaterno; }
            set { avalempresajefeapaterno = value; }
        }

        public string AvalEmpresaJefeAMaterno
        {
            get { return avalempresajefeamaterno; }
            set { avalempresajefeamaterno = value; }
        }

        public string AvalEmpresaPuesto
        {
            get { return avalempresapuesto; }
            set { avalempresapuesto = value; }
        }

        public byte AvalEmpresaAntiguedad
        {
            get { return avalempresaantiguedad; }
            set { avalempresaantiguedad = value; }
        }

        public int AvalEmpresaIngresos
        {
            get { return avalempresaingresos; }
            set { avalempresaingresos = value; }
        }

        public Nullable<int> AvalEmpresaOtrosIngresos
        {
            get { return avalempresaotrosingresos; }
            set { avalempresaotrosingresos = value; }
        }

        public string AvalEmpresaConcepto
        {
            get { return avalempresaconcepto; }
            set { avalempresaconcepto = value; }
        }

        public string AvalEmpresaTelefono
        {
            get { return avalempresatelefono; }
            set { avalempresatelefono = value; }
        }

        public Nullable<short> AvalEmpresaTelefonoExt
        {
            get { return avalempresatelefonoext; }
            set { avalempresatelefonoext = value; }
        }

        public bool AvalEmpresaPropietario
        {
            get { return avalempresapropietario; }
            set { avalempresapropietario = value; }
        }

        public string AvalEmpresaTipo
        {
            get { return avalempresagiro; }
            set { avalempresagiro = value; }
        }

        public string AvalEmpresaAnterior
        {
            get { return avalempresaanterior; }
            set { avalempresaanterior = value; }
        }

        public int Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }

        public short Plazo
        {
            get { return plazo; }
            set { plazo = value; }
        }

        public string FormaPago
        {
            get { return formapago; }
            set { formapago = value; }
        }

        public string DestinoPrestamo
        {
            get { return destinoprestamo; }
            set { destinoprestamo = value; }
        }

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public string TablaAmortizacion
        {
            get { return tablaamortizacion; }
            set { tablaamortizacion = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        public string UsuarioAlta
        {
            get { return usuarioalta; }
            set { usuarioalta = value; }
        }

        public DateTime FechaModificacion
        {
            get { return fechamodificacion; }
            set { fechamodificacion = value; }
        }

        public string UsuarioModificacion
        {
            get { return usuariomodificacion; }
            set { usuariomodificacion = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
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

        public DateTime Inicio
        {
            get { return inicio; }
            set { inicio = value; }
        }

        public DateTime Fin
        {
            get { return fin; }
            set { fin = value; }
        }

        #endregion
    }
}
