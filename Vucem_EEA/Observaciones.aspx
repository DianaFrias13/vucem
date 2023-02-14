<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Observaciones.aspx.cs" Inherits="Vucem_EEA.Observaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Observaciones</h1>
    <textarea id="txtObservaciones" cols="100" rows="15" runat="server">Observaciones</textarea>
    <asp:TextBox runat="server" Height="200px" Width="200px"></asp:TextBox>
</asp:Content>
