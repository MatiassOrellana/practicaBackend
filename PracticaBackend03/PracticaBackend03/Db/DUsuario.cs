using System.Data;
using System.Data.SqlClient;
using PracticaBackend03.Conexion;
using PracticaBackend03.Model;

namespace PracticaBackend03.Db;

public class DUsuario
{
    private ConexionDb cn;

    public DUsuario()
    {
        cn = new ConexionDb();
    }

    public async Task<List<Usuario>> MostrarUsuarios()
    {
        var lista = new List<Usuario>();
        using (var sql = new SqlConnection(cn.cadenaSQL()))
        {
            using (var cmd = new SqlCommand("MostrarUsuarios", sql))
            {
                await sql.OpenAsync();
                cmd.CommandType = CommandType.StoredProcedure;
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var musuarios = new Usuario();
                        musuarios.id = (int)reader["id"];
                        int idSelected = musuarios.id;
                        musuarios.Name = (string)reader["name"];
                        musuarios.faculty = (string)reader["faculty"];
                        musuarios.quantity = await MostrarConteo(idSelected);
                        if (musuarios.quantity != 0)
                        {
                            musuarios.Last_Reserved = await MostrarFecha(idSelected);
                            
                        }
                        var libros = await MostrarLibrosPorUsuario(idSelected);
                        musuarios.reserves = libros;
                        lista.Add(musuarios);
                    }
                }
            }
        }

        return lista;
    }

    public async Task<DateTime> MostrarFecha(int id)
    {
        var fecha = new DateTime();
        
        using (var sql = new SqlConnection(cn.cadenaSQL()))
        {
            using (var cmd = new SqlCommand("MostrarfechaMasReciente", sql))
            {
                cmd.CommandType = CommandType.StoredProcedure; 
                cmd.Parameters.AddWithValue("@id", id);
                await sql.OpenAsync(); 
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                
                    while (await reader.ReadAsync())
                    {
                        var reservado = (DateTime)reader[""];
                        fecha = reservado;
                    }
                
                }
            }
        }
        return fecha;
        
    }
    
    public async Task<int> MostrarConteo(int id)
    {
        var count = 0;
        using (var sql = new SqlConnection(cn.cadenaSQL()))
        {
            using (var cmd = new SqlCommand("ContarLibros", sql))
            {
                cmd.CommandType = CommandType.StoredProcedure; 
                cmd.Parameters.AddWithValue("@id", id);
                await sql.OpenAsync(); 
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    
                    while (await reader.ReadAsync())
                    {
                        var libros = (int)reader[""];//lee  la contraseña
                        count = libros;
                    }
                    
                }
            }
        }
        return count; 
    }
    
    public async Task<List<Libro>> MostrarLibrosPorUsuario(int id)
    {
        var lista = new List<Libro>();
        using (var sql = new SqlConnection(cn.cadenaSQL()))
        {
            using (var cmd = new SqlCommand("MostrarLibrosPorUsuario", sql))
            {
                cmd.CommandType = CommandType.StoredProcedure; 
                cmd.Parameters.AddWithValue("@id", id);
                await sql.OpenAsync(); 
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    
                    while (await reader.ReadAsync())
                    {
                        var mlibros = new Libro();
                        mlibros.id = (int)reader["id"];
                        mlibros.name = (string)reader["name"];
                        mlibros.description = (string)reader["description"];
                        mlibros.code = (string)reader["code"];
                        lista.Add(mlibros);
                    }
                    
                }
            }
        }
        return lista; 
    }
    
    
}