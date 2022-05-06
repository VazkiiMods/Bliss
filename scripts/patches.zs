// Remove pointless tooltip from Corail Woodcutter

<item:corail_woodcutter:oak_woodcutter>.removeTooltip("REMOVEME");

// Fix FD not supporting stripping quark woods

CuttingBoard.addRecipe("blossom_log_strip", 
	<item:quark:stripped_blossom_log>,
	<item:farmersdelight:tree_bark>,
	<item:quark:blossom_log>,
	<tag:items:forge:tools/axes>
);

CuttingBoard.addRecipe("blossom_wood_strip", 
	<item:quark:stripped_blossom_wood>,
	<item:farmersdelight:tree_bark>,
	<item:quark:blossom_wood>,
	<tag:items:forge:tools/axes>
);

CuttingBoard.addRecipe("azalea_log_strip", 
	<item:quark:stripped_azalea_log>,
	<item:farmersdelight:tree_bark>,
	<item:quark:azalea_log>,
	<tag:items:forge:tools/axes>
);

CuttingBoard.addRecipe("azalea_wood_strip", 
	<item:quark:stripped_azalea_wood>,
	<item:farmersdelight:tree_bark>,
	<item:quark:azalea_wood>,
	<tag:items:forge:tools/axes>
);