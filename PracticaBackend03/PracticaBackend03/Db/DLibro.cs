using System.Data;
using System.Data.SqlClient;
using PracticaBackend03.Conexion;
using PracticaBackend03.Model;

namespace PracticaBackend03.Db;

public class DLibro
{
    private ConexionDb cn;
    public DLibro()
    {
        cn = new ConexionDb();
    }
    
    public async Task<List<Libro>> MostrarLibros()
    {
        var lista = new List<Libro>();
        using (var sql = new SqlConnection(cn.cadenaSQL()))
        {
            using (var cmd = new SqlCommand("MostrarLibros", sql))
            {
                await sql.OpenAsync();
                cmd.CommandType = CommandType.StoredProcedure;
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var mlibros = new Libro();
                        mlibros.id = (int)reader["id"];
                        int idSelected = mlibros.id;
                        mlibros.name = (string)reader["name"];
                        mlibros.description = (string)reader["description"];

                        var libros = await MostrarUsuariosPorLibro(idSelected);
                        mlibros.reserves = libros;
                        lista.Add(mlibros);
                    }
                }
            }
        }

        return lista;
    }
    
    public async Task<List<Usuario>> MostrarUsuariosPorLibro(int id)
    {
        var lista = new List<Usuario>();
        using (var sql = new SqlConnection(cn.cadenaSQL()))
        {
            using (var cmd = new SqlCommand("MostrarUsuariosPorLibro", sql))
            {
                cmd.CommandType = CommandType.StoredProcedure; 
                cmd.Parameters.AddWithValue("@id", id);
                await sql.OpenAsync(); 
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    
                    while (await reader.ReadAsync())
                    {
                        var musuarios = new Usuario();
                        musuarios.id = (int)reader["id"];
                        musuarios.Name = (string)reader["name"];
                        musuarios.faculty = (string)reader["faculty"];
                        lista.Add(musuarios);
                    }
                    
                }
            }
        }
        return lista; 
    }
}