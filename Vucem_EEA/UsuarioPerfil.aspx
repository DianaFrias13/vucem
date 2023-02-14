<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsuarioPerfil.aspx.cs" Inherits="Vucem_EEA.UsuarioPerfil" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btn-dark {
            color: white !important;
            background-color: var(--hover-primary) !important;
            border-color: var(--btn-primary-color) !important;
        }

            .btn-dark:hover {
                color: white !important;
                background-color: var(--btn-primary-color) !important;
                border-color: var(--btn-primary-color) !important;
            }
            .form-control{
                width:auto;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <fieldset class="row">
            <div class="container text-black-50 row">
                <div class=" col-6 row justify-content-center">
                    <div class=" align-items-center col-auto">
                        <fieldset>
                            <div class="row">
                                <asp:Image runat="server" ID="image" CssClass="form-control img-thumbnail" Height="300" ImageUrl="~/Images/user.png" />

                            </div>
                            <br />
                            <div class="row">
                                <asp:FileUpload runat="server" ID="FUImage" CssClass="form-control form-control-sm" accept=".jpg,.png,.jpeg" onchange="previewFile()" />
                            </div>
                            <br />
                            <div class="row">
                                <asp:Button runat="server" ID="btnAplicar" CssClass="form-control btn btn-dark" Text="Aplicar Cambios" OnClick="btnAplicar_Click" />
                            </div>
                        </fieldset>
                    </div>
                    <div class="row">
                        <asp:Label runat="server" CssClass=" alert-danger" ID="lblError"> </asp:Label>
                        <asp:Label ID="lblImagen" runat="server" Text="" Enabled="false"></asp:Label>

                    </div>
                </div>

             
                            <div class=" col-6 img-thumbnail" style="max-width:30rem; max-height:30rem; padding-left:100px;" >
                
                            <div class="col-6 row justify-content-center">
                                <div class=" align-items-center ">

                                    <fieldset>
                                        <h5>
                                            <i class=" fas fa-database"></i>&nbsp;Datos personales
                                        </h5>

                                        <asp:Table runat="server" Enabled="false">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label runat="server" CssClass="col-form-label" Text="Nombres"></asp:Label>&nbsp;&nbsp; 
                                            <asp:HiddenField ID="hdn_id" runat="server" Value='<%# Eval("id_usuario") %>' />
                                                    <asp:Label runat="server" ID="lbl_Id" Visible="false"></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" CssClass="form-control " ID="tbNombres"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                        <asp:Label runat="server" CssClass="col-form-label" Text="Apellidos"></asp:Label>&nbsp;&nbsp; 
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="tbApellidos"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                        <asp:Label runat="server" CssClass="col-form-label" Text="Rol"></asp:Label>&nbsp;&nbsp; 
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="tbRol"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </fieldset>
                                    <br />
                                    <fieldset>
                                        <h5>
                                            <i class="fas fa-key"></i>&nbsp; Datos de Sesi&oacute;n
                                        </h5>
                                        <asp:Table runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                        <asp:Label runat="server" CssClass="col-form-label" Text="Usuario"></asp:Label>&nbsp;&nbsp; 
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="tbUsuario" Enabled="false"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                        </asp:Table>

                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
               
        </fieldset>
        <br />
        <br />


    </div>
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=image.ClientID %>');
            var file = document.querySelector('#<%=FUImage.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
</asp:Content>
