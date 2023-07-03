document.addEventListener('DOMContentLoaded', function() {
  var itemPriceInput = document.getElementById('item-price');
  var commissionElement = document.getElementById('add-tax-price');
  var profitElement = document.getElementById('profit');

  itemPriceInput.addEventListener('input', function() {
    var price = parseInt(this.value);
    if (!isNaN(price)) {
      var commission = Math.round(price * 0.1);
      var profit = price - commission;
      commissionElement.textContent = commission.toLocaleString();
      profitElement.textContent = profit.toLocaleString();
    } else {
      commissionElement.textContent = '';
      profitElement.textContent = '';
    }
  });
});