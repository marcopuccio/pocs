#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <fstream>

#include <mysql_connection.h>
#include <driver.h>
#include <cppconn/exception.h>
#include <cppconn/statement.h>
#include <cppconn/resultset.h>
#include <cppconn/prepared_statement.h>

using namespace std;
using namespace sql;

void limpiarPantalla() {
  cout << "\033[2J\033[1;1H";
}


void listarAlumnos(sql::Statement *stmt, sql::ResultSet *res) {
  res = stmt->executeQuery("SELECT * FROM Alumno");

  cout << endl;
  cout << "LISTA DE ALUMNOS.." << endl;
  while(res->next()) {
    cout << "- Legajo: " << res->getInt(1);
    cout << " Nombre: " << res->getString(2);
    cout << " Apellido: " << res->getString(3);
    cout << " DNI: " << res->getInt(4) << endl;
  }
}


void crearAlumno(sql::Connection *con) {
  sql::PreparedStatement *prep_stmt;
  prep_stmt = con->prepareStatement("INSERT INTO UAI.Alumno(legajo_alumno, nombre_alumno, apellido_alumno, documento_alumno) VALUES(?,?,?,?)");
  
  int leg;
  char nombre[50];
  char apellido[50];
  int doc;
  
  cout << "Ingresar Legajo.. ";
  cin >> leg;
  cout << "Ingresar Nombre.. ";
  cin >> nombre;
  cout << "Ingresar Apellido.. ";
  cin >> apellido;
  cout << "Ingresar Documento.. ";
  cin >> doc;

  prep_stmt->setInt(1, leg);
  prep_stmt->setString(2, nombre);
  prep_stmt->setString(3, apellido);
  prep_stmt->setInt(4, doc);
  prep_stmt->execute();
  cout << "INSERTADO" << endl;
}


void modificarAlumno(sql::Connection *con) {
  sql::PreparedStatement *prep_stmt;
  prep_stmt = con->prepareStatement("UPDATE UAI.Alumno SET nombre_alumno=?, apellido_alumno=?, documento_alumno=? WHERE legajo_alumno=?");
 
  int leg;
  char nombre[50];
  char apellido[50];
  int doc;
  
  cout << "Ingresar Legajo.. ";
  cin >> leg ;
  cout << "Ingresar Nombre.. ";
  cin >> nombre;
  cout << "Ingresar Apellido.. ";
  cin >> apellido;
  cout << "Ingresar Documento.. ";
  cin >> doc;

  prep_stmt->setString(1, nombre);
  prep_stmt->setString(2, apellido);
  prep_stmt->setInt(3, doc);
  prep_stmt->setInt(4, leg);
  prep_stmt->execute();
  cout << "MODIFICADO";
}


void eliminarAlumno(sql::Connection *con) {
  sql::PreparedStatement *prep_stmt;
  prep_stmt = con->prepareStatement("DELETE FROM Alumno WHERE legajo_alumno=?");
 
  int leg;

  cout << "Ingresar Legajo.. ";
  cin >> leg ;

  prep_stmt->setInt(1, leg);
  prep_stmt->execute();
  cout << "BORRADO";
}

void exportarListado(sql::Statement *stmt, sql::ResultSet *res) {
  res = stmt->executeQuery("SELECT * FROM Alumno");
  cout << endl;
  
  ofstream outfile;
  outfile.open("data.csv");

  cout << "EXORTANDO.." << endl;
  while(res->next()) {
    outfile << res->getInt(1) << ",";
    outfile << res->getString(2) << ",";
    outfile << res->getString(3) << ",";
    outfile << res->getInt(4) << endl;
  }
  outfile.close();
  cout << "EXPORTADO.. data.csv" << endl;

}


void importarListado(sql::Connection *con) {
  sql::PreparedStatement *prep_stmt;
  
  ifstream file;
  file.open("data.csv");

  string leg;
  string nombre;
  string apellido;
  string doc;


  prep_stmt = con->prepareStatement("INSERT INTO UAI.Alumno(legajo_alumno, nombre_alumno, apellido_alumno, documento_alumno) VALUES(?,?,?,?)");
  cout << "IMPORTANDO.. data.csv" << endl;

  while (getline(file, leg, ',')) {
    prep_stmt->setString(1, leg);

    getline(file, nombre, ',') ;
    prep_stmt->setString(2, nombre);

    getline(file, apellido, ',') ;
    prep_stmt->setString(3, apellido);

    getline(file, doc);
    prep_stmt->setString(4, doc);

    prep_stmt->execute();
  }
  cout << "IMPORTADO.." << endl;


}


int main(void)
{ 
  try {
    cout << "INICIANDO APLICACION.."<< endl;
    cout << endl;
    
    // Variables de conexion
    sql::Driver *driver;
    sql::Connection *con;
    sql::Statement *stmt;
    sql::ResultSet *res;
    
    // Conexion a MYSQL
    cout << "CONECTANDO A MYSQL.."<< endl;
    driver = get_driver_instance();
    con = driver->connect("tcp://127.0.0.1:3306", "dev", "dev");   
    con->setSchema("UAI");
    stmt = con->createStatement();
    cout << "CONECTADO.." << endl;
    cout << endl;
    
    // Comenzar
    cout << "Presionar cualquier tecla para comenzar" << endl;
    cin.get();

    // Menu
    int option;
    do {
      limpiarPantalla();
      cout << "1. Listar Alumnos.." << endl;
      cout << "2. Crear Alumno" << endl;
      cout << "3. Modificar Alumno" << endl;
      cout << "4. Eliminar Alumno" << endl;
      cout << "5. Exportar Archivo" << endl;
      cout << "6. Importar Archivo" << endl;

      cout << "CTRL+C. Salir" << endl;
      cout << "Selection: ";
      cin >> option;
      switch ( option ) {
      case 1:
        listarAlumnos(stmt, res);
        cin.get();
        break;
      case 2:
        crearAlumno(con);
        cin.get();
        break;
      case 3:
        modificarAlumno(con);
        cin.get();
        break;
      case 4:
        eliminarAlumno(con);
        cin.get();
        break;
      case 5:
        exportarListado(stmt, res);
        cin.get();
        break;
      case 6:
        importarListado(con);
        cin.get();
        break;
      default:
        cout << "INGRESO INCORRECTO" << endl;
        continue;
      }
      cin.get();

    }
    while(true);
    
    delete stmt;
    delete con;
    delete res;

  } catch (sql::SQLException &e) {    
    cout << "# ERR: " << e.what();
    cout << " (MySQL error code: " << e.getErrorCode();
    cout << ", SQLState: " << e.getSQLState() << " )" << endl;
  }

  return EXIT_SUCCESS;
}
