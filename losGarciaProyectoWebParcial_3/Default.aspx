<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="losGarciaProyectoWebParcial_3._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
      <section style="display: flex; justify-content: center; align-items: center; height: 85vh;  text-align: center;">
        <img
                src="/imagenes/presentando.png"
                class="img-fluid rounded"
                alt="Vinos y Licores"
                width="380"
                height="400"
              />
              <h1 style="font-size: 150px;">Vinos y Licores <label class="nombre">"Los Garcia"</label></h1>
      </section>
      <section>
        <section>
            <div class="container mt-5">
                <p>
                Bienvenido a nuestra tienda en línea de vinos y licores. Aquí
                encontrarás una amplia selección de bebidas alcohólicas de alta
                calidad para todas las ocasiones. Ya sea que estés buscando un vino
                elegante para una cena especial o un licor único para regalar, lo
                tenemos todo.
                </p>
                <p>
                Nuestro compromiso es ofrecer productos auténticos y un servicio
                excepcional. Explora nuestro catálogo y descubre las mejores
                opciones para ti.
                </p>
            </div>
        </section>
      </section>
      <section>
        <div id="carouselExampleDark" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="10000">
              <img src="/imagenes/pasport.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="2000">
              <img src="/imagenes/bacardi.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="/imagenes/centenario.png" class="d-block w-100" alt="...">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </section>
    </main>

</asp:Content>
