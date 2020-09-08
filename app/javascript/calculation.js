window.addEventListener('load', function(){
  const price = document.getElementById("item-price")
  const fee = document.getElementById('add-tax-price')
  const profit = document.getElementById("profit")
  price.addEventListener('input', function(){
    const price_count = document.getElementById("item-price").value
    const fee_count = Math.floor(price_count * 0.1)
    const profit_count = price_count - fee_count
    fee.innerHTML = fee_count
    profit.innerHTML = profit_count
  })
});

