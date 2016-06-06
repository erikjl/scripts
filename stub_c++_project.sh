#!/bin/bash

#-------- Stubs out project folders, init git, .gitignore, and creates makefile
#----- create directory structure -----

if [ -z "$1" ]; then
    echo "*** No project name argument specified! Exiting... ***"
    exit
fi

projectName=$1

if [ -d "$projectName" ]; then
    echo "**** Folder already exists! Exiting... ****"
    exit
fi

mkdir "$projectName"
mkdir "$projectName"/src    # *.cpp files go here
mkdir "$projectName"/bin    # output executables go here
mkdir "$projectName"/obj  # object files go here. (clean target)
mkdir "$projectName"/include #header files
mkdir "$projectName"/lib    #libs compiled by project

#----- initialize git & .gitignore for C++ specifically-----

echo "build" > "$projectName"/.gitignore
echo "lib/*" >> "$projectName"/.gitignore
echo "bin/*" >> "$projectName"/.gitignore
echo "*.o" >> "$projectName"/.gitignore
cd "$projectName"
git init
cd ..

#----- stub out ia compilable main.cpp -----

echo "//----------$projectname----------" > "$projectName"/src/main.cpp
echo "" >> "$projectName"/src/main.cpp
echo "#include <string>" >> "$projectName"/src/main.cpp
echo "#include <iostream>" >> "$projectName"/src/main.cpp
echo "" >> "$projectName"/src/main.cpp
echo "int main() {" >> "$projectName"/src/main.cpp
echo "  std::cout << \"Hello!\" << std::endl;" >> "$projectName"/src/main.cpp
echo "  return 1;" >> "$projectName"/src/main.cpp
echo "}" >> "$projectName"/src/main.cpp

#----- Create Makefile -----

echo "CC :=g++ #main compiler" >> "$projectName"/Makefile
echo "SRCDIR := src" >> "$projectName"/Makefile
echo "OBJDIR := build" >> "$projectName"/Makefile
echo "TARGET := bin/$projectName" >> "$projectName"/Makefile
echo "SOURCES := \$(wildcard \$(SRCDIR)/*.cpp)" >> "$projectName"/Makefile
echo "OBJECTS := \$(SOURCES:.cpp=.o)" >> "$projectName"/Makefile
echo "#OBJECTS2 := \$(pathsubst src/%.cpp,obj/%.o,\$(SOURCES))" >> "$projectName"/Makefile
echo "CFLAGS := -c -g -Wall" >> "$projectName"/Makefile
echo "#INC := -I include \$(INCLIST) -I /usr/local/include" >> "$projectName"/Makefile
echo "#LIB := /usr/local/lib" >> "$projectName"/Makefile
echo "" >> "$projectName"/Makefile
echo "\$(TARGET): \$(OBJECTS)" >> "$projectName"/Makefile
echo -e "\t\$(CC) \$(OBJECTS) -o \$(TARGET)" >> "$projectName"/Makefile
echo "" >> "$projectName"/Makefile
echo "\$(OBJECTS): \$(SOURCES)" >> "$projectName"/Makefile
echo -e "\t\$(CC) \$(CFLAGS) -o \$@ \$<" >> "$projectName"/Makefile
echo "" >> "$projectName"/Makefile
echo "clean:" >> "$projectName"/Makefile
echo -e "\trm -f \$(OBJECTS) \$(TARGET)" >> "$projectName"/Makefile
echo "" >> "$projectName"/Makefile



# Too compilcated, isnt working
#echo "LIB := -pthread " >> "$projectName"/Makefile
#echo "INC := -I include" >> "$projectName"/Makefile
#echo "SOURCES := \$(shell find \$(SRCDIR) -type f -name *.\$(SRCEXT))" >> "$projectName"/Makefile
#echo "OBJECTS := \$(pathsubst \$(SRCDIR)/%,\$(BUILDDIR)/%,\$SOURCES:.\$(SRCEXT)=.o))" >> "$projectName"/Makefile
#echo "" >> "$projectName"/Makefile
#echo "  \$(TARGET): \$(OBJECTS)" >> "$projectName"/Makefile
#echo -e "\t@echo \" Linking...\"" >> "$projectName"/Makefile
#echo -e "\t@echo \" \$(CC) \$^ -o \$(TARGET) \$(LIB)\"; \$(CC) \$^ -o \$(TARGET) \$(LIB)" >> "$projectName"/Makefile
#echo "" >> "$projectName"/Makefile
#echo "  \$(BUILDDIR)/%.o: \$(SRCDIR)/%.\$(SRCEXT)" >> "$projectName"/Makefile
#echo -e "\t@mkdir -p \$(BUILDDIR)" >> "$projectName"/Makefile
#echo -e "\t@echo \" \$(CC) \$(CFLAGS) \$(INC) -c -o \$@ \$<\";  \$(CC) \$(CFLAGS) \$(INC) -c -o \$@ \$<\"" >> "$projectName"/Makefile
#echo "" >> "$projectName"/Makefile
#iecho -e "\tclean:" >> "$projectName"/Makefile
#echo -e "\t@echo \" Cleaning... \"" >> "$projectName"/Makefile
#echo -e "\t@echo \" \$(RM) -r \$(BUILDDIR) \$(TARGET)\"; \$(RM) -r \$(BUILDDIR) \$(TARGET)\"" >> "$projectName"/Makefile
#echo "" >> "$projectName"/Makefile
#echo -e "\t.PHONY: clean" >> "$projectName"/Makefile
#echo "" >> "$projectName"/Makefile




