﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class VolumetriaD
    {
        #region campos
        int volumetria;
        short renglon;
        string conceptoID;
        decimal cantidad;
        decimal utilizada; 
        string clave;

        int croquis;
        int fotos;
        #endregion

        #region propiedades
        public int Volumetria
        {
            get { return volumetria; }
            set { volumetria = value; }
        }

        public string Clave
        {
            get { return clave; }
            set { clave = value; }
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

        public decimal Utilizada
        {
            get { return utilizada; }
            set { utilizada = value; }
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
  
        #endregion

    }
}
