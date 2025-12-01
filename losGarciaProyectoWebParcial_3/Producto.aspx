<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="losGarciaProyectoWebParcial_3.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <section
            style="display: flex; justify-content: center; align-items: center; height: 85vh; text-align: center;">
            <img
                src="../imagenes/noidea.png"
                class="img-fluid rounded"
                alt="Vinos y Licores"
                width="380"
                height="400" />

                <h1>Nuestros Productos</h1>
                <div style="display: flex;
    gap: 20px;
    justify-content: center;
    flex-wrap: nowrap;
    overflow-x: auto;
    width: 100%;
    padding: 1rem;">
                    <asp:Repeater ID="RepeaterProductos" runat="server" OnItemCommand="RepeaterProductos_ItemCommand">
                        <ItemTemplate>
                            <div class="card" style="width: 18rem;">
                                <h5 class="card-title"><%# Eval("nombre") %></h5>
                                <asp:Image ID="imgProducto" runat="server"
                                    ImageUrl='<%# ResolveUrl("~/Imagenes/" + Eval("imagen")) %>'
                                    CssClass="card-img-top" 
                                    Style="object-fit: cover;" />

                                <div class="card-body">
                                    <p class="card-text">ID: #<%# Eval("id") %></p>
                                    <p class="card-text"><%# Eval("descripcion") %></p>
                                    <asp:Button ID="btnEliminar" AccessKey="E" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="Eliminar" CommandArgument='<%# Eval("id") %>' />
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
        </section>
        <section>
            <p>Actualizar producto</p>

            <!-- ID del producto desde un DropDownList -->
            <asp:DropDownList
                ID="ddlProductos"
                runat="server"
                DataTextField="nombre"
                DataValueField="id">
            </asp:DropDownList>

            <br />
            <br />

            <!-- Nombre -->
            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nuevo nombre" />

            <!-- Descripción -->
            <asp:TextBox ID="txtDescripcion" runat="server" placeholder="Nueva descripcion" />

            <!-- Imagen -->
            <asp:TextBox ID="txtImagen" runat="server" placeholder="URL de imagen" />

            <br />
            <br />

            <!-- Botón con OnClick NORMAL -->
            <asp:Button
                ID="btnActualizar"
                runat="server"
                Text="Actualizar"
                OnClick="btnActualizar_Click"
                CssClass="btn btn-primary" />
        </section>

    </main>
</asp:Content>
