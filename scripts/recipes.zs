import crafttweaker.api.recipe.FurnaceRecipeManager;

var air = <item:minecraft:air>;
var heart_of_the_sea = <item:minecraft:heart_of_the_sea>;
var quartz = <item:minecraft:quartz>;
var prismarine_shard = <item:minecraft:prismarine_shard>;
var leather = <item:minecraft:leather>;
var string_item = <item:minecraft:string>;
var crop_tag = <tag:items:quark:seed_pouch_holdable>;
var stick = <item:minecraft:stick>;
var slime = <item:minecraft:slime_ball>;
var iron = <tag:items:forge:ingots/iron>;
var canvas = <item:farmersdelight:canvas>;
var rotten_flesh = <item:minecraft:rotten_flesh>;
var paraglider = <item:paraglider:paraglider>;
var honey_bottle = <item:minecraft:honey_bottle>;
var piston = <item:minecraft:piston>;

// Remove some recipes that shouldn't be in here
craftingTable.remove(paraglider);
craftingTable.removeByName("minecraft:lead");
craftingTable.removeByName("minecraft:scaffolding");
craftingTable.removeByName("comforts:rope_and_nail");

// Craftable Trident
craftingTable.addShaped("ez_trident", 
		<item:minecraft:trident>, 
		[[air, quartz, heart_of_the_sea],
		 [air, prismarine_shard, quartz],
		 [prismarine_shard, air, air]]);

// Replace Rabbit Hide in recipes with Leather
craftingTable.removeByName("quark:tools/crafting/seed_pouch");
craftingTable.removeByName("quark:tools/crafting/bundle");
craftingTable.removeByName("supplementaries:slingshot");

craftingTable.addShaped("leather_seed_pouch", 
		<item:quark:seed_pouch>, 
		[[string_item, leather, string_item],
		 [leather, crop_tag, leather],
		 [air, leather, air]]);
craftingTable.addShaped("leather_bundle", 
		<item:minecraft:bundle>, 
		[[string_item, leather, string_item],
		 [leather, air, leather],
		 [leather, leather, leather]]);
 craftingTable.addShaped("leather_slingshot", 
		<item:supplementaries:slingshot>, 
		[[string_item, leather, string_item],
		 [stick, slime, stick],
		 [air, stick, air]]);

// Pre-End Iron Rod
craftingTable.removeByName("quark:automation/crafting/iron_rod");
craftingTable.addShaped("earlygame_iron_rod", 
		<item:quark:iron_rod>, 
		[[iron], [iron], [iron]]);

// Selectable Painting Only
craftingTable.remove(<item:minecraft:painting>);
craftingTable.addShaped("canvas_painting", 
		<item:selectable_painting:selectable_painting>, 
		[[stick, stick, stick], 
		 [stick, canvas, stick], 
		 [stick, stick, stick]]);

// RF to Leather
furnace.addRecipe("rf2leather", leather, rotten_flesh, 0.0, 200);

// Recycle Paraglider
craftingTable.addShapeless("recycle_paraglider", leather * 4, [paraglider]);

// Honey Sticky Piston
craftingTable.addShaped("honey_sticky_piston",
		<item:minecraft:sticky_piston>,
		[[honey_bottle],
		[piston]]);