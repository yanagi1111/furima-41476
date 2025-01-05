const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const taxValue = Math.floor(inputValue * 0.1);
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = taxValue;
    profit.innerHTML = Math.floor(inputValue - taxValue);
  } )}

  window.addEventListener("turbo:load", price);
  window.addEventListener("turbo:render", price);