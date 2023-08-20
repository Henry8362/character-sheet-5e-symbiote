// This file will be loaded into the browser along with the index.html file and make the character sheets work.
// It will contact an external service and make a fetch request to pull in a JSON array of data for the character sheet, which will then load into the page.
// Called when page is loaded
async function initSheet(e) {

  // Get the player characters associated with player who has the symbiote, this will be by the unique ID of the model.
  //let $playercharacters = TS.creatures.getCreaturesOwnedByPlayer;
  // for each player character, create a new character sheet
  //$playercharacters.forEach(function (character) {
    // get the ID if unique
   // if (character.isUnique) {
    console.log(e);
    let id = e.id;

    //let id = "782831a7-83d4-49a9-92e6-b61646592d24";
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

<<<<<<< HEAD
async function fetchItems() {

  var response = await fetch(`http://localhost:3000/Items`)
  var data = await response.json();
  return data;

}


=======
>>>>>>> 37c4a72df419cc6d9b1dc79f7ef9e8ad2010e06a
async function  getPlayers() {

  players = await TS.players.getPlayersInThisCampaign();
  return players;
  //await TS.creatures.getUniqueCreaturesInThisCampaign();

}

async function getUser() {

  player = await TS.players.whoAmI();
  return player;


}

async function getUsersCreatures(e) {


  creatures = await TS.creatures.getCreaturesOwnedByPlayer(e);
  creatures = TS.creatures.getMoreInfo(creatures);
  return creatures;

}

async function getUsersResources(e) {

  // for the given player, we make an API query to get the resources that player has access to.
  // we then return that data to the calling function.
  console.log(e);
  var response = await fetch(`http://localhost:3000/Players/${e}/Resources`);
  var data = await response.json();
  return data;
}

async function createSheet(id, data) {
  console.log(data);
  var response = await fetch(`http://localhost:3000/Players/${id}/MakeSheet`, {
    method: 'POST', // Use 'PUT' if updating instead of creating
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)


});
var data = await response.json();
return data;
};