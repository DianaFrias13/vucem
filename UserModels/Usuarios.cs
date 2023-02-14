using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserModels
{
    public  class Usuarios
    {
        public  int id_usuario { get; set; }
        public  string Usuario { get; set; }
        public  string Contrasena { get; set; }
        public string Nombre { get; set; }

        public  string Apellido{ get; set; }
        public string Estado { get; set; }
        public int idRol { get; set; }
        public string Imagen { get; set; }
        public string Rol { get; set; }

    }
}
