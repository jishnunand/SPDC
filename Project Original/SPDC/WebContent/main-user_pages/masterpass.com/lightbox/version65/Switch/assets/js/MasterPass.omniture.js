
var merchant = "";
var region = "";
var issuer = "";
var registrationType = "";
var channel = "MasterPass Wallet";
var pageName = "";
var siteSection = "lightbox";
var language="";
var siteType="";
function prepareData(){

	try{

        //make sure that this is the right frame - how are we accounting for that?
        //Can we get the source url from the fallback cases
		var pageUrl = location.href;

		// The below code has been put on to retrieve merchant name as per business doc given;
		//needs to be examined more on confirmation of query string comparison.

        //why are we not relying on the session variables?
        //we can also look into the parameter variables rather than pulling from the url
				if (pageUrl.indexOf("cmp=ilc-red.masterpass.marketing.issuer.") > 0) {
					merchant = pageUrl.substring(pageUrl.lastIndexOf('.') + 1, pageUrl.length);
				} else if (pageUrl.indexOf("cmp=ilc-red.masterpass.marketing.register.") > 0) {
					merchant = pageUrl.substring(pageUrl.lastIndexOf('.') + 1, pageUrl.length);
				} else if (pageUrl.indexOf("cmp=ilc-red.masterpass.checkout.") > 0) {
					merchant = pageUrl.substring(pageUrl.lastIndexOf('.') + 1, pageUrl.length);
				} else {
					merchant = MasterPass.session.merchant.name;
				}

	}catch(e){
		try{
            //Why is this a try catch?
			merchant = MasterPass.session.parameters.merchant_name;
		}catch(e){

		}
	}

	try{
		var selectedCountry = "";
		var countries = MasterPass.session.countries;
		if(countries !== undefined)
		{
			for(var i = 0; i < countries.length; i++) {
				if (countries[i].code === MasterPass.session.userLocale.country) {
					selectedCountry = countries[i].name;
					break;
				}
			}
		}

		if(selectedCountry !== undefined)
		{
			region = selectedCountry;
		}
	}catch(e){

	}

	try{
		issuer = MasterPass.session.parameters.walletId;
		registrationType = issuer;
	}catch(e){

	}

    //rename variables
	if(typeof s != "undefined")
	{
		s.prop11 = s.eVar18 = region;
		if (typeof region != "undefined")
		    s.prop56 = s.evar56 = region;
		if (typeof merchant != "undefined")
		    s.prop61 = s.evar61 = merchant;
		if (typeof issuer != "undefined")
		    s.prop62 = s.evar62 = issuer;
		if (typeof siteType != "undefined")
			s.prop57=s.eVar57= siteType;
	}


}


// how can this pass data into a more genericized message?




//client in two places
function tagCheckoutInitiated(merchant1, region1, issuer1){
	try{
		prepareData();

		region = region? region:region1;
		merchant = merchant? merchant:merchant1;
		issuer = issuer? issuer:issuer1;

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar38,events,products';
		s.linkTrackEvents='scCheckout';
		s.prop3 = s.eVar3='Check Out Action';
		s.prop4 =s.eVar4= 'Check Out Initiated';
		s.prop11 = s.eVar18 = region;
		s.events='scCheckout';
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.tl(true,'o','Merchant Check Out Initiated');
		s.events="";
	}catch(e){
        // log errors guys, come onnn
		//do nothing
	}
}


//unused
function tagLetsGoButton(emailOrPhone) {
	try {

		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,';
		s.prop3 =s.eVar3= 'Visitor Action';
		s.prop4=s.eVar4= 'Lets Go Button Click - '+ emailOrPhone;
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.tl(true,'o','Lets Go Button Click');
	} catch(e) {
		//do nothing
	}

}

//unused - Now auth

function signupInitiated() {

	try
	{
		prepareData();
		s.pageName = "Registration - Sign Up Initiated Page";
		s.prop3=s.eVar3="Registration Process";
		s.prop4=s.eVar4="Step 1";
		s.eVar13=issuer;
		s.events="event11";
		s.t();
		s.events="";

	} catch(e) {

	// do nothing
	}

}

//user info
function  tagUserInformation() {
	try
	{
		prepareData();
		s.pageName = "Registration - Tell us about yourself Page";
		s.prop3=s.eVar3="Registration Process";
		s.prop4=s.eVar4="Step 2";
		s.eVar13=issuer;
		s.t();

	} catch(e) {
		// do nothing
	}

}

//security info
function tagSecurityInfoPage() {
	try {
		prepareData();
		s.pageName = "Registration - Add Security Page";
		s.prop3=s.eVar3="Registration Process";
		s.prop4=s.eVar4="Step 3";
		s.eVar13=issuer;
		s.t();

	} catch(e) {
		// do nothing
	}

}

//payment card
function tagAddCardPage()
{
	try
	{
		prepareData();
		s.pageName = "Registration - Add Card Page";
		s.prop3=s.eVar3="Registration Process";
		s.prop4=s.eVar4="Step 4";
		s.eVar13=issuer;
		s.t();

	}
	catch(e)
	{
		// do nothing
	}

}

//security info
function tagOnSuccessfulSignUp()
{
	try
	{
		prepareData();
		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar13,eVar36,events';
		s.linkTrackEvents='event12';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 =s.eVar4= 'Registration Completed';
		s.prop11=s.eVar18=region;
		s.events="event12";
		s.eVar36=merchant;
		s.eVar38=issuer;
		s.eVar13=issuer;
		s.tl(true,'o','Registration Completed');
		s.events="";
		s.eVar3=s.eVar4=s.prop3=s.prop4="";
	}
	catch(e)
	{
		//do nothing
	}

}


//unused
function tagAddCardCompletion()
{
	try
	{
		prepareData();
		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,eVar38,events';
		s.linkTrackEvents='event40';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 =s.eVar4= 'Card Add - Completed';
		s.prop11=s.eVar18=region;
		s.events='event40';
		s.eVar36=merchant;
		s.eVar38=issuer;
		s.tl(true,'o','Card Add - Completed');
		s.events="";
	}
	catch(e)
	{
		//do nothing
	}

}




//authentication js
function signInLink(emailOrPhone){
	try{
		prepareData();
		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,eVar38,events';
		s.linkTrackEvents='event2';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 =s.eVar4= 'Sign In Completed';
		s.prop11=s.eVar18=region;
		s.events='event2';
		s.eVar36=merchant;
		s.eVar38=issuer;
		s.tl(true,'o','Sign In Completed');
		s.events="";
		s.eVar3=s.eVar4=s.prop3=s.prop4="";
	}catch(e){
		//do nothing
	}

}

//FLOWS REMOVED back in loyalty Card

function tagAddLoyaltyCardbuttonInitiated(){
	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36';
		s.prop3=s.eVar3= 'Visitor Action';
		s.prop4=s.eVar4= 'Gift or Loyalty Card addition - Initiated';
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.tl(true,'o','Gift Card addition - Initiated');
	}catch(e){
		//do nothing
	}

}

//loyalty card
function tagAddLoyaltyCardbuttonCompleted(){

	try{

		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,events';
		s.linkTrackEvents='event40';
		s.prop3=s.eVar3= 'Visitor Action';
		s.prop4=s.eVar4= 'Gift or Loyalty Card addition - Completed';
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.events="event40";
		s.tl(true,'o','Gift Card addition - Completed');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//shoppingcart button
function tagShoppingCartView(){


	try{

		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,events,products';
		s.linkTrackEvents='scView';
		s.prop3 =s.eVar3= 'Check Out Action';
		s.prop4 = s.eVar4=' Shopping Cart Viewed';
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.events="scView";
		s.tl(true,'o','Shopping Cart Viewed');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//unused
function tagShoppingCartItemAdditon(){


	try{

		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,events,products';
		s.linkTrackEvents='scAdd';
		s.prop3 =s.eVar3= 'Check Out Action';
		s.prop4 =s.eVar4= ' Shopping Cart Item Added';
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.events="scAdd";
		s.tl(true,'o','Shopping Cart Item Added');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//unused
function tagShoppingCartItemRemoval(){


	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,events,products';
		s.linkTrackEvents='scRemove';
		s.prop3 = s.eVar3= 'Check Out Action';
		s.prop4 =s.eVar4= ' Shopping Cart Item Removed';
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.events="scRemove";
		s.tl(true,'o','Shopping Cart Item Removed');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//dashboard
function tagCheckoutComplete(){


	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,events,products';
		s.linkTrackEvents='purchase';
		s.prop3 = s.eVar3= 'Check Out Action';
		s.prop4 =s.eVar4= 'Check Out Completed';
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.events="purchase";
		s.tl(true,'o','Check Out Completed');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//unused
function tagGetConnectedButtonClick(){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,events';
		s.prop3 =s.eVar3= 'Visitor Action';
		s.prop4= s.eVar4= 'Get Connected Button Click';
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.tl(true,'o','Get Connected Button Click');
	}catch(e){
		//do nothing
	}

}


//chooseWallet REMOVED
function tagMerchantRegistrationInitialized(){


	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar13,eVar36,events';
		s.linkTrackEvents='event11';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 =s.eVar4= 'Registration Initiated';
		s.prop11 = s.eVar18 = region;
		s.events="event11";
		s.eVar13='Merchant Registration';
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.tl(true,'o','Registration Initiated');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//commented security info
function tagMerchantRegistrationComplete(){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar13,eVar36,events';
		s.linkTrackEvents='event12';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 =s.eVar4= 'Registration Completed';
		s.prop11 = s.eVar18 = region;
		s.events="event12";
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.eVar13='Merchant Registration';
		s.tl(true,'o','Registration Completed');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//unused

function tagClicksOnLinks(linkName){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 = s.eVar4 = linkName +' - Clicked';
		s.prop11 = s.eVar18 = region;
		s.tl(true,'o', linkName +' - Clicked');
	}catch(e){
		//do nothing
	}

}

//change wallet notification
function tagFooterLinkClicks(linkName){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 = s.eVar4 = linkName +' - Clicked';
		s.prop11 = s.eVar18 = region;
		s.tl(true,'o', linkName +' - Clicked');
	}catch(e){
		//do nothing
	}

}

//For Wallet registrations from Marketing sites
//unused
function tag3rdPartyMasterPassWalletLink(){


	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar36,events';
		s.prop3= s.eVar3 = 'Visitor Action';
		s.prop4= s.eVar4 = '3rd Party - Wallet Selector Display Initialized';
		s.prop11 = s.eVar18 = region;
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.tl(true,'o','3rd Party - Wallet Selector Display Initialized');
	}catch(e){
		//do nothing
	}

}


//client.js REMOVED
function tag3rdPartyRegistrationInitialized(){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar13,eVar36,events';
		s.linkTrackEvents='event11';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 = s.eVar4= 'Registration Initiated';
		s.prop11 = s.eVar18 = region;
		s.events="event11";
		s.eVar13='3rd Party Registration';
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.tl(true,'o','Registration Initiated');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//commented security info
function tag3rdPartyRegistrationComplete(){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar13,eVar36,events';
		s.linkTrackEvents='event12';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 = s.eVar4= 'Registration Completed';
		s.prop11 = s.eVar18 = region;
		s.events="event12";
		s.eVar36 = merchant;
		s.eVar38 = issuer;
		s.eVar13='3rd Party Registration';
		s.tl(true,'o','Registration Completed');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//For Wallet registrations from Issuer sites
//unused
function tagIssuerSiteMasterPassWalletLink(){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,events';
		s.prop3 =s.eVar3= 'Visitor Action';
		s.prop4 =s.eVar4= 'Issuer Site - Wallet Selector Display Initialized';
		s.prop11 = s.eVar18 = region;
		s.eVar38 = issuer;
		s.tl(true,'o','Issuer Site - Wallet Selector Display Initialized');
	}catch(e){
		//do nothing
	}

}

//chooseWallet REMOVED
function tagIssuerSiteRegistrationInitialized(){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar13,eVar36,events';
		s.linkTrackEvents='event11';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 = s.eVar4= 'Registration Initiated';
		s.prop11 = s.eVar18 = region;
		s.events="event11";
		s.eVar13='Issuer Site Registration';
		s.eVar38 = issuer;
		s.tl(true,'o','Registration Initiated');
		s.events="";
	}catch(e){
		//do nothing
	}

}

//commented securityInfo
function tagIssuerSiteRegistrationComplete(){

	try{
		prepareData();

		s.linkTrackVars='prop3,prop4,eVar3,eVar4,eVar13,eVar36,events';
		s.linkTrackEvents='event12';
		s.prop3 = s.eVar3='Visitor Action';
		s.prop4 = s.eVar4= 'Registration Completed';
		s.prop11 = s.eVar18 = region;
		s.events="event12";
		s.eVar13='Issuer Site Registration';
		s.eVar38 = issuer;
		s.tl(true,'o','Registration Completed');
		s.events="";
	}catch(e){
		//do nothing
	}

}

function tagPage(pageName)
{
	try
	{
		prepareData();
		s.pageName=pageName;
		s.language=language;
		s.t();
	}
	catch(e)
	{
		//do nothing
	}

}


//unused
function signUpandSignInPageTag(checkoutFlag,pageName)
{
	var scriptStr = "";
	var scriptStringsrc= "";
	prepareData();
	try
	{
		    scriptStr += 'var pageName = '+'\"'+ pageName + '\" ;';
		    scriptStr += 'var checkout = '+'\"'+ checkoutFlag + '\" ;';
			scriptStr += 'var merchant='+'\"'+ merchant + '\"; ';
			scriptStr += 'var issuer='+'\"' + issuer + '\" ;';
			scriptStr += 'var region= \"' + region + '\" ;';
			scriptStr += 'var channel = \"MasterPass Wallet\" ;';
			scriptStr += 'var siteSection = \"lightbox\" ;';
			scriptStr += 'var registrationType = '+'\"'+ issuer + '\" ;';
			scriptStr += 'var amc=amc||{};if(!amc.on){amc.on=amc.call=function(){}};';
			 var script = document.createElement( 'script' );
		     script.src = "//www.adobetag.com/d2/v2/ZDItbWFzdGVyY2FyZC0yODkwLTE5Mzkt/amc.js";
		     $('body').append( script );



	}
	catch(e)
	{
		// do nothing
	}

}
function pageTag(pageContent) {

	var scriptStr = "";
	prepareData();
	try{
		 scriptStr += 'var pageName = '+'\"'+ pageContent.pageName + '\" ;';
		 scriptStr += 'var checkout = '+'\"'+ pageContent.checkout + '\" ;';
		 scriptStr += 'var sitesection='+'\"' + pageContent.siteName + '\" ;';
		 scriptStr += 'var registrationType='+'\"' + issuer + '\" ;';
		 scriptStr += 'var merchant='+'\"'+ merchant + '\"; ';
		 scriptStr += 'var issuer='+'\"' + issuer + '\" ;';
		 scriptStr += 'var region= \"' + region + '\" ;';
		 scriptStr += 'var channel = \"MasterPass Wallet\" ;';
	}catch(e){
		console.log("Page Tag Exception : "+e);
	}

	return scriptStr;
}

function appendPageTag($root, pageContent){
	try{
    	var omnitureScript = document.createElement('script');
     	omnitureScript.id = "omniturePageTag";
        omnitureScript.type = "text/javascript";
        omnitureScript.text =pageTag(pageContent);
        $root.closest( "body" ).find("#omniturePageTag").remove();
        $root.closest( "body" ).append(omnitureScript);

    }catch(e){
    	//Do nothing
    }
}

function whiteLabelSignUpandSignInPageTag($root, pageContent){

	try{
    	var omnitureScript = document.createElement('script');
     	omnitureScript.id = "omniturePageTag";
        omnitureScript.type = "text/javascript";
        omnitureScript.text =pageWhitLabelTag(pageContent);
        $root.closest( "body" ).find("#omniturePageTag").remove();
        $root.closest( "body" ).append(omnitureScript);

    }catch(e){
    	//Do nothing
    }
}

function pageWhiteLabelTag(pageContent) {

	var scriptStr = "";
	prepareData();

	region = region? region:pageContent.region;
	pageName=pageName?pageName:pageContent.pageName;
	siteType=siteType?siteType:pageContent.siteType;
	language=language?language:pageContent.language;

	try{
		 scriptStr += 'var pageName = '+'\"'+pageName + '\" ;';
		 scriptStr += 'var checkout = '+'\"'+ pageContent.checkout + '\" ;';
		 scriptStr += 'var sitesection='+'\"' + pageContent.siteName + '\" ;';
		 scriptStr += 'var siteType='+'\"' + siteType + '\" ;';
		 scriptStr += 'var registrationType='+'\"' + issuer + '\" ;';
		 scriptStr += 'var merchant='+'\"'+ merchant + '\"; ';
		 scriptStr += 'var issuer='+'\"' + issuer + '\" ;';
		 scriptStr += 'var region= \"' + region + '\" ;';
		 scriptStr += 'var language= \"' + language + '\" ;';
		 scriptStr += 'var channel = \"MasterPass\" ;';
	}catch(e){
		console.log("Page Tag Exception : "+e);
	}

	return scriptStr;
}
