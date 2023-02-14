using System;
using System.IO;
using System.Web.Services;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Services;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Windows;
using System.Drawing;
using Business_;
using UserModels;


namespace Vucem_EEA
{


    public partial class GestionUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlUsuarios.Visible = true;
                pnlConfigUsuarios.Visible = false;
                PanelGVusuarios.Visible = true;

                GetEstado();
                GetEstadoNew();
                GetRolNew();
                ListarUsuarios();
                Usuarios us = (Usuarios)Session["usuariologueado"];

                //Session.Timeout = 1;

               
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
        #region 'Metodos para llenar datos'
        public void ListarUsuarios()
        {
            UsersConection obj = new UsersConection();
            DataTable table = obj.Gestion(txtFiltro.Text, Estado_DDL.SelectedValue);
            UsuarioGV.DataSource = table;
            UsuarioGV.DataBind();

        }


        public void GetEstado()
        {

            Estado_DDL.Items.Add(new ListItem("Todos", "Todos"));
            Estado_DDL.Items.Add(new ListItem("Activo", "Activo"));
            Estado_DDL.Items.Add(new ListItem("Inactivo", "Inactivo"));
            Estado_DDL.SelectedValue = "Todos";

        }
       
        public void GetEstadoNew()
        {


            EstadoConf_DDL.Items.Add(new ListItem("Activo", "Activo"));
            EstadoConf_DDL.Items.Add(new ListItem("Inactivo", "Inactivo"));
            EstadoConf_DDL.SelectedValue = "Activo";

        }
        public void GetRolNew()
        {


            Rol_DDL.Items.Add(new ListItem("Administrador", "Administrador"));
            Rol_DDL.Items.Add(new ListItem("Usuario", "Usuario"));
            Rol_DDL.SelectedValue = "Usuario";

        }
        #endregion
        #region 'Metodos Gestion de Usuarios'


        public void EliminarUsuario()
        {
            Usuarios uss = new Usuarios();
            UsersConection obj = new UsersConection();
            uss.id_usuario = id_usu.Value == "" ? 0 : Convert.ToInt32(id_usu.Value);
            string id_usuario = uss.id_usuario.ToString();
            lblUsuario.Text = uss.Usuario;
            obj.Delete(uss);
           

        }
        private void Limpiar()
        {
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtUsuario.Text = string.Empty;
            txtPassword.Text = string.Empty;
            EstadoConf_DDL.SelectedValue = "Activo";
            Rol_DDL.SelectedValue = "Administrador";
            txtVerificar.Text = string.Empty;
            lblErrorReg.Text = string.Empty;
            txtNombre.Focus();
            id_e.Value = string.Empty;
        }
        
        public bool RegistrarUsu(string SinverficarPass)
        {
            Usuarios uss = new Usuarios();
            UsersConection obj = new UsersConection();
            Regex letras = new Regex(@"[a-zA-Z]");
            Regex numeros = new Regex(@"[0-9]");
            Regex especiales = new Regex("[!\"#\\$%&'()*+,-./:;=?@\\[\\]{|}~]");
            SinverficarPass = txtPassword.Text;
            Regex minNum = new Regex(@".{8,}");
            
            uss.id_usuario = id_e.Value == "" ? 0 : Convert.ToInt32(id_e.Value);
            uss.Nombre = txtNombre.Text;
            uss.Apellido = txtApellido.Text;
            uss.Usuario = txtUsuario.Text;
            uss.Contrasena = txtPassword.Text;
            uss.Estado = EstadoConf_DDL.SelectedValue;
            uss.Rol = Rol_DDL.SelectedValue;
            uss.Imagen = FUImage.FileName;
            string id_usuario = id_e.Value;


           // if ( txtNombre.Text == "" || txtApellido.Text == "" || txtPassword.Text == "" || txtUsuario.Text == "" )
           // {
           //     ScriptManager.RegisterStartupScript(this.updUsuarios, GetType(), "Popup", "ShowErrorCampos();", true);

           //     //txtPassword.BorderColor = Color.Red;
           //     //txtPassword.BorderStyle = BorderStyle.Double;
           //     //txtVerificar.BorderColor = Color.Red;
           //     //txtVerificar.BorderStyle = BorderStyle.Double;
           //     //txtNombre.BorderColor = Color.Red;
           //     //txtNombre.BorderStyle = BorderStyle.Double;
           //     //txtUsuario.BorderColor = Color.Red;
           //     //txtUsuario.BorderStyle = BorderStyle.Double;
           //     //txtApellido.BorderColor = Color.Red;
           //     //txtApellido.BorderStyle = BorderStyle.Double;
           //     return false;
                
           // }
           
           //  if (!letras.IsMatch(SinverficarPass) || !numeros.IsMatch(SinverficarPass) || !especiales.IsMatch(SinverficarPass))
           // {
           //     ScriptManager.RegisterStartupScript(this.updUsuarios, GetType(), "Popup", "ShowErrorCondicionesPopUp();", true);

           //     txtPassword.BorderColor = Color.Red;
           //     txtPassword.BorderStyle = BorderStyle.Double;
           //     txtVerificar.BorderColor = Color.Red;
           //     txtVerificar.BorderStyle = BorderStyle.Double;
           //     return false;

           // }
           //if ( txtVerificar.Text == "" | txtPassword.Text != txtVerificar.Text)
           // {
           //     ScriptManager.RegisterStartupScript(this.updUsuarios, GetType(), "Popup", "ShowErrorPassPopUp();", true);                
           //     txtVerificar.BorderColor = Color.Red;
           //     txtVerificar.BorderStyle = BorderStyle.Double;
              
           //     return false;
           // }
             if (obj.existeUsuario(uss.Usuario))
            {
                ScriptManager.RegisterStartupScript(this.updUsuarios, GetType(), "Popup", "ShowErrorExiste();", true);
                return false;
            }
            else 
            {
               

                if (FUImage.HasFile)
                {
                    string fullPath = Path.Combine(Server.MapPath("~/Images/"), FUImage.FileName.ToString());
                    FUImage.SaveAs(fullPath);
                    imgPerfil.ImageUrl = fullPath;
                }

                obj.Registro(uss);
                ScriptManager.RegisterStartupScript(this.updUsuarios, GetType(), "Popup", "ShowRegistroPopUp();", true);

                pnlConfigUsuarios.Visible = false;
                pnlUsuarios.Visible = true;
                PanelGVusuarios.Visible = true;

                Limpiar();
                ListarUsuarios();

                return true;
            }
        }
        public bool EditarUsuario(string SinverficarPass)
        {
            Usuarios uss = new Usuarios();
            UsersConection obj = new UsersConection();
            Regex letras = new Regex(@"[a-zA-Z]");
            Regex numeros = new Regex(@"[0-9]");
            Regex especiales = new Regex("[!\"#\\$%&'()*+,-./:;=?@\\[\\]{|}~]");
            SinverficarPass = txtPassword.Text;
            Regex minNum = new Regex(@".{8,}");

            uss.id_usuario = id_e.Value == "" ? 0 : Convert.ToInt32(id_e.Value);
            uss.Nombre = txtNombre.Text;
            uss.Apellido = txtApellido.Text;
            uss.Usuario = txtUsuario.Text;
            uss.Contrasena = txtPassword.Text;
            uss.Estado = EstadoConf_DDL.SelectedValue;
            uss.Rol = Rol_DDL.SelectedValue;
            uss.Imagen = FUImage.FileName;
            string id_usuario = id_e.Value;


            //if (!letras.IsMatch(SinverficarPass) || !numeros.IsMatch(SinverficarPass) || !especiales.IsMatch(SinverficarPass) || txtNombre.Text == "" || txtApellido.Text == "" || txtPassword.Text == "" || txtUsuario.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(this.updUsuarios, GetType(), "Popup", "ShowErrorNums();", true);
            //    txtPassword.BorderColor = Color.Red;
            //    txtPassword.BorderStyle = BorderStyle.Double;
            //    txtVerificar.BorderColor = Color.Red;
            //    txtVerificar.BorderStyle = BorderStyle.Double;
            //    txtNombre.BorderColor = Color.Red;
            //    txtNombre.BorderStyle = BorderStyle.Double;
            //    txtUsuario.BorderColor = Color.Red;
            //    txtUsuario.BorderStyle = BorderStyle.Double;
            //    txtApellido.BorderColor = Color.Red;
            //    txtApellido.BorderStyle = BorderStyle.Double;
            //    return false;
            //}
            //if (txtVerificar.Text == "" || txtPassword.Text != txtVerificar.Text)
            //{
            //    string title = "Error";
            //    string body = "Los campos no deben quedar vacios";
            //    ScriptManager.RegisterStartupScript(this.updUsuarios, GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);

            //    txtPassword.BorderColor = Color.Red;
            //    txtPassword.BorderStyle = BorderStyle.Double;
            //    txtVerificar.BorderColor = Color.Red;
            //    txtVerificar.BorderStyle = BorderStyle.Double;
                
            //    return false;

            //}

            if (FUImage.HasFile)
            {

                string fullPath = Path.Combine(Server.MapPath("~/Images/"), FUImage.FileName.ToString());
                FUImage.SaveAs(fullPath);
                imgPerfil.ImageUrl = fullPath;
                return true;
            }
            else
            {
                obj.Edit(uss);
                ScriptManager.RegisterStartupScript(this.updUsuarios, GetType(), "Popup", "ShowEditPopUp();", true);

                pnlConfigUsuarios.Visible = false;
                pnlUsuarios.Visible = true;
                PanelGVusuarios.Visible = true;

                Limpiar();
                ListarUsuarios();

                return true;
            }


        }
        #endregion


        #region 'Metodos en los Botones'
        protected void UsuarioGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            UsersConection obj = new UsersConection();
            if (e.CommandName == "Editar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                //GridViewRow row = UsuarioGV.Rows[index];
                UsuarioGV.SelectedIndex = index;
                HiddenField hdf_id_usuario = (((e.CommandSource as LinkButton).Parent.FindControl("hdf_id_usuario")) as HiddenField);
                Usuarios us = obj.ConsultaxID(Convert.ToInt32(hdf_id_usuario.Value));

                string id_usuario = us.id_usuario.ToString();
                id_e.Value = id_usuario;
                txtNombre.Text = us.Nombre;
                txtApellido.Text = us.Apellido;
                txtUsuario.Text = us.Usuario;
                txtPassword.Text = us.Contrasena;
                EstadoConf_DDL.SelectedValue = us.Estado;
                Rol_DDL.SelectedValue = us.Rol;
                
                    imgPerfil.ImageUrl = ("~/Images/" + us.Imagen);

                ////FUImage.Visible = false;
                ////lblPerfil.Visible = false;
                ////imgPerfil.Visible = false;
                pnlConfigUsuarios.Visible = true;
                pnlUsuarios.Visible = false;
                PanelGVusuarios.Visible = false;

                lb_Guardar.Visible = false;
                lb_Editar.Visible = true;
                btnLimpiar.Visible = false;
                txtUsuario.Enabled = false;
            }
            if (e.CommandName == "Eliminar")
            {

                int index = Convert.ToInt32(e.CommandArgument);

                UsuarioGV.SelectedIndex = index;
                HiddenField hdf_id_usuario = (((e.CommandSource as LinkButton).Parent.FindControl("hdf_id_usuario")) as HiddenField);
                Usuarios us = obj.ConsultaxID(Convert.ToInt32(hdf_id_usuario.Value));
                Usuarios usulogueado = (Usuarios)Session["usuariologueado"];
                string id_usuario = us.id_usuario.ToString();
                id_usu.Value = id_usuario;
                lblUsuario.Text = us.Usuario;
                
                ListarUsuarios();
                ScriptManager.RegisterStartupScript(this.updUsuarios,GetType(), "Popup", "showDeleteconfirmModal();", true);
 
            }
        }

      
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            EliminarUsuario();         
            ListarUsuarios();
            pnlUsuarios.Visible = true;
            PanelGVusuarios.Visible = true;

            pnlConfigUsuarios.Visible = false;

        }

        protected void lb_Guardar_Click(object sender, EventArgs e)
        {
            RegistrarUsu(txtPassword.Text);
           
           
        }

        protected void lnk_Cancelar_Click(object sender, EventArgs e)
        {
            pnlUsuarios.Visible = true;
            PanelGVusuarios.Visible = true;

            pnlConfigUsuarios.Visible = false;
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }
        protected void lb_Editar_Click(object sender, EventArgs e)
        {
            EditarUsuario(txtPassword.Text);
        }
        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            pnlUsuarios.Visible = true;
            pnlConfigUsuarios.Visible = false;
            PanelGVusuarios.Visible = true;
            Limpiar();
        }
        protected void btn_Registro_Click(object sender, EventArgs e)
        {
            lb_Editar.Visible = false;
            txtUsuario.Enabled = true;
            lb_Guardar.Visible = true;
            btnLimpiar.Visible = true;
            btn_Cancelar.Visible = true;
            pnlUsuarios.Visible = false;
            pnlConfigUsuarios.Visible = true;
            PanelGVusuarios.Visible=false;
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            UsersConection obj = new UsersConection();
            DataTable table = obj.Gestion(txtFiltro.Text, Estado_DDL.SelectedValue);
            UsuarioGV.DataSource = table;
            UsuarioGV.DataBind();
        }

        #endregion


        protected void UsuarioGV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UsuarioGV.PageIndex = e.NewPageIndex;
            ListarUsuarios();
        }



        protected void Estado_DDL_TextChanged(object sender, EventArgs e)
        {
            if (Estado_DDL.SelectedValue != "")
            {
                UsersConection obj = new UsersConection();
                DataTable table = obj.Gestion(txtFiltro.Text, Estado_DDL.SelectedValue);
                UsuarioGV.DataSource = table;
                UsuarioGV.DataBind();
            }
        }
    }
}
    
