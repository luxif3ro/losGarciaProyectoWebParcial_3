using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace losGarciaProyectoWebParcial_3
{
    public partial class Producto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarProductos();
                cargarDropdown();
            }
        }

        private void cargarDropdown()
        {
            ddlProductos.DataSource = new Modelo.Producto().ListarProductos();
            ddlProductos.DataTextField = "nombre";
            ddlProductos.DataValueField = "id";
            ddlProductos.DataBind();
        }

        void cargarProductos()
        {
            List<ProductoDTO> productos = new Modelo.Producto().ListarProductos();
            RepeaterProductos.DataSource = productos;
            RepeaterProductos.DataBind();
        }
        protected void RepeaterProductos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Modelo.Producto productoModel = new Modelo.Producto();
                productoModel.EliminarProducto(id);
                cargarProductos();
            }
        }
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlProductos.SelectedValue);

            string nombre = txtNombre.Text;
            string descripcion = txtDescripcion.Text;
            string imagen = txtImagen.Text;

            new Modelo.Producto().ActualizarProducto(id, nombre, descripcion, imagen);

            cargarProductos(); // Actualiza el Repeater
        }

    }
}