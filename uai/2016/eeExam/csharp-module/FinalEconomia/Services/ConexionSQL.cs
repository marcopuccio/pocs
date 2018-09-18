using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;

public class ConexionSQL
{
    SqlConnection conexion;

    private string connectionString;
    /// <summary>
    ///     Constructor donde se crea el connection string e instancia la conexion
    /// </summary>
    public ConexionSQL()
    {
        connectionString = "Data Source=FRNTDELL\\SQLEXPRESS;Initial Catalog=SIGT;Integrated Security=SSPI;";
        conexion = new SqlConnection(connectionString);
    }
   


    public SqlConnection DesconectarBaseDatos()
    {
        try
        {
            conexion = new SqlConnection(conexion.ConnectionString);
            conexion.Close();
        }
        catch (Exception ex)
        {
        }
        return conexion;
    }

    public SqlConnection ConectarBaseDatos()
    {
        try
        {
            conexion = new SqlConnection(conexion.ConnectionString);
            conexion.Open();

        }
        catch (Exception ex)
        {
           
        }

        return conexion;
    }

}
