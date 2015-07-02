using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{

    /// <summary>
    /// Clase que controla la entidad de PreciarioGeneralCategoria
    /// </summary>
    public class PreciarioGeneralCategoria
    {
        #region Campos

        string id;
        string clave;
        string preciario;
        string descripcion;
        string usuario;
        string estatus;
        Nullable<DateTime> fechaalta;
        string tipo;

        PreciarioGeneralCategoria rcategoria;

        

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Clave
        {
            get { return clave; }
            set { clave = value; }
        }

        public string Preciario
        {
            get { return preciario; }
            set { preciario = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
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

        public Nullable<DateTime> FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public PreciarioGeneralCategoria RCategoria
        {
            get { return rcategoria; }
            set { rcategoria = value; }
        }

        #endregion

    }
}
