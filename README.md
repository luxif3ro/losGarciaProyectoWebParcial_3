# Proyecto Web – losGarciaProyectoWebParcial_3

Este proyecto es un sitio web con cuatro páginas principales:

- **Home**
- **Sobre Nosotros**
- **Productos**
- **Contáctanos**

Las páginas **Productos** y **Contáctanos** están conectadas a una base de datos MySQL y utilizan una biblioteca de clases llamada **Modelo** para realizar operaciones CRUD.

---

# 📌 Tecnologías utilizadas

- ASP.NET WebForms  
- C#  
- Biblioteca de clases (capa Modelo)  
- MySQL  
- MySql.Data  
- HTML / CSS  

---

# 📂 Estructura general del CRUD

El CRUD del proyecto se divide así:

| Página | Operación | Tabla |
|--------|------------|--------|
| **Contáctanos** | CREATE (Insertar mensaje) | `contactanos` |
| **Productos** | READ (Listar), UPDATE (Actualizar), DELETE (Eliminar) | `producto` |

Todas estas operaciones se manejan desde la biblioteca de clases **Modelo** mediante clases independientes.

---

# 🗄️ Clase de Conexión — `Conexion.cs`

Esta clase controla la conexión a la base de datos MySQL.  
Es utilizada por *todos los controladores* del CRUD.

```csharp
using System;
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

            string cadenaConexion = "server=" + servidor + "; database=" + bd + 
                                    "; uid=" + usuario + "; pwd=" + password + ";";

            try
            {
                conexionBD.ConnectionString = cadenaConexion;
                conexionBD.Open();
                System.Diagnostics.Debug.WriteLine("Conexion Exitosa");
            }
            catch (MySqlException ex)
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
```
Perfecto.
Con **todo el código exacto** que me enviaste, ahora sí puedo generarte un **README.md profesional, limpio y totalmente fiel al contenido de tu repositorio**.

---

---

# 📝 CRUD — Módulo *Contáctanos*

La página **Contáctanos** permite insertar un mensaje en la tabla `contactanos`.

### ✔ CREATE — Insertar mensaje

Clase: **Contactanos.cs**

```csharp
using System;

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
```

---

# 📦 CRUD — Módulo *Productos*

Este módulo permite:

* **Listar productos** (READ)
* **Actualizar productos** (UPDATE)
* **Eliminar productos** (DELETE)

Cada producto está representado por un DTO.

---

# ✔ DTO del producto — `ProductoDTO.cs`

```csharp
namespace Modelo
{
    public class ProductoDTO
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string imagen { get; set; }
    }
}
```

---

# ✔ READ — Listar productos

Clase: **Producto.cs**

```csharp
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
```

---

# ✔ UPDATE — Actualizar un producto

```csharp
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
```

---

# ✔ DELETE — Eliminar un producto

```csharp
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
```

---

# ✔ Cómo funciona el CRUD dentro del sitio

## **Página: Productos**

* Al cargar la página, se ejecuta `ListarProductos()`
* Al presionar "Eliminar", se ejecuta `EliminarProducto(id)`
* Al editar y guardar, se ejecuta `ActualizarProducto(id, ...)`
* Al finalizar cada acción, la lista se vuelve a cargar

## **Página: Contáctanos**

* El usuario llena un formulario
* Se llama a `Contactanos.EnviarMensaje(nombre, correo, mensaje)`
* El registro se inserta en la tabla `contactanos`

---

# 🏁 Conclusión

El proyecto implementa correctamente un CRUD completo usando:

* ASP.NET WebForms
* C#
* MySQL
* Biblioteca de clases como capa de acceso a datos

Utilizando clases independientes para mantener separado el control de datos de las páginas web.

---