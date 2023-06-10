namespace PracticaBackend03.Conexion;

public class ConexionDb
{
    private string connectionString = string.Empty;    
    
    public ConexionDb()
    {
        
        var constructor = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.Development.json").Build();
        connectionString = constructor.GetSection("ConnectionStrings:DefaultConnection").Value; 
            
    }

    public string cadenaSQL() { 
        return connectionString; 
    }
}