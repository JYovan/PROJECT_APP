using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que contiene los campos de la tabla Participante
    /// </summary>
    public class Participante
    {
        #region Fields

        string id;
        string nombre;
        string amaterno;
        string apaterno;
        DateTime fechanacimiento;
        byte edad;
        string genero;
        string estado;
        string ciudad;
        string telefono;
        string celular;
        string email;
        byte tipoparticipante;
        string otrotipoparticipante;
        string nombreempresa;
        string puesto;
        string area;
        bool factura;
        short empresa;
        bool pagado;

        #endregion

        #region Properties

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

        public DateTime FechaNacimiento
        {
            get { return fechanacimiento; }
            set { fechanacimiento = value; }
        }

        public byte Edad
        {
            get { return edad; }
            set { edad = value; }
        }

        public string Genero
        {
            get { return genero; }
            set { genero = value; }
        }

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }

        public string Ciudad
        {
            get { return ciudad; }
            set { ciudad = value; }
        }

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }

        public string Celular
        {
            get { return celular; }
            set { celular = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public byte TipoParticipante
        {
            get { return tipoparticipante; }
            set { tipoparticipante = value; }
        }

        public string OtroTipoParticipante
        {
            get { return otrotipoparticipante; }
            set { otrotipoparticipante = value; }
        }

        public string NombreEmpresa
        {
            get { return nombreempresa; }
            set { nombreempresa = value; }
        }

        public string Puesto
        {
            get { return puesto; }
            set { puesto = value; }
        }

        public string Area
        {
            get { return area; }
            set { area = value; }
        }

        public bool Factura
        {
            get { return factura; }
            set { factura = value; }
        }

        public short Empresa
        {
            get { return empresa; }
            set { empresa = value; }
        }

        public bool Pagado
        {
            get { return pagado; }
            set { pagado = value; }
        }

        #endregion
    }
}
