if ($('.transactionRowPrice').length != 0)
{

	totaler = function(e,i){
		var regex = /(\d+\.\d\d+)/;
		price = regex.exec($(e).html());
		if (price != null) { return parseFloat(price);}
	};
	prices = jQuery.map($('.transactionRowPrice'), totaler);

	total = 0.0;
	jQuery.map(prices, function(e,i){total += e});
	$('.transactionRowPrice').first().text("Total: $" + total);
}
