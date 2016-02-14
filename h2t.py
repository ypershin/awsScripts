#!/usr/bin/python

import sys
import html2text


def fH2T(fname):
	html=open(fname).read()
	print html2text.html2text(html)


def main():
	if len(sys.argv)<2:
		print "an argument is mandatory"
		sys.exit()
	
	fH2T(sys.argv[1])


if __name__ == "__main__""
	main()
