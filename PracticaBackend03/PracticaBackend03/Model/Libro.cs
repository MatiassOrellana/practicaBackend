namespace PracticaBackend03.Model;

public class Libro
{
    public int id { get; set; }
    public string code { get; set; }
    public string name { get; set; }
    public string description { get; set; }
    
    public List<Usuario> reserves { get; set; }
}