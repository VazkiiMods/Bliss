import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;

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

// ============================================================================================================
// Fix BoP ladders not having sawmill recipes
// ============================================================================================================

function addLadder(name as string, out as IItemStack, plank as IIngredient, log as IIngredient) as void {
	Woodcutter.addRecipe(name + "_ladder_sawmill", out, plank);
	Woodcutter.addRecipe(name + "_ladder4_sawmill", out * 4, log);
}

addLadder("jacaranda", <item:compatoplenty:jacaranda_ladder>, <item:biomesoplenty:jacaranda_planks>, <tag:items:biomesoplenty:jacaranda_logs>);
addLadder("fir", <item:compatoplenty:fir_ladder>, <item:biomesoplenty:fir_planks>, <tag:items:biomesoplenty:fir_logs>);
addLadder("redwood", <item:compatoplenty:redwood_ladder>, <item:biomesoplenty:redwood_planks>, <tag:items:biomesoplenty:redwood_logs>);
addLadder("mahogany", <item:compatoplenty:mahogany_ladder>, <item:biomesoplenty:mahogany_planks>, <tag:items:biomesoplenty:mahogany_logs>);
addLadder("willow", <item:compatoplenty:willow_ladder>, <item:biomesoplenty:willow_planks>, <tag:items:biomesoplenty:willow_logs>);
addLadder("magic", <item:compatoplenty:magic_ladder>, <item:biomesoplenty:magic_planks>, <tag:items:biomesoplenty:magic_logs>);
addLadder("dead", <item:compatoplenty:dead_ladder>, <item:biomesoplenty:dead_planks>, <tag:items:biomesoplenty:dead_logs>);
addLadder("umbran", <item:compatoplenty:umbran_ladder>, <item:biomesoplenty:umbran_planks>, <tag:items:biomesoplenty:umbran_logs>);
addLadder("palm", <item:compatoplenty:palm_ladder>, <item:biomesoplenty:palm_planks>, <tag:items:biomesoplenty:palm_logs>);