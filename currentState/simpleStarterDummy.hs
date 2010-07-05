--import BasicHap
import Parser.BasicHapMonad

main = getContents >>= print . getParseTree 
