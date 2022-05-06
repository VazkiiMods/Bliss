#priority 100
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.recipe.RecipeManagerWrapper;

public class Woodcutter {
	private static var woodcutting = <recipetype:corail_woodcutter:woodcutting> as RecipeManagerWrapper;

	public static addRecipe(name as string, output as IItemStack, input as IIngredient) as void {
		woodcutting.addJsonRecipe(name, {
			"type": "corail_woodcutter:woodcutting",
			"ingredient": input,
			"result": output.registryName,
			"count": output.amount
		});
	}

	public static removeRecipe(output as IItemStack) as void {
		woodcutting.remove(output);
	}
}