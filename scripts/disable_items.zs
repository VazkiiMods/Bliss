#priority 50

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.GenericRecipesManager;
import crafttweaker.api.text.Component;
import crafttweaker.api.text.TextComponent;
import crafttweaker.api.text.Style;
import crafttweaker.api.text.ChatFormatting;

var disabled_items = DisabledItems.items as IItemStack[];
var disabled = new TextComponent("Disabled by Bliss. Please do not use.") as TextComponent;
disabled.setStyle(<constant:minecraft:formatting:red>.asStyle());

for item in disabled_items {
	recipes.remove(item);
	item.addTooltip(disabled);
}