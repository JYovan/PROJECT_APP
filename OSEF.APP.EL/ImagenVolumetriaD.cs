using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de ImagenesVolumetriasD
    /// </summary>
    public class ImagenVolumetriaD
    {
        #region Campos

        int volumetria;
        string preciarioconcepto;
        string nombre;
        string direccion;
        string usuario;
        DateTime fechaalta;

        #endregion

        #region Propiedades

        public int Volumetria
        {
            get { return volumetria; }
            set { volumetria = value; }
        }

        public string PreciarioConcepto
        {
            get { return preciarioconcepto; }
            set { preciarioconcepto = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        #endregion
    }
}
