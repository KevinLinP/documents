if ($('.transactionRowPrice').length != 0)
{
	total = 0.0;

	totaler = function(e,i){
		var regex = /(\d+\.\d\d+)/;
		price = regex.exec($(e).html());
		if (price != null) {
			total += parseFloat(price[0])}
	};
	jQuery.map($('.transactionRowPrice'), totaler);

	alert("You are a $" + total + " customer.");
}
