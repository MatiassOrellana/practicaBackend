namespace PracticaBackend03.Model;

public class Usuario
{
    public int id { get; set; }
    public string Name { get; set; }
    public string faculty { get; set; }
    public DateTime Last_Reserved { get; set; }
    public int quantity { get; set; }
    
    public List<Libro> reserves { get; set; }
}