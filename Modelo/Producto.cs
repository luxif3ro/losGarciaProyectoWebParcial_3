using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace Modelo
{
    public class Producto
    {
        // ✔ Ahora devuelve una lista de ProductoDTO
        public List<ProductoDTO> ListarProductos()
        {
            Conexion conexion = new Conexion();
            conexion.abrirDB();

            List<ProductoDTO> productos = new List<ProductoDTO>();

            try
            {
                string consulta = "SELECT id, nombre, descripcion, imagen FROM producto";

                using (var comando = new MySqlCommand(consulta, conexion.conexionBD))
                using (var lector = comando.ExecuteReader())
                {
                    while (lector.Read())
                    {
                        productos.Add(new ProductoDTO
                        {
                            id = Convert.ToInt32(lector["id"]),
                            nombre = lector["nombre"].ToString(),
                            descripcion = lector["descripcion"].ToString(),
                            imagen = lector["imagen"].ToString()
                        });
                    }
                }
            }
            catch (MySqlException ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al listar los productos: " + ex.Message);
            }
            finally
            {
                conexion.cerrarDB();
            }

            return productos;
        }

        public void ActualizarProducto(int id, string nombre, string descripcion, string imagen)
        {
            Conexion conexion = new Conexion();
            conexion.abrirDB();

            try
            {
                string consulta = "UPDATE producto SET nombre = @nombre, descripcion = @descripcion, imagen = @imagen WHERE id = @id";

                using (var comando = new MySqlCommand(consulta, conexion.conexionBD))
                {
                    comando.Parameters.AddWithValue("@id", id);
                    comando.Parameters.AddWithValue("@nombre", nombre);
                    comando.Parameters.AddWithValue("@descripcion", descripcion);
                    comando.Parameters.AddWithValue("@imagen", imagen);

                    comando.ExecuteNonQuery();
                }
            }
            catch (MySqlException ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al actualizar el producto: " + ex.Message);
            }
            finally
            {
                conexion.cerrarDB();
            }
        }

        public void EliminarProducto(int id)
        {
            Conexion conexion = new Conexion();
            conexion.abrirDB();

            try
            {
                string consulta = "DELETE FROM producto WHERE id = @id";

                using (var comando = new MySqlCommand(consulta, conexion.conexionBD))
                {
                    comando.Parameters.AddWithValue("@id", id);
                    comando.ExecuteNonQuery();
                }
            }
            catch (MySqlException ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al eliminar el producto: " + ex.Message);
            }
            finally
            {
                conexion.cerrarDB();
            }
        }
    }
}
