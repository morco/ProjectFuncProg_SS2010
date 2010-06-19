--import BasicHap
import BasicHapMonad

main = getContents >>= print . getParseTree 
