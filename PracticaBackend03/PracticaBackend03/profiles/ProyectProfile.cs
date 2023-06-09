using System.Data.Common;

namespace PracticaBackend03.profiles;

public class ProyectProfile: AutoMapper.Profile
{
    public ProyectProfile()
    {
        CreateMap(DbPro)
    }
}