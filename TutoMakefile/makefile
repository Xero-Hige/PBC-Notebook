PADRON=XXXXX
ARCHIVOS=*.h *.c #Tipos de archivos que se van a agregar
CUATRIMESTRE=2013-2C
ENTREGA=Pila
ENCODING=ISO-8859-1
OUTPUTFILE=out.ps #archivo intermedio
FORMATO=landscape #portrait o landscape (vertical u horizontal)
COLUMNAS=2 #paginas por hoja (en columnas)
NUMEROS_LINEA=1 #cada cuantas lineas se imprime el numero de linea
ARCHIVO_ENTREGA=$(PADRON)-$(ENTREGA)
NOMBRE_ZIP= $(ARCHIVO_ENTREGA).zip
NOMBRE_PDF= $(ARCHIVO_ENTREGA).pdf
ENCABEZADO = "[75.41] Algoritmos y Programacion II"
PIE = "Padrón $(PADRON) (curso $(CUATRIMESTRE)) Entrega: $(ENTREGA)"

all: english_example


english_greeter.o: english_greeter.c greeter.h
	gcc -std=c99 english_greeter.c -c

spanish_greeter.o: spanish_greeter.c greeter.h
	gcc -std=c99 spanish_greeter.c -c

english_example: english_greeter.o example.c
	gcc -std=c99 example.c english_greeter.o -o e_example

spanish_example: spanish_greeter.o example.c
	gcc -std=c99 example.c spanish_greeter.o -o s_example

run: spanish_example
	./s_example

clean_obj:
	rm -f *.o

clean: clean_obj
	rm -f e_example s_example

pdf: clean
	a2ps $(ARCHIVOS) -Av --header=$(ENCABEZADO) --footer=$(PIE) --line-numbers=$(NUMEROS_LINEA) --borders=yes --columns=$(COLUMNAS)  --$(FORMATO) --output=$(OUTPUTFILE) --encoding=$(ENCODING) --tabsize=4 --major=columns --toc  | ps2pdf $(OUTPUTFILE) $(NOMBRE_PDF)
	rm *.ps #elimino los archivos temporales

entrega: pdf
	zip $(NOMBRE_ZIP) $(ARCHIVOS) *.pdf

clean_entrega: clean
	rm *.zip *.pdf
