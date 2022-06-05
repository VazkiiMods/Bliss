// ============================================================================================================
// Remove pointless tooltip from Corail Woodcutter
// ============================================================================================================

<item:corail_woodcutter:oak_woodcutter>.removeTooltip("REMOVEME");

// ============================================================================================================
// Fix FD not supporting stripping quark woods
// ============================================================================================================

var stripSound = "minecraft:item.axe.strip";

var axes = <tag:items:forge:tools/axes>;
var bark = <item:farmersdelight:tree_bark>;

CuttingBoard.addRecipeWithSound("blossom_log_strip",
	<item:quark:stripped_blossom_log>, bark, <item:quark:blossom_log>, axes, stripSound
);
CuttingBoard.addRecipeWithSound("blossom_wood_strip",
	<item:quark:stripped_blossom_wood>, bark, <item:quark:blossom_wood>, axes, stripSound
);
CuttingBoard.addRecipe("blossom_door_planks",
	<item:quark:blossom_planks>, <item:quark:blossom_door>, axes
);
CuttingBoard.addRecipe("blossom_trapdoor_planks",
	<item:quark:blossom_planks>, <item:quark:blossom_trapdoor>, axes
);
CuttingBoard.addRecipe("blossom_sign_planks",
	<item:quark:blossom_planks>, <item:quark:blossom_sign>, axes
);

CuttingBoard.addRecipeWithSound("azalea_log_strip",
	<item:quark:stripped_azalea_log>, bark, <item:quark:azalea_log>, axes, stripSound
);
CuttingBoard.addRecipeWithSound("azalea_wood_strip",
	<item:quark:stripped_azalea_wood>, bark, <item:quark:azalea_wood>, axes, stripSound
);
CuttingBoard.addRecipe("azalea_door_planks",
	<item:quark:azalea_planks>, <item:quark:azalea_door>, axes
);
CuttingBoard.addRecipe("azalea_trapdoor_planks",
	<item:quark:azalea_planks>, <item:quark:azalea_trapdoor>, axes
);
CuttingBoard.addRecipe("azalea_sign_planks",
	<item:quark:azalea_planks>, <item:quark:azalea_sign>, axes
);

// ============================================================================================================
// Remove cobbled deepslate from the cobblestone tag so it doesn't mess with the quark furnace recipe
// ============================================================================================================

var forge_cobblestone = <tag:items:forge:cobblestone>;
forge_cobblestone.remove(<item:minecraft:cobbled_deepslate>);