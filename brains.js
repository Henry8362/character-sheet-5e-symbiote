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

async function fetchItems() {

  var response = await fetch(`http://localhost:3000/Items`)
  var data = await response.json();
  return data;

}


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

  playersCreatures = await TS.creatures.getUniqueCreaturesInThisCampaign();
  playersCreatures = await TS.creatures.getMoreInfo(playersCreatures);
  playersCreatures = playersCreatures.filter(creature => creature.ownerIds.includes(e));
  return playersCreatures;

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

async function addItemToPlayerSheet(itemID, CharacterID) {

  var response = await fetch(`http://localhost:3000/Characters/${CharacterID}/Items/${itemID}`, {
    method: 'POST', // Use 'PUT' if updating instead of creating
    headers: {
      'Content-Type': 'application/json'
    },

  });


}

async function deductItemFromPlayerSheet(itemID, CharacterID, quantity) {

  var response = await fetch(`http://localhost:3000/Characters/${CharacterID}/Items/${itemID}/deduct/${quantity}`, {
    method: 'POST', // Use 'PUT' if updating instead of creating
    headers: {
      'Content-Type': 'application/json'
    },


});
return response;s
}

async function updateCharacterSheet(CharacterID, data) {

  var response = await fetch(`http://localhost:3000/Characters/${CharacterID}/UpdateSheet`, {
    method: 'POST', // Use 'PUT' if updating instead of creating
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)

  });
  return response;

}


// retrieve a buff from the API
async function getBuff(id) {

  var response = await fetch(`http://localhost:3000/Buffs/${id}`);
  var data = await response.json();
  return data;



}

async function addBuffToCharacterSheet(CharacterID, buff_id) {
  
  var response = await fetch(`http://localhost:3000/Characters/${CharacterID}/Buffs/${buff_id}/Add`,{
    method: 'POST', // Use 'PUT' if updating instead of creating
    headers: {
      'Content-Type': 'application/json'
    },
  });
  var data = await response.json();
  return data;


}

async function removeBuffFromCharacterSheet(CharacterID, buff_id) {

  var response = await fetch(`http://localhost:3000/Characters/${CharacterID}/Buffs/${buff_id}/Delete`,{
    method: 'POST', // Use 'PUT' if updating instead of creating
    headers: {
      'Content-Type': 'application/json'
    },
  });
  var data = await response.json();
  return data;


}



async function handleRollResult(rollEvent) {

    let result = rollEvent.payload.resultsGroups[0].result.results;
    // add up the total result.results 
    let total = 0;
    // Doesn't account for if a singular dice is rolled at the moment, need to fix that.
    if( result != undefined) {
      // add up the array values of result
      result.forEach(function (item) {
        total += item;
      }
      );

    }
    let data = VueApp.rollData;
    console.log(data);
    if (rollEvent.payload.rollId == data[0].rollID) {
        //if the roll event matches the roll id of the roll we are waiting for, we can process the result.
        
        // if it is a consumable
        if (data[0].type == "item") {
          // determine the attribute type
          switch(data[0].item.attributes.type) {
            case "heal":
              let bonusHealing = data[0].item.attributes.bonus;
              let totalHealing = parseInt(total) + parseInt(bonusHealing);
              // add the total healing to the character sheet via the API and deduct the item from the character sheet.
              // we need to get the character sheet ID from the roll data.
              let characterID = data[0].character_id;
              let itemID = data[0].item.id;
              // add the item to the character sheet
              await deductItemFromPlayerSheet(itemID, characterID, 1);
              // add the healing to the character sheet
              totalHealing = { "healing": totalHealing };
              await updateCharacterSheet(characterID, totalHealing);
              // find the character by characterID and get the name:
              let character = VueApp.characters.find(character => character.id == characterID);
              VueApp.updateMessage = data[0].item.name + " healed "  + character.name + " for " + totalHealing.healing + " hit points.";
              break;
            case "speed":
              break;




          }


        }
        else if (data[0].type == "attack") {

        }
        //unset VueApp.rollData
        VueApp.rollData = [];
        VueApp.refreshCreatures();
        return;
    }
  
  

}