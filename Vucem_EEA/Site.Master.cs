using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using UserModels;
using Business_;
using System.Drawing;
using System.Web.UI.HtmlControls;
using System.Text;

namespace Vucem_EEA
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public static int id_usuario;
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString);
        Usuarios user = new Usuarios();

        protected void Page_Load(object sender, EventArgs e)
        {
             Usuarios us = (Usuarios)Session["usuariologueado"];
            Session.Timeout = 20;
            
            if (us != null)
            {

                if ("Administrador".Equals(us.Rol))
                {
                    configocultar.Visible = true;
                    usuocultar.Visible = true;
                    lblOcultAdmin.Visible = true;
                    lblNombre.Text = us.Nombre + " " + us.Apellido;

                    lblUser.Text = us.Nombre + " " + us.Apellido;

                    lblRol.Text = us.Rol;

                    if (String.IsNullOrEmpty(us.Imagen))
                    {
                        imgPerfil.ImageUrl = "~/Images/" + "user.png";
                    }
                    else
                    {
                        imgPerfil.ImageUrl = "~/Images/" + us.Imagen;


                    }
                }
                if ("Usuario".Equals(us.Rol))
                {
                    lblOcultAdmin.Visible = false;

                    configocultar.Visible = false;
                    usuocultar.Visible = false;
                    lblUser.Text = us.Nombre + " " + us.Apellido;
                    lblRol.Text = us.Rol;
                    lblNombre.Text = us.Nombre + " " + us.Apellido;

                    if (String.IsNullOrEmpty(us.Imagen))
                    {
                        imgPerfil.ImageUrl = "~/Images/" + "user.png";
                    }
                    else
                    {
                        imgPerfil.ImageUrl = "~/Images/" + us.Imagen;


                    }



                }
            }
            else
            {
                Session["usuariologueado"] = us;
                
                Response.Redirect("Login.aspx");


            }
        }
        
            protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologueado");
            Response.Redirect("Login.aspx",false);
             
        }
       

        public System.Web.UI.WebControls.Image imgperfil
        {

            get
            {
                return this.imgPerfil;
            }
        }
        
        
    }
}
