using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;
using Entities;
using System.Runtime.Remoting.Contexts;

namespace FinalEconomia
{
    public partial class Home : Form
    {

        BLL.NegocioAlumno negocio = new BLL.NegocioAlumno();
        Alumno alumno = new Alumno();

        public Home()
        {
            InitializeComponent();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(boxNumero.Text))
            {
                MessageBox.Show(this, "Falta el número de legajo.");
            }
            else if (string.IsNullOrWhiteSpace(boxNombre.Text))
            {
                MessageBox.Show(this, "Falta el nombre del alumno.");

            }
            else if (string.IsNullOrWhiteSpace(BoxApellido.Text))
            {
                MessageBox.Show(this, "Falta el Apellido del alumno.");
                            }
            else if (string.IsNullOrWhiteSpace(BoxDNI.Text))
            {
                MessageBox.Show(this, "Falta el DNI del alumno.");

            }
            else
            {
                alumno.legajo = System.Convert.ToInt32(boxNumero.Text);
                alumno.nombre = boxNombre.Text;
                alumno.apellido = BoxApellido.Text;
                alumno.documento = BoxDNI.Text;

                try
                {
                    negocio.AltaAlumno(alumno);
                   
                    MessageBox.Show(this, "El Alumno" + alumno.nombre + " " + alumno.apellido +  " fue ingresado correctamente.");
                    Listar.PerformClick();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(this, ex.Message);
                }
            }
        }

        private void btnListar_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = negocio.ListarAlumno();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(boxNumero.Text))
            {
                MessageBox.Show(this, "Debe ingresar el numero de Legajo para modificar el mismo.");
            }
            else {
                alumno.legajo = System.Convert.ToInt32(boxNumero.Text);
                alumno.nombre = boxNombre.Text;
                alumno.apellido = BoxApellido.Text;
                alumno.documento = BoxDNI.Text;
                alumno.id = System.Convert.ToInt32(tbid.Text);
                try
                {
                    negocio.ModificarAlumno(alumno);

                    MessageBox.Show(this, "El Alumno " + alumno.nombre + alumno.apellido + " fue modificado con exito.");
                    Listar.PerformClick();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(this, ex.Message);
                }
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbid.Text))
            {
                MessageBox.Show(this, "Debe Seleccionar el Alumno para eliminar el mismo.");
            }
            else
            {
                alumno.id = System.Convert.ToInt32(tbid.Text);
              
                try
                {
                    negocio.BajaAlumno(alumno);

                    MessageBox.Show(this, "Alumno Eliminado.");
                    Listar.PerformClick();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(this, ex.Message);
                }
            }
        }
        
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                tbid.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
                boxNumero.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                boxNombre.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                BoxApellido.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                BoxDNI.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            }
        }

        private void btnExportar_Click(object sender, EventArgs e)
        {
            try
            {
                var logica = new NegocioAlumno();
                logica.Exportar(logica.ListarAlumno());
            } catch(Exception ex)
            {
                MessageBox.Show(this, ex.Message);
            }
        }

        private void btnImportar_Click(object sender, EventArgs e)
        {
            if(ofdImportar.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    var logica = new NegocioAlumno();
                    logica.Importar(ofdImportar.FileName);
                    MessageBox.Show(this, "Importado correctamente");
                    Listar.PerformClick();
                } catch(Exception ex)
                {
                    MessageBox.Show(this, ex.Message);
                }
            }
        }
    }

   
}
