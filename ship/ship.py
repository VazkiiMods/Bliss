import json, os, shutil, hashlib

# ############################################################ CONFIG ############################################################

# Pack name and Author
pack_name = 'Bliss'
pack_author = 'Vazkii'

# Ship Targets
do_client = True
do_server = True
do_modrinth = False

# Patchouli book file, leave blank if not used
book_file = 'patchouli_books/blissguide/book.json'

# Files to copy to the output zips
files_to_copy = ['config', 'defaultconfigs', 'fancymenu_setups', 'patchouli_books', 'scripts', 'shaderpacks']

# Files to not copy to the output zips
blacklisted_files = [
	'config/jei/ingredient-list-mod-sort-order.ini',
	'config/jei/ingredient-list-type-sort-order.ini',
	'config/jei/recipe-category-sort-order.ini',
	'config/jei/bookmarks.ini',
	'config/sodium-options.json'
]

# Additional files to copy to the server zip
server_files_to_copy = ['setup_server.bat', 'setup_server.sh', 'SERVER_README.txt']

# Mods to not include in the server zip
server_mods_blacklist = [
	581495, # Oculus
	317269, # Controllable
	574856, # Rubidium
	532127, # Legendary Tooltips
	271740, # Toast Control
	448233, # Entity Culling
	613117, # MacCraft
	570368, # Raised
	441114  # Nekos Enchanted Books
]

# Files to not copy to the server zip
server_blacklisted_files = [
	'config/openloader/resources',
	'config/MusicTriggers/songs',
	'config/fancymenu',
	'config/drippyloadingscreen',
	'fancymenu_setups',
	"shaderpacks"
]

# Directory settings
temp_dir = '.ship_temp'
overrides_dir = temp_dir + '/overrides'
out_dir = 'ship/output'
ship_dir = 'ship'

##################################################################################################################################

def main():
	version = input('Modpack Version: ')
	print('Building', pack_name, 'version', version)
	build_pack(version)

def build_pack(version):
	ensure_directory()
	cleanup()
	
	minecraftinstance_data = load_instance_data()
	ship_client(minecraftinstance_data, version)
	ship_server(minecraftinstance_data, version)

def cleanup():
	clear_dir(temp_dir)
	clear_dir(overrides_dir)
	clear_dir(out_dir)

def ship_client(minecraftinstance_data, version):
	if not do_client:
		return

	print("Shipping Client...")
	copy_files(files_to_copy, '', overrides_dir)
	clear_files(overrides_dir, blacklisted_files)
	update_book(version)
	make_manifests(minecraftinstance_data, version)
	zip_files(temp_dir, version, '');

def ship_server(minecraftinstance_data, version):
	if not do_server:
		return

	print("Shipping Server...")
	copy_files(server_files_to_copy, 'ship/', overrides_dir)
	clear_files(overrides_dir, server_blacklisted_files)
	write_mods_csv(minecraftinstance_data)
	zip_files(overrides_dir, version, '-server');

##################################################################################################################################

def load_instance_data():
	with open('minecraftinstance.json', 'r', encoding="utf-8") as in_file:
		minecraftinstance_data = json.load(in_file)
		return minecraftinstance_data

def server_download_files(minecraftinstance_data):
	return format_mod_array(minecraftinstance_data, server_mods_blacklist, server_download_obj)

def server_download_obj(installed_file):
	url = installed_file['downloadUrl']
	filename = 'mods/' + installed_file['fileName']
	return {
		'url': url,
		'filename': filename
	}

def format_mod_array(minecraftinstance_data, blacklist, format):
	formatted_array = []
	addons = minecraftinstance_data['installedAddons']
	for addon in addons:
		installed_file = addon['installedFile']
		package_type = addon['packageType']
		project_id = addon['addonID']

		if (not (project_id in blacklist)) and (package_type == 6):
			mod_obj = format(installed_file)
			formatted_array.append(mod_obj)

	return formatted_array

# Ensure we're working in the right directory
def ensure_directory():
	for f in files_to_copy:
		if not os.path.isdir(f):
			os.chdir('..')
			break

	for f in files_to_copy:
		assert os.path.isdir(f)

# Clear out old dir, make new one
def clear_dir(dir_name):
	if os.path.isdir(dir_name):
		shutil.rmtree(dir_name)
	os.mkdir(dir_name)

# Copy relevant files
def copy_files(arr, in_dir, out_dir):
	for f in arr:
		target = in_dir + f
		out_path = out_dir + '/' + f
		if os.path.isdir(target):
			shutil.copytree(target, out_path)
		else:
			shutil.copy(target, out_path)

# Delete blacklisted files
def clear_files(dir_name, blacklist):
	for f in blacklist:
		target = dir_name + '/' + f
		if os.path.isdir(target):
			shutil.rmtree(target)
		elif os.path.exists(target):
			os.remove(target)

# Update book.json with correct version
def update_book(version):
	if not book_file:
		pass

	with open(book_file, 'r') as in_file:
		book_data = json.load(in_file)
		book_data['subtitle'] = ("Version " + version)

		with open(overrides_dir + '/' + book_file, 'w') as out_file:
			json.dump(book_data, out_file, indent=4)

# Build and write manifest.json
def make_manifests(minecraftinstance_data, version):
	modloader = minecraftinstance_data['baseModLoader']
	forge_ver = modloader['name']
	forge_ver_raw = modloader['forgeVersion']
	mc_ver = modloader['minecraftVersion']
	
	manifest_files = []
	modirinth_files = []
	addons = minecraftinstance_data['installedAddons']

	mod_jars = [f for f in os.listdir('mods') if f.endswith('.jar')]
	installed_files = [a for a in addons if a['installedFile'] and a['packageType'] == 6]
	expected = len(mod_jars)
	curr = len(installed_files)

	if curr != expected:
		print('Length of installedAddons array differs from amount of installed mod jars! (%d len vs %d expected)' % (curr, expected))
		installed_filenames = [f['installedFile']['fileName'] for f in installed_files]

		larger = mod_jars if (expected > curr) else installed_filenames
		smaller = mod_jars if (expected < curr) else installed_filenames
		for f in larger:
			if not f in smaller:
				print('Mod missing:', f)
		quit()

	print('Making pack manifest with', curr, 'mods...')

	for addon in addons:
		installed_file = addon['installedFile']
		if addon['packageType'] != 6:
			continue

		manifest_files.append({
			'projectID': addon['addonID'],
			'fileID': installed_file['id'],
			'required': True
		})

		mod_file_path = 'mods/' + installed_file['fileName']
		modirinth_files.append({
			'path': mod_file_path,
			'hashes': {
				'sha1': sha1(mod_file_path),
				'sha512': sha512(mod_file_path)
			},
			'downloads': [ installed_file['downloadUrl'] ],
			'fileSize': installed_file['fileLength']
		})

	out_manifest = {
		'minecraft': {
			'version': mc_ver,
			'modLoaders': [
				{
					'id': forge_ver,
					'primary': True
				}
			]
		},
		'manifestType': 'minecraftModpack',
		'manifestVersion': 1,
		'name': pack_name,
		'version': version,
		'author': pack_author,
		'files': manifest_files,
		'overrides': 'overrides'
	}

	out_modirinth_index = {
		'formatVersion': 1,
		'game': 'minecraft',
		'name': pack_name,
		'versionId': version,
		'files': modirinth_files,
		'dependencies': {
			'minecraft': mc_ver,
			'forge': forge_ver_raw
		}
	}

	with open(temp_dir + '/manifest.json', 'w') as out_file:
		json.dump(out_manifest, out_file, indent=2)
		
	if do_modrinth:
		with open(temp_dir + '/modrinth.index.json', 'w') as out_file:
			json.dump(out_modirinth_index, out_file, indent=2)

def write_mods_csv(minecraftinstance_data):
	download_files = server_download_files(minecraftinstance_data)

	modloader = minecraftinstance_data['baseModLoader']
	forge_ver = modloader['name']
	mc_ver = modloader['minecraftVersion']
	
	forge_ver = mc_ver + '-' + modloader['forgeVersion']
	forge_filename = 'forge-' + forge_ver + '-installer.jar'
	forge_url = 'https://files.minecraftforge.net/maven/net/minecraftforge/forge/' + forge_ver + '/' + forge_filename
	download_files.insert(0, {
		'url': forge_url,
		'filename': 'forge-installer.jar'
	})

	with open(overrides_dir + '/mods.csv', 'w') as out_file:
		for mod in download_files:
			out_file.write(mod['url'].replace(' ', '%20') + ',' + mod['filename'].replace(' ', '_') + '\n')

def zip_files(src_dir, version, denom):
	out_file = out_dir + '/' + pack_name.replace(' ', '') + '-' + version + denom
	shutil.make_archive(out_file, 'zip', src_dir)

##################################################################################################################################

def sha1(file):
	return hash_file(hashlib.sha1(), file)

def sha512(file):
	return hash_file(hashlib.sha512(), file)

def hash_file(algo, file):
	with open(file, 'rb') as f:
		while True:
			data = f.read(65536)
			if not data:
				break

			algo.update(data)

	return "{0}".format(algo.hexdigest())

##################################################################################################################################

main()