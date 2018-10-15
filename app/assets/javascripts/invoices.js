$(function () {
  function productRows() {
    return $(".jsProductRow:visible");
  };

  function numberAndPriceInputs(productRow) {
    return productRow.find("[id$=_unit_price],[id$=_number]");
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

  // function destroyLink(productRow) {
  //   return productRow.find("[id$=__destroy]");
  // }

  function totalAmountInput() {
    return $("#invoice_total_amount");
  };

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
    totalAmount.val(Number(amount_sum * 1.08).toFixed(0));
  };

  $.each(productRows(), function() {
    $.each(numberAndPriceInputs($(this)), function() {
      $(this).change(function() {
        recalculateAmount($(this));
      });
    });
    // TODO : 品目を削除した時に値段を再計算
    // $.each(destroyLink($(this)), function() {
    //   $(this).on('click', function() {
    //     recalculateTotalAmount($(this));
    //   });
    // });
  });
});