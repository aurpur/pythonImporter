import ast
import json
from ast2json import ast2json

sampleFolder = "../sample_design_smell/"
filename = "layers_formation/gh_non_dominating_dow_sampling.py"
path = sampleFolder + filename


f = open(path, "r")
tree = ast.parse(f.read())

resultFile = open("output/result.json", "w")
print(ast2json(tree))
resultFile.write(json.dumps(ast2json(tree)))

f.close()
resultFile.close()



