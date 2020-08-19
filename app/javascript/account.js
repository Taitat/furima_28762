document.addEventListener('keydown', function(){

const price = document.getElementById("item-price");
price.addEventListener('input', (e) => {
  const itemPrice = price.value
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit"); 
  add_tax_price.innerHTML = Math.floor(itemPrice * 0.1)
  profit.innerHTML = Math.floor(itemPrice * 0.9)
  

});

})