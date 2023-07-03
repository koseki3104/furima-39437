document.addEventListener('DOMContentLoaded', function() {
  const itemPriceInput = document.getElementById('item-price');
  const commissionElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  itemPriceInput.addEventListener('input', function() {
    const price = Number(this.value);
    if (!isNaN(price)) {
      const commission = Math.round(price * 0.1);
      const profit = price - commission;
      commissionElement.textContent = commission.toLocaleString();
      profitElement.textContent = profit.toLocaleString();
    } else {
      commissionElement.textContent = '';
      profitElement.textContent = '';
    }
  });
});