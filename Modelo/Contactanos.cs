using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Modelo
{
    public static class Contactanos
    {
        public static void EnviarMensaje(string nombre, string correo, string mensaje)
        {
            Conexion conexion = new Conexion();
            conexion.abrirDB();
            try
            {
                string consulta = "INSERT INTO contactanos (nombre, correo, mensaje) VALUES (@nombre, @correo, @mensaje)";
                using (var comando = new MySql.Data.MySqlClient.MySqlCommand(consulta, conexion.conexionBD))
                {
                    comando.Parameters.AddWithValue("@nombre", nombre);
                    comando.Parameters.AddWithValue("@correo", correo);
                    comando.Parameters.AddWithValue("@mensaje", mensaje);
                    comando.ExecuteNonQuery();
                }
                System.Diagnostics.Debug.WriteLine("Mensaje enviado correctamente.");
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al enviar el mensaje: " + ex.Message);
            }
        }
    }
}
