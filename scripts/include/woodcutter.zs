#priority 100
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.recipe.RecipeManagerWrapper;

public class Woodcutter {

	public static addRecipe(name as string, output as IItemStack, input as IIngredient) as void {
		<recipetype:corail_woodcutter:woodcutting>.addJsonRecipe(name, {
			"type": "corail_woodcutter:woodcutting",
			"ingredient": input,
			"result": output.registryName,
			"count": output.amount
		});
	}

	public static removeRecipe(output as IItemStack) as void {
		<recipetype:corail_woodcutter:woodcutting>.remove(output);
	}
}