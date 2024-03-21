function calculation (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const commission = Math.floor(parseFloat(itemPrice.value) * 0.1);
    const addItemPrice = document.getElementById("add-tax-price");
    addItemPrice.innerHTML = `${commission}`;
    
    const salesProfit = Math.round(parseFloat(itemPrice.value) - commission);
    const profit = document.getElementById("profit");
    profit.innerHTML = `${salesProfit}`;
  });
}

window.addEventListener('turbo:load', calculation);