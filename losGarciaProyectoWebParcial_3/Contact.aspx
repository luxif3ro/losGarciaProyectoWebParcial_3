<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="losGarciaProyectoWebParcial_3.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
<section style="display: flex; justify-content: center; align-items: center; height: 85vh; text-align: center;">

<img
    src="../imagenes/llamada.png"
    class="img-fluid rounded"
    alt="Vinos y Licores"
    width="380"
    height="400"
/>

<div class="container mt-5" id="contacto">
    <h2 class="text-center mb-4">Contáctanos</h2>

    <div id="contactForm">

        <div class="mb-3">
            <asp:Label ID="lblNombre" runat="server" CssClass="form-label" AssociatedControlID="txtNombre">
                Nombre:
            </asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Tu nombre"></asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="valNombre" 
                runat="server"
                ControlToValidate="txtNombre"
                ErrorMessage="El nombre es obligatorio"
                CssClass="text-danger" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblCorreo" runat="server" CssClass="form-label" AssociatedControlID="txtCorreo">
                Correo Electrónico:
            </asp:Label>
            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" TextMode="Email" placeholder="nombre@correo.com"></asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="valCorreo" 
                runat="server"
                ControlToValidate="txtCorreo"
                ErrorMessage="El correo es obligatorio"
                CssClass="text-danger" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblMensaje" runat="server" CssClass="form-label" AssociatedControlID="txtMensaje">
                Mensaje:
            </asp:Label>
            <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"
                placeholder="Escribe tu mensaje..."></asp:TextBox>

            <asp:RequiredFieldValidator 
                ID="valMensaje" 
                runat="server"
                ControlToValidate="txtMensaje"
                ErrorMessage="El mensaje es obligatorio"
                CssClass="text-danger" />
        </div>

        <!-- Botón que abre modal y guarda en BD -->
        <asp:Button 
            ID="btnGuardar" 
            runat="server" 
            CssClass="btn btn-primary w-100"
            Text="Enviar"
            OnClick="btnGuardar_Click" />
    </div>
</div>

</section>
</main>

</asp:Content>
