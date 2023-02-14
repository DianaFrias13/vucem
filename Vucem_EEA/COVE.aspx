<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="COVE.aspx.cs" Inherits="Vucem_EEA.COVE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Recursos/CSS/cove.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="row" style="align-content: end; align-items: end; text-align: right;">
            &nbsp &nbsp &nbsp
            <h3>COVE & E-Document</h3>
        </div>
        <div class="card text-black " style="">
                        <div class="card-body" style="text-align: center;">
        <asp:GridView CssClass="mGrid" ID="CoveEdocGV" runat="server" AutoGenerateColumns="false" ShowHeader="true" GridLines="None"
            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
            PageSize="7" AllowPaging="true">
            
                <Columns>
                    
                    
                            <asp:BoundField DataField="NumeroCove" HeaderText="Numero Cove" ItemStyle-Width="30" />
                            <asp:BoundField DataField="E-Document" HeaderText="E-Document" ItemStyle-Width="30" />
                            <asp:BoundField DataField="Identificador" HeaderText="Identificador" ItemStyle-Width="30" />
                            <asp:BoundField DataField="Pedimento" HeaderText="Pedimento" ItemStyle-Width="10" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" ItemStyle-Width="30" />
                            <asp:BoundField DataField="USD" HeaderText="USD" ItemStyle-Width="30" />
                            <asp:BoundField DataField="MXN" HeaderText="MXN" ItemStyle-Width="30" />
                            <asp:ButtonField ControlStyle-ForeColor="DarkSlateGray" HeaderText="Archivo" ButtonType="Link" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Font-Size="X-Large" CommandName="Select" ControlStyle-CssClass="i" ItemStyle-Width="200"
                                Text="<i class='far fa-file-pdf' aria-hidden='true'></i>" />
                     
                     

                </Columns>
                      
        </asp:GridView>
    </div>

            </div>
</asp:Content>
