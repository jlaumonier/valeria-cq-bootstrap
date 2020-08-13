import subprocess
import sys
import requirements-parser

with open('requirements.txt', 'r') as fd:
     for req in requirements.parse(fd):
         print(req.name, req.specs)

result = subprocess.run(['avail_wheels',
                         'torch',
                         '--all_versions',
                         '-p'+str(sys.version_info.major)+'.'+str(sys.version_info.minor)], stdout=subprocess.PIPE)

print(result.stdout)
