// This file will be loaded into the browser along with the index.html file and make the character sheets work.
// It will contact an external service and make a fetch request to pull in a JSON array of data for the character sheet, which will then load into the page.
// Called when page is loaded
async function initSheet() {

  // Get the player characters associated with player who has the symbiote, this will be by the unique ID of the model.
  //let $playercharacters = TS.creatures.getCreaturesOwnedByPlayer;
  // for each player character, create a new character sheet
  //$playercharacters.forEach(function (character) {
    // get the ID if unique
   // if (character.isUnique) {
    let id = 1;
    // make fetch request to get the character sheet data
    var response = await fetch(`http://localhost:3000/Players/${id}`)
    var data = await response.json();
    return data;
}
async function fetchMappings() {

  var response = await fetch(`http://localhost:3000/Fields`)
  var data = await response.json();
  return data;

}
async function fetchSkills() {
  
    var response = await fetch(`http://localhost:3000/Skills`)
    var data = await response.json();
    return data;
  
}

async function fetchBlocks() {
     
      // if local storage "statblocks" is empty, make fetch request to get the character sheet data
      const cachedData = localStorage.getItem('statblocks');
      if (cachedData) {
        return JSON.parse(cachedData);
      }
      else {
      var response = await fetch(`http://localhost:3000/StatBlocks`)
      var data = await response.json();
      localStorage.setItem('statblocks', JSON.stringify(data));
      return data;
      }
  }