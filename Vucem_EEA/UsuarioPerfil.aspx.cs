using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Windows;
using System.IO;

using Business_;
using UserModels;

namespace Vucem_EEA
{
    public partial class UsuarioPerfil : System.Web.UI.Page
    {
        public static int id_usuario;
        //var master = Page.Master as Site;

        protected void Page_Load(object sender, EventArgs e)
        {


            Usuarios us = (Usuarios)Session["usuariologueado"];
            string id_usuario = us.id_usuario.ToString();
            lbl_Id.Text = id_usuario;

            if (us == null || String.IsNullOrEmpty(id_usuario))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                
                lbl_Id.Text = us.id_usuario.ToString();
                tbNombres.Text = us.Nombre;
                tbApellidos.Text = us.Apellido;
                tbUsuario.Text = us.Usuario;
                tbRol.Text = us.Rol;
                if (String.IsNullOrEmpty(us.Imagen))
                {
                    Master.imgperfil.ImageUrl = "~/Images/" + "user.png";

                    image.ImageUrl = "~/Images/" + "user.png";
                }
                else
                {
                    Master.imgperfil.ImageUrl = "~/Images/" + us.Imagen;

                    image.ImageUrl = "~/Images/" + us.Imagen;
                  

                }


            }
        }

       

        protected void btnAplicar_Click(object sender, EventArgs e)
        {
            CambiarImagen();
        }
        public void CambiarImagen()
        {
            Usuarios uss = new Usuarios();
            UsersConection obj = new UsersConection();

            uss.id_usuario = lbl_Id.Text == "" ? 0 : Convert.ToInt32(lbl_Id.Text);

            uss.Imagen = FUImage.FileName;
            string id_usuario = lbl_Id.Text;
            if (obj.CambiarImagen(uss) > 0)
            {

                if (FUImage.HasFile)
                {

                    string fullPath = Path.Combine(Server.MapPath("~/Images/"), FUImage.FileName.ToString());
                    FUImage.SaveAs(fullPath);
                    image.ImageUrl = fullPath;
                    Master.imgperfil.ImageUrl = ("~/Images/" + uss.Imagen);
                    image.ImageUrl = ("~/Images/" + uss.Imagen);
                    lblError.Text = "Exito";

                }
            }
            else
            {
                lblError.Text = "No se ha cargado una imagen de perfil nueva!";
            }
            //if Master.btnOscuro==cli
        }
        public void verimagen()
        {
            Usuarios us = (Usuarios)Session["usuariologueado"];
            if (String.IsNullOrEmpty(us.Imagen))
            {
                //ScriptManager.RegisterStartupScript(this.updateLogin, GetType(), "invalid", "invalid();", true);
                image.ImageUrl = "~/Images/" + "user.png";
            }
            else
            {
                image.ImageUrl = "~/Images/" + us.Imagen;


            }
        }

        //protected void lnkAplicar_Click(object sender, EventArgs e)
        //{
        //    CambiarImagen();
        //}
    }
}