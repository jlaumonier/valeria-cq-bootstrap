import configparser
import subprocess
import sys

import requirements
from packaging import version


def parse_one_result(avail_wheel_results, require):
    package_is_present = False
    results = avail_wheel_results.split(b'\n')
    # excluding first lines
    results = results[2:]
    parsed_result = []
    for r in results:
        if r != b'':
            splitted_result = b' '.join(r.split()).split(b' ')
            parsed_result.append(splitted_result)
    return parsed_result


# Parse target environment config file
target_config = configparser.ConfigParser(strict=False)
config_file = sys.argv[1]
print(config_file)
target_config.read(config_file)
target_python_version = target_config['default']['PYTHON_VERSION'].split('.')

# Open requirements.txt to parse it
requirements_file = target_config['default']['REQUIREMENTS_FILE']
fd = open(requirements_file, 'r')
reqmts = requirements.parse(fd)
for req in reqmts:
    print(req.name, req.specs, end='')
    result = subprocess.run(['avail_wheels',
                             req.name,
                             '--all_versions',
                             '-p' + str(target_python_version[0]) + '.' + str(target_python_version[1])],
                            stdout=subprocess.PIPE)

    parsed_results = parse_one_result(result.stdout, req)
    if len(parsed_results) != 0:
        is_version_exists = False
        for r in parsed_results:
            existing_version = r[1].decode('utf8')
            require_version = req.specs[0][1]
            if version.parse(existing_version) == version.parse(require_version):
                is_version_exists = True

        if is_version_exists:
            print(' Package is present')
        else:
            print(' Package version not present. Possible versions: ', end='')
            for pv in parsed_results:
                print( pv[1], ', ', end='')
            print('')
    else:
        print(" Package does not exist")
