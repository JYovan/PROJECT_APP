using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;

namespace OSEF.ERP.APP
{
    public partial class Principal2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {

                string path = this.Server.MapPath("");

                var archivo = path + "/gantt-scheduler/data.js";


                if (File.Exists(archivo))
                    File.Delete(archivo);

                using (var fileStream = File.Create(archivo))
                {
                    var texto = new UTF8Encoding(true).GetBytes("");
                    fileStream.Write(texto, 0, texto.Length);
                    fileStream.Flush();
                }



                using (SqlConnection cnn = new SqlConnection("Data Source=localhost;user id=sa;password=Xpertex2014;Initial Catalog=OSEF_ERP"))
                {

                    string query = "SELECT * FROM Categorias";
                    SqlCommand cmd = new SqlCommand(query, cnn);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    GridView1.DataSource = ds;
                    GridView1.DataBind();




                    FileStream fs = new FileStream(path + "/gantt-scheduler/data.js", FileMode.Open, FileAccess.Write);

                    fs.Seek(0, SeekOrigin.Begin);

                    StreamWriter sw = new StreamWriter(fs);

                    string estrctura = "";

                    estrctura = "{\n" +
                                "\"success\" : true, \n" +
                                "\"tasks\" : {\n" +
                                    "\"rows\":[\n" +
                                   "{" +
                                        "\"Name\":\"Probando gantt\",\n" +
                                        "\"StartDate\":\"2010-01-18T08:00:00\",\n" +
                                        "\"EndDate\":\"2010-05-15\",\n" +
                                        "\"children\":[\n";

                    string conceptos = "";


                    int id = ds.Tables[0].Rows.Count;

                    for (int i = 0; i <= 3; i++)
                    {
                        string val = ds.Tables[0].Rows[i]["Descripcion"].ToString();

                        int idP = i + 1;


                        conceptos = conceptos +
                            "{\n" +
                            "\"Id\":" + idP + ",\n" +
                            "\"Name\":\"" + val + "\",\n" +
                            "\"PercentDone\":50,\n" +
                            "\"StartDate\":\"2010-01-18T08:00:00\",\n" +
                            "\"EndDate\":\"2010-01-30\",\n" +
                            "\"TaskType\":\"Important\",\n" +
                            "\"children\":[\n";


                        string categoria = ds.Tables[0].Rows[i]["ID"].ToString();

                        SqlCommand cmd2 = new SqlCommand("select * from SubCategorias where Categoria='" + categoria + "'", cnn);

                        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                        DataSet ds2 = new DataSet();
                        da2.Fill(ds2);


                        int to = ds2.Tables[0].Rows.Count;

                        for (int i2 = 0; i2 <= to - 1; i2++)
                        {


                            id = id + 1;

                            string subcategoria = ds2.Tables[0].Rows[i2]["Descripcion"].ToString();

                            conceptos = conceptos + "{\n" +
                                         "\"Duration\":2,\n" +
                                         "\"Id\":" + id + ",\n" +
                                         "\"Name\":\" " + subcategoria + "  \",\n" +
                                         "\"PercentDone\":50,\n" +
                                         "\"StartDate\":\"2010-01-18T08:00:00\",\n" +
                                         "\"TaskType\":\"LowPrio\",\n" +
                                         "\"leaf\":true\n" +
                                     "}\n";

                            if (i2 <= to - 1) { conceptos = conceptos + ","; }

                        }






                        conceptos = conceptos + "],\n" +
                                     "\"expanded\":true\n" +
                                 "}\n";






                        if (i <= 2) { conceptos = conceptos + ","; }

                    }


                    estrctura = estrctura + conceptos +
                        "  ],\n" +
                   "\"cls\":\"project\",\n" +
                    "\"expanded\":true \n" +
                "}\n" +
            "]\n" +
            "}\n" +
        "}";

                    sw.Write(estrctura);

                    sw.Close();

                    fs.Close();




                }


                Label1.Text = "Correcto";

            }
            catch (Exception)
            {



            }



        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("gantt-scheduler/gantt-scheduler.html");
        }
    }
}