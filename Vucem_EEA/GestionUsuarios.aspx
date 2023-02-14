<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="Vucem_EEA.GestionUsuarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style type="text/css">
        #background {
            position: fixed;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            overflow: hidden;
            padding: 0;
            margin: 0;
            background-color: #F0F0F0;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 100000;
        }

        #Progress {
            position: fixed;
            top: 40%;
            left: 40%;
            height: 20%;
            width: 20%;
            z-index: 100001;
            background-color: #FFFFFF;
            border: 1px solid gray;
            background-repeat: no-repeat;
            background-position: center;
            text-align: center;
            align-content: center;
            align-items: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
            <asp:Panel runat="server" ID="pnlUsuarios">

                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12" style="text-align: left;">
                        <h3>Usuarios</h3>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-12" style="text-align: right;">
                        <asp:LinkButton ID="btn_Registro" runat="server" CommandName="Registro" UniqueName="Registro" ToolTip="Registro" CssClass="btn btn-primary" OnClick="btn_Registro_Click"><i class="fas fa-user-plus"></i>&nbsp Registro</asp:LinkButton>

                    </div>

                </div>
                <div class="row">

                    <div class="col" style="text-align: right">
                        <br />
                    </div>
                </div>
                <div class="container-fluid p-0">

                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-12">

                            <label style="font-weight: bold;"><span>Estado</span></label>
                            <asp:DropDownList ID="Estado_DDL" runat="server" AutoPostBack="true" CssClass="form-control" OnTextChanged="Estado_DDL_TextChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12">

                            <label style="font-weight: bold;"><span>Filtro</span></label>
                            <asp:TextBox ID="txtFiltro" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>


                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <br />


                            <asp:LinkButton ID="btnBuscar" OnClick="btnBuscar_Click" runat="server"
                                CssClass="btn btn-outline " Height="35" Width="135"><i class="fas fa-search"></i>&nbsp Buscar</asp:LinkButton>

                        </div>

                    </div>
                </div>
                <br />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel runat="server" ID="updUsuarios">
        <ContentTemplate>           
            <asp:Panel ID="PanelGVusuarios" runat="server">

            <div class=" card card-body" style="border-radius: 0 !important">

                <asp:GridView CssClass="table table-striped table-bordered " ID="UsuarioGV" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                    GridLines="None" PagerStyle-HorizontalAlign="Left" HeaderStyle-CssClass="table-striped" ItemStyle-CssClass="table-dark"
                    AllowSorting="True" DataKeyNames="id_usuario" BorderColor="DarkGreen"
                    OnRowCommand="UsuarioGV_RowCommand" PageSize="10" OnPageIndexChanging="UsuarioGV_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombres" ItemStyle-Width="190" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellidos" ItemStyle-Width="200" HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="visible" />
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" ItemStyle-Width="200" HeaderStyle-CssClass="visible-ms" ItemStyle-CssClass="visible-ms" />

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="300px">

                            <ItemTemplate>
                                <asp:LinkButton ID="btn_Editar" runat="server" CommandName="Editar" UniqueName="Editar" CommandArgument="<%# Container.DataItemIndex %>" ToolTip="Editar" CssClass="btn btn-primary"><i class="fas fa-edit" ></i>&nbsp Editar</asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" Width="135" Height="35" CommandName="Eliminar" UniqueName="Eliminar" ToolTip="Eliminar" CommandArgument="<%# Container.DataItemIndex %>" runat="server" CssClass="btn btn-warning"><i class="far fa-trash-alt"></i>&nbsp Eliminar</asp:LinkButton>
                                <asp:HiddenField ID="hdf_id_usuario" runat="server" Value='<%# Eval("id_usuario") %>' />

                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <HeaderStyle CssClass="table-striped"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Left"></PagerStyle>
                </asp:GridView>
            </div>
            <asp:HiddenField ID="hdf_id" runat="server" Value='<%# Eval("id_usuario") %>' />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelConfig" runat="server">

        <ContentTemplate>
            <asp:Panel runat="server" ID="pnlConfigUsuarios">

                <div class="container-fluid p-0" id="" tabindex="-1" aria-labelledby="" aria-hidden="true">

                    <div class=" card card-body" style="border-radius: 0 !important">
                        <div class="">
                            <h2>Configuraci&oacute;n de Usuarios</h2>
                            <br />
                            <div>
                                <div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; text-align: left;">Nombres </label>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvNombre" ControlToValidate="txtNombre" ErrorMessage="Campo Obligatorio"
                                                ForeColor="Red" ToolTip="El campo es obligatorio" ValidationGroup="validacion" SetFocusOnError="True">
                                                *
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; text-align: left;">Apellidos</label>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvApellido" ControlToValidate="txtApellido" ErrorMessage="Campo Obligatorio"
                                                ForeColor="Red" Display="Dynamic" ToolTip="El campo es obligatorio" ValidationGroup="validacion" SetFocusOnError="True">
                                                *                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>


                                        </div>
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; text-align: left;">Rol</label>
                                            <asp:DropDownList ID="Rol_DDL" runat="server" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; text-align: left;">Nombre de Usuario</label>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvUsuario" ControlToValidate="txtUsuario" ErrorMessage="Campo Obligatorio"
                                                ForeColor="Red" Display="Dynamic" ToolTip="El campo es obligatorio" ValidationGroup="validacion" SetFocusOnError="True">
                                                *
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="col-lg-4 col-md-8 col-sm-1 ">
                                            <label style="font-weight: bold; text-align: left;">
                                                Contrase&ntilde;a
                                                <%--<span style="font-weight: bold; text-align: left;" data-toggle="tooltip" data-original-title="La contraseña debe contener letras, numeros y simbolos. Todos los campos deben ser llenados">Contraseña</span>
                                                <i style="color: #3c48e5" class="fas fa-info-circle"></i>--%>
                                            </label>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtPassword" ErrorMessage="Campo Obligatorio"
                                                ForeColor="Red" Display="Dynamic" ToolTip="El campo es obligatorio" ValidationGroup="validacion" SetFocusOnError="True">
                                                *
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>


                                        </div>

                                        <div class="col-lg-4 col-md-8 col-sm-12">

                                            <label style="font-weight: bold; text-align: left;">Verificar Contrase&ntilde;a</label>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvVerificar" ControlToValidate="txtVerificar" ErrorMessage="Campo Obligatorio"
                                                ForeColor="Red" Display="Dynamic" ToolTip="El campo es obligatorio" ValidationGroup="validacion" SetFocusOnError="True">
                                                *
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtVerificar" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:CompareValidator runat="server" ID="valComparar" ControlToValidate="txtVerificar" ControlToCompare="txtPassword"
                                                Display="Dynamic" EnableClientScript="true" ErrorMessage="Las contraseñas deben coincidir" Text="Las contraseñas deben coincidir" Type="String" BorderColor="Yellow" ForeColor="Red">
                                                Las contraseñas no coinciden
                                            </asp:CompareValidator>
                                        </div>
                                    </div>
                                    <asp:HiddenField ID="id_e" runat="server" Value='<%# Eval("id_usuario") %>' />

                                </div>

                            </div>
                            <br />
                            <div class="row">

                                <div class="col-lg-4 col-md-8 col-sm-12">
                                    <label style="font-weight: bold; text-align: left;">Estado</label>
                                    <asp:DropDownList ID="EstadoConf_DDL" runat="server" AutoPostBack="true" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>


                                <asp:Label ID="lblErrorReg" runat="server" CssClass="alert-danger"></asp:Label>

                            </div>
                            <br />

                            <asp:Label runat="server" ID="lblidnew" Visible="false"></asp:Label>
                            <asp:Label ID="lblInfo" runat="server" CssClass="alert-danger"></asp:Label>

                        </div>
                  

             


                <div class="row">
                    <div class="col-lg-4 col-md-9 col-sm-12">
                        <asp:LinkButton ID="lb_Guardar" ValidationGroup="validacion" CausesValidation="true" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="lb_Guardar_Click" Width="130px" Height="35px"><i class="fas fa-save"></i>&nbsp Guardar</asp:LinkButton>
                        <asp:LinkButton ID="lb_Editar" runat="server" ValidationGroup="validacion" CausesValidation="true" CssClass="btn btn-primary" OnClick="lb_Editar_Click" Width="130px" Height="35px"><i class="fas fa-edit"></i>&nbsp Editar</asp:LinkButton>
                    </div>
                    <div class="col-lg-4 col-md-9 col-sm-12">
                        <asp:LinkButton ID="btn_Cancelar" runat="server" CssClass="btn btn-outline" OnClick="btn_Cancelar_Click" Width="130px" Height="35px"><i class="fas fa-times"></i>&nbsp Cancelar</asp:LinkButton>

                    </div>
                    <div class="col-lg-4 col-md-9 col-sm-12 ">
                        <asp:LinkButton ID="btnLimpiar" runat="server" CssClass="btn btn-outline" OnClick="btnLimpiar_Click" Width="130px" Height="35px"><i class="fas fa-eraser"></i>&nbsp Limpiar</asp:LinkButton>

                    </div>
                </div>
                <br />
                        </div>
                    </div>
                <div class="container text-black-50 row">
                    <div class=" col-6 row justify-content-left">
                        <div class=" align-items-left col-auto">



                            <br />
                            <div class="row" style="font-weight: bold; text-align: left; font-size: 14px; color: dimgrey;">
                                <asp:Label runat="server" ID="lblPerfil" CssClass="lblPerfil" Text="Foto de perfil"></asp:Label>

                                <asp:FileUpload runat="server" ID="FUImage" CssClass="form-control form-control-sm" accept=",.jpg,.png,.jpeg" onchange="previewFile()" />
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <asp:Image runat="server" ID="imgPerfil" CssClass="form-control img-thumbnail" Height="300" Width="360" ImageUrl="~/Images/user.png" />

                            </div>
                        </div>
                    </div>

                </div>
                        
            </asp:Panel>
        </ContentTemplate>

    </asp:UpdatePanel>
    <asp:UpdateProgress ID="PantallaCarga" runat="server" DynamicLayout="true">
        <ProgressTemplate>
            <div class="loader"></div>

            </div>
        </ProgressTemplate>

    </asp:UpdateProgress>

    <div id="ErrorPassPopUp" class="modal fade" role="dialog">
        <div class="">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h3 style="text-align: left; align-items: flex-start;">ERROR!</h3>

                </div>
                <div class="modal-body">
                    <h4>Las contraseñas no coinciden</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="ErrorCondicionesPopUp" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h3 style="text-align: left; align-items: flex-start;">ERROR!</h3>

                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>

                </div>
                <div class="modal-body">
                    <h4>La contraseña debe contener n&uacute;meros, letras y s&iacute;mbolos</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="ErrorLetrasPopUp" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h3 style="text-align: left; align-items: flex-start;">ERROR!</h3>

                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>

                </div>
                <div class="modal-body">
                    <h4>La contraseña debe contener letras</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="ErrorPopUp" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h3 style="text-align: left; align-items: flex-start;">ERROR!</h3>

                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>

                </div>
                <div class="modal-body">
                    <h4>Todos los campos deben ser llenados. La contraseña debe contener numeros, letras y simbolos.</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="RegistradoPopUp" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h3 style="text-align: left; align-items: flex-start;">EXITO !</h3>

                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>

                </div>
                <div class="modal-body">
                    <h4>Usuario Registrado Correctamente</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="EditadoPopUp" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h3 style="text-align: left; align-items: flex-start;">EXITO!</h3>

                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>

                </div>
                <div class="modal-body">
                    <h4>Usuario Modificado Correctamente</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="ErrorCamposPopUp" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h3 style="text-align: left; align-items: flex-start;">ERROR!</h3>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>

                </div>
                <div class="modal-body">
                    <h4>Los campos no pueden quedar vacios</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="ErrorexistePopUp" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h3 style="text-align: left; align-items: flex-start;">ERROR!</h3>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>

                </div>
                <div class="modal-body">
                    <h4>El Usuario ya existe</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="DeleteconfirmModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center" style="padding-top: 40px !important; padding-bottom: 40px !important">

                    <div class="p-4">
                        <h2>
                            <span>¿Realmente desea eliminar al usuario ? </span></h2>
                    </div>
                    <div class="p-4">
                        <asp:UpdatePanel ID="updConfirm" runat="server">
                            <ContentTemplate>
                                <div>
                                    <asp:Label ID="lblUsuario" runat="server" CssClass=""></asp:Label>

                                    <asp:HiddenField ID="id_usu" runat="server" Value='<%# Eval("id_usuario") %>' />

                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="UsuarioGV" EventName="RowCommand" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div class="pt-4">
                        <div style="text-align: center">
                            <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Eliminar" UniqueName="Eliminar" ToolTip="Eliminar" CommandArgument='<%# Eval("id_usuario") %>' CssClass="btn btn-warning" OnClick="btnEliminar_Click"><i class="far fa-trash-alt"></i>&nbsp Eliminar</asp:LinkButton>
                            <asp:LinkButton ID="lnk_Cancelar" runat="server" Width="150px" Height="40px" OnClick="lnk_Cancelar_Click" CssClass="btn btn-secondary"><i class="fas fa-times"></i>&nbsp Cancelar</asp:LinkButton>



                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 style="text-align: left; align-items: flex-start;" class="modal-title"></h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);

            $("#MyPopup").modal("show");
        }
        function showDeleteconfirmModal() {
            $('#DeleteconfirmModal').modal('show');
        }

        function closeDeleteconfirmModal() {
            $('#DeleteconfirmModal').modal('dispose');
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
        }
        function ShowErrorExiste() {

            $("#ErrorexistePopUp").modal("show");
        }
        function ShowErrorPass() {

            $("#ErrorPassPopUp").modal("show");
        }
        function ShowErrorCondicionesPopUp() {

            $("#ErrorCondicionesPopUp").modal("show");
        }
        function ShowErrorLetras() {

            $("#ErrorLetrasPopUp").modal("show");
        }
        function ShowError() {

            $("#ErrorPopUp").modal("show");
        }
        function ShowErrorCampos() {

            $("#ErrorCamposPopUp").modal("show");
        }
        function ShowEditPopUp() {

            $("#EditadoPopUp").modal("show");
        }
        function ShowRegistroPopUp() {

            $("#RegistradoPopUp").modal("show");
        }



        function previewFile() {
            var preview = document.querySelector('#<%=imgPerfil.ClientID %>');
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
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip({
                placement: 'top'
            });
        });
    </script>

</asp:Content>
