$(document).ready(function() {
  $(".new-recipe-form").on("submit", function(event) {
    event.preventDefault();

    var name = $("#recipe-name").val();

    var description = $("#recipe-description").val();

    var recipeIngredients = $("#ingredients-list").val();
    var collectionOfIngredients = recipeIngredients.split("\n");

    var recipeSteps = $("#recipe-steps").val();
    var collectionOfSteps = recipeSteps.split("\n");

    var request = $.ajax({
      method: "POST",
      url: "/recipes",
      data: {"name": name, "description": description, "steps": collectionOfSteps, "ingredients": collectionOfIngredients}
    })

    debugger
  });
});
