#! /usr/bin/python3

import os
import re
import sys

for i in range(1,len(sys.argv)):

	sccf = sys.argv[i]
	#print(sccf)

	inf = open(sccf,'r')

	zcount = 0;
	ocount = 0;

	for l in inf.readlines():
		l = l.strip();

		m = re.match('^0(\d):',l)

		if m:
			num = int(m.group(1))

			if   num == 0:
				zcount += 1
			elif num == 1:
				ocount += 1

	inf.close()

	if zcount >= 20:
		cmd = 'mv ' + sccf + ' 00/'
	elif ocount >= 20:
		cmd = 'mv ' + sccf + ' 01/'

	print(cmd,zcount,ocount)
	os.system(cmd)
