function account(){

  const price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit"); 
  
price.addEventListener('input',(e) => {
  const itemPrice = document.getElementById("item-price").value;
  const XHR = new XMLHttpRequest();
  XHR.open("GET",`/items/account?price=${itemPrice}`, true);
  XHR.responseType = "json";
  XHR.send();
  XHR.onload = () => {
    if (itemPrice >= 10){
    add_tax_price.innerHTML = XHR.response.add_tax_price;
    profit.innerHTML = XHR.response.profit;
    } else{
    add_tax_price.innerHTML = 0;
    profit.innerHTML = 0;
    }
  }
  XHR.onerror = () => {
    alert("Request failed");
  };
  e.preventDefault();

});
}

setInterval(account,1000);