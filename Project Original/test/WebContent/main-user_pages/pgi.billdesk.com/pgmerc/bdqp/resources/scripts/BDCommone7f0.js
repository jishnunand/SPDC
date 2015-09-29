document.onmousedown = rightclickD; function rightclickD(e) { e = e||event; if (e.button == 2) { alert('Disable....'); return false; } }
if (typeof console == "undefined") { this.console = {log: function() {}}; }		// console.log error fixed for IE browser
var resPath = 'https://pgi.billdesk.com/pgmerc/bdqp/resources/';
var url = location.host; var baseURL = url.split('.');


$(document).ready( function() {
	$('.container').find('input[type=text] , input[type=password]').prop('value','');
	blockName = 'tab2'; BDPG.GenerateCardForm();  BDPG.AllowStoreCard(); $('.emiSection').hide();
	$('#AuthUser').hide(); $('button').attr('disabled', false).removeClass( 'disabled' );
	$('#qpTabAnchor , #qpPopupAnchor').hide(); $('#ExitisingUserSection input[id=cvv2]').remove();
	if ( $(window).width() <= 640) { $(".row-offcanvas-left").addClass('active relative')}
	if(isSICCAllowed) { BDPG.AllowSICCConfig() }
	
	/**** IFRAME Merchant Code goes here ****/
	if (top !== self) { var cssURL = '../pgmerc/bdqp/resources/style/embed.css'; 	
		var $head = $("head"); $head.append($("<link/>",{ rel: "stylesheet", href: cssURL, type: "text/css" }));
		$(".row-offcanvas-left").removeClass('active relative')
	}
	
	/**** CSMSG Merchant Integration goes here ****/
	if (isCsMsgMerc == "Y") { var scURL = resPath+'scripts/bd-storecard.js'; 	
		var $head = $("head"); $head.append($("<script/>",{ src: scURL }));
		//$('ul.tabs').prepend('<li id="qpTabAnchor"> <a data-value="QP-QPDIRECT" href="#tab1"><i class="fa fa-qp fa-fw">&nbsp;</i><span>QuickPay</span> </a></li>');
		//$('aside.right-side').prepend('<div id="tab1" class="tab_content"><div class="QPContent"></div></div>');
		$('ul.tabs li#qpTabAnchor, aside div#tab1').show();
		
		
		$("ul.tabs li").removeClass("active"); 	$("div.tab_content").removeClass("active bd-tabs-active").hide();
		$("ul.tabs li:first").eq(0).addClass("active").show(); 	$("div.tab_content").eq(0).addClass("active bd-tabs-active").show();
	}
});


//$(window).resize(function(){ if ( $(window).width() <= 640) { $(".row-offcanvas-left").addClass('active relative'); }  });

// Function to validate dropdown selection and split bankid and Itemcode
var BDPG			= {};
var CardObj 		= "";
var AjXRequestURL  	= "https://"+baseURL[0]+".billdesk.com/bdcs/BDCSPaymentOption";
var MsgSrc 			= $('input[name=msg]').val();
var RequestDataURL	= "";
/*************************************************************************\
  validateBDPGPayment(form1)
  function called when user click the "Submit" button.
\*************************************************************************/
function validateBDPGPayment() {
var regAmount = RegExp("^([1-9]{1}[0-9]{0,7}|[1-9]{1}[0-9]{0,7}\\.[0-9]{2})$");
var regName = RegExp("^[a-zA-Z. ]{3,50}$");
var regEmail = RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$");
var regMobile = new RegExp("^[0-9]{10}$");
var regCvv = RegExp("^[0-9]{3,4}$");

if(document.form1.txtBankID.value == "" || document.form1.txtBankID.value == "0" || document.form1.txtItemCode.value == "OTHER" || document.form1.txtItemCode.value == "CARD" ) { alert('Please select your payment option'); return false;  }

	var blockName = "CardForm";													// Get Elements of Credit Card Section
	cardNumber 	= $('input[name=cnumber]').val();
	cardName  	= $('input[name=cname2]').val();
	setCardType	= $('input[name=cardType]').val(); 
	cvvNo  		= $('input[name$=cvv2]').val();
	cardMonth 	= $('#expmon').val();
	cardYear  	= $('#expyr').val();


	if($('#cnumber').is(':visible') && cardNumber !== "") { cardNumber = cardNumber.split("-").join(""); }
	// Quick Pay tab Validation
	if(document.form1.txtItemCode.value.substring(0,3) == "QP-") {
		if (cbxValue == "CC" || cbxValue == "DC" || cbxValue == "AX" || cbxValue.substring(0,3) == "FX-") { // Credit Card Case
			if ( $('#'+cbxName).val() == "" || !regCvv.test($('input[id$='+cbxName+']').val())) { 
				alert('Enter the last 3/4 digits as printed on your card.');
				$('input[id^='+cbxName+']').focus(); 
				return false; 
			}
				var cvv2store = $('input[id$='+cbxName+']').val();
				document.form1.paymentid.value=document.form1.paymentid.value; 
				document.form1.txtBankID.value="CARD";
				$('input[id=cvv2]').val(cvv2store);

				if (cbxValue == "AX") { document.form1.txtBankID.value="FX-"+AmExBKID; }
				document.form1.action="https://www.billdesk.com/pgidsk/PGICommonGateway"; 
				if (isCsMsgMerc == "Y") { document.form1.txtBankID.value = "NA"; document.form1.reqid.value="BDCR0001" } else { document.form1.reqid.value="BDCR0002" }
		}
		if (cbxValue == "NB") { // Internet Banking
				document.form1.txtBankID.value=document.form1.txtBankID.value; 
				document.form1.action="https://www.billdesk.com/pgidsk/PGIMerchantRequestHandler"; 
		}
		
		// Disabled Bank check code here
		BDPG.alertDisabledBankInfoMessage(); var tmpBankid = document.form1.txtBankID.value;
		for(var tmpBankid in disabledBankArr){	
			var DBank=disabledBankArr[tmpBankid];
			if (document.form1.txtBankID.value.match(DBank))	{ 
				var disabledBankID = document.form1.txtBankID.value.match(DBank);
				alert( $( "span[data-bankid="+disabledBankID+"]").attr('data-desc') ); 
				return false; 
			}
		} // Disabled Bank ends above 
		
		if (isCsMsgMerc == "Y") { document.form1.msg.value=document.form1.csmsg.value; } else { document.form1.msg.value=document.form1.msg.value; }
		
		document.form1.txtItemCode.value=document.form1.txtItemCode.value.split('-')[1]; 
		
		if (cbxValue == "DC") { // SBI and Citi Debit Card check
			if (cbxIssuer.toLowerCase().match(/sbi/g) == "sbi") { document.form1.txtBankID.value="FX-SMP"; document.form1.txtItemCode.value="OD"+qpProdId;  }
			if (cbxIssuer.toLowerCase().match(/citi/g) == "citi") { document.form1.txtBankID.value="FX-CMP"; document.form1.txtItemCode.value="OD"+qpProdId;  }
		}
		$('#cvvBtn, #bankBtn').button('loading'); document.form1.target = "_parent"; document.form1.method = "post";
		document.form1.submit();
	} // Quick Pay tab Validation Ends here
	
	
	// Credit Card tab Validation
	else if(document.form1.txtBankID.value== "CARD" || document.form1.txtBankID.value== "SMP" || document.form1.txtBankID.value.substring(0,3)== "FX-") {
			if($('input#cnumber').val() === "") { alert('Card number cannot be blank'); $('input#cnumber').focus(); return false; }
			else {	BDPG.validateCard(cardNumber, setCardType, cardMonth, cardYear, cvvNo, cardName); return false; }
		} // Credit Card validation ends here
		
		
	// Internet Banking tab Validation
	else if(selectBoxId == "txtBankIDBK") {
		var check = $("#AcceptQuickPay").is(':checked');
		var isCsMsgCheck = $("#CsMsgStoreCrdDetails").is(':checked'); // CsMsg StoreCard Request Check
		
		if (check == true) {
				if ( viewCardStatus == 'N') {
					var blockName = $('#AuthUser');						// Get Elements of Credit Card Section
					$AuthUserinputs = blockName.find("input[name]");
					console.log('$AuthUserinputs '+$AuthUserinputs);
					userFname = $AuthUserinputs[2];	/*userLname = $AuthUserinputs[1];*/
					userEmail = $AuthUserinputs[0];	userMobile  = $AuthUserinputs[1]; var tBankid = 'CARD-DIRECT'; tBankid='CARD-'+qpProdId;
					//console.log('userFname '+userFname+ ' userLname '+userLname+ ' userEmail '+userEmail+ ' userMobile '+userMobile );
					
					if( !userEmail.value.match(regEmail)) 	{ alert("Please enter a valid Email ID"	); 	$('#txtUserEmail').focus();return false; }
					if( !userMobile.value.match(regMobile)) { alert("Please enter a valid mobile number."); $('#txtUserMobile').focus();return false; }
					if( !userFname.value.match(regName)) 	{ alert("Please enter a valid name"	); 	$('#txtUserFirstName').focus(); return false; }
					
					/*if( userLname.value.length == 0) { userLname.value = "NA"; }*/
					var userFname = userFname.value;  var userLname = "NA";  var userEmail = userEmail.value;  var userMobile =userMobile.value;
				}
				if ( viewCardStatus == 'Y') {
					var userEmail = viewEmailID; var userMobile = viewMobileNo;
					var userFname = viewUserFname; var userLname = "NA";
				}
		
				
				// Disabled Bank check code here
				BDPG.alertDisabledBankInfoMessage(); var tmpBankid = document.form1.txtBankID.value;
				for(var tmpBankid in disabledBankArr){	
					var DBank=disabledBankArr[tmpBankid];
					if (document.form1.txtBankID.value.match(DBank))	{ 
						var disabledBankID = document.form1.txtBankID.value.match(DBank);
						alert( $( "span[data-bankid="+disabledBankID+"]").attr('data-desc') ); 
						return false; 
					}
				} // Disabled Bank ends above 
				
				// Pass value to StoreCard here
				var tBankid = selectedBoxValue; var acttype = "NB"; var cardNumber = cardName = cardMonth = cardYear = "NA"; 
				BDPG.storeCard(userMobile, tBankid, userEmail, cardNumber, cardName, cardMonth, cardYear, acttype, userFname , userLname);
				return false;
			
		}
		if(isCsMsgCheck == true) { 
			cardNumber = "NA"; cardType  = ""; cardName = "NA"; cardMonth = "";	cardYear = ""; 
			BDCS.CsMsgStorecard(cardNumber, cardName, cardMonth, cardYear, "NB", selectedBoxValue); return false; }
		else {
		// Disabled Bank check code here
		BDPG.alertDisabledBankInfoMessage(); var tmpBankid = document.form1.txtBankID.value;
		for(var tmpBankid in disabledBankArr){	
			var DBank=disabledBankArr[tmpBankid];
			if (document.form1.txtBankID.value.match(DBank))	{ 
				var disabledBankID = document.form1.txtBankID.value.match(DBank);
				alert( $( "span[data-bankid="+disabledBankID+"]").attr('data-desc') ); 
				return false; 
			}
		} // Disabled Bank ends above 
		
		
		// Disabled Bank check code here
		BDPG.alertDisabledBankInfoMessage(); var tmpBankid = document.form1.txtBankID.value;
		for(var tmpBankid in disabledBankArr){	
			var DBank=disabledBankArr[tmpBankid];
			if (document.form1.txtBankID.value.match(DBank))	{ 
				var disabledBankID = document.form1.txtBankID.value.match(DBank);
				alert( $( "span[data-bankid="+disabledBankID+"]").attr('data-desc') ); 
				return false; 
			}
		} // Disabled Bank ends above 
		
		
		document.form1.msg.value=document.form1.msg.value; 
		document.form1.txtBankID.value=document.form1.txtBankID.value; document.form1.txtItemCode.value=document.form1.txtItemCode.value; 
		document.form1.reqid.value="cc_processall"; document.form1.target = "_parent";
		document.form1.method = "post"; 
		document.form1.action="https://www.billdesk.com/pgidsk/PGIMerchantRequestHandler";
		$('#proceedForm').button('loading');
		document.form1.submit();
	 	} 
	}
	
	// Network Wallet tab Validation
	else if(selectBoxId == "txtBankIDNW" && document.form1.txtBankID.value== "MPC") {
			RequestDataURL = "https://www.billdesk.com/pgidsk/PGIDirectRequestHandler";
			BDPG.getFormRequestData(document.form1.msg.value,document.form1.txtBankID.value, document.form1.txtItemCode.value,"NA","NA","NA","NA","NA","NA",RequestDataURL);
	}
	
	// EMI tab Validation
	else if(selectBoxId == "txtBankIDEMI" && document.form1.txtItemCode.value == "EMI") { 
		alert('Please Choose the plan (3, 6, 9 or 12-month) of your choice.');
		return false;
	}
	
	else {
		
	// Disabled Bank check code here
	BDPG.alertDisabledBankInfoMessage(); var tmpBankid = document.form1.txtBankID.value;
	for(var tmpBankid in disabledBankArr){	
		var DBank=disabledBankArr[tmpBankid];
		if (document.form1.txtBankID.value.match(DBank))	{ 
			var disabledBankID = document.form1.txtBankID.value.match(DBank);
			alert( $( "span[data-bankid="+disabledBankID+"]").attr('data-desc') ); 
			return false; 
		}
	} // Disabled Bank ends above 
		
		 
	$('#CardForm').hide();	document.form1.msg.value=document.form1.msg.value; document.form1.txtBankID.value=document.form1.txtBankID.value; 
	document.form1.txtItemCode.value=document.form1.txtItemCode.value;$('#proceedForm').button('loading'); document.form1.target = "_parent"; document.form1.method = "post"; document.form1.action="https://www.billdesk.com/pgidsk/PGIMerchantRequestHandler"; 
	document.form1.submit();
	}
return false;
}


/*************************************************************************\
  select box for payment methods(form1)
  function called when user change/update select box.
\*************************************************************************/
var getTmpBankId, selectBoxId,  selectedBoxValue, blockName  = ""
var TabBlock = $('#main-container').find('div.tab_content');								// capture tab content block element
var allselectBlock = $(TabBlock).find('select[id^="txtBankID"]');							// get all select box element starting with id txtBankID
/*var AEC="<h4>American Express ezeClick</h4> Notification messages are an important part of the user experience. All notification alert message will appear every time the user perform important tasks. Based on BANK ID such info messages will allow you to show with ease, and class. ";*/
var UTI="<h4>Axis NetBanking</h4> Please keep your mobile phone handy, as the bank will send the 2nd factor authentication to your registered mobile number with the bank to authenticate the payment. ";
var CIT="<h4>Citibank Debit Card</h4> Please click on Pay Now to be redirected to the Gateway where you need to enter your Citibank debit card details. ";
var HDF="<h4>HDFC NetBanking</h4> Please ensure that you have registered for the Third Party Transfer (TPT) and Remote Secure Access (RSA) services with HDFC Bank for using the NetBanking service to make merchant payments. ";
var SBI="<h4>State Bank of India NetBanking</h4> Please keep your mobile phone handy, as the bank will send the 2nd factor authentication to your registered mobile number with the bank to authenticate the payment. ";

$(allselectBlock).on('change', function() {
	$('#cardfm, .infoMessage, #checkBoxSection').remove();
	var TabContentSection = $(this).closest('div.tab_content').attr('id');
	var DebitTabContentSection = $(this).closest('div.panel-body').attr('id');
	selectBoxId = this.id;																	// get select box id
	selectedBoxValue = $(this).find(":selected").val().split('-')[0];						// get selected option value
	document.form1.txtBankID.value = $(this).find(":selected").val().split('-')[0]			// set bankid
	document.form1.txtItemCode.value = $(this).find(":selected").val().split('-')[1]		// set product id


	if(selectBoxId == "txtBankIDDC" && ( selectedBoxValue == "CARD" || selectedBoxValue == "SPD" || selectedBoxValue == "SMP")) { 
		if(TabContentSection == "tab3") { blockName = DebitTabContentSection };
		if(TabContentSection == "tab4") { blockName = TabContentSection };
		BDPG.GenerateCardForm(); BDPG.AllowStoreCard();
		return false; 
	}
	if(selectBoxId == "txtBankIDBK") {
			if(selectedBoxValue == "UTI" ) { BDPG.showInfoMessage(TabContentSection,UTI);  }
			if(selectedBoxValue == "CIT" ) { BDPG.showInfoMessage(TabContentSection,CIT);  }
			if(selectedBoxValue == "HDF" ) { BDPG.showInfoMessage(TabContentSection,HDF);  }
			if(selectedBoxValue == "SBI" ) { BDPG.showInfoMessage(TabContentSection,SBI);  }

			
			 BDPG.AllowStoreCard(); 
			return false; 
		}
	if(selectBoxId == "txtBankIDEMI") {
		$('.emiSection').remove(); $('#'+TabContentSection).append("<div class='emiSection'><h4>EMI Plans</h4></div>");
		BDPG.EvaluateEMI(selectedBoxValue);
	}
});


$("#tab2 ul.nav-pills li").click(function(){ 
	selectBoxId = $(this).find('a').attr("data-value").split("-")[0];
	selectedBoxValue = $(this).find('a').attr("data-value").split('-')[1];	
	document.form1.txtBankID.value = selectBoxId			// set bankid
	document.form1.txtItemCode.value = selectedBoxValue		// set product id
	
	if(selectBoxId == "AEC") { $('#checkBoxSection , #checkBoxSICCSection').remove(); }

	else { BDPG.AllowStoreCard(); if(isSICCAllowed) { BDPG.AllowSICCConfig() } }
	
});

$('ul.sidebar-menu li').on('click', function() { 
	$('#cardfm, #checkBoxSection, #AuthUser, .infoMessage, #ExitisingUserSection input[id=cvv2], .emiSection').remove();
	$(this).find('select[id^="txtBankID"]').val('0');
	$(".tab_content").find('select[id^="txtBankID"]').prop('value','0');
	
	BDPG.showSec('proceedForm');	BDPG.showSec('goBack'); $('.box-footer, .parametersection').show();
	
	selectBoxId = $(this).find("a").attr("data-value").split("-")[0];
	selectedBoxValue = $(this).find("a").attr("data-value").split('-')[1];						// get selected option value
	var TabContentSection = $(this).find("a").attr("href").replace(/^#/, '');
	
	document.form1.txtBankID.value = selectBoxId			// set bankid
	document.form1.txtItemCode.value = selectedBoxValue		// set product id
	blockName = $(this).find("a").attr("href").replace(/^#/, '');
	
	if(blockName == "tab1") { document.form1.paymentMode.value="QUICKPAY"; BDPG.hideSec('proceedForm'); BDPG.hideSec('goBack'); return false; }
	if(blockName == "tab2") { document.form1.paymentMode.value="CREDIT"; }
	if(blockName == "tab3") { document.form1.paymentMode.value="DEBIT"; }
	if(blockName == "tab4") { document.form1.paymentMode.value="ATMDEBIT"; }
	if(blockName == "tab5") { document.form1.paymentMode.value="NETBANKING"; }
	if(blockName == "tab6") { document.form1.paymentMode.value="CASHCARD"; }
	if(blockName == "tab7") { document.form1.paymentMode.value="NWALLET"; }
	if(blockName == "tab8") { document.form1.paymentMode.value="IMPS"; }
	if(blockName == "tab9") { document.form1.paymentMode.value="MOBPAYMENT"; }
	if(blockName == "tab10") { document.form1.paymentMode.value="ECHALLAN"; }
	if(blockName == "tab11") { document.form1.paymentMode.value="EMI"; }
	
	
	if(selectBoxId == "QP") { BDPG.hideSec('proceedForm'); BDPG.hideSec('goBack'); $('#ExitisingUserSection input[id=cvv2]').remove(); $('#ExitisingUserSection').append('<input type="hidden" name="cvv2" id="cvv2" value="">');  return false; }
	if(selectBoxId == "txtBankIDCC") {
		if(selectedBoxValue == "CARD") {
			document.form1.txtBankID.value = "CARD"; document.form1.txtItemCode.value = qpProdId;
			BDPG.GenerateCardForm();   BDPG.AllowStoreCard(); return false; 
		}
		//if(selectedBoxValue == "AEC" ) { BDPG.showInfoMessage(TabContentSection,AEC);  return false; }
		return false;
	}
	
	else if(selectBoxId == "txtBankIDDC" && ( selectedBoxValue == "CARD"  || selectedBoxValue == "SMP")) {
		$('#ExitisingUserSection input[id=cvv2]').remove();
	document.form1.txtBankID.value = "CARD"; document.form1.txtItemCode.value = qpProdId;	
	var DebitTabContentSection = $(this).closest('div.panel-body').attr('id');
	blockName = DebitTabContentSection;
	BDPG.GenerateCardForm(); BDPG.AllowStoreCard(); return false; }
	
	else if(selectBoxId == "txtBankIDBK") {
			if(selectedBoxValue == "UTI" ) { BDPG.showInfoMessage(TabContentSection,UTI);  }
			if(selectedBoxValue == "CIT" ) { BDPG.showInfoMessage(TabContentSection,CIT);  }
			if(selectedBoxValue == "HDF" ) { BDPG.showInfoMessage(TabContentSection,HDF);  }
			if(selectedBoxValue == "SBI" ) { BDPG.showInfoMessage(TabContentSection,SBI);  }

			
			 BDPG.AllowStoreCard(); 
			return false; 
		}
	// International Wallet tab Validation
	else if(selectBoxId == "txtBankIDNW") { 
		$.getScript( "../pgmerc/bdqp/resources/scripts/lib/MasterPass.client.js" )
			.done(function( script, textStatus ) {
			console.log( textStatus );
		})
		.fail(function( jqxhr, settings, exception ) {
			$( "div.log" ).text( "Triggered ajaxError handler." );
		});
	}
	else {
		$('#cardfm, #checkBoxSection, #AuthUser, #infoMessage').remove(); 
		$('#ExitisingUserSection input[id=cvv2]').remove();
	}
	return false;
});







/*************************************************************************\
  Validate Card Type and Card Length
  function called when users enters card number into "card number" field.
\*************************************************************************/
$(document).on("keyup", "input#cnumber",function () { BDPG.CardType(this.value); });
BDPG.CardType = function(n){
var n =  $('input#cnumber').val();
Cards	={	amex:/^(34|37)/, visa:/^4/, master:/^5[1-5]/, maestro:/^(50|63|66|5[6-8]|6[8-9]|600[0-9]|6010|601[2-9]|60[2-9]|61|620|621|6220|6221[0-1])/, 
			maestro16d:/^(508125|508126|508159|508192|508227|504809)/, diners:/^(30|36|38)/, misc:/^(0)/ }
setLen = { 	amex:15,visa:16,master:16,maestro:19,maestro16d:16,diners:14 }

			var blockName = "CardForm";											// Get Elements of Credit Card Section
			$inputs = $('#'+blockName).find("input[id]");						// Get all Input Elements			
				$selects = $('#'+blockName).find("select");						// Get all select Elements
				cardNumber 	= $('#cnumber').val();
				cardName  	= $('#cname2').attr('name');
				cvvNo  		= $('input[id$=cvv2]');
				cardMonth 	= $('#expmon').val();
				cardYear  	= $('#expyr').val();
				
					
	// Function to Validation Cards Number and get Cards Type 
  	var tmplen=n.split("-").join("").substring(0,6);							// tmplen stores first 6 digit of Cards number
	var setCardNumber=n.split("-").join("");


	if(tmplen.length>=6){	
	
	// Get Cards Type in Value (r) 
	var P = tmplen;	var T= "";													// first 6 digit of card number store in P to match with Regex in CARD
	for(var tmplen in Cards){	var Q=Cards[tmplen];							// get Card Label (visa,master...)
		if (P.match(Q))	{ 
		var T=tmplen; $('#cardTypeid').addClass(tmplen);
		$('input[name=cardType]').val(T);
		if(tmplen =="amex") {
			$('#checkBoxSICCSection').remove(); 
			if(!isCCAXAllowed) { $('input#cnumber').parent().addClass('has-error'); alert('Payment thru American Express Cards are not supported.'); return false}
			else {

				$('input[id$=cvv2]').attr('maxlength','4'); $('#cvvcardtype').addClass('amexcvv'); 
				$('div#cardfm div.crd-details div.cvvcol label.cvv').html('4 Digit batch code')
			}
			}
		} // condition to match regex and get the card type.
	} 
	
	// Get Card Length in Value (L) 
		var getCardType = T;
		for(var T in setLen) { var matchLen=setLen[T]; var ValidLen = getCardType.match(T);
			if(getCardType.match(T)){var L=matchLen; $('#cnumber').attr('maxlength',matchLen+3); $('#AuthUser').hide();}
		} 
	}
	
	if( getCardType == "" ) 	{ alert("Sorry! This is not a valid card number.");	return false; }
	if (getCardType == "maestro") { $('input#cnumber').attr('maxlength','23'); }
	
	// visa and Master
	if(setCardNumber.length===L) {
		if( !mod10( setCardNumber ) ) 	{ alert("Sorry! This is not a valid card number.");	return false; } 
		if (getCardType == "amex")  	{ BDPG.generateAmExTble(); appended = true; }
		if ((getCardType == "maestro" || getCardType == "maestro16d") && document.form1.paymentMode.value == 'DEBIT' )  {
				$('.expcol, .cvvcol').hide(); $("#expmon").prop('value','12'); 
				$("#expyr").prop('value','2060'); $("input[id=cvv2]").prop('value','111'); 
		}
		if ((getCardType == "maestro" || getCardType == "maestro16d") && document.form1.paymentMode.value != 'DEBIT')  { 
			alert('Sorry! This is not a valid card number.'); return false;
		}
		return {
			setCardType: 	getCardType,
			setCardNumber: 	setCardNumber
		}
	}

	else {
		if(isSICCAllowed) { BDPG.AllowSICCConfig() }
		$('input#cnumber').parent().removeClass('has-error');
		$('.cardHolder, .AmExSection').remove(); appended = false;
		$('#cvv2').attr('maxlength','3'); $('.expcol, .cvvcol').show();
		$("#expmon").prop('value','0'); $("#expyr").prop('value','0'); $("input[id$=cvv2]").prop('value','');
		$('#cardTypeid').removeClass('visa master amex maestro maestro16d diners'); $('#cvvcardtype').removeClass('amexcvv'); 
		$('div#cardfm div.crd-details div.cvvcol label.cvv').html('CVV/ CVC')	
		$('input[name=cardType]').val(""); 
		return false;
	}
	return false;
};







/*************************************************************************\
  Validate Card Number and relevant details
  function called on cnumber mod10 is true.
\*************************************************************************/
var txtcname = "";
BDPG.validateCard = function(cardNumber, cardType, cardMonth, cardYear, cardCvv, cardName, userFname , userLname) {

var regName = RegExp("^[a-zA-Z. ]{3,70}$");
var regCvv = RegExp("^[0-9]{3,4}$");
var regEmail = RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$");
var regMobile = new RegExp("^[0-9]{10}$");
var getCvvMaxLen = $('input[name=cvv2]').attr('maxlength');
var regStreetAdd = RegExp("^[A-Za-z0-9\\/\\#\\-\\_\\()\\s\\.\\,\\:]{3,100}$");
var regPinCode = RegExp("^[a-zA-Z0-9]{3,9}$");

	if( !mod10( cardNumber ) ) 	{ alert("Sorry! This is not a valid card number.");	return false; } 
	if( cardName == "" || !cardName.match(regName)) { alert("Please enter your name specified on the card."); $('#cname2').focus(); return false; }
	
	// Avoid validation for Maestro cards
	if (cardType != 'maestro'){
		if( cardMonth == '0' ) { alert("Please select a valid month."); $('#expmon').focus(); return false;  }
		if( cardYear == '0' ) {	alert("Please select a valid year.");	$('#expyr').focus(); return false;  }
		if( BDPG.expired(cardMonth, cardYear) ) { alert("Sorry! The expiry date that you have entered is invalid."); $('#expmon').focus();	return false; }
		if( cardCvv == "" ||  !regCvv.test(cardCvv) || cardCvv.length != getCvvMaxLen) { alert("Enter the last 3/4 digits as printed on your card."); 
			$('input[id$=cvv2]').focus();	return false; }
	}
	
	// Amex Card Validation 
	if (cardType == "amex") {
		
		var blockName = $('#AmExTble');						// Get Elements of Credit Card Section
			$AmExUserinputs = blockName.find("input[name]");
			AmexUserEmail = document.form1.AmExEmail;	AmeXUserMobile  = document.form1.AmExMobile; var tBankid = 'FX-'+AmExBKID;
			document.form1.txtBankID.value = "FX-"+AmExBKID;

			for (var i=0; i < document.form1.citizen.length; i++){ if (document.form1.citizen[i].checked) { var citizen_val = document.form1.citizen[i].value; } }
			
			if (citizen_val == "yes") { 
				if( !AmexUserEmail.value.match(regEmail)) { alert("Please enter a valid amex email id"	); 	$('#AmExEmail').focus(); return false; }
				if( !AmeXUserMobile.value.match(regMobile)) { alert("Please enter a valid amex mobile number."); $('#AmExMobile').focus();return false; }
				
				var txtfname ="NA"; var txtmname ="NA"; var txtlname ="NA"; var txtaddress ="NA"; 
				var txtcity ="NA";  var txtstate ="NA"; var txtzip ="NA"; var txtcountry ="IN"; var ipaddress = "NA";
				var email = document.form1.AmExEmail.value; var mobile = document.form1.AmExMobile.value; 
			}
			
			if (citizen_val == "no") {
				if (!document.form1.txtfname.value.match(regName)) { alert("Please enter a valid first name as per your billing statement. (e.g. Mathew)"); 	
				document.form1.txtfname.focus(); return false; }

			if (!document.form1.txtmname.value.length>1) { 
				if (!document.form1.txtmname.value.match(regName)) { alert("Please enter a valid middle name as per your billing statement. (e.g. Mahendra)"); 	
				document.form1.txtmname.focus(); return false; }
			}
				
			if (!document.form1.txtlname.value.match(regName)) { alert("Please enter a valid last name as per your billing statement. (e.g. Mathur)"); 	
				document.form1.txtlname.focus(); return false; }
				
			if (!document.form1.txtaddress.value.match(regStreetAdd)) { alert("Please enter a valid address as per your billing statement. (e.g. D303, Akash CHS, Andheri)"); document.form1.txtaddress.focus(); return false; }
			
			if (!document.form1.txtcity.value.match(regName)) { alert("Please enter a valid city as per your billing statement.(e.g. Mumbai)"); 	
				document.form1.txtcity.focus(); return false; }
			
			if (!document.form1.txtstate.value.match(regName)) { alert("Please enter a valid state as per your billing statement. (e.g. Maharashtra)"); 	
				document.form1.txtstate.focus(); return false; }
			
			if (!document.form1.txtzip.value.match(regPinCode)) { alert("Please enter a valid pin code as per your billing statement. (e.g. 400031)"); 	
				document.form1.txtzip.focus(); return false; }
				
			if (document.form1.txtcountry.value == "0") { alert("Please select a valid Country (eg India)"); 	
				document.form1.txtcountry.focus(); return false; }	
			
			if( !AmexUserEmail.value.match(regEmail)) { alert("Please enter a valid amex email id"	); 	$('#AmExEmail').focus(); return false; }
			if( !AmeXUserMobile.value.match(regMobile)) { alert("Please enter a valid amex mobile number."); $('#AmExMobile').focus();return false; }
			 
			if(document.form1.txtmname.value.length == 0){document.form1.txtmname.value="NA";} 
			var txtfname = document.form1.txtfname.value; var txtmname = document.form1.txtmname.value; var txtlname = document.form1.txtlname.value;
			var txtaddress = document.form1.txtaddress.value; var txtcity = document.form1.txtcity.value; var txtstate = document.form1.txtstate.value;
			var txtzip = document.form1.txtzip.value; var txtcountry = document.form1.txtcountry.value; var email = document.form1.AmExEmail.value;
			var mobile = document.form1.AmExMobile.value; var ipaddress = "NA"
			/*var txtcname = fname+"~"+mname+"~"+lname+"~"+address+"~"+city+"~"+state+"~"+zip+"~"+country+"~"+email+"~"+mobile+"~"+ipaddress;
			document.form1.cname2.value = txtcname;*/
				
			}
		
		txtcname = document.form1.cname2.value+'~'+txtfname+"~"+txtmname+"~"+txtlname+"~"+txtaddress+"~"+txtcity+"~"+txtstate+"~"+txtzip+"~"+txtcountry+"~"+email+"~"+mobile+"~"+ipaddress;
		//alert(document.form1.cname2.value);
		//return false; 
	}
	
	var check = $("#AcceptQuickPay").is(':checked');
	if (check == true) {
			if ( viewCardStatus == 'N') {
				var blockName = $('#AuthUser');						// Get Elements of Credit Card Section
				$AuthUserinputs = blockName.find("input[name]");
					userFname = $AuthUserinputs[2];	/*userLname = $AuthUserinputs[1];*/
					userEmail = $AuthUserinputs[0];	userMobile  = $AuthUserinputs[1]; var tBankid = 'CARD-DIRECT'; tBankid = 'CARD-'+qpProdId;
				
				
					if( !userEmail.value.match(regEmail)) 	{ alert("Please enter a valid Email ID"	); 	$('#txtUserEmail').focus();return false; }
					if( !userMobile.value.match(regMobile)) { alert("Please enter a valid mobile number."); $('#txtUserMobile').focus();return false; }
					if( !userFname.value.match(regName)) 	{ alert("Please enter your first name"	); 	$('#txtUserFirstName').focus(); return false; }
					
					/*if( userLname.value.length == 0) { userLname.value = "NA"; }*/
					var userFname = userFname.value;  var userLname = "NA";  var userEmail = userEmail.value;  var userMobile =userMobile.value;
			}
			if ( viewCardStatus == 'Y') {
				var userEmail = viewEmailID; var userMobile = viewMobileNo;
				var userFname = viewUserFname; var userLname = "NA";
			}
			
			// Pass value to StoreCard here
			var acttype = "CC"; var tBankid = "NA"; 
			if(document.form1.txtBankID.value == "FX-"+AmExBKID) { cardName = txtcname; }
			BDPG.storeCard(userMobile, tBankid, userEmail, cardNumber, cardName, cardMonth, cardYear, acttype, userFname , userLname);
			return false;
		}
	
	// CsMsg StoreCard Request Check
	var isCsMsgCheck = $("#CsMsgStoreCrdDetails").is(':checked');
	if(isCsMsgCheck == true) { acttype = "CC"; BDCS.CsMsgStorecard(cardNumber, cardName, cardMonth, cardYear, acttype, 'NA'); return false; }
	
	else {
		document.form1.cnumber.value =  cardNumber; document.form1.cardType.value = cardType; 
		document.form1.cname2.value =   cardName; document.form1.expmon.value =  cardMonth;
		document.form1.expyr.value =  cardYear; document.form1.cvv2.value =  cardCvv;
		
		if(document.form1.txtBankID.value == "FX-"+AmExBKID) { document.form1.cname2.value = txtcname };
		if(document.form1.txtBankID.value == "SMP") { document.form1.txtBankID.value = "FX-SMP"; };
		if(document.form1.txtBankID.value == "AM2") { document.form1.txtBankID.value = "FX-"+AmExBKID; };
		document.form1.txtBankID.value=document.form1.txtBankID.value;	document.form1.txtItemCode.value=document.form1.txtItemCode.value; 	
		document.form1.msg.value=document.form1.msg.value; document.form1.reqid.value="cc_processall"; document.form1.target = "_parent";
		document.form1.method = "post"; document.form1.action="https://www.billdesk.com/pgidsk/PGICommonGateway";
		document.form1.submit();
	}}







/*************************************************************************\
  BillDesk StoreCard(form1)
  function called when checkbox for storecard is true .
\*************************************************************************/

/* AddCard New Card : CS10014 							*\
\*----------------------------------------------------- */

BDPG.storeCard = function(userMobile, tBankid, userEmail, cardNumber, cardName, cardMonth, cardYear, acttype, userFirstName , userLastName) { 
cardObj = {msgcode:"CS10014",acttype:acttype,crdname:cardName,msg:MsgSrc,mobno:userMobile,txtBankID:tBankid,emailid:userEmail,ccno:cardNumber,expmonth:cardMonth,expyear:cardYear,userFname:userFirstName,userLname:userLastName};
	var request = $.ajax({
		url: AjXRequestURL, type: "POST", data:cardObj, dataType : 'text', async:true
	})
	$('#main-container').prepend('<div class="pleasewait"></div>');
	request.done(function(data) {
		var getDataEvaluate = eval ("("+data+")");
		if (acttype == "CC") {
			document.form1.cnumber.value =  cardNumber; document.form1.cardType.value = document.form1.cardType.value; 
			document.form1.cname2.value =   cardName; document.form1.expmon.value =  cardMonth;
			if(document.form1.txtBankID.value == "FX-"+AmExBKID) { document.form1.cname2.value = txtcname; };
			document.form1.expyr.value =  cardYear; document.form1.cvv2.value =  document.form1.cvv2.value; document.form1.reqid.value="BDCR0002"; 
			document.form1.reqid.value="cc_processall"; document.form1.txtBankID.value=document.form1.txtBankID.value;	
			if(document.form1.txtBankID.value == "SMP") { document.form1.txtBankID.value = "FX-SMP"; };
			if(document.form1.txtBankID.value == "AM2") { document.form1.txtBankID.value = "FX-"+AmExBKID; };
			document.form1.txtItemCode.value=document.form1.txtItemCode.value; 	document.form1.paymentid.value="NA";
			$('#proceedForm').button('loading');
			document.form1.action="https://www.billdesk.com/pgidsk/PGICommonGateway";
		}
		if (acttype == "NB") {
			document.form1.txtBankID.value=document.form1.txtBankID.value;	document.form1.txtItemCode.value=document.form1.txtItemCode.value; 
			$('#proceedForm').button('loading');
			document.form1.action="https://www.billdesk.com/pgidsk/PGIMerchantRequestHandler";
		}
		document.form1.msg.value=MsgSrc; document.form1.target = "_parent"; document.form1.method = "post"; document.form1.submit();
		
		
	});
	request.fail(function(data) { $('.pleasewait').remove(); console.log( "Request failed: "); });
}	// AddCard New Card ends here





/* ViewCard all prevously added Card : CS10010			*\
\*----------------------------------------------------- */
$( window ).load(function() {
	if(isQPAllowed) { BDPG.viewCard();  BDPG.hideSec('proceedForm'); } 
	if(!isCCDCAllowed) { document.form1.txtBankID.value = "";	document.form1.txtItemCode.value = ""; BDPG.showSec('proceedForm');}
	else { 
		BDPG.showSec('proceedForm');
		$("ul.tabs li:first").eq(0).addClass("active").show(); 	$("div.tab_content").eq(0).addClass("active bd-tabs-active").show();  //Activate first tab
		document.form1.txtBankID.value = "CARD";	document.form1.txtItemCode.value = qpProdId;
	 } 
});											// window onload get card list

var viewCardStatus = "N", viewEmailID, viewMobileNo, viewUserFname, viewUserLname, viewCardErrDesc, CacheEmailVal = ""
BDPG.viewCard = function() {
var check = $("#AcceptQuickPay").is(':checked'); 
CardObj = {msgcode:"CS10010",acttype:"ALL",msg:MsgSrc};
	var request = $.ajax({
		url: AjXRequestURL, type: "POST", data:CardObj, cache : 'false', dataType : 'text',
		//beforeSend: function() { $('div#tab1').html('<span class="pleasewait"> Please wait...</span>');	}
	})
	request.done(function(data) {
		$('div.QPContent').html('').attr('id','');
		var getDataEvaluate = eval ("("+data+")");
		var getCardDataEvalutate = getDataEvaluate.account['card'];
		viewCardStatus = getDataEvaluate.status;
		
		viewCardErrDesc = getDataEvaluate.errordescription;
		CacheEmailVal =  getDataEvaluate.emailid;		if (CacheEmailVal == "NA") { CacheEmailVal = "" }
		$('input#useremail').val(CacheEmailVal);
		
	if(viewCardStatus == 'Y') {
		$(".tab_content, #proceedForm, #goBack").hide();
		if ( $(window).width() <= 599) { $('#qpLogin').hide(); }
		$('#qpTabAnchor').show();								// Show QuickPay
		$("ul.tabs li:first").eq(0).addClass("active").show(); //Activate first tab
		$("div.tab_content").eq(0).addClass("active bd-tabs-active").show();
		$('div.QPContent').html('').attr('id',''); BDPG.generateViewCardTble(data); $("div#pleasewait").remove();
		document.form1.txtBankID.value = "";	document.form1.txtItemCode.value = "";
		return false; 
	} // get display if card length greater than 0
	
	if(viewCardStatus == 'N' || viewCardStatus == 'M') {
		$('#qpPopupAnchor').show();
		$('#qpLogin').hide(); $("div#pleasewait").remove();
		if (CacheEmailVal == 'NA' || CacheEmailVal == '') {
			$('div.QPContent').html('').attr('id','loginsection'); 
			$("#tab2").find('select#txtBankIDCC').prop('value','CARD-'+qpProdId);
	
			BDPG.ShowLoginSection(); $(".tab_content").hide();
			$("ul.tabs li:first, div.tab_content").eq(0).removeClass('active bd-tabs-active');
			$("div.tab_content").eq(0).hide(); $("div.tab_content").eq(1).addClass("active bd-tabs-active").show();
			$("ul.tabs li").eq(1).addClass("active bd-tabs-active").show(); BDPG.showSec('proceedForm');
			$('ul.tabs span.otheroption').hide();
			document.form1.txtBankID.value = "CARD";	document.form1.txtItemCode.value = qpProdId;
		}
		if (viewCardStatus == 'M'  || CacheEmailVal != '' && CacheEmailVal != 'NA') {
			$('#checkBoxSection, #AuthUser').remove();
			$('div.QPContent').html('').attr('id','blankmsg');
			$('#blankmsg').delay(800).fadeIn(); 
			document.form1.txtBankID.value = "CARD";	document.form1.txtItemCode.value = qpProdId;
			$('#blankmsg').html('<div id="ExitisingUserSection"><div class="page-header"><h4>Welcome, <span>'+getDataEvaluate.userfname+'</span></h4></div><br clear="all"> <p class="text-justify">To add <b>'+getDataEvaluate.merchantname+'</b> account <b>'+getDataEvaluate.payauth+'</b> to QuickPay, please verify through a One Time Password (OTP)</p> <div id="loginsection"></div><br clear="all"><button id="SendOTP" data-loading-text="Sending request..." type="button" data-target="#bdQPModel" data-toggle="modal" class="btn col-xs-12 col-md-12 btn-lg btn-danger">Send OTP</button> <p class="addnewcard">+ <strong><a href="javascript:void(0)">Use a new card</a></strong> <a onclick="return cancelForm();" class="pull-right" style="display: block;">Cancel</a></p><p>+ Not <span>'+getDataEvaluate.userfname+'?</span> <strong><a onclick="BDPG.removeUserInfo()">Sign In with a different QuickPay account</a></strong></p> </div>');
			
			BDPG.ShowLoginSection();
			$('#innerlogin').find('.signup-box').addClass('ExistingUser');
			$('input#useremail').attr("type", "email").addClass('disabled').prop('disabled','disabled').val(CacheEmailVal);
			$('.ExistingUser').find('p.infomsg').html('to my registered email address <b>@'+getDataEvaluate.emailid.split('@')[1]+'</b> beginning with <b>'+getDataEvaluate.emailid.substring(0,3)+'</b> and mobile number ending <b>'+getDataEvaluate.mobile.substring(5,10)+'</b>');
			
		}
		return false;
	}
	});
	request.fail(function( data, textStatus ) {	 console.log( "viewCard : Request failed:" + textStatus); });
	request.error(function(jqXHR, exception)  {  
			 if (jqXHR.status === 0)  { $('#loginsection').hide(); $('.blankmsg').delay(800).fadeIn().addClass('error'); 
										$('.blankmsg').html("Please verify Network connection"); } 
		else if (jqXHR.status == 404) { $('#loginsection').hide(); $('.blankmsg').delay(800).fadeIn().addClass('error'); 
										$('.blankmsg').html("Requested page not found. [404]"); } 
		else if (jqXHR.status == 500) { $('#loginsection').hide(); $('.blankmsg').delay(800).fadeIn().addClass('error'); 
										$('.blankmsg').html("Internal Server Error [500]"); } 
		else if (exception === 'parsererror') 	{ alert('Requested JSON parse failed.'); } 
		else if (exception === 'timeout') 		{ alert('Time out error.');	} 
		else if (exception === 'abort') 		{ alert('Ajax request aborted.'); } 
		else 	{ alert('Uncaught Error.\n' + jqXHR.responseText);}
	});
} // ViewCard function ends here


/* Function to generate ViewCard table based on Ajax data for : CS10010			*\
\*----------------------------------------------------------------------------- */
BDPG.generateViewCardTble = function(data) {
viewCardStatus = 'Y';
var getDataEvaluate = eval ("("+data+")");
var getCardDataEvalutate = getDataEvaluate.account['card'];
var getBankDataEvalutate = getDataEvaluate.account['bank'];
viewEmailID = getDataEvaluate.emailid; viewMobileNo = getDataEvaluate.mobile;
viewUserFname = getDataEvaluate.userfname;	viewUserLname = getDataEvaluate.userlname; 
var CardLen = getDataEvaluate.account['card'].length;
var BankLen = getDataEvaluate.account['bank'].length;

if ( $(window).width() <= 599) { $('#qpLogin').hide(); }
$('ul.nav li.user-menu a.dropdown-toggle span').html('').append(getDataEvaluate.userfname+' <i class="caret"></i>');
$('ul.nav li.user-menu ul.dropdown-menu li.user-header p').html('').append(getDataEvaluate.userfname+' '+getDataEvaluate.userlname);

if(CardLen != "" || BankLen != "") { 
$('div.QPContent').html('').attr('id','ExitisingUserSection');
$('#ExitisingUserSection').append('<input type="hidden" name="cvv2" id="cvv2" value="">');
$("#ExitisingUserSection").append('<h4>Please select a payment method from your QuickPay account</h4><div id="quickpayList" class="list-group">')
	var numCols = 7;
	//var tCell = [];
	var tRow = getDataEvaluate.account['card'].length;
	var $table = $('</div>');
	var j=0;
	$.each(getCardDataEvalutate, function(i,item) {
		j++;
		var accounttype = getCardDataEvalutate[i].accounttype; var maxlength = "3";
		if(accounttype == "CC") 	{ accounttype = "Credit Card"; 	 maxlength = "3";}
		if(accounttype == "DC")		{ accounttype = "Debit Card";	 maxlength = "3";}
		if(accounttype == "NB")		{ accounttype = "Internet Banking"; }
		if(accounttype == "AX") 	{ accounttype = "Amex Card"; var custname = "---"; maxlength = "4";}
		
	if(!(i%tRow)) tRow = $('<li class="list-group-item">');
			tCell = '<a id="'+item.token+','+item.accounttype+',NA" title="cb'+j+','+item.issuer+'" onclick="BDPG.removeCard(this)" class="badge remove"><i class="fa fa-trash-o fa-fw"></i></a> <div class="card" id="'+item.token+'" data-subject="'+item.accounttype+'" data-name="cb'+j+'" data-level="'+item.accounttype+','+item.issuer+'" onclick="checkOnly(this)" data-target="#CVV"><h4 class="list-group-item-heading"><img src="../../../../pgmerc/pgimages/images/banklogo/'+item.cardnetwork.toLowerCase()+'.png"> '+item.issuer+' <span class="pull-right">'+accounttype+'</span></h4><div class="row"><div class="col-sm-12"><div class="row"><div class="col-xs-5 col-sm-5">'+item.customername+'</div><div class="col-xs-6 col-sm-4"><p class="list-group-item-text text-right text-muted">**** **** **** '+item.cardend+'<br>expires on '+item.expdate+'</p></div></div></div></div></div></li>';								
			$('#quickpayList').append(tRow.append(tCell));
		});
		
	$.each(getBankDataEvalutate, function(i,item) {
		j++
		var banklogo = getBankDataEvalutate[i].bankid.toLowerCase();
		
		if(!(i%tRow)) tRow = $('<li class="list-group-item">');
			tCell = '<a class="badge remove" id="NA,NB,'+item.bankid+'" title="cb'+j+','+item.name+'" onclick="BDPG.removeCard(this)"><i class="fa fa-trash-o fa-fw"></i></a><div class="bank" name="cb'+j+'" data-subject="'+item.bankid+'" onclick="checkOnly(this)" data-level="NB,'+item.issuer+'" data-target="#Bank"><h4 class="list-group-item-heading"><img src="../../../../pgmerc/pgimages/images/banklogo/'+banklogo+'.gif" alt="'+item.name+'"  class="img-thumbnail"> <span class="pull-right">Internet Banking</span></h4></div></li>';								
			$('#quickpayList').append(tRow.append(tCell));
		});
		
	// If Bank logo not present, Bank Name with be display
	$("span.bank img").error(function() { 
		$div = $('<div>').html($(this).attr('alt'));
		$(this).replaceWith($div);
	});
	 
	 $('div#quickpayList').after('<p class="addnewcard">+ <strong><a href="javascript:void(0)">Use a new card</a></strong> <a onclick="return cancelForm();" class="pull-right" style="display: block;">Cancel</a></p><p>+ Not <span>'+getDataEvaluate.userfname+'?</span> <strong><a onclick="BDPG.removeUserInfo()">Sign In with a different QuickPay account</a></strong></p>');
	return false; 
	} 
	
	if(CardLen == "" || BankLen == "") { 
		$('#qpLogin').hide();
		$('div.QPContent').html('').attr('id','blankmsg');
		$('#blankmsg').delay(800).fadeIn(); $('#blankmsg').html('<div id="ExitisingUserSection"><div class="page-header"><h4 class="text-info">Hello, '+getDataEvaluate.userfname+'!</h4><h5>Not <span>'+getDataEvaluate.userfname+'?</span> <a onclick="BDPG.removeUserInfo()">Sign In with a different QuickPay account</a></h5></div><p class="text-justify">You have no cards added to your QuickPay account. </p><p>Simply save the card on your first transaction - no need to remember or painfully type your card details anymore and complete your payment in seconds!</p><p class="addnewcard">+ <strong><a href="javascript:void(0)">Use a new card</a></strong> </p></div><br><a onclick="return cancelForm();" class="pull-right" style="display: block;">Cancel</a>');
		return false; 
	}
	
	else { $('div.QPContent').html('').attr('id',''); BDPG.hideSec('ExitisingUserSection'); BDPG.hideSec('loginsection'); }
}	// Function to generate ViewCard table ends here



/* Function to remove Card from storeCard data : CS10015			*\
\*----------------------------------------------------------------- */
BDPG.removeCard = function(getElem) {
var removeCardData = getElem.id.split(",");
var xCardRemove = getElem.title.split(',')[0];
var del = confirm('Are you sure you want to remove '+getElem.title.split(',')[1]+'?'); 
if (del) {
CardObj = {msg:MsgSrc,msgcode:"CS10015",actTokenId:removeCardData[0],accountType:removeCardData[1],bankid:removeCardData[2]};
	var request = $.ajax({
		url: AjXRequestURL, type: "POST", data:CardObj, cache : 'false', dataType : 'text'
	})
	request.done(function( data ) { var getDataEvaluate = eval ("("+data+")"); 
		if(getDataEvaluate.status == 'Y') { 
			$(getElem).parent().closest("li.list-group-item").animate({ padding: 0, height: 0 }).wrapInner('<div />').css("background-color","rgba(0,140,203,.2)").slideUp(function() { $(this).closest('li').remove(); });
			
		}
		if(getDataEvaluate.status == 'N') { 
			$('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-danger'); $('.otpmsg').html(getDataEvaluate.errordescription); 
		}
		
	 });
	request.fail(function( data ) { $('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-danger'); $('.otpmsg').html(getDataEvaluate.errordescription); }); 
	return false;
	} // valid check box selected function ends here
else {
	return false;	
}
}

/* Function to remove User details/Cookie from browser : CS10016	*\
\*----------------------------------------------------------------- */
BDPG.removeUserInfo = function() {
	CardObj = {msg:MsgSrc,msgcode:"CS10016"};
	var request = $.ajax({
		url: AjXRequestURL, type: "POST", data:CardObj, cache : 'false', dataType : 'text'
	})
	request.done(function( data ) { 
		var getDataEvaluate = eval ("("+data+")"); 
		if(getDataEvaluate.status == 'Y') { 
			viewCardStatus = "N";
			$('div.QPContent').html('');
			$('#qpLogin').hide();
			BDPG.ShowLoginSection(); BDPG.AllowStoreCard();
			blockName = 'tab2'; BDPG.GenerateCardForm();  BDPG.AllowStoreCard(); $("#bdQPModel").modal('show');
			document.form1.txtBankID.value = "CARD";	document.form1.txtItemCode.value = qpProdId;
			BDPG.showSec('proceedForm');	BDPG.showSec('goBack');
			return false;
		}
		if(getDataEvaluate.status == 'N') { 
			$('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-danger'); $('.otpmsg').html(getDataEvaluate.errordescription); 
			return false;
		}
		
	 });
	request.fail(function( data ) { $('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-danger'); $('.otpmsg').html(getDataEvaluate.errordescription); }); 
} // remove User data from Browser
	
/*************************************************************************\
  BillDesk StoreCard(form1) function ends above
\*************************************************************************/








/*************************************************************************\
  BillDesk OTP Validation for StoreCard(form1)
  function called when user request for OTP.
\*************************************************************************/
$(document).on ('keypress', 'input[type=email], input[type=tel], input[type=number], input[type=text]', function( event ) {  
	if ( event.which == 13 ) { $(this).focus(); event.preventDefault();  } 
});

var username = ""

/* validate sendOTP form											*\
\*----------------------------------------------------------------- */
$(document).on('click submit' ,  '#SendOTP',function () {				// if theres a change in the username textbox
var regMobile = RegExp("^[0-9]{10}$");
var regEmail = RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$");

username = $("#useremail").val();								// Get the value in the username textbox
var mobileno = "NA";
if(username == "" || !username.match(regEmail)) { alert('Please enter valid email address'); $("#useremail").focus(); return false; }
if(username.match(regEmail)) {						// if the lenght greater than 3 characters
	$('#SendOTP').button('loading');
	BDPG.sendOTP(username,mobileno)				// Send new OTP
	return false; }
});


/* validate ReSendOTP form											*\
\*----------------------------------------------------------------- */
$(document).on('click', "#ReSendOTP",function () {									// if theres a change in the username textbox
var regEmail = RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$");
if(username == "" || !username.match(regEmail)) { alert('Please enter email address'); $("#useremail").focus(); return false; }
if( getEmailId != '' && getMobileNo != '' && otprefno != '' ) {						// if the lenght greater than 3 characters
	BDPG.ReSendOTP(getEmailId,getMobileNo,otprefno)									// Send new OTP
	return false; }
});



/* capture validateOTP click function								*\
\*----------------------------------------------------------------- */
$(document).on('click', "#validateOTP",function () {								// check if any change in the username textbox
var regOTPPass = RegExp("^[0-9]{6}$");
var secureOTP = $("#txtPayPass").val();											// Get the value in the password textbox
	if(secureOTP == "" || !secureOTP.match(regOTPPass)) { 
		alert('Please enter a valid 6 digit One Time Password (OTP) receive on your registered Mobile Number and/ or e-mail ID.'); 
		$("#txtPayPass").focus(); return false; 
	} else {
		var myEmailid = username;
		$('#validateOTP').button('loading');
		BDPG.validateOTP(myEmailid,getMobileNo,secureOTP)
	}
});



/* Function to send new OTP TO user : CS10011						*\
\*----------------------------------------------------------------- */
var otprefno = getMobileNo = "";
BDPG.sendOTP = function(Emailid,MobileNo) {
CardObj = {msg:MsgSrc,msgcode:"CS10011",mobno:MobileNo,emailid:Emailid};
	var request = $.ajax({
		url: AjXRequestURL, type: "POST", data:CardObj, cache : 'false', dataType : 'text'
	})
	//$("div.txt-fld button#SendOTP").replaceWith('<img src="resources/images/loading.gif" class="loading">');
	request.done(function( data ) {
		$('#tab1').removeClass('check_status');
		$('div#pleasewait').remove();
		var getDataEvaluate = eval ("("+data+")");
		if (getDataEvaluate.status == "Y") {
			otprefno = getDataEvaluate.otprefno
			getEmailId = getDataEvaluate.emailid;
			getMobileNo = getDataEvaluate.mobile;
			
			 setTimeout(function () {
				$('.otpmsg, .otpSection').fadeIn();
				$('.otpmsg').attr('class', '').addClass('otpmsg success');
				$('div.model').attr('class', '').addClass('otpmsg success');
				
				$('div#bdQPModel div.modal-body p.otpmsg').html('').append('One Time Password(OTP) sent successfully to your email <b class="text-info">'+getDataEvaluate.emailid.substring(0,3)+'****@'+getDataEvaluate.emailid.split('@')[1]+'</b> and mobile <b class="text-info">'+ getDataEvaluate.mobile.substring(0,1)+'xxxx'+getDataEvaluate.mobile.substring(5,10) +'</b>.');
				
				$('div#bdQPModel div.modal-body form.form-horizontal').html('').removeClass('form-horizontal').attr('role','form').append('<div class="form-group"><label for="txtPayPass">Enter One Time Password: </label><div class="row"><div class="col-md-6"><input type="tel" class="form-control" id="txtPayPass" name="txtPayPass" maxlength="6" placeholder="Enter the 6 digit OTP"></div><div class="col-md-6"><button type="button" id="validateOTP" data-loading-text="<i class=\'fa bd-icon fa-fw\'></i>  Please wait..." class="col-xs-12 col-md-12 btn btn-lg btn-danger"><i class="fa bd-icon fa-fw"></i> Verify with OTP</button></div></div></div>');
				
				$('div#bdQPModel div.modal-body').after('<div class="modal-footer"><h4 class="pull-left"><strong>Did not get the OTP? <a id="ReSendOTP"  class="text-primary">Re-send</a></strong></h4></div>')
				
				$('input#txtPayPass').focus();
				var isVisible = $('.otpSection').is(':visible');
				if (isVisible == true) {
					$('#useremail , #usermobile').attr("disabled", "disabled").css('color','#DDDDDD'); $('.signup-diff-user').remove();
					$("div.txt-fld button#SendOTP").replaceWith('<button id="ReSendOTP" name="ReSendOTP" type="button">Resend OTP</button>');
				}
				
			}, 800);
		 }
		if (getDataEvaluate.status == "N") { 
		$('#SendOTP').button('reset');
		 $('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-info'); $('.otpmsg').html(getDataEvaluate.errordescription); }
	});
	request.fail(function( data ) {$('div.pleasewait').remove(); console.log( "sendOTP : Request failed:"); });
}



/* Function to ReSend OTP TO user : CS10012							*\
\*----------------------------------------------------------------- */ 
BDPG.ReSendOTP = function(Emailid,MobileNo,OTPRefNo) {
CardObj = {msg:MsgSrc,msgcode:"CS10012",mobno:MobileNo,emailid:Emailid,refnumber:OTPRefNo};
	var request = $.ajax({
		url: AjXRequestURL, type: "POST", data:CardObj, cache : 'false', dataType : 'text'
	})
	request.done(function( data ) { 
		var getDataEvaluate = eval ("("+data+")");
		otprefno = getDataEvaluate.otprefno;
		if (getDataEvaluate.status == "Y") {
		$('.otpmsg').attr('class', '').addClass('otpmsg text-info').html('One Time Password(OTP) resent successfully to your email <b class="text-info">'+getDataEvaluate.emailid.substring(0,3)+'****@'+getDataEvaluate.emailid.split('@')[1]+'</b> and mobile <b class="text-info">'+ getDataEvaluate.mobile.substring(0,1)+'xxxx'+getDataEvaluate.mobile.substring(5,10) +'</b>.');
		
			var isVisible = $('.otpSection').is(':visible');
			if (isVisible == false) {  $('.otpmsg, .otpSection').fadeIn(); }
			$('input#txtPayPass').val('').focus();
		}
		
		if (getDataEvaluate.status == "N") { $('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-info'); $('.otpmsg').html(getDataEvaluate.errordescription); }
	});
	
	request.fail(function( data ) {$('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-info');; $('.otpmsg').html(getDataEvaluate.errordescription); });
}


/* Function to SUBMIT OTP TO user : CS10013							*\
\*----------------------------------------------------------------- */
BDPG.validateOTP = function(Emailid,MobileNo,secureOTP) { 
CardObj = {msg:MsgSrc,msgcode:"CS10013",acttype:"ALL",mobno:MobileNo,emailid:Emailid,refnumber:otprefno,otp:secureOTP};
	var request = $.ajax({
		url: AjXRequestURL, type: "POST", data:CardObj, cache : 'false', dataType : 'text'
	})
	request.done(function( data ) { 
		var getDataEvaluate = eval ("("+data+")");
		if(getDataEvaluate.status == 'Y') {
			
		$('div.row-offcanvas-left').removeClass('active relative');
		$(".tab_content, #proceedForm, #goBack,  #qpPopupAnchor").hide();
		if ( $(window).width() <= 599) { $('#qpLogin').hide(); }
		$('#qpTabAnchor').show();								// Show QuickPay

		setTimeout(function () {
				$("#bdQPModel").modal('hide');
				$('div.modal').attr('id','bdQPModel').html('');

				// Toggle tab for credit card.
				$("ul.tabs li:first").eq(0).addClass("active").show(); //Activate first tab
				$("div.tab_content").eq(0).addClass("active bd-tabs-active").show();
				
				$("ul.tabs li").eq(1).removeClass("active bd-tabs-active"); //Deactivate Second tab
				$("div.tab_content").eq(1).removeClass("active bd-tabs-active").hide();
				
				$('div.QPContent').html('').attr('id',''); BDPG.generateViewCardTble(data);
				document.form1.txtBankID.value = "";	document.form1.txtItemCode.value = "";
				
				//$('#ExitisingUserSection, .favdatspacer').show();
				$('p.blankmsg').hide();
				//$('.btn-submit').show();
			}, 600);
		}
		
		if(getDataEvaluate.status == 'N') { 
			$('#qpLogin').hide();
			$('#bdQPModel').find("input[name=txtPayPass]").prop('value','');
			
			$('#validateOTP').button('reset');
			$('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-danger'); $('.otpmsg').html("Error: "+getDataEvaluate.errordescription); 
			return false;
		}
		
		if(getDataEvaluate.errorcode == 'ECSVL037') {
			$('.otpSection').hide(); $('.otpmsg').delay(800).fadeIn().attr('class', '').addClass('otpmsg text-danger'); $('.otpmsg').html(getDataEvaluate.errordescription);
			$('#useremail , #usermobile').removeAttr("disabled").css('color','');
			$("div.txt-fld button#ReSendOTP").replaceWith('<button id="SendOTP" name="SendOTP" type="button">Send OTP</button>');
			return false;
		}
	});
	request.fail(function( data ) {
		
	});
	
}

/****************************************************/
	// OTP Validation ends  above
/****************************************************/





/* Function to GET form submission data : PGIDirectRequestHandler	*\
\*----------------------------------------------------------------- */
var data = []; var getDataEvaluate = ""; var EvaluateAjxData = "";
BDPG.getFormRequestData = function(MsgSrc, tBankid, tItemCode, cardNumber, cardName, cardMonth, cardYear, cardCvv, acttype, RequestDataURL) { 
var data = {msg:MsgSrc,txtBankID:tBankid,txtItemCode:tItemCode,cnumber:cardNumber, cname2:cardName, expmon:cardMonth, expyr:cardYear, cvv2:cardCvv, cardType:acttype, hidRequestId:"PGIME1000", hidOperation:"ME100",reqid:"cc_processall"};

/*  Ajax Data Evaluation													*\
\****************************************************************************/	
	var request = $.ajax({ type: "POST",url: RequestDataURL, data:data, cache : false, dataType : 'text',
		beforeSend: function() { $('body').prepend('<div id="pleasewait"></div><span class="pleasewait"> Please wait...</span>'); $('#proceedForm').button('loading');	},
	   
		success: function(data, textStatus, xhr) {
			getDataEvaluate = eval ("("+data+")"); EvaluateAjxData = getDataEvaluate.data;
			$('form div#AjaxResponsefields').remove(); 
			$('form').append('<div id="AjaxResponsefields"><form name="ResponseForm" id="ResponseForm" action=""></form></div>')
			$('#pleasewait, .pleasewait').remove();
		
			//Evaluated each items from Ajax Response
			$.each(EvaluateAjxData, function(i,item ) { 
				$('#AjaxResponsefields form#ResponseForm').append('<input name="'+i+'" type="hidden" value="'+item+'">');
			});
			if(document.form1.txtBankID.value="MPC"){ 
					MasterPass.client.checkout({
						 "requestToken":getDataEvaluate.data['oauth_token'],
						 "callbackUrl":getDataEvaluate.data['cancelUrl'],
						 "merchantCheckoutId":getDataEvaluate.data['checkout_identifier'],
						 "allowedCardTypes":getDataEvaluate.data['acceptable_cards'],
						 "version":"v6"
					});
			} else {
				document.ResponseForm.action=getDataEvaluate.url;  document.ResponseForm.method="POST"; 
				document.form1.target = "_parent";  document.ResponseForm.submit();
			}
		},
		error: function(xhr, textStatus, errorThrown) {
			$('#pleasewait , .pleasewait').remove(); $('#proceedForm').button('reset'); 
		}
	});
}









//////////////////////// Generate AmEx table
var appended = false;
BDPG.generateAmExTble = function() {
if(!appended) {
//$('.cardHolder, .AmExSection').remove();
//var AmExCardFormData = '<div class="AmExSection"><div class="widget-head"><h5 class="heading">Please provide your AMEX card details as required below and click on "Make Payment" </h5></div><div id="IndianHolder"><div class="form-group col-md-12"><div class="col-md-8"><label for="AmExEmail">Email ID</label><input type="email" placeholder="Email ID" id="AmExEmail" name="AmExEmail" class="form-control"></div><div class="col-md-4"><label for="AmExMobile">Mobile</label><input type="tel" placeholder="Mobile" id="AmExMobile" name="AmExMobile" class="form-control"></div></div>';

var AmExCardFormData = '<div class="AmExSection"><div class="widget-head"><h5 class="heading">Please provide your AMEX card details as required below and click on "Register" </h5></div><div class="form-group crdhld"><label for="cardholder" class="col-sm-4 control-label nopadT">Card Holder <span class="help-block">Select Card Type</span></label><div class="col-sm-6 row"><div class="btn-group" data-toggle="buttons"><label class="btn btn-default active" ><input type="radio" name="citizen" value="yes" id="indian" checked> Indian</label><label class="btn btn-default"><input type="radio" name="citizen" value="no" id="international"> International</label></div></div></div><div id="InternationalHolder" style="display:none"><div class="form-group col-md-12"><div class="col-md-4"><label for="txtfname">First Name</label><input type="text" placeholder="First name" name="txtfname" id="txtfname" class="form-control"></div><div class="col-md-4"><label for="txtmname">Middle Name</label><input type="text" placeholder="Middle name" name="txtmname" id="txtmname" class="form-control"></div><div class="col-md-4"><label for="txtlname">Last Name</label><input type="text" placeholder="Last name" name="txtlname" id="txtlname" class="form-control"></div></div><div class="form-group col-md-12"><div class="col-md-8"><label for="txtaddress">Street Address</label><input type="text" placeholder="Street Address" id="txtaddress" class="form-control"></div><div class="col-md-4"><label for="txtcity">City / Town</label><input type="text" placeholder="City / Town" id="txtcity" class="form-control"></div></div><div class="form-group col-md-12"><div class="col-md-4"><label for="txtstate">State/ Province</label><input type="text" placeholder="State/ Province" name="txtstate" id="txtstate" class="form-control"></div><div class="col-md-4"><label for="txtzip">Post/ Zip Code</label><input type="text" placeholder="Post/ Zip Code" name="txtzip" id="txtzip" class="form-control"></div><div class="col-md-4"><label for="txtcountry">Country</label><select id="txtcountry" name="txtcountry" class="form-control"><option value="0">Select Country</option><option value="AF">Afghanistan</option><option value="AL">Albania</option><option value="DZ">Algeria</option><option value="AS">American Samoa</option><option value="AD">Andorra</option><option value="AO">Angola</option><option value="AI">Anguilla</option><option value="AQ">Antarctica</option><option value="AG">Antigua and Barbuda</option><option value="AR">Argentina</option><option value="AM">Armenia</option><option value="AW">Aruba</option><option value="AU">Australia</option><option value="AT">Austria</option><option value="AZ">Azerbaijan</option><option value="BS">Bahamas</option><option value="BH">Bahrain</option><option value="BD">Bangladesh</option><option value="BB">Barbados</option><option value="BY">Belarus</option><option value="BE">Belgium</option><option value="BZ">Belize</option><option value="BJ">Benin</option><option value="BM">Bermuda</option><option value="BT">Bhutan</option><option value="BO">Bolivia</option><option value="BA">Bosnia and Herzegovina</option><option value="BW">Botswana</option><option value="BV">Bouvet Island</option><option value="BR">Brazil</option><option value="IO">British Indian Ocean Territory</option><option value="VG">British Virgin Islands</option><option value="BN">Brunei</option><option value="BG">Bulgaria</option><option value="BF">Burkina Faso</option><option value="BI">Burundi</option><option value="KH">Cambodia</option><option value="CM">Cameroon</option><option value="CA">Canada</option><option value="CV">Cape Verde</option><option value="KY">Cayman Islands</option><option value="CF">Central African Republic</option><option value="TD">Chad</option><option value="CL">Chile</option><option value="CN">China</option><option value="CX">Christmas Island</option><option value="CC">Cocos Islands</option><option value="CO">Colombia</option><option value="KM">Comoros</option><option value="CG">Congo</option><option value="CK">Cook Islands</option><option value="CR">Costa Rica</option><option value="HR">Croatia</option><option value="CU">Cuba</option><option value="CY">Cyprus</option><option value="CZ">Czech Republic</option><option value="CI">Côte d\'Ivoire</option><option value="DK">Denmark</option><option value="DJ">Djibouti</option><option value="DM">Dominica</option><option value="DO">Dominican Republic</option><option value="EC">Ecuador</option><option value="EG">Egypt</option><option value="SV">El Salvador</option><option value="GQ">Equatorial Guinea</option><option value="ER">Eritrea</option><option value="EE">Estonia</option><option value="ET">Ethiopia</option><option value="FK">Falkland Islands</option><option value="FO">Faroe Islands</option><option value="FJ">Fiji</option><option value="FI">Finland</option><option value="FR">France</option><option value="GF">French Guiana</option><option value="PF">French Polynesia</option><option value="TF">French Southern Territories</option><option value="GA">Gabon</option><option value="GM">Gambia</option><option value="GE">Georgia</option><option value="DE">Germany</option><option value="GH">Ghana</option><option value="GI">Gibraltar</option><option value="GR">Greece</option><option value="GL">Greenland</option><option value="GD">Grenada</option><option value="GP">Guadeloupe</option><option value="GU">Guam</option><option value="GT">Guatemala</option><option value="GN">Guinea</option><option value="GW">Guinea-Bissau</option><option value="GY">Guyana</option><option value="HT">Haiti</option><option value="HM">Heard Island And McDonald Islands</option><option value="HN">Honduras</option><option value="HK">Hong Kong</option><option value="HU">Hungary</option><option value="IS">Iceland</option><option value="IN">India</option><option value="ID">Indonesia</option><option value="IR">Iran</option><option value="IQ">Iraq</option><option value="IE">Ireland</option><option value="IL">Israel</option><option value="IT">Italy</option><option value="JM">Jamaica</option><option value="JP">Japan</option><option value="JO">Jordan</option><option value="KZ">Kazakhstan</option><option value="KE">Kenya</option><option value="KI">Kiribati</option><option value="KW">Kuwait</option><option value="KG">Kyrgyzstan</option><option value="LA">Laos</option><option value="LV">Latvia</option><option value="LB">Lebanon</option><option value="LS">Lesotho</option><option value="LR">Liberia</option><option value="LY">Libya</option><option value="LI">Liechtenstein</option><option value="LT">Lithuania</option><option value="LU">Luxembourg</option><option value="MO">Macao</option><option value="MK">Macedonia</option><option value="MG">Madagascar</option><option value="MW">Malawi</option><option value="MY">Malaysia</option><option value="MV">Maldives</option><option value="ML">Mali</option><option value="MT">Malta</option><option value="MH">Marshall Islands</option><option value="MQ">Martinique</option><option value="MR">Mauritania</option><option value="MU">Mauritius</option><option value="YT">Mayotte</option><option value="MX">Mexico</option><option value="FM">Micronesia</option><option value="MD">Moldova</option><option value="MC">Monaco</option><option value="MN">Mongolia</option><option value="MS">Montserrat</option><option value="MA">Morocco</option><option value="MZ">Mozambique</option><option value="MM">Myanmar</option><option value="NA">Namibia</option><option value="NR">Nauru</option><option value="NP">Nepal</option><option value="NL">Netherlands</option><option value="AN">Netherlands Antilles</option><option value="NC">New Caledonia</option><option value="NZ">New Zealand</option><option value="NI">Nicaragua</option><option value="NE">Niger</option><option value="NG">Nigeria</option><option value="NU">Niue</option><option value="NF">Norfolk Island</option><option value="KP">North Korea</option><option value="MP">Northern Mariana Islands</option><option value="NO">Norway</option><option value="OM">Oman</option><option value="PK">Pakistan</option><option value="PW">Palau</option><option value="PS">Palestine</option><option value="PA">Panama</option><option value="PG">Papua New Guinea</option><option value="PY">Paraguay</option><option value="PE">Peru</option><option value="PH">Philippines</option><option value="PN">Pitcairn</option><option value="PL">Poland</option><option value="PT">Portugal</option><option value="PR">Puerto Rico</option><option value="QA">Qatar</option><option value="RE">Reunion</option><option value="RO">Romania</option><option value="RU">Russia</option><option value="RW">Rwanda</option><option value="SH">Saint Helena</option><option value="KN">Saint Kitts And Nevis</option><option value="LC">Saint Lucia</option><option value="PM">Saint Pierre And Miquelon</option><option value="VC">Saint Vincent And The Grenadines</option><option value="WS">Samoa</option><option value="SM">San Marino</option><option value="ST">Sao Tome And Principe</option><option value="SA">Saudi Arabia</option><option value="SN">Senegal</option><option value="CS">Serbia and Montenegro</option><option value="SC">Seychelles</option><option value="SL">Sierra Leone</option><option value="SG">Singapore</option><option value="SK">Slovakia</option><option value="SI">Slovenia</option><option value="SB">Solomon Islands</option><option value="SO">Somalia</option><option value="ZA">South Africa</option><option value="GS">South Georgia And The South Sandwich Islands</option><option value="KR">South Korea</option><option value="ES">Spain</option><option value="LK">Sri Lanka</option><option value="SD">Sudan</option><option value="SR">Suriname</option><option value="SJ">Svalbard And Jan Mayen</option><option value="SZ">Swaziland</option><option value="SE">Sweden</option><option value="CH">Switzerland</option><option value="SY">Syria</option><option value="TW">Taiwan</option><option value="TJ">Tajikistan</option><option value="TZ">Tanzania</option><option value="TH">Thailand</option><option value="CD">The Democratic Republic Of Congo</option><option value="TL">Timor-Leste</option><option value="TG">Togo</option><option value="TK">Tokelau</option><option value="TO">Tonga</option><option value="TT">Trinidad and Tobago</option><option value="TN">Tunisia</option><option value="TR">Turkey</option><option value="TM">Turkmenistan</option><option value="TC">Turks And Caicos Islands</option><option value="TV">Tuvalu</option><option value="VI">U.S. Virgin Islands</option><option value="UG">Uganda</option><option value="UA">Ukraine</option><option value="AE">United Arab Emirates</option><option value="GB">United Kingdom</option><option value="US">United States</option><option value="UM">United States Minor Outlying Islands</option><option value="UY">Uruguay</option><option value="UZ">Uzbekistan</option><option value="VU">Vanuatu</option><option value="VA">Vatican</option><option value="VE">Venezuela</option><option value="VN">Vietnam</option><option value="WF">Wallis And Futuna</option><option value="EH">Western Sahara</option><option value="YE">Yemen</option><option value="ZM">Zambia</option><option value="ZW">Zimbabwe</option><option value="AX">Aland Islands</option></select></div></div></div><div id="IndianHolder"><div class="form-group col-md-12"><div class="col-md-8"><label for="AmExEmail">Email ID</label><input type="email" placeholder="Email ID" id="AmExEmail" name="AmExEmail" class="form-control"></div><div class="col-md-4"><label for="AmExMobile">Mobile</label><input type="tel" placeholder="Mobile" id="AmExMobile" name="AmExMobile" class="form-control"></div></div></div></div>';

$('#AmExTble').html(AmExCardFormData);
appended = true; 
}
}



// Prevent shift key since its not needed, Allow Only: keyboard 0-9, numpad 0-9, backspace, tab, left arrow, right arrow, delete. Prevent the rest
$(document).on("paste","keydown", "input#cnumber",function (event) {
if (event.shiftKey == true ) { event.preventDefault(); }		
if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46) {			// Allow normal operation
} else { event.preventDefault(); } });					




function AcceptSaveCard() {
// Save Card Check box
var savecard = $('#AcceptQuickPay');
var inital = savecard.is(':checked');

// Save Card section  input fields
var AuthUser = $("#AuthUser")[inital ? "removeClass" : "addClass"]("");
var AuthUserInputs = AuthUser.find("input").attr("disabled", !inital);

// show saved card feilds  when checkbox[AcceptQuickPay] is checked
if ($(savecard).is(":checked")) {
	
	$("#IndianHolder").find('input[type=text] , input[type=password]').prop('value','');
	BDPG.showSec("IndianHolder"); BDPG.hideSec("InternationalHolder");
	//$("#indcard")[0].checked = true;
	//$('input:radio[name=citizen]').val(['yes']).checked = true
	//$('label[for=intercard] span').removeClass('rchecked');
	
	if 	( viewCardStatus == 'N' ) { $('#txtUserEmail').val("");	$('#txtUserMobile').val("");
			$("#AuthUser").show();
			AuthUser[!this.checked ? "removeClass" : "addClass"]("show");	AuthUserInputs.attr('', !this.checked); }
	else {	$('#txtUserEmail').val(viewEmailID);	$('#txtUserMobile').val(viewMobileNo);
			$("#AuthUser").hide();
			AuthUser[!this.checked ? "removeClass" : "addClass"](""); AuthUserInputs.attr("disabled", this.checked); }
} else { $("#AuthUser").hide(); 

}

}

// Function Validate MOD10 for Card Number
function mod10( cardNumber ) { var ar = new Array( cardNumber.length ); var i = 0,sum = 0; 
	for( i = 0; i < cardNumber.length; ++i ) { ar[i] = parseInt(cardNumber.charAt(i));}
	for( i = ar.length -2; i >= 0; i-=2 ) { ar[i] *= 2; if( ar[i] > 9 ) ar[i]-=9; }
	for( i = 0; i < ar.length; ++i ) {sum += ar[i]; } return (((sum%10)==0)?true:false); 
}
// Card Expiry Validation
BDPG.expired = function( month, year ) { 
var now = new Date();	var expiresIn = new Date(year,month,0,0,0); expiresIn.setMonth(expiresIn.getMonth()); if( now.getTime() < expiresIn.getTime() ) return false; return true; }







/********* Quick Pay Visibility ************/
var checkQPtab = $('#tab1').is(':visible');
if(checkQPtab) { $('ul.tabs span.otheroption').show(); }
var checkClickTab = $('ul.tabs li').bind('click', function() {
	var getTab = $(this).find('a').html()
	var isFavdatVisible = $('#ExitisingUserSection').is(':visible');
	if (getTab == 'QuickPay') { $('ul.tabs span.otheroption').show(); $('#cardfm').remove(); return false; }
	else if (getTab == 'Credit Card') {	/*blockName = 'tab2'; BDPG.AllowStoreCard();  $('#cardfm').remove(); */$('ul.tabs span.otheroption').hide(); return false;  }
	//if (getTab == 'QuickPay' && isFavdatVisible == "true") { $('ul.tabs span.otheroption').show(); return false;  }
	else { $('ul.tabs span.otheroption').hide(); $('#notes').css('margin-top','12px'); /*$('#cardfm').remove();*/ return false;  }

});




var cbxName,cbxValue,cbxIssuer=""
function checkOnly(QPCheckedValue){
with(document.form1) {
	$id = QPCheckedValue.id;

	for(i = 0; i < elements.length; i++)  {if(elements[i].checked == true && elements[i].name != QPCheckedValue.name)  { elements[i].checked = false; } } 

	document.form1.txtBankID.value = $(QPCheckedValue).attr('data-subject')
	document.form1.txtItemCode.value = "QP-"+qpProdId;
	
	var paymentSubject = $(QPCheckedValue).attr('data-subject'); 
	if(paymentSubject == "CC" || paymentSubject == "DC" || paymentSubject == "AX") { 
		document.form1.paymentid.value = QPCheckedValue.id; 
		var $name = $(QPCheckedValue).attr('data-name');  PopulateModel($name); 
		
	}
	else if(paymentSubject == "AX") { 
		var $name = QPCheckedValue.name;  PopulateModel($name);
		document.form1.paymentid.value = QPCheckedValue.id; document.form1.txtBankID.value = "FX-"+AmExBKID; 
	}
	else { document.form1.paymentid.value = "";  PopulateModelBank(); }
	cbxName = $(QPCheckedValue).attr('data-name'); cbxValue = $(QPCheckedValue).attr('data-level').split(',')[0];
	cbxIssuer = $(QPCheckedValue).attr('data-level').split(',')[1];
} }

$(document).on('click','.crdhld div label', function() {
$('.crdhld div label').removeClass('active').removeAttr('checked','checked'); $(this).addClass('active').find('input[type=radio]').attr('checked','checked');
citizen_val = $(this).find('input[type=radio]').attr('value');
var check = $("#AcceptQuickPay").is(':checked');

//for (var i=0; i < document.form1.citizen.length; i++){ if (document.form1.citizen[i].checked) { var citizen_val = document.form1.citizen[i].value; } }

if (citizen_val=="yes") {
	$("#IndianHolder").find('input[type=text] , input[type=password]').attr('value','');
	BDPG.showSec("IndianHolder"); BDPG.hideSec("InternationalHolder");
	return false;
 }
if (citizen_val=="no"  && !check) { 
	$("#InternationalHolder").find('input[type=text] , input[type=password]').attr('value','');
	BDPG.showSec("IndianHolder"); BDPG.showSec("InternationalHolder");
	return false;
	}
});

/************ Custom function ***************/
BDPG.showSec = function(section) {$('#'+section).show();}
BDPG.hideSec = function(section) {$('#'+section).hide();}
$('input[type="text"],input[type="password"]').on('keyup',function() {$(this).removeClass("emptyField");});

/****** Spilt Card Number Value **********/
$(document).on('keyup', "input#cnumber",function () {
  var crdnumber = $(this).val().split("-").join(""); // remove hyphens
  if (crdnumber.length > 0) { crdnumber = crdnumber.match(new RegExp('.{1,4}', 'g')).join("-"); }
  $(this).val(crdnumber);
});

/****** SI Function for ProductID: PGISI **********/
$(document).on('click', "input#autopay",function () {
  var $isPGISIChecked = $(this).is(':checked');
  if ($isPGISIChecked) { document.form1.txtItemCode.value = "PGSI"; } else { document.form1.txtItemCode.value = qpProdId;}
});

/****** Delay and Replace CVV number **********/
var timer;
$(document).on('keyup', "input[id^=cb]",function () {
	
	//var $this = this; clearTimeout(timer); timer = setTimeout(function(){$($this).val($($this).val().replace(/[^\s]/g, "*"))},300);
});

// Show Store Card Block	
BDPG.ShowLoginSection = function() {
$('div.modal').attr('id','bdQPModel').html('');
$('#qpPopupAnchor').show(); $('#qpTabAnchor').hide();
if (viewCardStatus == 'M') { $('#qpPopupAnchor').hide(); $('#qpTabAnchor').show(); BDPG.showSec('proceedForm'); }

// Toggle tab for credit card.
$(".tab_content").hide();
$("ul.tabs li:first, div.tab_content").eq(0).removeClass('active bd-tabs-active');
$("div.tab_content").eq(0).hide(); 
$("#main-container div.tab_content").eq(1).addClass("active bd-tabs-active").show();
$("ul.tabs li").eq(1).addClass("active bd-tabs-active").show();

	if(viewCardStatus == 'N' || viewCardStatus == 'M') { 
		if (CacheEmailVal == 'NA' || CacheEmailVal == '') {
	$('#loginsection').prepend('<h1>Welcome to QuickPay</h1><h5>Please sign in to your QuickPay account. <span class="texti">New to QuickPay? <a id="newQPuser" href="#">click here</a></span></h5>'); 
		}
	}
var LoginBox = '<div id="innerlogin"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><h4 class="modal-title" id="myModalLabel"><img src="../../../../pgmerc/vodafone/quickpay/resources/images/icon_quickpay.gif" align="absmiddle" width="23" height="25" alt=""> QuickPay</h4></div><div class="modal-body"><p class="otpmsg">To import your saved cards, enter your QuickPay email address and verify with a One Time Password.</p><form class="form-horizontal"><div class="form-group"><label for="useremail" class="col-sm-3 control-label" style="text-align:left;">Email ID: </label><div class="col-xs-12 col-sm-8 input-group"><span class="input-group-addon"><i class="fa fa-envelope fa-fw"></i></span><input type="email" class="form-control" id="useremail" name="useremail" placeholder="Enter QuickPay email id"><br></div></div><div class="row"><div class="col-sm-12"><button type="button" data-loading-text="<i class=\'fa bd-icon fa-fw\'></i>  Please wait..." class="col-xs-12  col-md-12 btn btn-lg btn-danger" id="SendOTP"><i class="fa bd-icon fa-fw"></i> Verify with OTP</button></div></div><p class="text-info small" style="margin-top:7px;">New to QuickPay? Simply save the card on your first transaction</p></form></div></div></div></div>'
$('body').css('padding-right','0');
$('div.modal').append(LoginBox); // $('div.otpSection').hide();
$('body').css('padding-right','0');
}

// Show Store Card Block	
BDPG.AllowStoreCard = function() {
$('#checkBoxSection, #AuthUser').remove();

/****** Quick Page StoreCard Block *****/
var checkBoxdata = '<div id="checkBoxSection" class="panel panel-info"><div class="panel-heading checkbox"><label><input type="checkbox" name="AcceptQuickPay" id="AcceptQuickPay" value="AcceptQuickPay" onclick="AcceptSaveCard()"> Save this card/ bank for QuickPay.</label></div><div id="AuthUser" class="panel-body" style="display:none;"><div class="row"><div class="col-md-6"><div class="form-group"><label for="txtUserEmail">Email address</label><div class="input-group"><div class="input-group-addon"><i style="font-size:20px;" class="fa fa-envelope"></i></div><input class="form-control" type="email" name="txtUserEmail" id="txtUserEmail" placeholder="Enter email address"></div></div></div><div class="col-md-6"><div class="form-group"><label for="txtUserMobile">Mobile Number</label><div class="input-group"><div class="input-group-addon" style="min-width:42px; padding:0px;"><i class="fa fa-mobile-phone fa-fw" style="font-size:25px"></i></div><input class="form-control" type="tel" maxlength="10" placeholder="Enter mobile number" id="txtUserMobile" name="txtUserMobile"></div></div></div></div><div class="form-group"><label for="txtUserFirstName">User Name</label><div class="input-group"><div class="input-group-addon" style="min-width:42px; padding:0px;"><i class="fa fa-user fa-fw" style="font-size:20px"></i></div><input type="text" class="form-control" id="txtUserFirstName" name="txtUserFirstName" placeholder="Enter your name"></div></div></div></div>';

/****** CsMsg Save Card Block *****/
if (isCsMsgMerc == "Y") { viewCardStatus ="Y"; var checkBoxdata = '<div id="checkBoxSection" class="panel panel-info"><div class="panel-heading checkbox"><label><input type="checkbox" name="CsMsgStoreCrdDetails" id="CsMsgStoreCrdDetails" > Save this card/ bank for QuickPay.</label></div></div>'; }

if (blockName == "tab2") { blockName = "cccard"; }
if (blockName == "tab3") { blockName = "vmm"; }
if(isQPAllowed || isCsMsgMerc != "N") {
	if (viewCardStatus !== 'M') { $('#'+blockName).append(checkBoxdata);	} 
}
}


// Create Info Block	
BDPG.showInfoMessage = function(tabName,infoContent) {
$('.infoMessage').remove();
var checkBoxdata = "<div class='infoMessage warningi'>"+infoContent+"</div>"
$('#'+tabName).append(checkBoxdata);
}


// Disabled Bank Info
var disabledBankArr = [];
BDPG.alertDisabledBankInfoMessage = function() { 
disabledBankArr= [];	// empty array list too added / find new list of bank;
$( "span[name^=disabledBank]" ).each( function(){
	disabledBankArr.push( $( this ).attr('data-bankid') );
});
return disabledBankArr;
}

BDPG.GenerateCardForm = function() {
$('#cardfm').remove();
var InsetCardBlock = $('#'+blockName).find('div[data-name^=CardForm]').attr('id');
var CardFormData = '<div id="cardfm"><div class="form-group crdno"><label for="cnumber" class="control-label">Card Number</label><div class="col-xs-12 input-group"><input type="tel" placeholder="Enter card number" name="cnumber" id="cnumber" class="form-control" value="" maxlength="19" autocomplete="off"><span class="input-group-addon"><i id="cardTypeid" class="fa cardT fa-fw"></i></span><input type="hidden" name="cardType" id="cardType"></div></div><div class="form-group row crd-details"><div class="col-xs-7 col-md-8 expcol"><label class="control-label" for="expmon">Expiration Date</label><div class="row expydate"><div class="col-xs-6"><select name="expmon" class="form-control" id="expmon" data-name="cardMonth"><option class="padl5" selected="" value="0">Month</option><option class="padl5" value="01">01 (Jan)</option><option class="padl5" value="02">02 (Feb)</option><option class="padl5" value="03">03 (Mar)</option><option class="padl5" value="04">04 (Apr)</option><option class="padl5" value="05">05 (May)</option><option class="padl5" value="06">06 (Jun)</option><option class="padl5" value="07">07 (Jul)</option><option class="padl5" value="08">08 (Aug)</option><option class="padl5" value="09">09 (Sep)</option><option class="padl5" value="10">10 (Oct)</option><option class="padl5" value="11">11 (Nov)</option><option class="padl5" value="12">12 (Dec)</option></select></div><div class="col-xs-6"><select name="expyr" class="form-control" id="expyr" data-name="cardYear"><option class="padl5" selected="" value="0">Year</option><option class="padl5" value="2015">2015</option><option class="padl5" value="2016">2016</option><option class="padl5" value="2017">2017</option><option class="padl5" value="2018">2018</option><option class="padl5" value="2019">2019</option><option class="padl5" value="2020">2020</option><option class="padl5" value="2021">2021</option><option class="padl5" value="2022">2022</option><option class="padl5" value="2023">2023</option><option class="padl5" value="2024">2024</option><option class="padl5" value="2025">2025</option><option class="padl5" value="2026">2026</option><option class="padl5" value="2027">2027</option><option class="padl5" value="2028">2028</option><option class="padl5" value="2029">2029</option><option class="padl5" value="2030">2030</option><option class="padl5" value="2031">2031</option><option class="padl5" value="2032">2032</option><option class="padl5" value="2033">2033</option><option class="padl5" value="2034">2034</option><option class="padl5" value="2035">2035</option><option class="padl5" value="2036">2036</option><option class="padl5" value="2037">2037</option><option class="padl5" value="2038">2038</option><option class="padl5" value="2039">2039</option><option class="padl5" value="2040">2040</option><option class="padl5" value="2041">2041</option><option class="padl5" value="2042">2042</option><option class="padl5" value="2043">2043</option><option class="padl5" value="2044">2044</option><option class="padl5" value="2045">2045</option><option class="padl5" value="2046">2046</option><option class="padl5" value="2047">2047</option><option class="padl5" value="2048">2048</option><option class="padl5" value="2049">2049</option><option class="padl5" value="2050">2050</option><option class="padl5" value="2051">2051</option><option class="padl5" value="2052">2052</option><option class="padl5" value="2053">2053</option><option class="padl5" value="2054">2054</option><option class="padl5" value="2055">2055</option><option class="padl5" value="2056">2056</option><option class="padl5" value="2057">2057</option><option class="padl5" value="2058">2058</option><option class="padl5" value="2059">2059</option><option class="padl5" value="2060">2060</option></select></div></div></div><div class="col-xs-5 col-md-4 cvvcol"><label class="control-label cvv" for="cvv2">CVV/ CVC</label><input type="password" name="cvv2" id="cvv2" class="form-control" maxlength="3"></div></div><div class="form-group"><label class="control-label" for="cname2">Card Holder Name</label><input type="text" class="form-control" id="cname2" name="cname2" placeholder="Enter card holder name" autocomplete="off"></div></div>';
$('#'+blockName).find('#'+InsetCardBlock).append(CardFormData);
//alert('blockName '+blockName+ ' InsetCardBlock ' +InsetCardBlock); 
}


var $isChecked=""
$(document).on('click', "input[type=checkbox] , input[type=radio]" ,function () {
//$('input[type=radio],input[type=checkbox]').on('click', function() {
	var $id = this.id;
	var $type = this.type
	$isChecked = $(this).is(':checked');
	
	
	if ($type == "checkbox") {
		if ($isChecked) {
        	$('label[for='+$id+']').find('span').addClass('cbchecked');
		} else {
			$('label[for='+$id+']').find('span').removeClass('cbchecked');
		}
    }
	if ($type == "radio") {
		$('input[name=citizen]').removeAttr('checked');
		
		if ($isChecked) {
			$('label[for$=card]').find('span').removeClass('rchecked');
			$('input[id='+$id+']').prop('checked',true);
			$('label[for='+$id+']').find('span').addClass('rchecked');
		} else {
			$('input[name=citizen]').children('label').find('span').removeClass('rchecked');
			$('input[id='+$id+']').removeAttr('checked',false);
			$('label[for='+$id+']').find('span').removeClass('rchecked');
		}
	}
});



// position the popup at the center of the page
function positionPopup(){
  if(!$("#popupHelper").is(':visible')){ return;  } 
  $("#popupHelper").css({
      left: ($(window).width() - $('#popupHelper').width()) / 2.20,
      top: ($(window).width() - $('#popupHelper').width()) / 9,
      position:'absolute'
  });
}
//maintain the popup at center of the page when browser resized
$(window).bind('resize',positionPopup);

// Open Popup
$(document).on('click', "a#newQPuser",function () {
	$("#popupHelper , .blackScreen").remove();
	$('body').append('<div class="blackScreen"></div><div id="popupHelper"></div>');
	
	
	$("#popupHelper").append('<div class="closebtn"></div><div class="w50p floatl"><img src="../pgmerc/storecard/resources/images/demo/qp_screen.html"></div><div class="w50p floatr"><br><h1>Welcome to QuickPay - the best way to pay online.</h1><br><p class="txt14">QuickPay makes it <strong>super easy</strong> to complete your payment online by securely storing your card/ payment information in a <cite>digital wallet</cite>.</p><br><div class="signInUser">Registered QuickPay User <span class="floatr textr"><a class="closebtn btn-signin">Sign In</a></span></div><br clear="all"> <div class="textc"><a class="btn-quickpay">Initate Payment and create a QuickPay account</a></div> </div><br clear="all"><br clear="all"><h1>Set up your QuickPay account online when you pay the first time.</h1><div class="w50p floatl">You will need to select the check box &ndash; <strong>Save this payment option for QuickPay</strong> when you use any of the payment options the first time [viz. Credit Card, Debit Card, Internet Banking, etc] and complete a one-time registration process by providing your email id and mobile number.<br><br>QuickPay tokenizes your payment information and saves it securely against your registered email address, thereby allowing to pay with a single click when you return back.<br><br>On your next visit, you can pay instantly using QuickPay -- no need to remember or painfully type your card details anymore and complete your payment in seconds!<br></div><div class="w50p floatr textr"><br><img src="../pgmerc/storecard/resources/images/demo/savecard_screen.html"> </div><br clear="all"><br clear="all">Read the <a href="../../qpfaqs.htm" target="_blank" id="QPfaq">QuickPay FAQ</a> or write to us at <a href="mailto:quickpay@billdesk.com">quickpay@billdesk.com</a> for any queries.<br>Already registered for QuickPay? <a href="javascript:void(0)" class="closebtn">Sign in to QuickPay</a>').hide();
	
	$("#popupHelper").fadeIn(1000);
	positionPopup();
});

// Close Popup
$(document).on( 'click', ".closebtn", function () { $("#popupHelper , .blackScreen").fadeOut(500); $('button').button('reset'); });
$(document).on( 'keydown', function ( e ) { if ( e.keyCode === 27 ) { $("#popupHelper , .blackScreen").fadeOut(500);  } });

$(document).on('click', ".btn-quickpay", function () { $("#popupHelper , .blackScreen").fadeOut(500); 
			$("ul.tabs li:first, div.tab_content").eq(0).removeClass('active bd-tabs-active');
			$("div.tab_content").eq(0).hide(); $('ul.tabs span.otheroption').hide(); $("div.tab_content").eq(1).addClass("active bd-tabs-active").show();
			$("ul.tabs li").eq(1).addClass("active bd-tabs-active").show();
			$("#tab2").find('select#txtBankIDCC').prop('value','CARD-'+qpProdId);
			BDPG.GenerateCardForm();  BDPG.AllowStoreCard();
			document.form1.txtBankID.value = "CARD";	document.form1.txtItemCode.value = qpProdId;
});
// ends here



/*
 * Global variables. If you change any of these vars, don't forget
 * to change the values in the less files!
*/
var left_side_width = 220; //Sidebar width in pixels
$(function() {
    "use strict";

   //Enable sidebar toggle
    $("[data-toggle='offcanvas']").click(function(e) {
        e.preventDefault();
	
		//if ( $(window).width() <= 640) { $(".container").css('height','').height( $(document).height()-65); }
   //If window is small enough, enable sidebar push menu
        if ($(window).width() <= 992) {
            $('.row-offcanvas').toggleClass('active');
            $('.left-side').removeClass("collapse-left");
            $(".right-side").removeClass("strech");
            $('.row-offcanvas').toggleClass("relative");
			$('.parametersection').show();
        } else {
            //Else, enable content streching
            $('.left-side').toggleClass("collapse-left");
            $(".right-side").toggleClass("strech");
        }
    });
});


$("a[data-toggle=popover] , i[data-toggle=popover] , input[data-toggle=popover] , abbr[data-toggle=popover]").popover();



$(document).on('click','div.modal-dialog.modal-sm div.modal-content div.modal-header button.close', function() { 
	$('input[name=paymentid], input[name=txtItemCode], input[name=txtBankID], input[id^=cb]').val('');
	$('button').button('reset');
})

//$(document).on('click','div#quickpayList.list-group a.list-group-item div.card', function() { var $name = $(this).attr('name'); PopulateModel($name); return false; });
//$(document).on('click','div#quickpayList.list-group a.list-group-item div.bank', function() { PopulateModelBank(); return false; });
//$(document).on('click','ul.tabs.sidebar-menu button#qpPopupAnchor', function() { PopulateLoginModel(); return false; });

function PopulateModel($name){
	
	$('div.modal').html('').attr('id','CVV');
	var ModelContent = '<div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><h4 class="modal-title" id="myModalLabel"><img src="../../../../pgmerc/vodafone/quickpay/resources/images/icon_quickpay.gif" align="absmiddle" width="23" height="25" alt=""> QuickPay</h4></div><div class="modal-body"><div class="form-group"><label for="cvvno">Enter CVV/ CVC / 4DBC </label><input type="password" class="form-control" id="'+$name+'" name="'+$name+'" maxlength="4"></div><button type="button" data-loading-text="<i class=\'fa bd-icon fa-fw\'></i>  Please wait..." class="col-xs-12 col-md-12 btn btn-lg btn-danger" id="cvvBtn" onclick="validateBDPGPayment()"><i class="fa bd-icon fa-fw"></i> Pay Now</button><div class="clearfix"></div></div></div></div>';
	$('div.modal').append(ModelContent);
	$('div#CVV.modal.fade.in div.modal-dialog.modal-sm div.modal-content div.modal-body div.form-group input.form-control').attr({'id':$name,'name':$name,'value':''});
	$('body').css('padding-right','0');
	$("#CVV").modal('show');
}

function PopulateModelBank(){ 
	$('div.modal').html('').attr('id','Bank');
	var ModelContent = '<div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><h4 class="modal-title" id="myModalLabel"><img src="../../../../pgmerc/vodafone/quickpay/resources/images/icon_quickpay.gif" align="absmiddle" width="23" height="25" alt=""> QuickPay</h4></div><div class="modal-body"><p>Please click on PAYNOW button to make your payment through Internet Banking</p><button id="bankBtn" type="button" data-loading-text="<i class=\'fa bd-icon fa-fw\'></i>  Please wait..." class="col-xs-12 col-md-12 btn btn-lg btn-danger" onclick="validateBDPGPayment()"><i class="fa bd-icon fa-fw"></i> Pay Now</button><div class="clearfix"></div></div></div></div>';
	$('div.modal').append(ModelContent);
	$('body').css('padding-right','0');
	$("#Bank").modal('show');
}


function PopulateCardList(){ 
	$('div.modal').html('').attr('id','DebitList');
	var ModelContent = '<div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><h4 class="modal-title" id="myModalLabel"> </h4></div><div class="modal-body"><p>Please click on PAYNOW button to make your payment through Internet Banking</p><button type="button" data-loading-text="<i class=\'fa bd-icon fa-fw\'></i>  Please wait..." class="col-xs-12 col-md-12 btn btn-lg btn-danger" onclick="validateBDPGPayment()">Pay Now</button><div class="clearfix"></div></div></div></div>';
	$('div.modal').append(ModelContent);
	$('body').css('padding-right','0');
	$("#DebitList").modal('show');

}


/****** Reflect Popular Bank selection in Bank DropDown **********/
$("div#BankLogo label input[name=netbank]").on("change",function(){ $("select[id=txtBankIDBK]").val($(this).val()).change(); });

$("input[name=payoption]").on("change",function(){ 
	var selectedPayOption = $(this).val();									// get selected option value
	document.form1.paymentMode.value = $(this).attr('id')					// set PaymentMode
	document.form1.txtBankID.value = selectedPayOption.split('-')[0]		// set bankid
	document.form1.txtItemCode.value = selectedPayOption.split('-')[1]		// set product id
	
	if(selectedPayOption.split('-')[0] == "273" ) { 
		$('#tab5 p.rewards_msg').html('You can now pay your Vodafone bill with PAYBACK points. Select PAYBACK points among the payment options to redeem them now!');
		return false;
	}
	if(selectedPayOption.split('-')[0] == "CIT" ) { 
		$('#tab5 p.rewards_msg').html('Your credit card must have a minimum of 250 points to be eligible for redemption. 100 points of Citibank Rewards/IndianOil Citibank Platinum or Titanium Card = Rs. 40; and 100 points of Citibank Ultima Card = Rs. 100.For detailed T&amp;Cs, please <a href="#">click here</a>.');
		return false;
	}
	
});



/****** Use New CARD **********/
$(document).on('click','p.addnewcard a', function() {
	$(".tab_content").hide();
	$("div.tab_content").eq(0).hide();
	$("ul.tabs li:first, div.tab_content").eq(0).removeClass('active bd-tabs-active');
	$('#ExitisingUserSection input[id=cvv2]').remove();
	
	$("ul.tabs li").eq(1).addClass("active bd-tabs-active").show();
	$("#main-container div.tab_content").eq(1).addClass("active bd-tabs-active").show();
	
	blockName = 'tab2'; BDPG.GenerateCardForm(); BDPG.AllowStoreCard(); document.form1.txtBankID.value = "CARD";	document.form1.txtItemCode.value = qpProdId;
	BDPG.showSec('proceedForm'); BDPG.showSec('goBack');
})

var DebitTypeID = "";
$('div#accordion div.panel h4.panel-title').on('click', function() {
	$(this).find('input[type=radio]').prop('checked', true);
 	DebitTypeID = $(this).find('input[type=radio]').attr('id'); 
	$(".tab_content").find('select[id^="txtBankID"]').prop('value','0');
	
	if(DebitTypeID == "VisaMaster") {
		$('#vmm').find('#cardfm, #checkBoxSection').remove(); 
		document.form1.txtBankID.value = "CARD"; document.form1.txtItemCode.value = qpProdId;
		BDPG.GenerateCardForm();  BDPG.AllowStoreCard();
	}
	if(DebitTypeID == "ATM") {
		$('#collapseTwo').find('#cardfm, #checkBoxSection').remove();
		document.form1.txtBankID.value = ""; document.form1.txtItemCode.value = qpProdId; 
	}
	if(DebitTypeID == "Rupay") { 
		document.form1.txtBankID.value = "URP"; document.form1.txtItemCode.value = qpProdId; 
	}
})


// Show Store Card Block	
BDPG.AllowSICCConfig = function() {
$('#checkBoxSICCSection').remove();
var checkBoxdata = '<div id="checkBoxSICCSection" class="panel panel-success"><div class="panel-heading checkbox"><label><input type="checkbox" name="autopay" id="autopay" value=""> STANDING INSTRUCTION <span style="color:#4B555F;">I wish to make this payment and expressly consent to my subsequent payments to the above entity also being charged to my above card on a recurring basis.</span></label></div></div>';
if (blockName == "tab2") { blockName = "cccard"; }
if(isSICCAllowed) {
	$('#tab2').append(checkBoxdata);
 }
}

// EMI Calculation Function start here
var pv = document.form1.msg.value.split('|')[3]; var rate; var tenure; var rateMonthly; var rateMonthly100; 
function emicalc(rate,tenure){
var fv=0; var type=0; if (!fv) fv = 0; if (!type) type = 0;

if (rate == 0) { //rate = rate/1200;
      pmt= (pv + fv)/tenure; rateMonthly = 0; rateMonthly100 = 0;
} else {
      rateMonthly = Math.round((rate/12)*100)/100.00; 
      rateMonthly100 = rate/1200; var pvif = Math.pow(1 + rateMonthly100, tenure); var pmt = rateMonthly100 / (pvif - 1) * -(pv * pvif + fv);
      pmt = pmt*-1; if (type == 1) { pmt /= (1 + rateMonthly100); };
      rateMonthly100 = Math.round(rateMonthly100*100)/100.00;
}

pmtvalue = Math.round(pmt * 100) / 100.00; var totalAmount = Math.round(pmt*tenure*100)/100.00; var interestPaid = Math.round((totalAmount-pv)*100)/100.00
var str1 = pv; pmtvalue = pmtvalue.toString(); totalAmount = totalAmount.toString(); interestPaid = interestPaid.toString();

///// Set Calculated value
$("#amount").text(str1); $("#tenure").text(tenure); $("#aintrte").text(rate); $("#emiamt").text(pmtvalue); $("#paidamt").text(totalAmount); $("#intpaid").text(interestPaid);
}


/*  EMI Calculation															*\
\****************************************************************************/	
BDPG.EvaluateEMI = function(txtBankID) {
	$('.emiSection').hide();
	
	var txtBKValue = document.form1.txtBankID.value;
	
	bnkTenure = { HDF:'3,6,9,12',	CMP:'3,6,9,12',		CIT:'3,6,9,12',		HCC:'3,6,9,12', 	EPG:'3,6,9,12',		SBI:'3,6,9,12',		KTK:'3,6,9,12',	SCB:'3,6,9,12', AXS:'3,6,9,12', HSB:'3,6,9,12' }
	bnkiRate =  { HDF:'12,12,13,13',CMP:'12,12,15,15',	CIT:'12,12,15,15',	HCC:'12,12,13,13',	EPG:'13,13,13,13',  SBI:'14,14,14,14',	KTK:'12,12,14,14',SCB:'13,13,14,14',AXS:'12,12,13,13', HSB:'12.50,12.50,13.50,13.50' }
	
	// Loop to GET Bank Tenure : tmpTenure
	var tempBK = txtBKValue; var tmpTenure = "";
	for(var txtBKValue in bnkTenure) {
		if (txtBKValue.match(tempBK)) { var txtBKValue = txtBKValue.match(tempBK); tmpTenure = bnkTenure[txtBKValue]; } // Bank Tenure value in var tmpTenure;
	}
	
	// Loop to GET Bank Interest Rate : tmpRate
	for(var txtBKValue in bnkiRate) {
		if (txtBKValue.match(tempBK)) { txtBKValue = txtBKValue.match(tempBK); tmpRate = bnkiRate[txtBKValue]; } // Bank Tenure value in var tmpTenure;
	}
	
	if(!tmpRate) { alert('Currently, EMI option for selected Banks is not present.'); return false; }
	
	$('.emiSection').show(); $('.emiSection table.table').remove();
$('.emiSection').append('<table width="100%" cellpadding="0" border="0" cellspacing="0" class="table" ><thead><tr><th width="45"><img src="../pgmerc/bdqp/resources/images/tick.png"></th><th width="22%">EMI<br>Tenure</th><th width="22%">Bank Interest<br>Rate (%)</th><th>Monthly<br>Payment (EMI)</th><th>Total Bank<br>Interest Payable</th></tr></thead><tbody>');
	
	// For Loop in Arrays [bnkTenure , bnkiRate] to Calculate EMI
	var tmpRate = tmpRate.split(','); var tmpTenure = tmpTenure.split(',');
	$.each([tmpRate, tmpTenure], function(i) {
		$.each(this, function(i, v) { 
				calculateEMI(tmpTenure[i],v);								//console.log('tempCalVal '+tmpTenure[i] , v);
				
		});
		 return( false );
	});
}


var k = 0;
function calculateEMI(tenure,rate) {
	var TxnAmount = isTrnAmount;
	var numberOfMonths = tenure; var rateOfInterest = rate; var monthlyInterestRatio = (rateOfInterest/100)/12;
	
	var top = Math.pow((1+monthlyInterestRatio),numberOfMonths);
	var bottom = top -1; var sp = top / bottom;
	var emi = (TxnAmount * monthlyInterestRatio) * sp;
	var full = numberOfMonths * emi;
	var interest = Math.ceil(full - TxnAmount);
	
	for (var j=tenure;j<=numberOfMonths;j++){ k++
	setTimeout(function(){
      $('.emiSection table.table').append( "<tr><td><input type='radio' id='"+tenure+"EMI' value='"+tenure+"EMI' name='emiPlan'><label for='"+tenure+"EMI'><span></span></label></td><td>"+tenure+" months</td><td>"+rate+"%</td><td>Rs. "+Math.ceil(emi)+"</td><td>Rs. "+interest+"</td></tr>");
        }, j*100 )
	}
} // EMI Calculation ends here


// EMI Table functionality
$(document).on('click','.emiSection table.table tr, input[name=emiPlan]',function() {
	$('.emiSection table.table tr').removeClass('active'); 
	$('.emiSection table.table td input[id$=EMI]').removeAttr('checked'); 
	
	var emiType = $(this).find('input[name=emiPlan]').attr('id');
	$('input[name=txtItemCode]').val($(this).find('input[name=emiPlan]').attr('id'));
	$(this).find('input[id='+emiType+']').attr('checked',true);
	$(this).addClass('active');
});

$(document).on('click', 'input[name=emiPlan]', function() {
	$('.emiSection table.table tr').removeClass('active'); 
	$(this).closest( 'tr').addClass('active');
})
var emiBankID =new RegExp('^SBI|SCB|KTK|AXS|HSB$');
$('#txtBankIDEMI').change(function (){ if($(this).val().match(emiBankID)) $('input[name=txtBankID]').val(mercPriGate); });

$(document).on('click','.emiSection table.table tr, input[name=emiPlan]',function() {

if($('#txtBankIDEMI').val().match(emiBankID)) $('input[name=txtItemCode]').val($('#txtBankIDEMI').val() + $(this).find('input[name=emiPlan]').attr('id'));
	});
	
	
/*  Cancel Functionality													*\
\****************************************************************************/
function cancelForm() {
	$(document).find('#CancelTab input.form-control, #CancelTab textarea.form-control').prop('value','').attr('value','');
	$('input[name=fdOpt]').removeAttr('checked');
	$('#fdbContinue').attr('data-tab',$('ul.tabs li.active').find('a').attr('href').split('#')[1]); // setting up value to restore Orginal Tab
	$('.tab_content, .box-footer').hide(); $('#CancelTab').show();
	if ( $(window).width() <= 640) { $('.parametersection').hide(); $(".row-offcanvas-left").removeClass('active relative'); }
}
$(window).resize(function(){ if ( $(window).width() <= 640 && $('#CancelTab').css('display') == 'block') { $('.parametersection').hide();  } else { $('.parametersection').show(); } });

// Cancel -- Continue button
$(document).on('click', '#fdbContinue', function() { 
	var $thisId = $(this).attr('data-tab'); 
	$('.tab_content').hide(); $('#'+$thisId).show(); // Restore original Active Tab 
	$('.box-footer').show();
	if ( $(window).width() <= 640) { $('.tab_content').hide(); $('.parametersection').show(); $(".row-offcanvas-left").addClass('active relative'); }
	if($thisId == "tab1") { $('.box-footer').hide(); } if($thisId == "tab2") { BDPG.GenerateCardForm();  BDPG.AllowStoreCard(); }
})

// Cancel -- Abort button
$(document).on('click', '#fdbCancel', function() { 
 	$thisOptionSelected = $(this).attr('data-option');
	var regReason 	= RegExp("^[A-Za-z0-9\\-\\_!,@ ]{1,250}$");
	var regEmail 	= RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$");
	var regMobile 	= new RegExp("^[0-9]{10}$");
	
	
	var checkBoxes = $('input[name=fdOpt]'); var selected = false;
	for(i=0;i<checkBoxes.length;i++) { if(checkBoxes[i].checked) { selected = true; } }
	if(!selected) { alert('Please help us by selecting any one option from above reason for aborting this transaction.'); return false;	}
	
	
	if($thisOptionSelected == "other") { 
		if(document.form1.otherReason.value == "" || !document.form1.otherReason.value.match(regReason)) {
			alert('Please give us your feedback..'); document.form1.otherReason.focus();
			return false;
		} else {
			document.form1.cancel_reason.value=document.form1.otherReason.value;
		}
	}
	if(document.form1.custemail.value.length>0 && !document.form1.custemail.value.match(regEmail)){ 
		alert('Please provide enter a valid email id'); document.form1.custemail.focus(); return false;
	}
	if(document.form1.custmobile.value.length>0 && !document.form1.custmobile.value.match(regMobile)){ 
		alert('Please provide enter a valid mobile number'); document.form1.custmobile.focus(); return false;
	}
	else {
		if(document.form1.custemail.value =="") { document.form1.custemail.value = "NA" }
		if(document.form1.custmobile.value =="") { document.form1.custmobile.value = "NA" }
		
		document.form1.txtItemCode.value=qpProdId; document.form1.reqid.value="cc_cancelall"; if(baseURL[0] == "pgi") { baseURL[0] = "www";}
		document.form1.action="https://"+baseURL[0]+".billdesk.com/pgidsk/PGICommonGateway"; $('input[name=fdbCancel]').prop('disabled', 'disabled');
		document.form1.submit();
	}
})


$('input[name=fdOpt]').each(function() {
	$(this).on('touchstart click', function() {
	var _SelectedCheckBox = $("input[name=fdOpt]:checked").length;
	var _SelectedCheckBoxValue = $(this).val();
	$('#fdbCancel').attr('data-option',$(this).val());
	$('div.fdbfield').remove();
	
	if(_SelectedCheckBox !='0' ){
		$('input[name=fdOpt]').not(this).removeAttr('checked'); $('div.fdbfield').remove();	$('form').append('<div class="fdbfield"><div>');
		$('div.fdbfield').html('').append('<input type="hidden" name="cancel_reason" value="'+$(this).attr('value')+'">');
	} 
	if(_SelectedCheckBox !='0' && _SelectedCheckBoxValue =='other' ){ $('#otherReason').removeClass('disabled').removeAttr('disabled'); }
	else {
		$('#otherReason').addClass('disabled').attr('disabled','disabled');
		
	}
});
});