﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Conceptos
    /// </summary>
    public class Concepto
    {
        #region Campos

        string id;
        short orden;
        string descripcion;
        string categoriaidraw;
        string subcategoriaidraw;
        string tipomov;
        string modulo;
        DateTime fechaalta;
        string estatus;

        Categoria rcategoria;
        Subcategoria rsubcategoria;

        #endregion

        #region Propiedades

        public string Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Modulo
        {
            get { return modulo; }
            set { modulo = value; }
        }

        public short Orden
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

        public string SubCategoriaIdRaw
        {
            get { return subcategoriaidraw; }
            set { subcategoriaidraw = value; }
        }

        public string TipoMov
        {
            get { return tipomov; }
            set { tipomov = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public Categoria RCategoria
        {
            get { return rcategoria; }
            set { rcategoria = value; }
        }

        public Subcategoria RSubCategoria
        {
            get { return rsubcategoria; }
            set { rsubcategoria = value; }
        }

        #endregion
    }
}
