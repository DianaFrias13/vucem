using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Vucem_EEA
{
    public partial class xPedimento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getPedimento();
        }
            public void getPedimento()
        { 
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[4] { new DataColumn("Archivo", typeof(string)),
                    new DataColumn("Fecha",typeof(string)),
                    new DataColumn("TipoDoc",typeof(string)),
                            new DataColumn("Descargar", typeof(string))


                         });
                dt.Rows.Add("1890-1000456 ", "14-05-2021", "Pedimento completo", "1");
                dt.Rows.Add("Cove12001nz20", "14-05-2021", "COVE", "1");
                dt.Rows.Add("ED019865234567 ", "14-05-2021", "ED", "1");

                showPedimentoGV.DataSource = dt;
                showPedimentoGV.DataBind();
        
            }
        }
    }
}