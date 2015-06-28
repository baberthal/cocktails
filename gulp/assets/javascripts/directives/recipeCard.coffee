angular.module 'cocktails'
  .directive 'recipeCard', ->
    return {
      restrict: 'E'
      template: "
<md-card flex='75'>
  <md-card-content>
    <h2 class='md-display-1'>{{ cocktailRecipe.name }}</h2>
    <p class='md-body-1'>{{ cocktailRecipe.description }}</p>
  </md-card-content>
  <div class='md-actions' layout-align='end center' layout-padding='' layout='row'>
    <p class='md-caption italic' ng-show='cocktailRecipe.user'>Created by {{ cocktailRecipe.user }} on {{ cocktailRecipe.createdAt }}</p>
    <p class='md-caption italic' ng-hide='cocktailRecipe.user'>Created by Admin on {{ cocktailRecipe.createdAt }}</p>
    <span flex=''></span>
    <md-button class='md-primary' ng-click='viewCocktail(cocktailRecipe)'>Details</md-button>
    <md-button ng-click='editRecipe(cocktailRecipe.id)' ng-show='canEdit(cocktailRecipe)'>Edit</md-button>
    <md-button class='md-warn' ng-click='delete(cocktailRecipe)' ng-show='canEdit(cocktailRecipe)'>Delete</md-button>
  </div>
</md-card>
"
    }
