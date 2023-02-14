<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="xPedimento.aspx.cs" Inherits="Vucem_EEA.xPedimento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
                    <link href="cove.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Pedimento:</h1><asp:Label runat="server"></asp:Label>
    <asp:GridView CssClass="mGrid" ID="bancoGV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                PageSize="7" AllowPaging="true">
        <Columns>
                    
                    <asp:BoundField DataField="banco" HeaderText="Banco" ItemStyle-Width="30" />
                    <asp:BoundField DataField="cuenta" HeaderText="Cuenta" ItemStyle-Width="30" />
                    <asp:BoundField DataField="folio" HeaderText="Folio de Constancia" ItemStyle-Width="30" />
                    <asp:BoundField DataField="fecha" HeaderText="Fecha de Constancia " ItemStyle-Width="10" />
                    <asp:BoundField DataField="tipoCta" HeaderText="Tipo de Cuenta" ItemStyle-Width="30" />
                    <asp:BoundField DataField="clave" HeaderText="Clave de Garantia" ItemStyle-Width="30" />
                    <asp:BoundField DataField="total" HeaderText="Total de Garantia" ItemStyle-Width="10" />
                  
                   

                </Columns>
     </asp:GridView>

    <asp:GridView CssClass="mGrid" ID="showPedimentoGV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                PageSize="7" AllowPaging="true">
        <Columns>
                    
                    <asp:BoundField DataField="Archivo" HeaderText="Archivo" ItemStyle-Width="30" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" ItemStyle-Width="30" />
                    <asp:BoundField DataField="TipoDoc" HeaderText="TipoDoc" ItemStyle-Width="30" />
                    <asp:BoundField DataField="Descargar" HeaderText="Descargar" ItemStyle-Width="10" />
                  
                   

                </Columns>
     </asp:GridView>
     <div style="position:fixed; bottom: 0px;top:auto;height:100px;z-index:5;">
      <asp:Button runat="server" Text="Encabezado"  PostBackUrl="~/Encabezado.aspx" CssClass="btnPat"/>&nbsp;
      <asp:Button runat="server" Text="Tasas y cuadros de liquidaci&oacute;n"  PostBackUrl="~/TasasyCuadros.aspx" CssClass="btnPat"/>&nbsp;
      <asp:Button runat="server" Text="Identificadores"  PostBackUrl="~/Identificadores.aspx" CssClass="btnPat"/>&nbsp;
      <asp:Button runat="server" Text="Transporte"  PostBackUrl="~/Transporte.aspx" CssClass="btnPat"/>&nbsp;
      <asp:Button runat="server" Text="Observaciones"  PostBackUrl="~/Observaciones.aspx" CssClass="btnPat"/>

     
  </div>
</asp:Content>
