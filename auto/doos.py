'''
Batch renames file's extension in a given directory
'''

import os
import sys
from os.path import join
from os.path import splitext

def main():
    try:
        work_dir, old_ext, new_ext = sys.argv[1:]
    except ValueError:
        sys.exit("Usage: {} directory old-ext new-ext".format(__file__))

    for filename in os.listdir(work_dir):
        if old_ext == splitext(filename)[1]:
            newfile = filename.replace(old_ext, new_ext)
            os.rename(join(work_dir, filename), join(work_dir, newfile))


if __name__ == '__main__':
    main()