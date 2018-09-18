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

    private string String;
    /// <summary>
    ///     Constructor donde se crea el connection string e instancia la conexion
    /// </summary>
    public ConexionSQL()
    {
        String = "Data Source=FRDB1;Initial Catalog=UAI;Integrated Security=SSPI;";
        conexion = new SqlConnection(String);
    }



    public SqlConnection Desconectar()
    {
        try
        {
            conexion = new SqlConnection(conexion.ConnectionString);
            conexion.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return conexion;
    }

    public SqlConnection Conectar()
    {
        try
        {
            conexion = new SqlConnection(conexion.ConnectionString);
            conexion.Open();

        }
        catch (Exception ex)
        {
            throw ex;
        }

        return conexion;
    }

}
