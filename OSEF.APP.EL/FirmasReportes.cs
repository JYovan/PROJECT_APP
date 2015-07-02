using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class FirmasReportes
    {
        #region Campos

        string firmaAutorizo;
        string firmaReviso;
        string modulo;

        #endregion

        #region Propiedades

        public string FirmaAutorizo
        {
            get { return firmaAutorizo; }
            set { firmaAutorizo = value; }
        }
                public string FirmaReviso
        {
            get { return firmaReviso; }
            set { firmaReviso = value; }
        }
                public string Modulo
        {
            get { return modulo; }
            set { modulo = value; }
        }
        #endregion
    }
}

