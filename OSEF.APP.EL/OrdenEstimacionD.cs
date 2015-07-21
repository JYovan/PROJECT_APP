using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que manipulo la clase de OrdenEstimacionD
    /// </summary>
    public class OrdenEstimacionD
    {

        #region Campos

        int id;
        short renglon;
        string conceptoID;
        decimal cantidad;
        string unidad;
        decimal precio;
        decimal importe;
        string moneda;
        int fotos;
        int croquis;
        int facturas;

        string clave;
        OrdenEstimacion rmovimiento;

        string intext;

     
        #endregion

        #region Propiedades
        public int Id
        {
            get { return id; }
            set { id = value; }
        }


        public short Renglon
        {
            get { return renglon; }
            set { renglon = value; }
        }

        public string ConceptoID
        {
            get { return conceptoID; }
            set { conceptoID = value; }
        }


        public decimal Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }


        public string Unidad
        {
            get { return unidad; }
            set { unidad = value; }
        }


        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }

        public decimal Importe
        {
            get { return importe; }
            set { importe = value; }
        }

        public string Clave
        {
            get { return clave; }
            set { clave = value; }
        }

        public OrdenEstimacion RMovimiento
        {
            get { return rmovimiento; }
            set { rmovimiento = value; }
        }

        public string IntExt
        {
            get { return intext; }
            set { intext = value; }
        }

        public string Moneda
        {
            get { return moneda; }
            set { moneda = value; }
        }
        public int Fotos
        {
            get { return fotos; }
            set { fotos = value; }
        }
        public int Croquis
        {
            get { return croquis; }
            set { croquis = value; }
        }
        public int Facturas
        {
            get { return facturas; }
            set { facturas = value; }
        }
        #endregion
    }
}
