app: app.o 
	g++ -o app app.o -L/usr/lib -lmysqlcppconn
	
app.o: app.cpp
	g++ -c -I/usr/include/cppconn app.cpp

clean:
	rm -f *.o app