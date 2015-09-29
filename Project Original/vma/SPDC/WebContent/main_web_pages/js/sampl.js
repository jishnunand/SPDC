$(document).ready(function(){
	console.log("sdfdf");
	setTimeout(function(){
		console.log("log1");
		$.ajax({
			method:"GET",
			url:"http://localhost:9895/SPDC/main_web_pages/CheckTable.jsp"
		});
		
	},100);
	setTimeout(function(){
		console.log("log2");
	$.ajax({
			method:"GET",
		url:"http://localhost:9895/SPDC/main-admin_pages/update_bills.jsp"
	});
	
	console.log("after log2");
},200);
	
	
	setTimeout(function(){
		console.log("log3");
	$.ajax({
			method:"GET",
		url:"http://localhost:9895/SPDC/main-admin_pages/generates_bills.jsp"
	});
	
	console.log("after log3");
},200);
	
	
});