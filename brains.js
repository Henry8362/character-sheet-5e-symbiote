// This file will be loaded into the browser along with the index.html file and make the character sheets work.
// It will contact an external service and make a fetch request to pull in a JSON array of data for the character sheet, which will then load into the page.
// Called when page is loaded
function initSheet() {

  // Get the player characters associated with player who has the symbiote, this will be by the unique ID of the model.
  let $playercharacters = TS.creatures.getCreaturesOwnedByPlayer;
  // for each player character, create a new character sheet
  $playercharacters.forEach(function (character) {
    // get the ID if unique
    if (character.isUnique) {
    let $id = character.id;
    }
  });

}