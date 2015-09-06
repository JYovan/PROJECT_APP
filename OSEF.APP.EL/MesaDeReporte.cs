using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    
    /// <summary>
    /// Clase que controla la entidad de MesaDeReporte
    /// </summary>
    public class MesaDeReporte
    {
        #region Campos

        int id;
        string mov;
        string movid;
        string sucursal;
        string idsucursal;
        int cr;

        Nullable<DateTime> fechaemision;
        string observaciones;
        string estatus;
        string origen;
        string origenid;
        string usuario;
        Sucursal rsucursal;
        string reporte;
        string division;
        Nullable<DateTime> fechaorigen;
        Nullable<DateTime> fechamaximaatencion;
        decimal diasatencion;
        string reporto;
        string trabajorequerido;
        string atiende;
        string trabajorealizado;
        string codigofalla;
        string tienefotos;
        string tieneReporte;
        Nullable<DateTime> fechallegada;
        Nullable<DateTime> horallegada;

        Nullable<DateTime> fechafinActividad;
        Nullable<DateTime> horafinactividad;
        string cuadrilla;
        decimal importetotal; 
        bool facturado;
        string clasificacion;
        bool revisado;
        string facturamantenimiento;
        string cliente;
        string idcliente;
        Cliente rcliente;
        #endregion

        #region Propiedades

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int CR
        {
            get { return cr; }
            set { cr = value; }
        }

        public string Mov
        {
            get { return mov; }
            set { mov = value; }
        }

        public string MovID
        {
            get { return movid; }
            set { movid = value; }
        }

        public string Sucursal
        {
            get { return sucursal; }
            set { sucursal = value; }
        }

        public Nullable<DateTime> FechaEmision
        {
            get { return fechaemision; }
            set { fechaemision = value; }
        }

        public string Observaciones
        {
            get { return observaciones; }
            set { observaciones = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public string Origen
        {
            get { return origen; }
            set { origen = value; }
        }

        public string OrigenId
        {
            get { return origenid; }
            set { origenid = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
        public Sucursal RSucursal
        {
            get { return rsucursal; }
            set { rsucursal = value; }
        }

        public string Reporte
        {
            get { return reporte; }
            set { reporte = value; }
        }

        public string Division
        {
            get { return division; }
            set { division = value; }
        }

        public Nullable<DateTime> FechaOrigen
        {
            get { return fechaorigen; }
            set { fechaorigen = value; }
        }

        public Nullable<DateTime> FechaMaximaAtencion
        {
            get { return fechamaximaatencion; }
            set { fechamaximaatencion = value; }
        }

        public decimal DiasAtencion
        {
            get { return diasatencion; }
            set { diasatencion = value; }
        }

        public string Reporto
        {
            get { return reporto; }
            set { reporto = value; }
        }

        public string TrabajoRequerido
        {
            get { return trabajorequerido; }
            set { trabajorequerido = value; }
        }

        public string Atiende
        {
            get { return atiende; }
            set { atiende = value; }
        }

        public string TrabajoRealizado
        {
            get { return trabajorealizado; }
            set { trabajorealizado = value; }
        }

        public string CodigoFalla
        {
            get { return codigofalla; }
            set { codigofalla = value; }
        }

        public string TieneFotos
        {
            get { return tienefotos; }
            set { tienefotos = value; }
        }

        public string TieneReporte
        {
            get { return tieneReporte; }
            set { tieneReporte = value; }
        }

        public Nullable<DateTime> FechaLlegada
        {
            get { return fechallegada; }
            set { fechallegada = value; }
        }
        public Nullable<DateTime> HoraLlegada
        {
            get { return horallegada; }
            set { horallegada = value; }
        }

        public Nullable<DateTime> FechaFinActividad
        {
            get { return fechafinActividad; }
            set { fechafinActividad = value; }
        }


        public Nullable<DateTime> HoraFinActividad
        {
            get { return horafinactividad; }
            set { horafinactividad = value; }
        }

        public string Cuadrilla
        {
            get { return cuadrilla; }
            set { cuadrilla = value; }
        }

        public decimal ImporteTotal
        {
            get { return importetotal; }
            set { importetotal = value; }
        }
        public bool Facturado
        {
            get { return facturado; }
            set { facturado = value; }
        }
        public string Clasificacion
        {
            get { return clasificacion; }
            set { clasificacion = value; }
        }

        public bool Revisado
        {
            get { return revisado; }
            set { revisado = value; }
        }
        public string FacturaMantenimiento
        {
            get { return facturamantenimiento; }
            set { facturamantenimiento = value; }
        }

        public string Cliente
        {
            get { return cliente; }
            set { cliente = value; }
        }

        public Cliente RCliente
        {
            get { return rcliente; }
            set { rcliente = value; }
        }

        public string IdSucursal
        {
            get { return idsucursal; }
            set { idsucursal = value; }
        }

        public string IdCliente
        {
            get { return idcliente; }
            set { idcliente = value; }
        }
        #endregion
    }
}