####### Compiler, tools and options

CC	=	g++
CFLAGS	=	-O3 -g -Wno-deprecated
INCPATH	=	
LINK	=	g++
LFLAGS	=	

####### Directories

OBJ = objs
SOURCE = source
HEADER = headers
DRIVERS = drivers
BIN = bin
LIB = libs

OBJECTS = $(OBJ)/Berry.o \
          $(OBJ)/random_sample.o \
	  $(OBJ)/helpers.o


#driver make programs

MAIN_OBJ = $(OBJ)/nclu.o
LIBS = $(LIB)/libcorelib.a


TARGET = $(BIN)/nclu

#targets

nclu: $(OBJECTS) $(MAIN_OBJ)
		$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(MAIN_OBJ) $(LIBS)

lib: $(OBJECTS) $(LIBS)
	ar x $(LIBS)
	ar cr nclulib.a *.o $(OBJECTS)
	rm *.o
	mv nclulib.a $(LIB)/
#install and setup scripts
install:
		mkdir -p $(OBJ) 
		mkdir -p $(BIN)

clean:
		rm -rf $(OBJ)
		rm -rf $(BIN)
# main data structures and functionality



$(OBJ)/Berry.o: $(SOURCE)/berry.cpp
		$(CC) $(CFLAGS) -c  $(SOURCE)/berry.cpp -o $@
$(OBJ)/nclu.o: nclu.cpp
		$(CC) $(CFLAGS) -c nclu.cpp -o $@ $(LIBS)
$(OBJ)/random_sample.o: $(SOURCE)/random_sample.cpp
		$(CC) $(CFLAGS) -c $(SOURCE)/random_sample.cpp -o $@
$(OBJ)/helpers.o: $(SOURCE)/helpers.cpp
		$(CC) $(CFLAGS) -c $(SOURCE)/helpers.cpp -o $@