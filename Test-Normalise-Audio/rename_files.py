#!/usr/bin/env python3
import os,sys

def get_all_files(treeroot):
    for dir,subdirs,files in os.walk(treeroot):
        for f in files: 
            if f in __file__: continue
            fullpath = os.path.realpath( os.path.join(dir,f) )
            newpath = '_'.join(fullpath.rsplit('/', 1))

            print('Move ' + fullpath + ' to ' + newpath   )
            #os.rename(fullpath,newpath)


def main():
    top_dir="."
    # If directory not given, assume cwd
    if len(sys.argv) == 2: top_dir=sys.argv[1]
    get_all_files(top_dir)

if __name__ == '__main__' : main()