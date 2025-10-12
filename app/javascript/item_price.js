document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput || !addTaxPrice || !profit) return;

    priceInput.addEventListener('input', () => {
     const value = parseInt(priceInput.value, 10) || 0;
    addTaxPrice.innerHTML = Math.floor(value * 0.1);
    profit.innerHTML = value - Math.floor(value * 0.1);
  });
});
