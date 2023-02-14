using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Business_;
using UserModels;
namespace Vucem_EEA
{
    public partial class Pedimentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios us = (Usuarios)Session["usuariologueado"];
            //Session.Timeout = 20;

            if (!IsPostBack)
            {

                GetPatentes();
                GetPedimentos();
                GetClavePed();
                GetOperacion();
                Session.Timeout = 1;
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

      
        #region "metodos"

        public DataTable GetDataPedimentos()
        {
            DataTable pedimentos = new DataTable();
            pedimentos.Columns.Add("Id");
            pedimentos.Columns.Add("Pedimento");
            pedimentos.Columns.Add("Patente");
            pedimentos.Columns.Add("Estado");
            pedimentos.Columns.Add("Clave");
            pedimentos.Columns.Add("Tipo");
            pedimentos.Columns.Add("Aduana");
            pedimentos.Columns.Add("FechaPago");
            pedimentos.Columns.Add("Importe");

            pedimentos.Rows.Add("1", "1632", "125463", "CERRADO","IN","IMP-1","071","13/10/2021","100,000");
            pedimentos.Rows.Add("2", "1254", "966332","CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("3", "1478", "258744", "ABIERTO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("4", "5985", "12", "CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("5", "1458", "334", "CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("6", "3256", "2", "ABIERTO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("7", "2541", "3","CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("8", "1458", "2", "CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("9", "1478", "343", "ABIERTO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("10", "1111", "4534", "CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("11", "1236", "454","CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("12", "5584", "454", "CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("13", "1584", "5278",  "ABIERTO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("14", "1288", "8514",  "CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("15", "6556", "2547", "ABIERTO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("16", "8795", "7847", "CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");
            pedimentos.Rows.Add("17", "5874", "8657", "CERRADO", "IN", "IMP-1", "071", "13/10/2021", "100,000");

            return pedimentos;
        }
        public void GetPedimentos()
        {
            DataTable pedimentos = GetDataPedimentos();
            PedimentosGV.DataSource = pedimentos;
            PedimentosGV.DataBind();
        }
        
        public void GetPatentes()
        {

            Patentes_DDL.Items.Add(new ListItem("Todos", "Todos"));
            Patentes_DDL.Items.Add(new ListItem("83832", "83832"));
            Patentes_DDL.Items.Add(new ListItem("25652", "25652"));
            Patentes_DDL.SelectedValue = "Todos";

        }
       
        
        public void GetOperacion()
        {
            
            Operacion_DDL.Items.Add(new ListItem("Todos", "Todos"));
            Operacion_DDL.Items.Add(new ListItem("Importacion", "Importacion"));
            Operacion_DDL.Items.Add(new ListItem("Exportacion", "Exportacion"));
            Operacion_DDL.SelectedValue = "Todos";
        }
        
        public void GetClavePed()
        {

            ClavePed_DDL.Items.Add(new ListItem("Todos", "Todos"));
            ClavePed_DDL.Items.Add(new ListItem("A1", "A1"));
            ClavePed_DDL.Items.Add(new ListItem("A3", "A3"));
            ClavePed_DDL.Items.Add(new ListItem("AF", "AF"));
            ClavePed_DDL.Items.Add(new ListItem("IN", "IN"));
            ClavePed_DDL.SelectedValue = "Todos";
           
        }
        #endregion
        #region "metodos en botones"



        protected void PedimentosGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AbrirPedimento")
            {
                HiddenField Id = (((e.CommandSource as LinkButton).Parent.FindControl("Id")) as HiddenField);
                string id_pedimento = Id.Value;
            }
        }

        protected void PedimentosGV_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblEstado = e.Row.FindControl("lblEstado") as Label;
                HiddenField lblEstado_value = e.Row.FindControl("lblEstado_value") as HiddenField;

                if(lblEstado_value.Value.Equals("ABIERTO"))
                {
                    lblEstado.Style.Add("color", "#ffffff");
                    lblEstado.Style.Add("background", "#a60508");
                }
                else 
                {
                    lblEstado.Style.Add("color", "#ffffff");
                    lblEstado.Style.Add("background", "#287233");/*#5fe35f*/
                }
                lblEstado.Style.Add("padding-top", "5px");
                lblEstado.Style.Add("padding-bottom", "5px");
                lblEstado.Style.Add("padding-left", "10px"); 
                lblEstado.Style.Add("padding-right", "10px");

                lblEstado.Style.Add("padding-radius", "10px");
                lblEstado.Style.Add("border-radius", "5px");
                



            }
        }

        protected void Patentes_DDL_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void PedimentosGV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            PedimentosGV.PageIndex = e.NewPageIndex;
            DataTable pedimentos = GetDataPedimentos();
            PedimentosGV.DataSource = pedimentos;
            PedimentosGV.DataBind();

        }

        protected void Operacion_DDL_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ClavePed_DDL_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lnkLimpiar_Click(object sender, EventArgs e)
        {
            txtAduanaBuscar.Text = string.Empty;
            txtBuscarPedimento.Text = string.Empty;
            txtAFechaPago.Text = string.Empty;
            txtAFechaRecepcion.Text = string.Empty;
            ClavePed_DDL.SelectedValue = "Todos";
            Operacion_DDL.SelectedValue = "Todos";
            Patentes_DDL.SelectedValue = "Todos";
            txtdeFechaPago.Text = string.Empty;
            txtDeFechaRecepcion.Text = string.Empty;
            txtBuscarPedimento.Focus();
            
        }
        #endregion

        
    }
}