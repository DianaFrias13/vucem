
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Windows;
using System.IO;

using Business_;
using UserModels;
using System.Web.UI.HtmlControls;

namespace Vucem_EEA
{
    public partial class COVE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios us = (Usuarios)Session["usuariologueado"];
            //Session.Timeout = 1;
            if (!this.IsPostBack)
            {
                GetCOVE();
                if (us != null)
                {
                    Session["usuariologueado"] = us;
                    

                }
                else
                {
                    Response.Redirect("Login.aspx");

                }
            }
           

        }
        public DataTable GetDataCOVE()
        {
            DataTable COVE_dt = new DataTable();
            COVE_dt.Columns.Add("NumeroCove");
            COVE_dt.Columns.Add("E-Document");
            COVE_dt.Columns.Add("Identificador");
            COVE_dt.Columns.Add("Pedimento");
            COVE_dt.Columns.Add("Fecha");
            COVE_dt.Columns.Add("USD");
            COVE_dt.Columns.Add("MXN");
            
            COVE_dt.Rows.Add("cove19098", "16327890", "ED", "1890-78990", "10/10/2021","100", "2000");


            return COVE_dt;
            
        }
        public void GetCOVE()
        {
            DataTable COVE_dt = GetDataCOVE();
            CoveEdocGV.PageSize = 10;
            CoveEdocGV.DataSource = COVE_dt;
            CoveEdocGV.DataBind();
        }
        //public void dark()
        //{
        //    AttributeCollection mast = bodymaster.Attributes;
        //    mast.CssStyle.Add("background-color", "#fafafa");
        //    HtmlGenericControl html = (HtmlGenericControl)Page.Master.FindControl("body");
        //    html.Attributes.Add("background-color", "#fafafa");
            
        //    if (Master.bodyy.Attributes.CssStyle.Add("background-color", "#fafafa"))
        //    {
        //        Master.Attributes.CssStyle.Add("background-color", "#fafafa");
        //        MasterPage asd = ((MasterPage)Page.Master).Ul.Attributes.Add("class", "bla");
        //        Master.imgperfil
        //    }
        //}
        


    }
   
    
}