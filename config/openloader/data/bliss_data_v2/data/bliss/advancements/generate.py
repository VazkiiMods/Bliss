from advancement_base import *


fetch('get_backpack', 'quark:backpack', 'minecraft:story/smelt_iron', display_type='goal')
fetch('get_paraglider', 'paraglider:paraglider', 'minecraft:adventure/sleep_in_bed')
fetch('get_atlas', 'map_atlases:atlas', 'minecraft:adventure/sleep_in_bed')
fetch('get_iron_rod', 'quark:iron_rod', 'minecraft:story/smelt_iron')
fetch('get_copper_pipe', 'quark:pipe', 'minecraft:story/smelt_iron')
fetch('get_sawmill', 'corail_woodcutter:oak_woodcutter', 'minecraft:story/smelt_iron')
fetch('get_slime_in_a_bucket', 'quark:slime_in_a_bucket', 'minecraft:adventure/kill_a_mob')
fetch('get_trading_post', 'tradingpost:tradin_post', 'minecraft:adventure/trade')
fetch('get_seed_pouch', 'quark:seed_pouch', 'minecraft:husbandry/plant_seed')

fetch('get_diamond_heart', 'quark:diamond_heart', 'minecraft:adventure/kill_a_mob')
fetch('get_pickarang', 'quark:pickarang', 'bliss:bliss/get_diamond_heart', display_type='goal')
fetch('get_tater', 'quark:tiny_potato', 'bliss:bliss/get_diamond_heart', display_type='hidden')
fetch('get_glow_shroom', 'quark:glow_shroom', 'bliss:bliss/get_diamond_heart')

fetch('get_all_music_discs', 'quark:music_disc_endermosh', 'minecraft:end/find_end_city', 'music_discs.txt', 'challenge')
fetch('get_all_crystals', 'quark:red_crystal_cluster', 'minecraft:adventure/sleep_in_bed', 'crystals.txt', 'challenge')