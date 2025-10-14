const initializePriceCalculation = () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput) return;

  priceInput.replaceWith(priceInput.cloneNode(true));
  const newPriceInput = document.getElementById('item-price');

  newPriceInput.addEventListener('input', () => {
    const value = parseInt(newPriceInput.value, 10) || 0;
    addTaxPrice.textContent = Math.floor(value * 0.1);
    profit.textContent = value - Math.floor(value * 0.1);
  });
};

document.addEventListener('turbo:load', initializePriceCalculation);
document.addEventListener('turbo:render', initializePriceCalculation);
