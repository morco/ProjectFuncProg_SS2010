import Salex

main = getContents >>= print . alexScanTokens
