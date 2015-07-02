using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class CodigoPostal
    {
        #region Campos
        string id;

        string estado;
        string municipio;
        string colonia;
        int numero;
        Estado restado;
        Municipio rmunicipio;
        Colonia rcolonia;

        #endregion

        #region Propiedades

        public string Id
        {
            get { return id; }
            set { id = value; }
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

        public string Colonia
        {
            get { return colonia; }
            set { colonia = value; }
        } 

        public int Numero
        {
            get { return numero; }
            set { numero = value; }
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

        #endregion
    }
}
