document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = Number(priceInput.value);
      if (price >= 300 && price <= 9999999) {
        const fee = Math.floor(price * 0.1);
        const gain = price - fee;
        addTaxPrice.textContent = fee;
        profit.textContent = gain;
      } else {
        addTaxPrice.textContent = 0;
        profit.textContent = 0;
      }
    });
  }
});