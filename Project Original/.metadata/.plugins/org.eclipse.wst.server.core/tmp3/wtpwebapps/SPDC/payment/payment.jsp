<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  
    <link rel="stylesheet" type="text/css" href="style.css" />
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	
     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600' rel='stylesheet' type='text/css'>
</head>
<body>
<%
String id = request.getParameter("id");
%>
<div class="column column2 center">
		<div class="content" id="payment">
			<div class="left">
			<form action="http://localhost:9895/SPDC/payment/paycon.jsp?" class="go-right" method="post">
				<div>
				<input type="hidden" value="<%=id%>" name="id">
				<input  type="text" name="card_number" value="" id="card_number" placeholder="xxxx-xxxx-xxxx-xxxx" data-trigger="change" data-validation-minlength="1" data-type="name" data-required="true" data-error-message="Enter Your Credit Card Number" /><label >Card Number</label>
				</div>
				<div>
				  <div class="expiry">	
				      <div class="month_select">
				        <select required name="exp_month" value="" id="exp_month" placeholder="" data-trigger="change" data-type="name" data-required="true" data-error-message="Enter Your Credit Card Expiration Date">
							<option value = "1">01 (Jan)</option>
                   			<option value = "2">02 (Feb)</option>
                   			<option value = "3">03 (Mar)</option>
                   			<option value = "4">04 (Apr)</option>
                   			<option value = "5">05 (May)</option>
                   			<option value = "6">06 (Jun)</option>
                   			<option value = "7">07 (Jul)</option>
                   			<option value = "8">08 (Aug)</option>
                   			<option value = "9">09 (Sep)</option>
                   			<option value = "10">10 (Oct)</option>
                   			<option value = "11">11 (Nov)</option>
                   			<option value = "12">12 (Dec)</option>
                        </select>
                      </div>
                      <div class="year_select">
				        <select name="exp_year" value="" id="exp_year" placeholder="" data-trigger="change" data-type="name" data-required="true" data-error-message="Enter Your Credit Card Expiration Date">
							<option value = "1">14 </option>
                   			<option value = "2">15 (Feb)</option>
                   			<option value = "3">16 (Mar)</option>
                   			<option value = "4">17 (Apr)</option>
                   			<option value = "5">18 (May)</option>
                   			<option value = "6">19 (Jun)</option>
                   			<option value = "7">20 (Jul)</option>
                   			<option value = "8">22 (Aug)</option>
                   			<option value = "9">23 (Sep)</option>
                   			<option value = "10">24 (Oct)</option>
                   			<option value = "11">25 (Nov)</option>
                   			<option value = "12">26 (Dec)</option>
                        </select>
            	      </div>
                  <label class="exp_date" for="Exp_Date">Exp Date</label>
            	    </div>
            	  </div>
            	<div class="sec_num">
              <div>
				        <input  type="text" name="ccv" value="" id="ccv" placeholder="123" data-trigger="change" data-validation-minlength="3" data-type="name" data-required="true" data-error-message="Enter Your Card Security Code"/><label for="ccv">Security Code</label>
				      </div>
				      </div>
				      <div class="right">
				<div class="accepted">
					<span><img src="img/Z5HVIOt.png"></span>
					<span><img src="img/Le0Vvgx.png"></span>
					<span><img src="img/D2eQTim.png"></span>
					<span><img src="img/Pu4e7AT.png"></span>
					<span><img src="img/ewMjaHv.png"></span>
					<span><img src="img/3LmmFFV.png"></span>
				</div>
				<div class="secured">
					<img class="lock" src="img/lock.png">
					<p class="security info">What, well you mean like a date? Doc? Am I to understand you're still hanging around with Doctor Emmett Brown, McFly? Tardy slip for you, Miss Parker. And one for you McFly I believe that makes four in a row.</p>
				</div>
			</div>
			<input type="submit" value="Continue" class="continue" >
			      </form>
			</div>
			
			
 		</div>
 	</div>

</body>
</html>