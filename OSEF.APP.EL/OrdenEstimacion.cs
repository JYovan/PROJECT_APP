using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de OrdenEstimacion
    /// </summary>
    public class OrdenEstimacion
    {
        #region Campos

        int id;
        string mov;
        string movid;
        string sucursal;
        Nullable<DateTime> fechaemision;
        string observaciones;
        string estatus;
        string origen;
        string origenid;
        string usuario;
        string reporte;
        string division;
        Nullable<DateTime> fechaorigen;
        Nullable<DateTime> fechamaximaatencion;
        decimal diasatencion;
        string reporto;
        string trabajorequerido;
        string trabajorealizado;
        string codigofalla;
        Nullable<DateTime> fechallegada;
        Nullable<DateTime> horallegada;
        Nullable<DateTime> fechafinActividad;
        Nullable<DateTime> horafinactividad;
        string cuadrilla;
        decimal importetotal;
        Nullable<DateTime> Horaorigen;
        string Rutaimagen;
        string atendido;
        string noorden;
        string referenciaorden;
        string clasificacion; 
        bool facturado;
        string cliente;
        Cliente Rcliente;


      

        Sucursal rsucursal;
        List<OrdenEstimacionD> rordenestimaciond;
        Cuadrilla rcuadrilla;

        
        #endregion

        #region Propiedades

        public int Id
        {
            get { return id; }
            set { id = value; }
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

        public Sucursal RSucursal
        {
            get { return rsucursal; }
            set { rsucursal = value; }
        }

        public List<OrdenEstimacionD> ROrdenEstimacionD
        {
            get { return rordenestimaciond; }
            set { rordenestimaciond = value; }
        }


        public Cuadrilla RCuadrilla
        {
            get { return rcuadrilla; }
            set { rcuadrilla = value; }
        }
        public Nullable<DateTime> HoraOrigen
        {
            get { return Horaorigen; }
            set { Horaorigen = value; }
        }

        public string RutaImagen
        {
            get { return Rutaimagen; }
            set { Rutaimagen = value; }
        }

        public string Atendido
        {
            get { return atendido; }
            set { atendido = value; }
        }

        public string NoOrden
        {
            get { return noorden; }
            set { noorden = value; }
        }


        public string ReferenciaOrden
        {
            get { return referenciaorden; }
            set { referenciaorden = value; }
        }
         
        public string Clasificacion
        {
            get { return clasificacion; }
            set { clasificacion = value; }
        }

        public bool Facturado
        {
            get { return facturado; }
            set { facturado = value; }
        }

        public string Cliente
        {
            get { return cliente; }
            set { cliente = value; }
        }
        public Cliente RCliente
        {
            get { return Rcliente; }
            set { Rcliente = value; }
        }

        #endregion
    }
}
