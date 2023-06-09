namespace PracticaBackend03.Conexion;

public class ConexionDb
{
    private string connectionString = string.Empty;    
    
    public ConexionDb()
    {
        
        var constructor = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("Properties/launchSettings.json").Build();
        connectionString = constructor.GetSection("profiles:TiendaApi:conexionBaseERP").Value; 
            
    }

    public string cadenaSQL() { 
        return connectionString; //retorna el conexion string
        //nota: tambien puede retornar "grande" o la frase del "datasource...."
    }
}