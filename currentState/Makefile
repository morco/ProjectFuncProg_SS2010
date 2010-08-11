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
	ghc -c BinaryOps.hs
	ghc -c $(SUBDIR_PARSE)/ParserTypes.hs
	ghc -c Definitions.hs
	ghc -c $(SUBDIR_LEX)/BasicParseStringToVal.hs
	ghc -c ProgrammState.hs-boot #   -- Produces A.hi-boot, A.o-boot
	ghc -c BasicTime.hs  #   -- Produces A.hi-boot, A.o-boot
	ghc -c Expressions.hs        # -- Consumes A.hi-boot, produces B.hi, B.o
	ghc -c ProgrammState.hs	     # -- Consumes B.hi, produces A.hi, A.o
	#ghc -o $(BINARIES) BinaryOps.o $(SUBDIR_PARSE)/ParserTypes.o Definitions.o $(SUBDIR_PARSE)/ParserErrors.o $(SUBDIR_LEX)/BasicAlexMonad.o $(SUBDIR_LEX)/BasicParseStringToVal.o Expressions.o ProgrammState.o $(SUBDIR_PARSE)/BasicHapMonad.o Interprete.o
	$(COMPILER) $(OPTIONS) $+ -o $(BINARIES)


#precompile: 
#	cd $(SUBDIR_LEX) && alex $(BASIC_LEX_FILE) && alex $(BASIC_STR_TO_INT_LEX)
#	cd $(SUBDIR_PARSE) && happy $(BASIC_HAP_FILE)
#	cd ..


# Remove build files and generated binaries.
clean:
	rm -f *.o *.hi *.o-boot *.hi-boot $(BINARIES)
	cd $(SUBDIR_PARSE) && rm -f *.o *.hi 
	cd $(SUBDIR_LEX) && rm -f *.o *.hi 
	
#-rw-r--r-- 1 wipaar wipaar  3655  8. Aug 22:26 GeneralFunctions.hs
