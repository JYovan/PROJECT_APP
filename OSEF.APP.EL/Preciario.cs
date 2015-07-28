using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Preciarios
    /// </summary>
    public class Preciario
    {
        #region Campos

        string id;
        string descripcion;
        string sucursal;
        string archivo;
        string usuario;
        string estatus;
        string cliente;
        Cliente rcliente;

        DateTime fechaalta;
        
        Sucursal rsucursal;
        List<PreciarioCategoria> rpreciariocategorias;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public string Sucursal
        {
            get { return sucursal; }
            set { sucursal = value; }
        }

        public string Archivo
        {
            get { return archivo; }
            set { archivo = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
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

        public Sucursal RSucursal
        {
            get { return rsucursal; }
            set { rsucursal = value; }
        }

        public List<PreciarioCategoria> RPreciarioCategorias
        {
            get { return rpreciariocategorias; }
            set { rpreciariocategorias = value; }
        }

        public string Cliente
        {
            get { return cliente; }
            set { cliente = value; }
        }
        public Cliente RCliente
        {
            get { return rcliente; }
            set { rcliente = value; }
        }
        #endregion
    }
}
