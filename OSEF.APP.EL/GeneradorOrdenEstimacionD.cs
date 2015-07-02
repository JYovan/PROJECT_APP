using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class GeneradorOrdenEstimacionD
    {
        #region Campos

        int movid;
        string conceptoid; 
        string descripcion;
        string eje;
        string entreEje1;
        string entreEje2;
        string area;
        decimal largo;
        decimal ancho;
        decimal alto; 
        decimal cantidad;
        decimal total;
        string plano;

        PreciarioGeneralConcepto rconcepto;


        #endregion

        #region Propiedades

        public int MovID
        {
            get { return movid; }
            set { movid = value; }
        }

        public string ConceptoID
        {
            get { return conceptoid; }
            set { conceptoid = value; }
        }


        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public string Eje
        {
            get { return eje; }
            set { eje = value; }
        }

        public string EntreEje1
        {
            get { return entreEje1; }
            set { entreEje1 = value; }
        }

        public string EntreEje2
        {
            get { return entreEje2; }
            set { entreEje2 = value; }
        }

        public string Area
        {
            get { return area; }
            set { area = value; }
        }

        public decimal Largo
        {
            get { return largo; }
            set { largo = value; }
        }

        public decimal Ancho
        {
            get { return ancho; }
            set { ancho = value; }
        }

        public decimal Alto
        {
            get { return alto; }
            set { alto = value; }
        }

        public decimal Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }

        public decimal Total
        {
            get { return total; }
            set { total = value; }
        }

        public string Plano
        {
            get { return plano; }
            set { plano = value; }
        }
        public PreciarioGeneralConcepto RConcepto
        {
            get { return rconcepto; }
            set { rconcepto = value; }
        }
        #endregion


    }
}
