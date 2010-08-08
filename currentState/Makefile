# Configuration
COMPILER=ghc
# OPTIONS=--make -O2 -fforce-recomp -Wall
OPTIONS=--make -O2 -fforce-recomp 
BINARIES=basic_interprete
SUBDIR_PARSE=./Parser
SUBDIR_LEX=$(SUBDIR_PARSE)/Lexer
BASIC_LEX_FILE=BasicAlexMonad.x
BASIC_STR_TO_INT_LEX=BasicParseStringToVal.x
BASIC_HAP_FILE=BasicHapMonad.y


# Build the main project
main: Interprete.hs 
	cd $(SUBDIR_LEX) && alex $(BASIC_LEX_FILE) && alex $(BASIC_STR_TO_INT_LEX)
	cd $(SUBDIR_PARSE) && happy $(BASIC_HAP_FILE)
	cd ..
	$(COMPILER) $(OPTIONS) $+ -o $(BINARIES)


#precompile: 
#	cd $(SUBDIR_LEX) && alex $(BASIC_LEX_FILE) && alex $(BASIC_STR_TO_INT_LEX)
#	cd $(SUBDIR_PARSE) && happy $(BASIC_HAP_FILE)
#	cd ..


# Remove build files and generated binaries.
clean:
	rm -f *.o *.hi $(BINARIES)
	cd $(SUBDIR_PARSE) && rm -f *.o *.hi 
	cd $(SUBDIR_LEX) && rm -f *.o *.hi 
	
