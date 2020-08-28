// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

function profit(){
  const item1 = document.getElementById("item-price")
  const item2 = document.getElementById("add-tax-price")
  const item3 = document.getElementById("profit")

item1.addEventListener("change", function(){
  let price = item1.value;
  function tax(){
    return item2 = price * 0.10;
  }
  function tax(){
    return item3 = price * 0.90;
  }
  var price = tax(price);
  var price = Math.round(price);

})
}
window.addEventListener("load", profit);