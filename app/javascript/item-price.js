window.addEventListener('load', () => {
 const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;


    const tax = inputValue * 0.1
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(tax)


    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = tax
    profitDom.innerHTML =  Math.floor(inputValue - tax)

})

});

