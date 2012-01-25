####### Compiler, tools and options

CC	=	g++
CFLAGS	=	-O3 -g -Wno-deprecated
INCPATH	=	
LINK	=	g++
LFLAGS	=	
LIBS	=	-L ./libs -lcorelib

####### Directories

OBJ = objs
SOURCE = source
HEADER = headers
DRIVERS = drivers
BIN = bin

OBJECTS = $(OBJ)/Berry.o \
          $(OBJ)/random_sample.o


#driver make programs

MAIN_OBJ = $(OBJ)/nclu.o



TARGET = $(BIN)/nclu

#targets
.cpp.o:
	$(CC) -c $(CFLAGS) -o $@ $<


nclu: $(OBJECTS) $(MAIN_OBJ)
		$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(MAIN_OBJ) $(LIBS)


#install and setup scripts
install:
		mkdir -p $(OBJ) 
		mkdir -p $(BIN)

clean:
		rm -rf $(OBJ)
		rm -rf $(BIN)
# main data structures and functionality



$(OBJ)/Berry.o: $(SOURCE)/berry.cpp
		$(CC) $(CFLAGS) -c  $(SOURCE)/berry.cpp -o $@ $(LIBS)
$(OBJ)/nclu.o: nclu.cpp
		$(CC) $(CFLAGS) -c nclu.cpp -o $@ $(LIBS)
$(OBJ)/random_sample.o: $(SOURCE)/random_sample.cpp
		$(CC) $(CFLAGS) -c $(SOURCE)/random_sample.cpp -o $@ $(LIBS)


