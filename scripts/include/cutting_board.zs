#priority 100
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.recipe.RecipeManagerWrapper;

public class CuttingBoard {

	public static addRecipe(name as string, output as IItemStack, input as IIngredient, tool as IIngredient) as void {
		<recipetype:farmersdelight:cutting>.addJsonRecipe(name, {
			"type": "farmersdelight:cutting",
			"ingredients": [input],
			"tool": tool,
			"result": [
				{
					"item": output.registryName,
					"count": output.amount
				}
			]
		});
	}

	public static addRecipe(name as string, output as IItemStack, output2 as IItemStack, input as IIngredient, tool as IIngredient) as void {
		<recipetype:farmersdelight:cutting>.addJsonRecipe(name, {
			"type": "farmersdelight:cutting",
			"ingredients": [input],
			"tool": tool,
			"result": [
				{
					"item": output.registryName,
					"count": output.amount
				},
				{
					"item": output2.registryName,
					"count": output2.amount
				}
			]
		});
	}

	public static addRecipeWithOptional(name as string, output as IItemStack, outputOptional as IItemStack, chance as double, input as IIngredient, tool as IIngredient) as void {
		<recipetype:farmersdelight:cutting>.addJsonRecipe(name, {
			"type": "farmersdelight:cutting",
			"ingredients": [input],
			"tool": tool,
			"result": [
				{
					"item": output.registryName,
					"count": output.amount
				}, 
				{
					"item": outputOptional.registryName,
					"count": outputOptional.amount,
					"chance": chance
				}
			]
		});
	}

	public static removeRecipe(output as IItemStack) as void {
		<recipetype:farmersdelight:cutting>.remove(output);
	}
}