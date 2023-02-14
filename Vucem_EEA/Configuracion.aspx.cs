using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using UserModels;
using Business_;
namespace Vucem_EEA
{
    public partial class Configuracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetConfig();
                Usuarios us = (Usuarios)Session["usuariologueado"];
                Session.Timeout = 1;
                //Master.Attributes.CssStyle.Add("");
               

                if (us != null)
                {
                    
                    if ("Usuario".Equals(us.Rol))
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                }
                else
                {
                    Session["usuariologueado"] = us;
                    Response.Redirect("Login.aspx");

                }
            }
        }
        #region "metodos"
        public DataTable GetDataConfig()
        {
            DataTable config_DT = new DataTable();
            config_DT.Columns.Add("Nombre_conf");
            config_DT.Columns.Add("Domicilio_conf");
            config_DT.Columns.Add("Nint_conf");
            config_DT.Columns.Add("Next_conf");
            config_DT.Columns.Add("Municipio_conf");
            config_DT.Columns.Add("Localidad_conf");
            config_DT.Columns.Add("Entidad_conf");
            config_DT.Columns.Add("RFC_conf");
            config_DT.Columns.Add("Siglas_conf");
            config_DT.Columns.Add("Tel_conf");
            config_DT.Columns.Add("CP_conf");
            config_DT.Columns.Add("Colonia_conf");



            config_DT.Rows.Add("GSC", "MISIONES", "1", "1", "Juarez", "Juarez", "Chihuahua", "345432POSDF ", "GSC  ", "65612345", " 32222 ", "MISIONES");


            return config_DT;
        }
        public void GetConfig()
        {
            DataTable config_DT = GetDataConfig();
            Config_GV.DataSource = config_DT;
            Config_GV.DataBind();
        }
        #endregion
    }
}