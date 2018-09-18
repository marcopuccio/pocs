using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
   public class DatosAlumno
    {

      ConexionSQL conexion = new ConexionSQL();
        public void AltaAlumno(Entities.Alumno Alumno)
        {
            try
            {
                conexion.Conectar();

                SqlCommand cmd = new SqlCommand("INSERTAR_ALUMNO", conexion.Conectar());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@legajo", SqlDbType.Int).Value = Alumno.legajo;
                cmd.Parameters.Add("@nombre", SqlDbType.NVarChar).Value = Alumno.nombre;
                cmd.Parameters.Add("@apellido", SqlDbType.NVarChar).Value = Alumno.apellido;
                cmd.Parameters.Add("@documento", SqlDbType.NVarChar).Value = Alumno.documento;
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Desconectar();
            }
        }
        public void ModificarAlumno(Entities.Alumno Alumno)
        {
            try
            {
                conexion.Conectar();
                SqlCommand cmd = new SqlCommand("MODIFICAR_ALUMNO", conexion.Conectar());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = Alumno.id;
                cmd.Parameters.Add("@legajo", SqlDbType.Int).Value = Alumno.legajo;
                cmd.Parameters.Add("@nombre", SqlDbType.NVarChar).Value = Alumno.nombre;
                cmd.Parameters.Add("@apellido", SqlDbType.NVarChar).Value = Alumno.apellido;
                cmd.Parameters.Add("@documento", SqlDbType.NVarChar).Value = Alumno.documento;
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Desconectar();
            }

        }
        public DataTable ListarAlumno()
        {
            try
            {
                conexion.Conectar();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Alumno", conexion.Conectar());
                DataSet AlumnoDatSet = new DataSet();
                adapter.Fill(AlumnoDatSet, "Alumno");
                conexion.Desconectar();
                return AlumnoDatSet.Tables[0];
            } catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Desconectar();
            }
        }
        public void BajaAlumno(Entities.Alumno Alumno)
        {
            try
            {
                conexion.Conectar();
                SqlCommand cmd = new SqlCommand("ELIMINAR_ALUMNO", conexion.Conectar());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = Alumno.id;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Desconectar();
            }

        }
    }
}
