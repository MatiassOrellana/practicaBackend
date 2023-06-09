namespace PracticaBackend03.Model;

public class Reservas
{
    public Usuario Usuario { get; set; }
    public Libro libro { get; set; }
    public DateTime lastReserved { get; set; }
}