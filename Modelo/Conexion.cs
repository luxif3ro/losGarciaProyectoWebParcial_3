using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;

namespace Modelo
{
    public class Conexion
    {
        public MySqlConnection conexionBD = new MySqlConnection();
        public void abrirDB()
        {
            string servidor = "localhost";
            string bd = "losGarcia";
            string usuario = "root";
            string password = "pekotron123";
            //Se crea la cadena de conexion con los parametros anteriores
            string cadenaConexion = "server=" + servidor + "; database=" + bd + "; uid=" + usuario + "; pwd=" + password + ";";
            try//se intenta la conexion
            {
                conexionBD.ConnectionString = cadenaConexion;
                conexionBD.Open();
                //MessageBox.Show("Conexion Exitosa");
                System.Diagnostics.Debug.WriteLine("Conexion Exitosa");
            }
            catch (MySqlException ex)//si hay error se muestra el mensaje
            {
                System.Diagnostics.Debug.WriteLine("Error al conectarse a la base de datos: " + ex.Message);    
            }

        }
        public void cerrarDB()
        {
            try 
            {
                if (conexionBD.State == ConnectionState.Open)
                {
                    conexionBD.Close();
                    //MessageBox.Show("Conexion Cerrada");
                    System.Diagnostics.Debug.WriteLine("Conexion Cerrada");
                }
            }
            catch (MySqlException ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al cerrar la base de datos: " + ex.Message);
            }
        }
    }
}
