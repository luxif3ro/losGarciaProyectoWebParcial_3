<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="losGarciaProyectoWebParcial_3.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <section
      style="
        display: flex;
        justify-content: center;
        align-items: center;
        height: 85vh;
        text-align: center;
      "
    >
      <div class="card" style="width: 30rem">
        <div class="card-body">
          <h5 class="card-title"> Sobre nosotros</h5>
            <p class="card-text">
                Somos una empresa dedicada a la venta de vinos y licores, con una
                amplia variedad de productos para satisfacer los gustos de nuestros
                clientes. Nos enorgullece ofrecer productos de alta calidad a precios
                competitivos, y nos esforzamos por brindar un excelente servicio al
                cliente. Ya sea que esté buscando un vino para una ocasión especial
                o simplemente quiera disfrutar de una copa después del trabajo, en
                Vinos y Licores "Los Garcia" encontrará lo que necesita.
            </p>
        </div>
      </div>
      <img
        src="../assets/images/pensando.png"
        class="img-fluid rounded"
        alt="Vinos y Licores"
        width="380"
        height="400"
      />
    </section>
    </main>
</asp:Content>
