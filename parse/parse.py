import ast
import json
import pathlib
import ntpath

from ast2json import ast2json

def path_leaf(path):
    head, tail = ntpath.split(path)
    return tail or ntpath.basename(head)

def parse(path):
    with open(path, "r") as f:
        tree = ast.parse(f.read())
    return json.dumps(ast2json(tree), indent=4)

def save(outputFile, filename, jsonFormated_str):
    with open(outputFile, "w") as resultFile:
        #print(jsonFormated_str)
        print(filename + " ......... parsed")
        resultFile.write(jsonFormated_str)


############################################# 
## Transform the Python sample to AST tree ## 
## And save it to JSON file                ##
#############################################


print("---------------------------------------------------------------- ")
print("---------------------------------------------------------------- ")
print("   The samples are in the folder 'sample_design_smell")
print("   All the samples parsed are saved in the folder 'output'")
print("---------------------------------------------------------------- ")
print("---------------------------------------------------------------- ")
print("\n")
print("Parsing the samples ...")
print("---------------------------------------------------------------- ")
samples = pathlib.Path("../sample_design_smell/")
for path in samples.rglob("*.py"):
    if path.is_file():
        ## Build the path of the sample and the output file
        filename = path_leaf(str(path))
        outputFolder = "output/"
        outputFile = outputFolder + filename.split('.')[0]+ ".json"


        ## Parse the Python sample to AST tree
        jsonFormated_str = parse(str(path))

        ## Save the AST tree to JSON file
        save(outputFile, filename, jsonFormated_str)



