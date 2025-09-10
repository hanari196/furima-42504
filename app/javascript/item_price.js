function calculatePrice() {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return; // フォームがないページでは動作しない

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value, 10);

    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    if (!isNaN(price)) {
      const tax = Math.floor(price * 0.1);            // 手数料 10%、小数点切り捨て
      const profitValue = Math.floor(price - tax);   // 利益も切り捨て
      taxPrice.textContent = tax;
      profit.textContent = profitValue;
    } else {
      taxPrice.textContent = 0;
      profit.textContent = 0;
    }
  });
}

// Turbo（Hotwire）対応
window.addEventListener("turbo:load", calculatePrice);
window.addEventListener("turbo:render", calculatePrice);
