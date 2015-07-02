using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de AhorrosD
    /// </summary>
    public class AhorroD
    {
        #region Campos

        int ahorro;
        byte renglon;
        string articulo;
        decimal saldoanterior;
        decimal importe;
        decimal saldo;

        #endregion

        #region Propiedades

        public int Ahorro
        {
            get { return ahorro; }
            set { ahorro = value; }
        }

        public byte Renglon
        {
            get { return renglon; }
            set { renglon = value; }
        }

        public string Articulo
        {
            get { return articulo; }
            set { articulo = value; }
        }

        public decimal SaldoAnterior
        {
            get { return saldoanterior; }
            set { saldoanterior = value; }
        }

        public decimal Importe
        {
            get { return importe; }
            set { importe = value; }
        }

        public decimal Saldo
        {
            get { return saldo; }
            set { saldo = value; }
        }

        #endregion
    }
}
