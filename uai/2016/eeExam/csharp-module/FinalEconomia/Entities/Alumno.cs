using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Alumno
    {
        private int _legajo;
        public int legajo
        {
            get { return _legajo; }
            set { _legajo = value; }
        }
        private int _id;
        public int id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _nombre;
        public  string nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        private string _apellido;
        public string apellido
        {
            get { return _apellido; }
            set { _apellido = value; }
        }
        private string _documento;
        public string documento
        {
            get { return _documento; }
            set { _documento = value; }
        }
    }

      
}
