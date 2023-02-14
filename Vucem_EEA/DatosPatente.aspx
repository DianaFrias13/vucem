<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DatosPatente.aspx.cs" Inherits="Vucem_EEA.DatosPatente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Recursos/CSS/cove.css" rel="stylesheet" type="text/css" />

    <style>
        .gridancho {
            width: 100%;
        }
        .card-header {
            text-align: center;
            background-color: #287233 !important;
            border-radius: 0 !important
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdateContent" runat="server">
        <ContentTemplate>
            <asp:DropDownList ID="SelectorTabla" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SelectorTabla_SelectedIndexChanged" CssClass="form-control col-lg-6 col-md-9 col-sm-12">
                <asp:ListItem Value="DatosGenerales" Text="Datos Generales"></asp:ListItem>
                <asp:ListItem Value="Transporte" Text="Transporte"></asp:ListItem>
                <asp:ListItem Value="Guias" Text="Gu&iacute;as"></asp:ListItem>
                <asp:ListItem Value="Contenedores" Text="Contenedores"></asp:ListItem>
                <asp:ListItem Value="CFDI" Text="CFDI o Documento Equivalente"></asp:ListItem>
                <asp:ListItem Value="Fechas" Text="Fechas"></asp:ListItem>
                <asp:ListItem Value="IdentificadoresPed" Text="Identificadores a Nivel Pedimento"></asp:ListItem>
                <asp:ListItem Value="CuentasAduaneras" Text="Cuentas Aduaneras de Garant&iacute;a Nivel Partida"></asp:ListItem>
                <asp:ListItem Value="TasaPedimento" Text="Tasas a Nivel Pedimento"></asp:ListItem>
                <asp:ListItem Value="DetContribuciones" Text=" Contribuciones a Nivel Pedimento"></asp:ListItem>
                <asp:ListItem Value="Observaciones" Text="Observaciones a Nivel Pedimento"></asp:ListItem>
                <asp:ListItem Value="Descargos" Text="Descargos"></asp:ListItem>
                <asp:ListItem Value="Destinatarios" Text="Destinatarios"></asp:ListItem>
                <asp:ListItem Value="Partidas" Text="Partidas"></asp:ListItem>
                <asp:ListItem Value="Mercancias" Text="Mercanc&iacute;as"></asp:ListItem>
                <asp:ListItem Value="Permisos" Text="Permisos"></asp:ListItem>
                <asp:ListItem Value="Identificadores" Text="Identificadores a Nivel Partida"></asp:ListItem>
                <asp:ListItem Value="CuentasAduanerasPed" Text="Cuentas Aduaneras de Garant&iacute;a Nivel Pedimento"></asp:ListItem>
                <asp:ListItem Value="Tasas" Text="Tasas a Nivel Partida"></asp:ListItem>
                <asp:ListItem Value="Contrib_Partida" Text="Contribuciones a Nivel Partida"></asp:ListItem>
                <asp:ListItem Value="ObsPartida" Text="Observaciones a Nivel Partida"></asp:ListItem>
                <asp:ListItem Value="Rectificacion" Text="Rectificaci&oacute;n"></asp:ListItem>
                <asp:ListItem Value="DifContribuciones" Text="Diferencias de Contribuciones "></asp:ListItem>
            </asp:DropDownList>

            <br />
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updDatosGenerales" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelDatosGenerales" runat="server">
                <h3>Datos Generales</h3>

                <asp:GridView CssClass="gridancho" ID="DatosGV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                    AllowPaging="true">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class=" card card-header" >
                                    <div class="row">
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size: 1rem; color: white;">Tipo de Operaci&oacute;n</label>

                                            <asp:TextBox ID="txtTipoOp" runat="server" Text='<%# Eval("TipoOp") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size:1rem; color: white;">Clave de Documento</label>

                                            <asp:TextBox ID="txtClaveDoc" runat="server" Text='<%# Eval("ClaveDoc") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size:1rem; color: white;">Secci&oacute;n Aduanera de Entrada</label>

                                            <asp:TextBox ID="TxtSeccion" runat="server" Text='<%# Eval("SeccAdu") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-body" style="border-radius: 0 !important;">
                                    <div class="container-fluid p-0">
                                        <div class="row">

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">CURP del Contribuyente</label>

                                                <asp:TextBox ID="txtCURPcont" runat="server" Text='<%# Eval("CURPcont") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">RFC</label>

                                                <asp:TextBox ID="txtRFC" runat="server" Text='<%# Eval("RFC") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">CURP Agente Aduanal</label>

                                                <asp:TextBox ID="txtCURPage" runat="server" Text='<%# Eval("CUPRage") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Tipo de Cambio</label>

                                                <asp:TextBox ID="txtTipoCambio" runat="server" Text='<%# Eval("TipoCam") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Total de Fletes</label>
                                                <asp:TextBox ID="txtTotFletess" runat="server" Text='<%# Eval("TotFletes") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>

                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class=" ol-form-label" style="font-weight: bold; font-size: 1rem;">Total de Seguros</label>
                                                <asp:TextBox ID="txtToteguros" runat="server" Text='<%# Eval("TotSeguros") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Total de Embalajes</label>
                                                <asp:TextBox ID="txtTotEmb" runat="server" Text='<%# Eval("TotEmb") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class=" col-form-label" style="font-weight: bold; font-size: 1rem;">Total de Incrementables</label>
                                                <asp:TextBox ID="txtTotIncr" runat="server" Text='<%# Eval("TotIncr") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Total de Deducibles</label>
                                                <asp:TextBox ID="txtTotDeduc" runat="server" Text='<%# Eval("TotDeduc") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Peso Bruto Mercancia</label>
                                                <asp:TextBox ID="txtPBM" runat="server" Text='<%# Eval("PBM") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class=" col-form-label" style="font-weight: bold; font-size: 1rem;">Medio de Transporte de Salida</label>
                                                <asp:TextBox ID="TXTtRsalida" runat="server" Text='<%# Eval("TrSalida") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Medio de Transporte de Arribo</label>
                                                <asp:TextBox ID="txtTrArribo" runat="server" Text='<%# Eval("TrArribo") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Medio de Transporte de Entrada y Salida</label>
                                                <asp:TextBox ID="txttrEntSal" runat="server" Text='<%# Eval("TrEntSal") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class=" col-form-label" style="font-weight: bold; font-size: 1rem;">Destino de la Mercanc&iacute;a</label>
                                                <asp:TextBox ID="txtDestinoMerc" runat="server" Text='<%# Eval("DestinoMerc") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Nombre del Contribuyente</label>
                                                <asp:TextBox ID="txtNombContribuyente" runat="server" Text='<%# Eval("NombContribuyente") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class=" col-form-label" style="font-weight: bold; font-size: 1rem;">Calle del Contribuyente</label>
                                                <asp:TextBox ID="txtCalleContribuyente" runat="server" Text='<%# Eval("CalleContribuyente") %>' CssClass="form-control" Enabled="false" ></asp:TextBox>
                                            </div>
                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Número Interior del Contribuyente </label>
                                                <asp:TextBox ID="txtNumIntC" runat="server" Text='<%# Eval("NumIntContrib") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>

                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Número exterior del contribuyente</label>
                                                <asp:TextBox ID="txtNumExtContrib" runat="server" Text='<%# Eval("NumExtContrib") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class=" col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">CP del Contribuyente</label>
                                                <asp:TextBox ID="txtCPContribuyente" runat="server" Text='<%# Eval("CPContribuyente") %>' CssClass="form-control" Enabled="false"></asp:TextBox>

                                            </div>

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class=" col-form-label" style="font-weight: bold; font-size: 1rem;">Municipio del Contribuyente</label>
                                                <asp:TextBox ID="txtMunicContrib" runat="server" Text='<%# Eval("MunicContrib") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Entidad Federal del Contribuyente</label>
                                                <asp:TextBox ID="txtEntidadContrib" runat="server" Text='<%# Eval("EntidadContrib") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Pa&iacute;s del Contribuyente</label>
                                                <asp:TextBox ID="txtPaisContrib" runat="server" Text='<%# Eval("PaisContrib") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Tipo de Pedimento</label>
                                                <asp:TextBox ID="txtTipoPedimento" runat="server" Text='<%# Eval("TipoPedimento") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Fecha de Recepci&oacute;n del Pedimento</label>
                                                <asp:TextBox ID="txtFechaRecepcion" runat="server" Text='<%# Eval("FechaRecepcion") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label class="col-form-label" style="font-weight: bold; font-size: 1rem;">Fecha de Pago</label>
                                                <asp:TextBox ID="txtFechaPago" runat="server" Text='<%# Eval("FechaPago") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="updTransporte" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelTransporte" runat="server">
                <h3>Transporte</h3>
                <br />
                <div class="card text-black " style="">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="TransporteGV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="RFCtransp" HeaderText="RFC del Transportista" ItemStyle-Width="10" />
                                <asp:BoundField DataField="CURPtransp" HeaderText="CURP del Transportista" ItemStyle-Width="30" />
                                <asp:BoundField DataField="NombreTransp" HeaderText="Nombre del Transportista" ItemStyle-Width="30" />
                                <asp:BoundField DataField="PaisTransp" HeaderText="Pa&iacute;s del Transportista" ItemStyle-Width="30" />
                                <asp:BoundField DataField="IdentifTransp" HeaderText="Identificador del Transporte" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="10" />



                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updTasasPedimento" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelTasasPedimento" runat="server">
                <h3>Tasas a Nivel Pedimento</h3>
                <br />
                <div class="card text-black " style="">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="tasaPed_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="ClaveContr" HeaderText="Clave de Contribuci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Tasa" HeaderText="Tasa de Contribuci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TipoTasa" HeaderText="Tipo de Tasa" ItemStyle-Width="10" />
                                <asp:BoundField DataField="TipoPed" HeaderText="Tipo de Pedimento" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updIdentNivelPartida" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelIdentificadores" runat="server">
                <h3>Identificadores a Nivel Partida</h3>
                <br />
                <div class="card text-black " style="">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="IdentificadoresGV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="Fraccion" HeaderText="Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="SecFraccion" HeaderText="Secuencia de la Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="ClaveCaso" HeaderText="Clave del Caso" ItemStyle-Width="30" />
                                <asp:BoundField DataField="IdCaso" HeaderText="Identificador del Caso" ItemStyle-Width="10" />
                                <asp:BoundField DataField="ComplCaso" HeaderText="Complemento del Caso" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha ed Pago" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updTasas" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelTasas" runat="server">
                <h3>Tasas a Nivel Partida</h3>
                <br />
                <div class="card text-black " style="">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="TasasGV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="Fraccion" HeaderText="Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="ClaveContr" HeaderText="Clave de Contribuci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Tasa" HeaderText="Tasa de Contribuci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TipoTasa" HeaderText="Tipo de Tasa" ItemStyle-Width="10" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updIdentificadores" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelIdentificadoresPed" runat="server">
                <h3>Identificadores a Nivel Pedimento</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="IdentPed_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="IdentPed_GV_PageIndexChanging " PagerStyle-HorizontalAlign="Left">
                            <Columns>

                                <asp:BoundField DataField="ClaveCaso" HeaderText="Clave del Caso" ItemStyle-Width="30" />
                                <asp:BoundField DataField="IdCaso" HeaderText="Identificador del Caso" ItemStyle-Width="10" />
                                <asp:BoundField DataField="TipoPed" HeaderText="Tipo de Pedimento" ItemStyle-Width="30" />
                                <asp:BoundField DataField="ComplCaso" HeaderText="Complemento del Caso" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaValidPago" HeaderText="Fecha de Validaci&oacute;n del Pago" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updCFDI" runat="server">
        <ContentTemplate>

            <asp:Panel ID="PanelCFDI" runat="server">
                <h3>CFDI o Documento Equivalente</h3>
                <br />

                <asp:GridView CssClass="gridancho" ID="CFDI_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                    AllowPaging="true" OnPageIndexChanging="CFDI_GV_PageIndexChanging" PageSize="1">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class=" card card-header">
                                    <div class="row">

                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size: 1rem; color: white;">Fecha de Facturaci&oacute;n</label>
                                            <asp:Label runat="server" ID="lblFechaFact" Text='<%# Eval("FechaFact") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                        </div>
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size: 1rem; color: white;">N&uacute;mero de Factura</label>
                                            <asp:Label ID="lblNumFcat" runat="server" Text='<%# Eval("NumFact") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                        </div>
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size: 1rem; color: white;">Termino de Facturaci&oacute;n</label>
                                            <asp:Label ID="lblTermFact" runat="server" Text='<%# Eval("TermFact") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class=" card card-body" style="border-radius: 0 !important">
                                    <div class="container-fluid p-0">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Valor en D&oacute;lares</label>
                                                <asp:Label ID="lblValDolares" runat="server" Text='<%# Eval("ValDolares") %>' CssClass="form-control" Enabled="false"></asp:Label>

                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Valor en Moneda Extranjera</label>

                                                <asp:Label ID="lblValMonedaExt" runat="server" Text='<%# Eval("ValMonedaExt") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Moneda de Facturaci&oacute;n</label>
                                                <asp:Label ID="lblMonFact" runat="server" Text='<%# Eval("MonFact") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                            </div>

                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Pa&iacute;s de Facturaci&oacute;n</label>
                                                <asp:Label ID="lblPaisFcat" runat="server" Text='<%# Eval("PaisFact") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Entidad Federativa de Facturaci&oacute;n</label>
                                                <asp:Label ID="lblEntFedFact" runat="server" Text='<%# Eval("EntFedFact") %>' CssClass="form-control" Enabled="false"></asp:Label>

                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Identificaci&oacute;n Fiscal del Proveedor</label>
                                                <asp:Label ID="lblIdFiscProv" runat="server" Text='<%# Eval("IdFIscProv") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Proveedor de Mercanc&iacute;a </label>
                                                <asp:Label ID="lblProvMercancia" runat="server" Text='<%# Eval("ProvMercancia") %>' CssClass="form-control" Enabled="false"></asp:Label>

                                            </div>


                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Calle del Proveedor</label>
                                                <asp:Label ID="lblCalleProv" runat="server" Text='<%# Eval("CalleProv") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">N&uacute;mero Interior del Proveedor</label>
                                                <asp:TextBox ID="lblNumInterProv" runat="server" Text='<%# Eval("NumInterProv") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">N&uacute;mero Exterior del Proveedor</label>
                                                <asp:Label ID="lblNumExtProv" runat="server" Text='<%# Eval("NumExtProv") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">CP del Proveedor</label>
                                                <asp:Label ID="lblCPProv" runat="server" Text='<%# Eval("CPprov") %>' CssClass="form-control" Enabled="false"></asp:Label>

                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Municipio del Proveedor</label>
                                                <asp:Label ID="lblMunicProv" runat="server" Text='<%# Eval("MunicProv") %>' CssClass="form-control"   Enabled="false"></asp:Label>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Fecha de Pago</label>
                                                <asp:Label ID="lblFechapAGO" runat="server" Text='<%# Eval("FechaPago") %>' CssClass="form-control" Enabled="false"></asp:Label>
                                            </div>
                                        </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <PagerStyle Height="30px" VerticalAlign="Top" HorizontalAlign="Left" CssClass="GridPager" />
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" Position="Top" PageButtonCount="10" />
                </asp:GridView>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updDestinatarios" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelDestinatarios" runat="server">
                <h3>Destinatarios</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="Destinatarios_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="IdFiscal_Dest" HeaderText="ID FISCAL" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Nombrec_Dest" HeaderText="Nombre del Destinatario" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Calle_Des" HeaderText="Calle" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Numext_Des" HeaderText="N&uacute;mero Exterior" ItemStyle-Width="10" />
                                <asp:BoundField DataField="NumInt_Des" HeaderText="N&uacute;mero Interior" ItemStyle-Width="10" />
                                <asp:BoundField DataField="CdMun_Dest" HeaderText="CD Municipio" ItemStyle-Width="30" />
                                <asp:BoundField DataField="CP_Dest" HeaderText="CP" ItemStyle-Width="10" />
                                <asp:BoundField DataField="Pais_Dest" HeaderText="Pa&iacute;s" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />



                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updGuias" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelGuias" runat="server">
                <h3>Gu&iacute;as</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="Guias_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="NumGuia" HeaderText="N&uacute;mero de Gu&iacute;a" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TipoGuia" HeaderText="Tipo de Gu&iacute;a" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />



                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updCuentasAduaneras" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelCuentasAduaneras" runat="server">
                <h3>Cuentas Aduaneras de Garant&iacute;a a Nivel Partida</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="CuentasAduaneras_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="Fraccion" HeaderText="Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="SecFraccion" HeaderText="Secuencia de la Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Inst_Emisora" HeaderText="Instituci&oacute;n Emisora" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Num_Cuenta_Adu" HeaderText="N&uacute;mero de Cuenta" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FolioConstancia" HeaderText="Folio de Constancia" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaConstancia" HeaderText="Fecha de Constancia" ItemStyle-Width="10" />
                                <asp:BoundField DataField="Clave_Garantia" HeaderText="Clave de Garant&iacute;a" ItemStyle-Width="10" />
                                <asp:BoundField DataField="VUT" HeaderText="Valor Unitario T&iacute;tulo" ItemStyle-Width="10" />
                                <asp:BoundField DataField="Total_Garantia" HeaderText="Total de Garant&iacute;a" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Cantidad_UM" HeaderText="Cantidad Unidades de Medida" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TitAsig" HeaderText="T&iacute;tulos Asignados" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />



                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updDescargos" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelDescargos" runat="server">
                <h3>Descargos</h3>
                                <br />

                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                <asp:GridView CssClass="mGrid" ID="Descargos_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                    PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                    AllowPaging="true">
                    <Columns>

                        <asp:BoundField DataField="PatenteOrig" HeaderText="Patente Original" ItemStyle-Width="30" />
                        <asp:BoundField DataField="PedimentoOrig" HeaderText="Pedimento Original" ItemStyle-Width="30" />
                        <asp:BoundField DataField="Aduana_Orig" HeaderText="Secci&oacute;n Aduanera del Despacho Original" ItemStyle-Width="30" />
                        <asp:BoundField DataField="Doc_Orig" HeaderText="Documento Original" ItemStyle-Width="10" />
                        <asp:BoundField DataField="FechaPago_Orig" HeaderText="Fecha de Pago Original" ItemStyle-Width="30" />
                        <asp:BoundField DataField="Fraccion_Orig" HeaderText="Fracci&oacute;n Original" ItemStyle-Width="10" />
                        <asp:BoundField DataField="UnidMedida" HeaderText="Clave Unidad de Medida Original" ItemStyle-Width="30" />
                        <asp:BoundField DataField="Mercancia" HeaderText="Mercanc&iacute;a Descargada" ItemStyle-Width="10" />
                        <asp:BoundField DataField="TipoPed" HeaderText="Tipo de Pedimento" ItemStyle-Width="30" />
                        <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />

                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updCuentasAduanerasPedimento" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelCuentasAduanerasPedimento" runat="server">
                <h3>Cuentas Aduaneras de Garant&iacute;a a Nivel Pedimento</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="CuentasPedim_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="Inst_Emisora" HeaderText="Instituci&oacute;n Emisora" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Num_Cuenta_Adu" HeaderText="N&uacute;mero de Cuenta" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FolioConstancia" HeaderText="Folio de Constancia" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaConstancia" HeaderText="Fecha de Constancia" ItemStyle-Width="10" />
                                <asp:BoundField DataField="TipoCta" HeaderText="Tipo de Cuenta" ItemStyle-Width="10" />
                                <asp:BoundField DataField="Clave_Garantia" HeaderText="Clave de Garant&iacute;a" ItemStyle-Width="10" />
                                <asp:BoundField DataField="VUT" HeaderText="Valor Unitario T&iacute;tulo" ItemStyle-Width="10" />
                                <asp:BoundField DataField="Total_Garantia" HeaderText="Total de Garant&iacute;a" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Cantidad_UM" HeaderText="Cantidad Unidades de Medida" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TitAsig" HeaderText="T&iacute;tulos Asignados" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updObservacionesPartida" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelObsPartida" runat="server">
                <h3>Observaciones a Nivel Partida</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="ObsPartida_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="Fraccion" HeaderText="Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="SecFraccion" HeaderText="Secuencia de la Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="SecObservacion" HeaderText="Secuencia de Observaci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />




                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updRectificacion" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelRectificacion" runat="server">
                <h3>Rectificaci&oacute;n</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="Rectificacion_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="ClavePed" HeaderText="Clave del Pedimento" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="10" />
                                <asp:BoundField DataField="PedAnterior" HeaderText="Pedimento Anterior" ItemStyle-Width="30" />
                                <asp:BoundField DataField="PatAnterior" HeaderText="Patente Anterior" ItemStyle-Width="10" />
                                <asp:BoundField DataField="AduAnterior" HeaderText="Secci&oacute;n Aduanera Anterior" ItemStyle-Width="30" />
                                <asp:BoundField DataField="DocAnterior" HeaderText="Documento Anterior" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaAnterior" HeaderText="Fecha de Operaci&oacute;n Anterior" ItemStyle-Width="30" />
                                <asp:BoundField DataField="PedOriginal" HeaderText="Pedimento Original" ItemStyle-Width="30" />
                                <asp:BoundField DataField="PatOriginal" HeaderText="Patente Original" ItemStyle-Width="10" />
                                <asp:BoundField DataField="AduOriginal" HeaderText="Secci&oacute;n Aduanera Original" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updFechas" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelFechas" runat="server">
                <h3>Fechas</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="Fechas_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="TipoFecha" HeaderText="Tipo de Fecha" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaOper" HeaderText="Fecha de Operaci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaValPago" HeaderText="Fecha de Validaci&oacute;n de Pago" ItemStyle-Width="30" />

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updContribuciones" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelDetContribuciones" runat="server">
                <h3>Contribuciones a nivel Pedimento</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="DetContribuciones_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="ClaveContr" HeaderText="Clave de Contribuci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Importe" HeaderText="Importe" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FormaPago_DC" HeaderText="Forma de Pago" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TipoPed" HeaderText="Tipo de Pedimento" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updContribPartida" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelContribPartida" runat="server">
                <h3>Contribuciones a Nivel Partida</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="ContrPartida_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="Fraccion" HeaderText="Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="SecFraccion" HeaderText="Secuencia de la Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="ClaveContr" HeaderText="Clave de Contribuci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Importe" HeaderText="Importe" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FormaPago_DC" HeaderText="Forma de Pago" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updDifContribuciones" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelDifContribuciones" runat="server">
                <h3>Diferencias de Contribuciones </h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="DifContribuciones_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="ClaveContr" HeaderText="Clave de Contribuci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Importe" HeaderText="Importe" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FormaPago_DC" HeaderText="Forma de Pago" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TipoPed" HeaderText="Tipo de Pedimento" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPartidas" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelPartidas" runat="server">
                <h3>Partidas</h3>
                <br />
               
                <asp:GridView CssClass="gridancho" ID="Partidas_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                    OnPageIndexChanging="Partidas_GV_PageIndexChanging" AllowPaging="true" PageSize="1">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class=" card card-header" >

                                    <div class="row">
                                        <div class=" col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size: 1rem; color: white;">Fracci&oacute;n</label>
                                            <asp:TextBox ID="txtFraccion" runat="server" Text='<%# Eval("Fraccion") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size: 1rem; color: white;">Secuencia de la Fracci&oacute;n</label>
                                            <asp:TextBox ID="txtSecFraccion" runat="server" Text='<%# Eval("SecFraccion") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4 col-md-8 col-sm-12">
                                            <label style="font-weight: bold; font-size: 1rem; color: white;">Subdivisi&oacute;n de la Fracci&oacute;n</label>
                                            <asp:TextBox ID="txtSubFraccion" runat="server" Text='<%# Eval("SubFraccion") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-body" style="border-radius: 0 !important">
                                    <div class="container-fluid p-0">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Descripci&oacute;n de la Mercanc&iacute;a</label>
                                                <asp:TextBox ID="txtDescMerca" runat="server" Text='<%# Eval("DescrMercancia") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Precio Unitario</label>
                                                <asp:TextBox ID="txtPrecioUnit" runat="server" Text='<%# Eval("PrecioUnit") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Valor de la Aduana</label>
                                                <asp:TextBox ID="txtValorAduana" runat="server" Text='<%# Eval("ValorAduana") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Valor Comercial</label>
                                                <asp:TextBox ID="txtTipoOp" runat="server" Text='<%# Eval("ValComercial") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Valor en D&oacute;lares</label>
                                                <asp:TextBox ID="txtClaveDoc" runat="server" Text='<%# Eval("ValDolares") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Cantidad UM Comercial</label>
                                                <asp:TextBox ID="TxtSeccion" runat="server" Text='<%# Eval("UMcomercial") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Unidad de Medida Comercial </label>
                                                <asp:TextBox ID="txtCURPcont" runat="server" Text='<%# Eval("UMC") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Cantidad UM Tarifa</label>
                                                <asp:TextBox ID="txtCUM" runat="server" Text='<%# Eval("cantUMtarifa") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Unidad de Medida de la Tarifa</label>
                                                <asp:TextBox ID="txtUM" runat="server" Text='<%# Eval("UMtarifa") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Valor Agregado</label>
                                                <asp:TextBox ID="txtValAgre" runat="server" Text='<%# Eval("Val_Agr") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Clave de Vinculaci&oacute;n</label>
                                                <asp:TextBox ID="txtClaveVinc" runat="server" Text='<%# Eval("ClaveVinc") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">M&eacute;todo de Valoraci&oacute;n</label>
                                                <asp:TextBox ID="txtMetVlor" runat="server" Text='<%# Eval("MetValor") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">C&oacute;digo de Mercanc&iacute;a</label>
                                                <asp:TextBox ID="txtCodMerca" runat="server" Text='<%# Eval("CodMerca") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Marca de Mercanc&iacute;a</label>
                                                <asp:TextBox ID="txtMarca" runat="server" Text='<%# Eval("MarcaMerc") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Modelo de Mercanc&iacute;a</label>
                                                <asp:TextBox ID="txtModelo" runat="server" Text='<%# Eval("ModeloMerca") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Pa&iacute;s Origen o Destino</label>
                                                <asp:TextBox ID="txtPaisDest" runat="server" Text='<%# Eval("PaisDest") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Pa&iacute;s del Comprador o Vendedor</label>
                                                <asp:TextBox ID="txtPaisCompr" runat="server" Text='<%# Eval("PaisCompr") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Entidad Federativa de Origen</label>
                                                <asp:TextBox ID="txtEntorigen" runat="server" Text='<%# Eval("EntidadOrigen") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Entidad Federativa de Destino</label>
                                                <asp:TextBox ID="txtEntidadDest" runat="server" Text='<%# Eval("EntidadDest") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Entidad Federativa del Comprador</label>
                                                <asp:TextBox ID="txtEntidadCompr" runat="server" Text='<%# Eval("EntidadComprador") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Entidad Federativa del Vendedor</label>
                                                <asp:TextBox ID="txtEntVendedor" runat="server" Text='<%# Eval("EntidadVendedor") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Tipo de Operaci&oacute;n</label>
                                                <asp:TextBox ID="txtTipoOpe" runat="server" Text='<%# Eval("TipoOP") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Clave de Pedimento</label>
                                                <asp:TextBox ID="txtClavePed" runat="server" Text='<%# Eval("ClavePed") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 col-md-8 col-sm-12">
                                                <label style="font-weight: bold; font-size: 1rem;">Fecha de Pago</label>
                                                <asp:TextBox ID="txtFechaPago" runat="server" Text='<%# Eval("FechaPago") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>


                                        </div>

                                    </div>
                                </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <PagerStyle Height="30px" VerticalAlign="Top" HorizontalAlign="Left" CssClass="GridPager" />
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" Position="Top" PageButtonCount="10" />
                </asp:GridView>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updContenedores" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelContenedores" runat="server">
                <h3>Contenedores</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="Contenedores_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="NumCont" HeaderText="N&uacute;mero de Contenedor" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TipoCont" HeaderText="Tipo de Contenedor" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPermisos" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelPermisos" runat="server">
                <h3>Permisos</h3>
                
                 <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="Permisos_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>

                                <asp:BoundField DataField="Fraccion" HeaderText="Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="SecFraccion" HeaderText="Secuencia de la Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="ClavePermiso" HeaderText="Clave del Permiso" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FirmaDescargo" HeaderText="Firma de Descargo" ItemStyle-Width="30" />
                                <asp:BoundField DataField="NumPermiso" HeaderText="N&uacute;mero de Permiso" ItemStyle-Width="30" />
                                <asp:BoundField DataField="ValDolares" HeaderText="Valor D&oacute;lares" ItemStyle-Width="30" />
                                <asp:BoundField DataField="UMTcantidad" HeaderText="Cantidad de Mercanc&iacute;a UMT" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updMercancias" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelMercancias" runat="server">
                <h3>Mercanc&iacute;as</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="Mercancias_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="Fraccion" HeaderText="Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="SecFraccion" HeaderText="Secuencia de la Fracci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="NumVehic" HeaderText="N&uacute;mero de Veh&iacute;culo" ItemStyle-Width="30" />
                                <asp:BoundField DataField="KmVehic" HeaderText="Kilometraje del Veh&iacute;culo" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" ItemStyle-Width="30" />

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updObervaciones" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelObservaciones" runat="server">
                <h3>Observaciones a Nivel Pedimento</h3>
                <br />
                <div class="card text-black ">
                    <div class="card-body" style="text-align: center;">
                        <asp:GridView CssClass="mGrid" ID="Observaciones_GV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                            AllowPaging="true">
                            <Columns>


                                <asp:BoundField DataField="SecObservacion" HeaderText="Secuencia de Observaci&oacute;n" ItemStyle-Width="30" />
                                <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" ItemStyle-Width="30" />
                                <asp:BoundField DataField="TipoPed" HeaderText="Tipo de Pedimento" ItemStyle-Width="30" />
                                <asp:BoundField DataField="FechaValPago" HeaderText="Fecha de Validaci&oacute;n de Pago" ItemStyle-Width="30" />


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
