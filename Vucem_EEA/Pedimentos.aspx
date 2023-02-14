<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedimentos.aspx.cs" Inherits="Vucem_EEA.Pedimentos" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Recursos/CSS/colores.css" rel="stylesheet" type="text/css" />

    <style>
        table {
            width: 100%;
        }

        .filtros {
            display: block;
            margin: 0 0 0.28571429rem 0;
            color: rgba(0,0,0,.87);
            font-size: .92857143em;
            font-weight: 700;
            text-transform: none;
            position: relative;
            max-width: 100%;
        }

        .card .text-black {
            width: 200px;
            display: flex !important;
            float: left !important;
            margin: 15px;
        }

        tr {
            float: left;
            width: 250px;
            margin-top: 10px;
            padding: 10px;
        }

        .card-header {
            background-color: white !important;
        }




        .Lbl {
            font-weight: bold;
            font-size: 20px;
            color: darkgrey;
        }

        .Lbl2 {
            font-family: 'Roboto', sans-serif;
            font-weight: bold;
            font-size: 16px;
            color: #424247;
        }

        .LblFecha {
            font-weight: bold;
            font-size: 12px;
            color: #145A32;
        }

        .LblImporte {
            font-weight: bold;
            font-size: 20px;
            color: darkred !important;
            padding-left: 15px;
            padding-right: -10px;
        }

        .btn-primary-actualizar {
            color: white !important;
            background-color: #235C17 !important;
            border-color: #235C17 !important;
            margin-top: 14px !important;
        }

            .btn-primary-actualizar:hover {
                color: white !important;
                background-color: #165909 !important;
                border-color: #165909 !important;
                margin-top: 14px !important;
            }

            .btn-primary-actualizar:focus {
                outline: none !important;
                border: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
            }

            .btn-primary-actualizar:active {
                position: relative;
            }

       
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div style="align-content: end; align-items: end; text-align: right; margin: 10px;">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-12" style="text-align: left;">

                <h2>Pedimentos</h2>
            </div>
            <div class="col-lg-9 col-md-6 col-sm-12">

                <asp:LinkButton ID="lnkActualizar" runat="server" Width="130" Height="35" CssClass="btn btn-primary"><i class="fas fa-sync-alt"></i> Actualizar </asp:LinkButton>
            </div>

        </div>
    </div>
    <br />
    <div class="container-fluid p-0 " style="margin-left: 10px !important;">

        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-12">
                <label class="Lbl2">Pedimento</label>
                <div class="form-group" id="buscar-group">

                    <asp:TextBox ID="txtBuscarPedimento" runat="server" placeholder="Buscar pedimento" TextMode="Search" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <label class="Lbl2">Patente</label>
                <asp:DropDownList ID="Patentes_DDL" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="Patentes_DDL_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-12">
                <label class="Lbl2">Aduana</label>
                <asp:TextBox ID="txtAduanaBuscar" runat="server" placeholder="Aduana" TextMode="Search" CssClass="form-control"></asp:TextBox>
            </div>
            <br />
            <br />
            <div class="row">
                <div class=" col-lg-6 col-md-6 col-sm-6">
                    <asp:LinkButton ID="BtnSearch" runat="server" CssClass="btn btn-outline-custom" Width="130" Height="35"><i class="fas fa-search"></i> Buscar </asp:LinkButton>

                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">

                    <asp:LinkButton runat="server" Width="130" Height="35" CssClass="btn btn-outline-custom" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
<i class="fas fa-filter" style="margin-right: 10px;"></i>&nbsp Filtro
                    </asp:LinkButton>
                </div>


            </div>
        </div>
        <div class="collapse" id="collapseExample" style="align-content: center; align-items: center; text-align: justify;">

            <div class="row ">

                <div class="col-lg-3 col-md-9 col-sm-12">
                    <label class="Lbl2">De la fecha de pago</label>
                    <asp:TextBox ID="txtdeFechaPago" runat="server" placeholder="De la fecha de pago" TextMode="Date" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="col-lg-3 col-md-9 col-sm-12">
                    <label class="Lbl2">A la fecha de pago</label>

                    <asp:TextBox ID="txtAFechaPago" runat="server" placeholder="A la fecha de pago" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-3 col-md-9 col-sm-12">
                    <label class="Lbl2">Tipo de Operaci&oacute;n</label>
                    <asp:DropDownList ID="Operacion_DDL" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="Operacion_DDL_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-9 col-sm-12">
                    <label class="Lbl2">De la fecha de recepci&oacute;n</label>

                    <asp:TextBox ID="txtDeFechaRecepcion" runat="server" placeholder="De la fecha de recepcion" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-3 col-md-9 col-sm-12">
                    <label class="Lbl2">A la fecha de recepci&oacute;n</label>
                    <asp:TextBox ID="txtAFechaRecepcion" runat="server" placeholder="A la fecha de recepcion" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-3 col-md-9 col-sm-12">
                    <label class="Lbl2">Clave de Pedimento</label>
                    <asp:DropDownList ID="ClavePed_DDL" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ClavePed_DDL_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <br />
                <div class="col-lg-3 col-md-9 col-sm-12">
                    <br />
                    <asp:LinkButton ID="lnkLimpiar" runat="server" CssClass="btn  btn-outline-limpiar" OnClick="lnkLimpiar_Click" Width="130" Height="35"><i class="fas fa-eraser"></i>&nbsp  Limpiar </asp:LinkButton>

                </div>
            </div>
            <br />

        </div>
    </div>

    <asp:GridView PageSize="12" CssClass="mGrid" ID="PedimentosGV" runat="server" AutoGenerateColumns="false" ShowHeader="false" AllowPaging="true"
        OnRowCommand="PedimentosGV_RowCommand" OnRowDataBound="PedimentosGV_RowDataBound" GridLines="None" OnPageIndexChanging="PedimentosGV_PageIndexChanging"
        PagerStyle-HorizontalAlign="Left">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="card text-black " style="max-width: 22rem; border: none">
                        <div class="card-header" style="text-align: center;">
                            <asp:HiddenField ID="id" runat="server" Value='<%# Eval("Id") %>' />

                            <asp:Label runat="server" ID="lblPedimento" Text='<%# Eval("Pedimento") %>' CssClass="Lbl"></asp:Label>


                            <label style="font-weight: bold; color: darkgrey; font-size: 20px;">-</label>
                            <asp:Label runat="server" ID="lblPatente" Text='<%# Eval("Patente") %>' CssClass="Lbl"></asp:Label>
                            <br />

                            <asp:Label runat="server" ID="lblEstado" Text='<%# Eval("Estado") %>'></asp:Label>
                            <asp:HiddenField ID="lblEstado_value" runat="server" Value='<%# Eval("Estado") %>' />
                        </div>
                        <div class="card-body">
                            <div class="container-fluid p-0">
                                <div class="row">
                                    <div class="col-lg-3 col-md-7 col-sm-12" style="text-align: center;">
                                        <label style="font-weight: bold; text-align: left; color: darkgrey;">Clave</label>
                                        <asp:Label ID="lblClave_value" runat="server" Text='<%# Eval("Clave") %>'></asp:Label>

                                    </div>
                                    <div class="col-lg-5 col-md-9 col-sm-12" style="text-align: center;">
                                        <label style="font-weight: bold; text-align: center; color: darkgrey;">Tipo</label>
                                        <asp:Label ID="lblTipo_value" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>

                                    </div>
                                    <div class="col-lg-4 col-md-8 col-sm-12" style="text-align: center; padding-right: 5px;">
                                        <label style="font-weight: bold; text-align: center; padding-right: 15px; padding-left: 1px; color: darkgrey;">Aduana</label>
                                        <asp:Label ID="lblAduana_value" runat="server" Text='<%# Eval("Aduana") %>'></asp:Label>
                                    </div>
                                </div>
                                <label style="color: darkgray; font-size: 12px;">Servicios Inf&oacute;rmaticos GSC</label>

                            </div>
                            <label style="font-weight: bold; font-size: 13px; color: #145A32;">Fecha de pago:</label>
                            <asp:Label runat="server" ID="lblFechaPago_value" Text='<%# Eval("FechaPago") %>' CssClass="LblFecha" ></asp:Label>
                            <div class="row" style="text-align: right !important">


                                <label class="LblImporte">$</label>


                                <asp:Label runat="server" ID="lblImporte_value" Text='<%# Eval("Importe") %>' CssClass="LblImporte"></asp:Label>
                            </div>

                        </div>
                        <div style="text-align: center;">
                            <asp:LinkButton ID="lnkSubirArchivo" runat="server" PostBackUrl="~/DatosPatente.aspx" CssClass="i"><i class="far fa-file-pdf"></i></asp:LinkButton>&nbsp &nbsp
                                 <asp:LinkButton ID="lnkCompartir" runat="server" PostBackUrl="~/DatosPatente.aspx" CssClass="i"><i class="fas fa-share-square"></i></asp:LinkButton>&nbsp &nbsp
                                 <asp:LinkButton ID="lnkDocumentos" runat="server" PostBackUrl="~/DatosPatente.aspx" CssClass="i"><i class="fas fa-paperclip"></i></asp:LinkButton>
                        </div>
                      
                        <div style="text-align: center;">
                            <asp:LinkButton ID="AbrirPedimento" runat="server" Width="135" Height="35" CommandName="AbrirPedimento" UniqueName="AbrirPedimento" ToolTip="Abrir Pedimento" CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-primary" PostBackUrl="~/DatosPatente.aspx"><i class="far fa-folder-open"></i>&nbsp Abrir</asp:LinkButton>
                        </div>
                        <br />

                    </div>


                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <PagerStyle Height="30px" VerticalAlign="Bottom" HorizontalAlign="Left" CssClass="GridPager" />
        <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" Position="Bottom" PageButtonCount="10" />

    </asp:GridView>

</asp:Content>
