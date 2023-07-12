import ast
import json

from ast2json import ast2json

############################################# 
## Transform the Python sample to AST tree ## 
## And save it to JSON file                ##
#############################################


## Todo : change with the needed sample
subFolder = "layers_formation/"
filename = "gh_non_dominating_dow_sampling.py"

## Sample folder and output folder
sampleFolder = "../sample_design_smell/"
outputFolder = "output/"

## Build the path of the sample and the output file
path = sampleFolder + subFolder + filename
outputFile = outputFolder + filename.split('.')[0]+ ".json"

## Parse the Python sample to AST tree
f = open(path, "r")
tree = ast.parse(f.read())

## Save the AST tree to JSON file
resultFile = open(outputFile, "w")
print(ast2json(tree))
resultFile.write(json.dumps(ast2json(tree)))

## Close the files stream
f.close()
resultFile.close()



