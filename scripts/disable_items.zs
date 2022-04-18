#priority 50

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.GenericRecipesManager;

var disabled_items = Globals.disabled_items as IItemStack[];

for item in disabled_items {
	recipes.remove(item);
}