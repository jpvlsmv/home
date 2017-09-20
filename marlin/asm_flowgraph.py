#!/usr/bin/python3

def main(args):
  try:
    print('Input file:', args.i)
  except IOError as msg:
    args.error(str(msg))

if __name__ == "__main__":
  import argparse
  parser = argparse.ArgumentParser(
    description = 'Analyze an assembly listing to produce a control flow graph'
  )
  parser.add_argument('-i', metavar='in-file',
                      type=argparse.FileType('rt'))
  main(parser.parse_args())
