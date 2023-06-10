using Microsoft.AspNetCore.Mvc;
using PracticaBackend03.Db;
using PracticaBackend03.Model;

namespace PracticaBackend03.Controllers;

[ApiController]
[Route("api/Users")]
public class UsuarioController: ControllerBase
{
    [HttpGet]
    public async Task<ActionResult<List<Usuario>>> Get()
    {
        var funcion = new DUsuario();
        var lista = await funcion.MostrarUsuarios();
        return lista;
    }
    
}