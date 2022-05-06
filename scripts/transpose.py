# Used to copy JEI blacklist into a recipe disable script
# run this script again if you change the JEI blacklist

import os

def main():
	jei_file = '../config/jei/blacklist.cfg'
	output_file = 'include/disabled_items_list.zs'

	with open(output_file, 'w') as of:
		of.write('''#priority 100
import crafttweaker.api.item.IItemStack;
public class DisabledItems {
\tpublic static var items = [\n''')
		firstline = True

		with open(jei_file, 'r') as f:
			for line in f.readlines():
				if (' ' in line) or ('minecraft:' in line) or ('fluid:' in line):
					continue

				if not firstline:
					of.write(',\n')
				of.write('\t\t<item:' + line.replace('\n', '') + '>')
				firstline = False

		of.write('''\n\t] as IItemStack[];
}''')

main()