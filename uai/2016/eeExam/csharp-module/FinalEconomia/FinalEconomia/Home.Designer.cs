namespace FinalEconomia
{
    partial class Home
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.boxNumero = new System.Windows.Forms.TextBox();
            this.boxNombre = new System.Windows.Forms.TextBox();
            this.BoxApellido = new System.Windows.Forms.TextBox();
            this.Agregar = new System.Windows.Forms.Button();
            this.Modificar = new System.Windows.Forms.Button();
            this.Eliminar = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Listar = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.BoxDNI = new System.Windows.Forms.TextBox();
            this.tbid = new System.Windows.Forms.TextBox();
            this.Exportar = new System.Windows.Forms.Button();
            this.Importar = new System.Windows.Forms.Button();
            this.ofdImportar = new System.Windows.Forms.OpenFileDialog();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(22, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "N° ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 49);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Nombre";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 72);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(44, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Apellido";
            // 
            // boxNumero
            // 
            this.boxNumero.Location = new System.Drawing.Point(63, 19);
            this.boxNumero.Name = "boxNumero";
            this.boxNumero.Size = new System.Drawing.Size(41, 20);
            this.boxNumero.TabIndex = 4;
            // 
            // boxNombre
            // 
            this.boxNombre.Location = new System.Drawing.Point(63, 42);
            this.boxNombre.Name = "boxNombre";
            this.boxNombre.Size = new System.Drawing.Size(90, 20);
            this.boxNombre.TabIndex = 5;
            // 
            // BoxApellido
            // 
            this.BoxApellido.Location = new System.Drawing.Point(63, 65);
            this.BoxApellido.Name = "BoxApellido";
            this.BoxApellido.Size = new System.Drawing.Size(90, 20);
            this.BoxApellido.TabIndex = 6;
            // 
            // Agregar
            // 
            this.Agregar.Location = new System.Drawing.Point(15, 123);
            this.Agregar.Name = "Agregar";
            this.Agregar.Size = new System.Drawing.Size(61, 23);
            this.Agregar.TabIndex = 8;
            this.Agregar.Text = "Agregar";
            this.Agregar.UseVisualStyleBackColor = true;
            this.Agregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // Modificar
            // 
            this.Modificar.Location = new System.Drawing.Point(82, 123);
            this.Modificar.Name = "Modificar";
            this.Modificar.Size = new System.Drawing.Size(60, 23);
            this.Modificar.TabIndex = 9;
            this.Modificar.Text = "Modificar";
            this.Modificar.UseVisualStyleBackColor = true;
            this.Modificar.Click += new System.EventHandler(this.btnModificar_Click);
            // 
            // Eliminar
            // 
            this.Eliminar.Location = new System.Drawing.Point(16, 152);
            this.Eliminar.Name = "Eliminar";
            this.Eliminar.Size = new System.Drawing.Size(60, 23);
            this.Eliminar.TabIndex = 10;
            this.Eliminar.Text = "Eliminar";
            this.Eliminar.UseVisualStyleBackColor = true;
            this.Eliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(159, 12);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(399, 192);
            this.dataGridView1.TabIndex = 11;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // Listar
            // 
            this.Listar.Location = new System.Drawing.Point(82, 152);
            this.Listar.Name = "Listar";
            this.Listar.Size = new System.Drawing.Size(60, 23);
            this.Listar.TabIndex = 12;
            this.Listar.Text = "Listar";
            this.Listar.UseVisualStyleBackColor = true;
            this.Listar.Click += new System.EventHandler(this.btnListar_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(13, 94);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(26, 13);
            this.label5.TabIndex = 13;
            this.label5.Text = "DNI";
            // 
            // BoxDNI
            // 
            this.BoxDNI.Location = new System.Drawing.Point(63, 87);
            this.BoxDNI.Name = "BoxDNI";
            this.BoxDNI.Size = new System.Drawing.Size(90, 20);
            this.BoxDNI.TabIndex = 14;
            // 
            // tbid
            // 
            this.tbid.Location = new System.Drawing.Point(-24, 184);
            this.tbid.Name = "tbid";
            this.tbid.Size = new System.Drawing.Size(34, 20);
            this.tbid.TabIndex = 15;
            this.tbid.Visible = false;
            // 
            // Exportar
            // 
            this.Exportar.Location = new System.Drawing.Point(82, 181);
            this.Exportar.Name = "Exportar";
            this.Exportar.Size = new System.Drawing.Size(60, 23);
            this.Exportar.TabIndex = 16;
            this.Exportar.Text = "Exportar";
            this.Exportar.UseVisualStyleBackColor = true;
            this.Exportar.Click += new System.EventHandler(this.btnExportar_Click);
            // 
            // Importar
            // 
            this.Importar.Location = new System.Drawing.Point(16, 181);
            this.Importar.Name = "Importar";
            this.Importar.Size = new System.Drawing.Size(60, 23);
            this.Importar.TabIndex = 17;
            this.Importar.Text = "Importar";
            this.Importar.UseVisualStyleBackColor = true;
            this.Importar.Click += new System.EventHandler(this.btnImportar_Click);
            // 
            // ofdImportar
            // 
            this.ofdImportar.Filter = "CSV|*.csv";
            // 
            // Home
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(570, 224);
            this.Controls.Add(this.Importar);
            this.Controls.Add(this.Exportar);
            this.Controls.Add(this.tbid);
            this.Controls.Add(this.BoxDNI);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.Listar);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.Eliminar);
            this.Controls.Add(this.Modificar);
            this.Controls.Add(this.Agregar);
            this.Controls.Add(this.BoxApellido);
            this.Controls.Add(this.boxNombre);
            this.Controls.Add(this.boxNumero);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Home";
            this.Text = "Alumnos";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox boxNumero;
        private System.Windows.Forms.TextBox boxNombre;
        private System.Windows.Forms.TextBox BoxApellido;
        private System.Windows.Forms.Button Agregar;
        private System.Windows.Forms.Button Modificar;
        private System.Windows.Forms.Button Eliminar;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button Listar;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox BoxDNI;
        private System.Windows.Forms.TextBox tbid;
        private System.Windows.Forms.Button Exportar;
        private System.Windows.Forms.Button Importar;
        private System.Windows.Forms.OpenFileDialog ofdImportar;
    }
}

