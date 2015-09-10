using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Categorias
    /// </summary>
    public class Categoria
    {
        #region Campos

        string id;
        byte orden;
        string descripcion;

        List<Subcategoria> rsubcategoria;
        List<Concepto> rconcepto;

        #endregion

        #region Propiedades

        public string Id
        {
            get { return id; }
            set { id = value; }
        }

        public byte Orden
        {
            get { return orden; }
            set { orden = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public List<Subcategoria> RSubCategoria
        {
            get { return rsubcategoria; }
            set { rsubcategoria = value; }
        }

        public List<Concepto> RConcepto
        {
            get { return rconcepto; }
            set { rconcepto = value; }
        }

        #endregion
    }
}
