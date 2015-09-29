$(document).ready(function(){
	console.log("sdfdf");
	setTimeout(function(){
		console.log("log");
		$.ajax({
			method:"GET",
			url:"http://localhost:9895/Original_Code/main_web_pages/CheckTable'jsp"
		});
	},2000);
	console.log("after log");
});