<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vucem_EEA.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link href="Recursos/CSS/EstiloLogin.css" rel="stylesheet" />
    <title>Inicio de sesi&oacute;n</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/solid.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.0.13/js/all.js"></script>
        <link href="Recursos/CSS/darktheme.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form class="col-12" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdateLogin" runat="server">

        <ContentTemplate>
    <div class="modal-dialog text-center">

        <div class="col-sm-9 main-section">
            <div class="modal-content" >

                    <h1 style="padding:20px; ">EEA-CODE</h1>
                    <h4 style="color: black; ">Iniciar sesi&oacute;n</h4>
                    <br />
                    <div class="form-group" id="user-group">
                        <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" placeholder="Nombre de Usuario"  ></asp:TextBox>

                    </div>
                    <div class="form-group" id="contrasena-group">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass=" form-control " placeholder="Contrase&ntilde;a" TextMode="Password"></asp:TextBox>
                    </div>
                    <div>
                        <asp:LinkButton ID="BtnIngresar" runat="server" CssClass="btn btn-primary" OnClick="BtnIngresar_Click" Width="140" Height="40"><i class="fas fa-sign-in-alt"></i>  Ingresar </asp:LinkButton>

                    </div>

                    <br />
                    <div>

                    </div>
                <br />
                    <div style="text-align: center; color: azure" class="mb-2">
                        <small style="color: dimgray;">Copyright © 2023 Derechos Resevados          
                        </small>
                    </div>
              
            </div>
        </div>
        <br />
        <br />

    </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <!-- Modal -->
    <div id="ErrorLoginModal" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="LoginFailModalModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body text-center" style="padding-top: 40px !important; padding-bottom: 40px !important">
                    <div>
                        <img src="Images/error.png" style="max-width: 100px" />
                    </div>
                </div>
                <div class="modal-body" style="text-align:center;">
                    <h4>Usuario o contraseña incorrectos</h4>
                </div>
                <div class="modal-footer"style="text-align:center !important; align-content:center !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Intentar de nuevo</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ShowErrorLoginModal() {

            $("#ErrorLoginModal").modal("show");

        }

    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>
