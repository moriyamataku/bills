$(document).on('turbolinks:load', function() { 
  function productRows() {
    return $(".jsProductRow:visible");
  };

  function numberAndPriceInputs() {
    return $(".product_row").find("[id$=_unit_price],[id$=_number]");
  };

  function deleteLinks() {
    return $("a.product_delete");
  };

  function numberInput(productRow) {
    return productRow.find("[id$=_number]");
  };

  function priceInput(productRow) {
    return productRow.find("[id$=_unit_price]");
  };

  function amountInput(productRow) {
    return productRow.find("[id$=_amount]");
  };

  function totalAmountInput() {
    return $("#invoice_total_amount");
  };

  function taxSelect() {
    return $("select[name='invoice[tax_id]']");
  }

  function taxRate() {
    const tax = parseFloat(taxSelect().text());
    return ((100 + tax) / 100)
  }

  function recalculateAmount(changedObject) {
    const productRow = changedObject.parents(".jsProductRow");
    const number = Number(numberInput(productRow).val());
    const price  = Number(priceInput(productRow).val());
    let amount = amountInput(productRow);
    amount.val(number * price);
    recalculateTotalAmount();
  };

  function recalculateTotalAmount() {
    let amount_sum = 0;
    $.each(productRows(), function() {
      amount_sum += Number(amountInput($(this)).val());
    });
    let totalAmount = totalAmountInput();
    totalAmount.val(Number(amount_sum * taxRate()).toFixed(0));
  };

  $(document).on('change', numberAndPriceInputs(), function(event){
    recalculateAmount($(event.target));
  });

  $(document).on('hide', deleteLinks(), function(){
    recalculateTotalAmount();
  });
});