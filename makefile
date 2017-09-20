objects=main.o API.o Attribute.o BufferManager.o CatalogManager.o Condition.o IndexManager.o Interpreter.o RecordManager.o 

MiniSQL:$(objects)
	g++ -o MiniSQL $(objects)

main.o: Interpreter.h CatalogManager.h RecordManager.h IndexManager.h
	g++ -c main.cpp Interpreter.h CatalogManager.h RecordManager.h IndexManager.h

API.o: API.h CatalogManager.h RecordManager.h IndexManager.h
	g++ -c API.cpp CatalogManager.h RecordManager.h IndexManager.h

Attribute.o: Attribute.h
	g++ -c Attribute.cpp Attribute.h

BufferManager.o: BufferManager.h Minisql.h
	g++ -c BufferManager.cpp BufferManager.h Minisql.h

CatalogManager.o: CatalogManager.h BufferManager.h IndexInfo.h Attribute.h
	g++ -c CatalogManager.cpp CatalogManager.h BufferManager.h IndexInfo.h Attribute.h

Condition.o: Condition.h
	g++ -c Condition.cpp Condition.h

IndexManager.o: IndexManager.h API.h IndexInfo.h Attribute.h BPlusTree.h 
	g++ -c IndexManager.cpp IndexManager.h API.h IndexInfo.h Attribute.h BPlusTree.h

Interpreter.o: Interpreter.h Condition.h Attribute.h API.h
	g++ -c Interpreter.cpp Interpreter.h Condition.h Attribute.h API.h

RecordManager.o: RecordManager.h API.h Condition.h Attribute.h RecordManager.h BufferManager.h Minisql.h
	g++ -c RecordManager.cpp RecordManager.h API.h Condition.h Attribute.h RecordManager.h BufferManager.h Minisql.h


.PHONY :clean
clean:	
	-rm MiniSQL $(objects) *.o *.h.gch
