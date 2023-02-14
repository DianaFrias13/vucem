<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Configuracion.aspx.cs" Inherits="Vucem_EEA.Configuracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Recursos/CSS/colores.css" rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-12" style="text-align: left;">
            <h3>Configuraci&oacute;n</h3>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-12" style="text-align: right;">
<asp:LinkButton ID="btn_Guardar" runat="server" CommandName="Guardar" UniqueName="Guardar" Width="130" Height="35" ToolTip="Guardar" CssClass="btn btn-primary" PostBackUrl="~/DatosPatente.aspx"><i class="fas fa-save"></i>&nbsp 
                         Guardar</asp:LinkButton>

        </div>
    </div>
    <br />
    <div class="card text-black " style="text-align: left;">
        <div class="card-body" style="text-align: left;">
            <asp:GridView CssClass="" ID="Config_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" AllowPaging="true" PageSize="1">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="container-fluid p-0">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <label style="font-weight: bold; font-size: 1rem;">Nombre</label>

                                        <asp:TextBox ID="txtNombre" runat="server" Text='<%# Eval("Nombre_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class=" col-lg-3 col-md-6 col-sm-12">
                                        <label style="font-weight: bold; font-size: 1rem;">Domicilio</label>

                                        <asp:TextBox ID="txtDomicilio" runat="server" Text='<%# Eval("Domicilio_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <label style="font-weight: bold; font-size: 1rem;">N&uacute;mero Interior</label>

                                        <asp:TextBox ID="TxtNumInt" runat="server" Text='<%# Eval("Nint_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <label style="font-weight: bold; font-size: 1rem;">N&uacute;mero Exterior</label>

                                        <asp:TextBox ID="txtNumExt" runat="server" Text='<%# Eval("Next_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Municipio</label>

                                        <asp:TextBox ID="txtMunicipio" runat="server" Text='<%# Eval("Municipio_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class=" col-lg-3 col-md-6 col-sm-12">
                                        <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Localidad</label>

                                        <asp:TextBox ID="txtLocalidad" runat="server" Text='<%# Eval("Localidad_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class=" col-lg-3 col-md-6 col-sm-12">
                                        <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Entidad</label>

                                        <asp:TextBox ID="txtEntidad" runat="server" Text='<%# Eval("Entidad_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class=" col-lg-3 col-md-6 col-sm-12">
                                        <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">RFC</label>
                                        <asp:TextBox ID="txtRFC" runat="server" Text='<%# Eval("RFC_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class=" col-lg-3 col-md-6 col-sm-12">
                                        <label class=" col-form-label" style="font-weight: bold; font-size: 1rem;">Siglas</label>
                                        <asp:TextBox ID="txtSiglas" runat="server" Text='<%# Eval("Siglas_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class=" col-lg-3 col-md-6 col-sm-12">
                                        <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Tel&eacute;fono</label>
                                        <asp:TextBox ID="txtTelefono" runat="server" Text='<%# Eval("Tel_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class=" col-lg-3 col-md-6 col-sm-12">
                                        <label class=" col-form-label" style="font-weight: bold; font-size: 1rem;">C&oacute;digo Postal</label>
                                        <asp:TextBox ID="txtCP" runat="server" Text='<%# Eval("CP_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class=" col-lg-3 col-md-6 col-sm-12">
                                        <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Colonia</label>
                                        <asp:TextBox ID="txtColonia" runat="server" Text='<%# Eval("Colonia_conf") %>' CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row">

                                    <div class="col" style="text-align: left; margin-left: -10px;">
                                        
                                    </div>
                                </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
