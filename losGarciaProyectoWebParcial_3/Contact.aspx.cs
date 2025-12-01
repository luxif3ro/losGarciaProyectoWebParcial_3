using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace losGarciaProyectoWebParcial_3
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Contactanos.EnviarMensaje(txtNombre.Text, txtCorreo.Text, txtMensaje.Text);
            txtNombre.Text = "";
            txtCorreo.Text = "";
            txtMensaje.Text = "";
        }
    }
}