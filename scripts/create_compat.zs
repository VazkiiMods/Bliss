#priority 90

// Create integration by Partonetrain, lines 6-14 are from MobiusFlip's Crucial 2 Create compat script
#onlyif modloaded create
	#onlyif modnotloaded createtweaker
	import crafttweaker.api.events.CTEventManager;
	CTEventManager.register<crafttweaker.api.event.entity.player.PlayerLoggedInEvent>((event) => {
		var player = event.player;
		player.sendMessage("WARNING: Create Integration!");
		player.sendMessage("CreateTweaker is required for Create integration to work properly. Please make sure you have the latest version installed:");
		player.sendMessage("https://www.curseforge.com/minecraft/mc-mods/createtweaker");
		player.sendMessage(" ");
		player.sendMessage("IMPORTANT: This world needs to either be recreated, or the Create datapack's priority lowered to work, as you've loaded it without CreateTweaker.");
	});

	#endif

#onlyif modloaded createtweaker
import mods.create.CrushingManager;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.util.random.Percentaged;


println("Create detected. Loading Create Compat!");


// Excavated Variants Crusher ===============================================================================

for item in <tag:items:forge:ores>.elements {
	var amount = 1;
	if("excavated_variants" in ((item as IItemStack).registryName as string)){
		if("copper" in ((item as IItemStack).registryName as string)){
			amount = 5;
		}
		if("redstone" in ((item as IItemStack).registryName as string)){
			amount = 6;
		}	
		if("lapis" in ((item as IItemStack).registryName as string)){
			amount = 10;
		}	

		AddCrusherRecipe(item, GetOreItemFromOreBlock(item), amount, GetStoneFromOreBlock(item));
	}
}

function GetStoneFromOreBlock(oreBlock as IItemStack) as IItemStack{
	if ("create_crimsite" in (oreBlock.registryName as string)){
		return <item:create:crimsite>;
	}
	if ("create_limestone"  in (oreBlock.registryName as string)){
		return <item:create:limestone>;
	}
	if ("calcite" in (oreBlock.registryName as string)){
		return <item:minecraft:calcite>;
	}
	if ("create_scoria" in (oreBlock.registryName as string)){
		return <item:create:scoria>;
	}
	if ("quark_shales" in (oreBlock.registryName as string)){
		return <item:quark:shale>;
	}
	if ("quark_jasper"  in (oreBlock.registryName as string)){
		return <item:quark:jasper>;
	}
	if ("quark_limestone" in (oreBlock.registryName as string)){
		return <item:quark:limestone>;
	}
	if ("create_ochrum" in (oreBlock.registryName as string)){
		return <item:create:ochrum>;
	}
	if ("granite" in (oreBlock.registryName as string)){
		return <item:minecraft:granite>;
	}
	if ("dripstone" in (oreBlock.registryName as string) ){
		return <item:minecraft:dripstone_block>;
	}
	if ("tuff" in (oreBlock.registryName as string) ){
		return <item:minecraft:tuff>;
	}
	if ("create_veridium" in (oreBlock.registryName as string)){
		return <item:create:veridium>;
	}
	if ("diorite" in (oreBlock.registryName as string)){
		return <item:minecraft:diorite>;
	}
	if ("andesite" in (oreBlock.registryName as string)){
		return <item:minecraft:andesite>;
	}
	if ("create_asurine" in (oreBlock.registryName as string)){
		return <item:create:asurine>;
	}
	if ("create_scorchia" in (oreBlock.registryName as string)){
		return <item:create:scorchia>;
	}
	if ("blackstone" in (oreBlock.registryName as string)){
		return <item:minecraft:blackstone>;
	}
	if ("smooth_basalt" in (oreBlock.registryName as string)){
		return <item:minecraft:smooth_basalt>;
	}

	println((oreBlock.registryName as string) + " fell through GetStoneFromOreBlock!");
	return <item:minecraft:barrier>;
}

function GetOreItemFromOreBlock(oreBlock as IItemStack) as IItemStack{
	if ("coal_ore" in (oreBlock.registryName as string)){
		return <item:minecraft:coal>;
	}
	if ("iron_ore" in (oreBlock.registryName as string)){
		return <item:create:crushed_iron_ore>;
	}
	if ("copper_ore" in (oreBlock.registryName as string)){
		return <item:create:crushed_copper_ore>; 
	}
	if ("gold_ore" in (oreBlock.registryName as string)){
		return <item:create:crushed_gold_ore>;
	}
	if ("redstone_ore" in (oreBlock.registryName as string)){
		return <item:minecraft:redstone>; 
	}
	if ("emerald_ore" in (oreBlock.registryName as string)){
		return <item:minecraft:emerald>;
	}
	if ("lapis_ore" in (oreBlock.registryName as string)){
		return <item:minecraft:lapis_lazuli>; 
	}
	if ("diamond_ore" in (oreBlock.registryName as string)){
		return <item:minecraft:diamond>;
	}
	if ("zinc_ore" in (oreBlock.registryName as string)){
		return <item:create:crushed_zinc_ore>;
	}
	if("quartz_ore" in  (oreBlock.registryName as string)){
		return <item:minecraft:quartz>;
	}

	println((oreBlock.registryName as string) + " fell through GetOreItemFromOreBlock!");
	return <item:minecraft:barrier>;
}

function AddCrusherRecipe(oreBlock as IItemStack, crushedOre as IItemStack, amt as int, stone as IItemStack) as void{
	println("Added crusher recipe for " + (oreBlock.registryName as string));
	var output = [crushedOre * amt, (crushedOre % 75), (<item:create:experience_nugget> % 75), stone % 12] as Percentaged<IItemStack>[];
	var recipeName = "crushed_" + oreBlock.descriptionId;
	<recipetype:create:crushing>.addRecipe(recipeName, output, oreBlock, 250);
}

#endif
#endif