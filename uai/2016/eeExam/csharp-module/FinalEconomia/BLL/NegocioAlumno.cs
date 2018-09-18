using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DAL;
using System.Data;
using System.IO;

namespace BLL
{
    public class NegocioAlumno
    {

        DAL.DatosAlumno Datos = new DAL.DatosAlumno();
        public void AltaAlumno(Entities.Alumno objeto)
        {
            try

            {
                Datos.AltaAlumno(objeto);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ModificarAlumno(Entities.Alumno objeto)
        {
            Datos.ModificarAlumno(objeto);

        }
        public void BajaAlumno(Entities.Alumno objeto)
        {
            Datos.BajaAlumno(objeto);

        }
        public DataTable ListarAlumno()
        {
            return Datos.ListarAlumno();
        }
        public void Exportar(DataTable tabla)
        {
            var csv = new StringBuilder();
            foreach(var row in tabla.Rows)
            {
                var data = (DataRow)row;
                csv.AppendLine(string.Format("{0},{1},{2},{3}", data.ItemArray[1], data.ItemArray[2], data.ItemArray[3], data.ItemArray[4]));
            }
            File.WriteAllText("export.csv", csv.ToString());
        }
        public void Importar(string archivo)
        {
            StreamReader lector = new StreamReader(archivo);
            string linea = string.Empty;
            while((linea = lector.ReadLine()) != null)
            {
                var datos = linea.Split(new char[] { ',' });
                var alumno = new Alumno();
                alumno.legajo = Convert.ToInt32(datos[0]);
                alumno.nombre = datos[1];
                alumno.apellido = datos[2];
                alumno.documento = datos[3];
                AltaAlumno(alumno);
            }
            lector.Close();
        }
    }
}
