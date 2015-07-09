using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;
using System.IO;
using System.Data.OleDb;
using System.Data;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaPreciario : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Primer solicitud
            if (!X.IsAjaxRequest)
            {
                //2. Cargar sucursales
            }
        }

        /// <summary>
        /// Evento que se lanza al escoger un elemento de Sucursales
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbSucursales_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el Preciario seleccionado y obtener sus datos junto con su sucursal
            string strSucursal = e.ExtraParams["valor"];

            //2. Validar si se escocoge una usucursal ya usada
            if (SucursalBusiness.ObtenerSucursalesEnPreciariosPorID(strSucursal))
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "true", ParameterMode.Raw));
            else
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("existe", "false", ParameterMode.Raw));
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];
            string strEstatus = e.ExtraParams["estatus"];
            string strArchivo = e.ExtraParams["archivo"];
            string strSucursal = e.ExtraParams["sucursal"];
            
            string strcookieEditarPreciario = Cookies.GetCookie("cookieEditarPreciario").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            string strPreciarioDetalle = e.ExtraParams["DetallePreciario"];

            //2. Se guarda en una lista el Store que contiene todos los campos para deserealizarlos y usarlos para el insert
            List<PreciarioConcepto> lDetallePreciario = JSON.Deserialize<List<PreciarioConcepto>>(strPreciarioDetalle);
            Preciario oPreciario = new Preciario();




            //3. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //4. Datos del preciario
                    case "txtfID":
                        oPreciario.ID = sd.Value;
                        break;
                    case "txtfDescripcion":
                        oPreciario.Descripcion = sd.Value;
                        break;
                    case "cmbEstatus":
                        oPreciario.Estatus = sd.Value;
                        break;
                }
            }

            //5. Se toma el nombre del archivo de Excel que se está cargando
            oPreciario.Archivo = fufArchivoExcel.FileName;

            //6. Validar si es nuevo o es uno existente
            if (strcookieEditarPreciario.Equals("Nuevo"))
            {
                //Checar ticket de autenticación
                UsuarioBusiness.checkValidSession(this);


                //7. Traemeos el objeto de sesion para llenr el objeto con los datos de usuario
                oPreciario.FechaAlta = DateTime.Now;
                Usuario oUsuario = (Usuario)Session["Usuario"];
                oPreciario.Usuario = oUsuario.ID;
                oPreciario.Estatus = strEstatus;
                oPreciario.Sucursal = strSucursal;

                //8. Insertar en la base de datos
                oPreciario.ID = PreciarioBusiness.Insertar(oPreciario);
                string categoria = "";
                string subcategoria = "";
                string subsubcategoria = "";

                foreach (PreciarioConcepto sd in lDetallePreciario) 
                {
                    //9. Insertar Categoria
                    if (sd.Tipo.Equals("1")) 
                    {
                        PreciarioCategoria c = new PreciarioCategoria();
                        c.Clave = sd.Clave;
                        c.Preciario = oPreciario.ID;
                        c.Descripcion = sd.Descripcion;
                        c.Usuario = oUsuario.ID;
                        c.Estatus = sd.Estatus;
                        c.FechaAlta = sd.FechaAlta;
                        categoria =PreciarioCategoriaBuisness.Insertar(c);
                    }
                    //10. Insertar SubCategoria
                    if (sd.Tipo.Equals("2"))
                    {
                        PreciarioSubCategoria sc = new PreciarioSubCategoria();
                        sc.Clave = sd.Clave;
                        sc.Preciario = oPreciario.ID;
                        sc.Descripcion = sd.Descripcion;
                        sc.Categoria = categoria;
                        sc.Usuario = oUsuario.ID;
                        sc.Estatus = sd.Estatus;
                        sc.FechaAlta = sd.FechaAlta;
                        subcategoria= PreciarioSubCategoriaBusiness.Insertar(sc);
                    }
                    //11. Insertar SubSubCategoria
                    if (sd.Tipo.Equals("3"))
                    {
                        PreciarioSubSubCategoria ssc = new PreciarioSubSubCategoria();
                        ssc.Clave = sd.Clave;
                        ssc.Preciario = oPreciario.ID;
                        ssc.Descripcion = sd.Descripcion;
                        ssc.Categoria = categoria;
                        ssc.SubCategoria = subcategoria;
                        ssc.Usuario = oUsuario.ID;
                        ssc.Estatus = sd.Estatus;
                        ssc.FechaAlta = sd.FechaAlta;
                        subsubcategoria= PreciarioSubSubCategoriaBusiness.Insertar(ssc);
                    }
                    //12. Insertar Concepto
                    if (sd.Tipo.Equals(""))
                    {
                        PreciarioConcepto pc = new PreciarioConcepto();
                        pc.Clave = sd.Clave;
                        pc.Preciario = oPreciario.ID;
                        pc.Descripcion = sd.Descripcion;
                        pc.Unidad = sd.Unidad;
                        pc.Cantidad = sd.Cantidad;
                        pc.Utilizada = 0;
                        pc.Costo = sd.Costo;
                        pc.Importe = sd.Importe;
                        pc.Importefinal = 0;
                        pc.Categoria = categoria;
                        pc.SubCategoria = subcategoria;
                        pc.SubSubCategoria = subsubcategoria;
                        pc.Usuario = oUsuario.ID;
                        pc.Estatus = sd.Estatus;
                        pc.FechaAlta = sd.FechaAlta;
                        PreciarioConceptoBusiness.Insertar(pc);
                    }                
                }

                //13. Mandar mensaje con el código del Preciario
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Registro completo", "<p align='center'>Preciario registrada con ID: <br/>" + oPreciario.ID + ".</p>", success).Show();
            }
            else
            {
                //14. Valida que archivo guardar
                if (fufArchivoExcel.FileName.Equals(""))
                    oPreciario.Archivo = strArchivo;
                else
                    oPreciario.Archivo = fufArchivoExcel.FileName;

                //15. Tomamos la sucursal y estatus como parametro independiente por que ya esta desabilitada
                oPreciario.ID = strcookieEditarPreciario;
                oPreciario.Sucursal = strSucursal;
                oPreciario.Estatus = strEstatus;

                //16. Actualizar los datos del Preciario
                PreciarioBusiness.Actualizar(oPreciario);

                //17. Mandar mensaje con el código del preciario
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos del preciario <br/>" + oPreciario.ID + ".</p>", success).Show();
            }
        }

        ///// <summary>
        ///// Evento que se lanza al cargar el store
        ///// </summary>
        //[DirectMethod]
        public void sPreciario_Load(object sender, DirectEventArgs e)
        {
            string strcookieEditarPreciario = Cookies.GetCookie("cookieEditarPreciario").Value;
            if (!strcookieEditarPreciario.Equals("Nuevo"))
            {
                Preciario oPreciario = PreciarioBusiness.ObtenerPreciarioPorID(strcookieEditarPreciario);


                sPreciario.Add(new
                {
                    ID = oPreciario.ID,
                    Descripcion = oPreciario.Descripcion,
                    Sucursal = oPreciario.Sucursal,
                    RSucursal = oPreciario.RSucursal,
                    Archivo = oPreciario.Archivo,
                    Estatus = oPreciario.Estatus,
                    FechaAlta = oPreciario.FechaAlta,
                    Usuario = oPreciario.Usuario

                });


                //Cargar el detalle del movimiento
                sCarga.DataSource = PreciarioConceptoBusiness.ObtenerPreciarioConceptoPorPreciario(oPreciario.ID);
                sCarga.DataBind();
            }
        }


        //Evento que se lanza al dar click en el boton de Cargar
        public void btnImportar_Click(object sender, DirectEventArgs e)
        {
            //Se limpian las variables para si se equivocan de preciario puedan cargar otro archivo de excel
            sCarga.DataSource = "";
            sCarga.RemoveAll();
            string conexion = "";
            //Se obtiene la extension del archivo de excel para saber que controlador usar segun la version del Office
            string validaDoc = Path.GetExtension(Server.MapPath(" ") + "\\adjuntos\\" + fufArchivoExcel.FileName);

            //se verifica si existe el archivo en la ruta del proyecto si existe se sobreescribe, si no, se guarda a la carpeta de adjuntos
            if (File.Exists(Server.MapPath(" ") + "\\adjuntos\\" + fufArchivoExcel.FileName))
            {

                File.Delete(Server.MapPath(" ") + "\\adjuntos\\" + fufArchivoExcel.FileName);
                fufArchivoExcel.PostedFile.SaveAs(Server.MapPath(" ") + "\\adjuntos\\" + fufArchivoExcel.FileName);
            }
            else
            {
                fufArchivoExcel.PostedFile.SaveAs(Server.MapPath(" ") + "\\adjuntos\\" + fufArchivoExcel.FileName);
            }

            //se selecciona el controlador en base a la extencion
            if (validaDoc.Equals(".xls"))
            {
                conexion = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath(" ") + "\\adjuntos\\" + fufArchivoExcel.FileName + ";Extended Properties=\"Excel 8.0; HDR=Yes\"";
            }
            if (validaDoc.Equals(".xlsx"))
            {
                conexion = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath(" ") + "\\adjuntos\\" + fufArchivoExcel.FileName + ";Extended Properties=\"Excel 12.0; HDR=Yes\"";
            }

            //Se abre la conexion don OleDbConnection para poder leer datos del archivo de excel
            OleDbConnection connExcel = default(OleDbConnection);
            connExcel = new OleDbConnection(conexion);
            //se toma el número de hoja de excel donde se contiene el preciario con un number field
            byte nhoja = Convert.ToByte(nfHoja.Text);

            //Obtener el nombre de la hoja
            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

            //se guarde el nombre de la hoja para poder realizar la consulta
            string SheetName = dtExcelSchema.Rows[nhoja]["TABLE_NAME"].ToString();


            //Valores permitidos
            List<string> permitidos =new  List<string>(); 
            permitidos.Add("id");
            permitidos.Add("Concepto");
            permitidos.Add("Unidad");
            permitidos.Add("Cantidad");
            permitidos.Add("Precio");
            permitidos.Add("Importe");
            permitidos.Add("Tipo");


            //Extraemos e modelo de columnas del excel
            DataTable ExcelValues = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Columns, new object[] { null, null, SheetName, null });
            //Declaramos una lista para meter los nombres de las columnas a comparar
            List<string> lColumnasExcel = new List<string>();
            //Se agregan los nombres a la lista
            foreach (DataRow row in ExcelValues.Rows)
            {
                lColumnasExcel.Add(row["Column_name"].ToString());
            }

            //Se de clara una nueva lista que  manda llamar el metodo que compara y devuelve las columnas que no coinciden
            List<string> lValoresDiferentes = Comparator(lColumnasExcel, permitidos);

            //Si el validador devuelve 0 registros sin coincidir realiza la operacion
            if (lValoresDiferentes.Count() == 0)
            {
                //Se declara el objeto de comando que se encargará de realizar la consulta
                OleDbCommand seleccion = default(OleDbCommand);
                seleccion = new OleDbCommand("Select id, Concepto, Unidad, Cantidad, Precio, Importe, Tipo From [" + SheetName + "]", connExcel);
                //Se ejecuta la consulta
                OleDbDataAdapter adaptador = new OleDbDataAdapter();
                adaptador.SelectCommand = seleccion;

                //Se llena el DataSet con lo que devolvió el adaptador
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                //Variables Auxiliares para traer las categorias y declarar las fechas y estatus con los que se guarda el documento
                string categoria = "";
                string scategoria = "";
                string sscategoria = "";
                DateTime FechaAlta = DateTime.Now;
                string strEstatus = "ACTIVO";
                // Por cada tabla en el DataSet, imprime los valores de cada renglon
                foreach (DataTable thisTable in ds.Tables)
                {
                    //Por cada renglon imprime los valores de cada columna
                    foreach (DataRow row in thisTable.Rows)
                    {
                        //Columna auxiliar que nos permitirá saber si es Categoria, Subcategoria, subsubCategoria o concepto
                        if (row["Tipo"].ToString().Equals("1"))
                        {
                            //LLenamos la variable auxiliar con el Id de la Categoria, Subcategoria, subsubCategoria
                            categoria = row["id"].ToString();
                            //Agrega los datos del excell al store
                            sCarga.Add(new
                            {
                                Clave = row["Id"],
                                Descripcion = row["Concepto"],
                                Unidad = row["Unidad"],
                                Cantidad = row["Cantidad"],
                                Utilizada = 0,
                                Costo = row["Precio"],
                                Importe = row["Importe"],
                                Importefinal = 0,
                                Categoria = "",
                                Subcategoria = "",
                                SubSubCategoria = "",
                                FechaAlta = FechaAlta,
                                Estatus = strEstatus,
                                Tipo = row["Tipo"]

                            });

                        }

                        if (row["Tipo"].ToString().Equals("2"))
                        {
                            scategoria = row["id"].ToString();

                            sCarga.Add(new
                            {
                                Clave = row["Id"],
                                Descripcion = row["Concepto"],
                                Unidad = row["Unidad"],
                                Cantidad = row["Cantidad"],
                                Utilizada = 0,
                                Costo = row["Precio"],
                                Importe = row["Importe"],
                                ImporteFinal = 0,
                                Categoria = categoria,
                                SubCategoria = "",
                                SubSubCategoria = "",
                                FechaAlta = FechaAlta,
                                Estatus = strEstatus,
                                Tipo = row["Tipo"]

                            });

                        }
                        if (row["Tipo"].ToString().Equals("3"))
                        {
                            sscategoria = row["id"].ToString();

                            sCarga.Add(new
                            {
                                Clave = row["Id"],
                                Descripcion = row["Concepto"],
                                Unidad = row["Unidad"],
                                Cantidad = row["Cantidad"],
                                Utilizada = 0,
                                Costo = row["Precio"],
                                Importe = row["Importe"],
                                Importefinal = 0,
                                Categoria = categoria,
                                SubCategoria = scategoria,
                                SubSubCategoria = "",
                                FechaAlta = FechaAlta,
                                Estatus = strEstatus,
                                Tipo = row["Tipo"]

                            });

                        }

                        if (row["Tipo"].ToString().Equals(""))
                        {

                            sCarga.Add(new
                            {
                                Clave = row["Id"],
                                Descripcion = row["Concepto"],
                                Unidad = row["Unidad"],
                                Cantidad = row["Cantidad"],
                                Utilizada = 0,
                                Costo = row["Precio"],
                                Importe = row["Importe"],
                                Importefinal = 0,
                                Categoria = categoria,
                                SubCategoria = scategoria,
                                SubSubCategoria = sscategoria,
                                FechaAlta = FechaAlta,
                                Estatus = strEstatus,
                                Tipo = row["Tipo"]

                            });
                        }

                    }//Fin del for que recorre los renglones
                }
                //cerramos la conexion con el adaptador de excel
                connExcel.Close();
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "ok", ParameterMode.Value));
            }
            //Caso contrario no hace nada y devuelve los valores sin coincidencia
            else {

                string id = JSON.Serialize(lValoresDiferentes);
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "error", ParameterMode.Value));
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", id , ParameterMode.Value));

           
                connExcel.Close();
            }

        }



        public static List<string> Comparator(List<string> lsubidos, List<string> lpermitidos)
        {
            IEnumerable<string> differenceQuery = lsubidos.Except(lpermitidos);
            List<string> ldiferentes = new List<string>();

            foreach (string s in differenceQuery)
                ldiferentes.Add(s);

            return ldiferentes;
        }

    }
}