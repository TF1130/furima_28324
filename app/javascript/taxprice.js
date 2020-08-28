function stop(){
    const item1 = document.getElementById("item-price")
    const item2 = document.getElementById("add-tax-price")
    const item3 = document.getElementById("profit")
  
  item1.addEventListener("change", function(){
    let price = item1.value;
    const tax = `${price * 0.1}`
    item2.textContent = tax
    const tax2 = `${price * 0.9}`
    item3.textContent = tax2
  })
 }
window.addEventListener("load", stop);