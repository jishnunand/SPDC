$(document).ready(function(){
	console.log("sdfdf");
	setTimeout(function(){
		console.log("log");
		$.ajax({
			method:"GET",
			url:"http://localhost:9895/J/NewFile2.jsp"
		});
	},2000);
	console.log("after log");
});