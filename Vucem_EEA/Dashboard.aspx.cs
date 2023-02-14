using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_;
using UserModels;

namespace Vucem_EEA
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuarios us = (Usuarios)Session["usuariologueado"];
                Session.Timeout = 1;



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
        
    }
}