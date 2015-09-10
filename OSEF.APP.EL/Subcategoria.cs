using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de SubCategorias
    /// </summary>
    public class Subcategoria
    {
        #region Campos

        string id;
        byte orden;
        string descripcion;
        string categoriaidraw;

        Categoria rcategoria;
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

        public string CategoriaIdRaw
        {
            get { return categoriaidraw; }
            set { categoriaidraw = value; }
        }

        public Categoria RCategoria
        {
            get { return rcategoria; }
            set { rcategoria = value; }
        }

        public List<Concepto> RConcepto
        {
            get { return rconcepto; }
            set { rconcepto = value; }
        }

        #endregion
    }
}
