using Microsoft.AspNetCore.Mvc;
using PracticaBackend03.Db;
using PracticaBackend03.Model;

namespace PracticaBackend03.Controllers;
[ApiController]
[Route("api/Books")]
public class LibroController: ControllerBase
{
    [HttpGet]
    public async Task<ActionResult<List<Libro>>> Get()
    {
        var funcion = new DLibro();
        var lista = await funcion.MostrarLibros();
        return lista;
    }
}