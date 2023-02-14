using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.Security;
using Business_;
using UserModels;
using System.Web.UI;

namespace Vucem_EEA
{
    public partial class Login : System.Web.UI.Page
    {
        Usuarios user = new Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologueado");
            Response.Redirect("Login.aspx",true);
        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            getLogin();
           
        }
        
            public void getLogin()
        {
            
            string Usuario = txtUsuario.Text;
            string Contrasena = txtPassword.Text;
            Usuarios us = new Usuarios();

            UsersConection conexiones = new UsersConection();
            us = conexiones.Login(Usuario, Contrasena);
            if (String.IsNullOrEmpty(us.Usuario))
            {
                ScriptManager.RegisterStartupScript(this.UpdateLogin, GetType(), "Popup", "ShowErrorLoginModal();", true);
                //ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowErrorLoginModal();", true);

            }
            else
            {
                Session["usuariologueado"] = us;
                Response.Redirect("Dashboard.aspx", true);
              

            }
        }
      
    }

}


