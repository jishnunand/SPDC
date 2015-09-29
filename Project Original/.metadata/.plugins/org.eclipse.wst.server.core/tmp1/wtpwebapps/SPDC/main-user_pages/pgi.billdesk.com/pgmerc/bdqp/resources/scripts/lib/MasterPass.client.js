(function () {

	function isArray(value) {
		return value instanceof Array;
	}

	function isFunction(value) {
		return typeof value === 'function';
	}

	function isString(value) {
		return typeof value === 'string' || value instanceof String;
	}

	window.MasterPass = window.MasterPass || {};
	MasterPass.client = (function () {
		var lightbox = !!window.postMessage;
		var inProgress;
		var closeButton;
		var modal;
		var initialUrl;
		var frame;
		var overlay;
		var globalSettings;
		var myOrigin = window.location.protocol + '//' + window.location.hostname + (window.location.port ? ':' + window.location.port : '');
		var switchOrigin = 'https://masterpass.com/';
		var switchUrl = 'https://masterpass.com/lightbox/version65/Switch/index.html';
		var buyWithMasterPassImage = '../../../../../masterpass.com/lightbox/version65/Switch/integration/MasterPass.checkout.png';
		var buyWithMasterPass = 'Buy with MasterPass';
		var connectWithMasterPassImage = '../../../../../masterpass.com/lightbox/version65/Switch/integration/MasterPass.connect.png';
		var connectWithMasterPass = 'Connect with MasterPass';
		var originalMetaTag = '';
		var initStylesComplete = false;
		var head = document.getElementsByTagName('head')[0];
	    var script = document.createElement('script');
	    script.type = 'text/javascript';
	    script.src = "../../../../../masterpass.com/lightbox/version65/Switch/assets/js/MasterPass.omniture.js";
	    head.appendChild(script);
		function getInitSettings(flow, options) {
			var settings = {};
			
			if (isArray(options.allowedCardTypes)) {
				settings.allowedCardTypes = options.allowedCardTypes;
			}
			else if (isString(options.allowedCardTypes)) {
				settings.allowedCardTypes = [options.allowedCardTypes];
			}

			if (isArray(options.allowedLoyaltyPrograms)) {
				settings.allowedLoyaltyPrograms = options.allowedLoyaltyPrograms;
			}
			else if (isString(options.allowedLoyaltyPrograms)) {
				settings.allowedLoyaltyPrograms = [options.allowedLoyaltyPrograms];
			}

			if (isArray(options.allowedShipToCountries)) {
				settings.allowedShipToCountries = options.allowedShipToCountries;
			}
			else if (isString(options.allowedShipToCountries)) {
				settings.allowedShipToCountries = [options.allowedShipToCountries];
			}
			
			if (isString(options.shippingLocationProfile)) {
				settings.shippingLocationProfile = options.shippingLocationProfile;
			}


			if (options.callbackUrl) {
				settings.callbackUrl = options.callbackUrl;
			}

            if (options.returnUrl) {
                settings.merchant_return_url = options.returnUrl;
            }


            if (isFunction(options.cancelCallback)) {
				settings.cancelCallback = options.cancelCallback;
			}

			if (isFunction(options.failureCallback) && isFunction(options.successCallback) && window.postMessage) {
				settings.enhancedCallback = true;
				settings.failureCallback = options.failureCallback;
				settings.successCallback = options.successCallback;
			}

			settings.flow = flow;

			if (options.locale) {
				settings.locale = options.locale;
				var localeArray = options.locale.split('-');
				if(localeArray.length === 1){
					settings.locale = options.locale;	
				}else{
					settings.locale = localeArray[0]+'-'+localeArray[1].toUpperCase();	
				}
			}

			if (options.merchantCheckoutId) {
				settings.merchantCheckoutId = options.merchantCheckoutId;
			}

			if (options.precheckoutTransactionId) {
				settings.precheckoutTransactionId = options.precheckoutTransactionId;
			}

			if (options.cardId && flow === 'checkout') {
				settings.cardId = options.cardId;
			}

			if (options.loyaltyEnabled && flow === 'checkout') {

				settings.loyaltyEnabled = options.loyaltyEnabled;
			}
			
			
			if ( flow === 'checkout') {
				//Omniture Tagging While Checkout Initiated
                if(options.walletId){
                 settings.merchantId = options.walletId;
				tagChecoutInitiated(options.merchantName, options.locale, options.walletId);
                }else if(options.walletName){
                    settings.merchantId = options.walletName;
                    tagChecoutInitiated(options.merchantName, options.locale, options.walletName);
                }
			}
			
			
			if (options.suppressShippingAddressEnable && flow === 'checkout') {

				settings.suppressShippingAddressEnable = options.suppressShippingAddressEnable;
			}

			if (options.loyaltyId) {
				settings.loyaltyId = options.loyaltyId;
			}

			if (options.shippingId) {
				settings.shippingId = options.shippingId;
			}			

			if (options.requestBasicCheckout) {
				settings.requestBasicCheckout = true;
			}

			if (isArray(options.requestedDataTypes)) {
				settings.requestedDataTypes = options.requestedDataTypes;
			}
			else if (isString(options.requestedDataTypes)) {
				settings.requestedDataTypes = [options.requestedDataTypes];
			}

			if (options.requestExpressCheckout) {
				settings.requestExpressCheckout = true;
			}

			if (options.requestPairing || flow === 'connect') {
				settings.requestPairing = true;
			}

			if (options.requestToken) {
				settings.requestToken = options.requestToken;
			}

            if (options.version) {
                settings.version = options.version;
            }
			
			if (options.pairingRequestToken) {
				settings.pairingRequestToken = options.pairingRequestToken;
                if (flow === 'connect') {
                    settings.requestToken = options.pairingRequestToken;
                }
			}
			
			if (options.silentPairing) {
				settings.silentPairing = options.silentPairing;
			}
			
			if (options.requireShippingDestination === false) {
				settings.requireShippingDestination = false;
			}
			else if (flow === 'checkout') {
				settings.requireShippingDestination = true;
			}

			settings.targetOrigin = myOrigin;

			if (options.walletId) {
				settings.walletId = options.walletId;
			}

            if (options.walletName) {
                settings.walletId = options.walletName;
            }

            if(options.consumerWalletId && (flow === 'checkout' || flow === 'card-security' || flow === 'add-shipping-address' || flow === 'add-payment-method' || flow === 'add-loyalty-program')) {
                settings.consumerWalletId = options.consumerWalletId;
            }

			globalSettings = settings;

			return settings;
		}

		function buildQueryString(settings) {
			var parameters = [];

			for (var key in settings) {
				if (settings.hasOwnProperty(key)) {
					if (isArray(settings[key])) {
						parameters.push(key + '=' + encodeURIComponent(settings[key].join(',')));
					}
					else if (!isFunction(settings[key])) {
						parameters.push(key + '=' + encodeURIComponent(settings[key]));
					}
				}
			}

			return '?' + parameters.join('&');
		}

		function executeFlow(settings) {
			if (inProgress) {
				settings.failureCallback();
				return;
			}

			initStyles();
			initFrame(settings);

			document.getElementsByTagName('body')[0].className += ' MasterPass_modal-open';

			inProgress = true;
		}

		function initStyles() {
			if (!initStylesComplete) {
				document.getElementsByTagName('head')[0].appendChild(buildStyle());
				initStylesComplete = true;
			}
		}

        function initFrame(settings) {
            var src = switchUrl + buildQueryString(settings);

            if (!window.postMessage || self != top 
            	|| navigator.userAgent.match(/iPhone/i) 
            	|| navigator.userAgent.match(/iPod/i)
            	|| navigator.userAgent.match(/iPad/i) 
            	|| (navigator.userAgent.match(/Android/i) 
            		&& navigator.userAgent.match(/Mobile/i))) {
                //Older browser that doesn't support postMessage will go full screen, or if the client script is framed
                window.location = src;
            } else {
                overlay = buildOverlay();
                document.body.appendChild(overlay);
                frame = buildFrame(src);
                document.body.appendChild(frame);
            }
            bindEvents();
        }

		function buildStyle() {
			var element = document.createElement('link');
			element.setAttribute('rel', 'stylesheet');
			element.setAttribute('href', '../../../../../masterpass.com/lightbox/version65/Switch/integration/MasterPass.client.css');
			return element;
		}

		function buildOverlay() {
			var element = document.createElement('div');
			element.id = 'MasterPass_overlay';
			return element;
		}

		function buildFrame(src) {
			var element = document.createElement('div');
			element.id = "MasterPass_container";
			var html = '<iframe id="MasterPass_frame" name="MasterPass_frame" allowTransparency="true" frameborder="0" src="' + src + '"></iframe>';
			element.innerHTML = html;

			return element;
		}

		/***********************************************
		 Event related functions
		************************************************/
		function cancelMasterPass() {
			dispose();
		}

		// Bind all events
		function bindEvents() {
			if (window.addEventListener) {
				window.addEventListener('message', onMessage, false);
			} else if (window.attachEvent) {
				window.attachEvent('onmessage', onMessage);
			}
		}

		function dispose() {
			removeModal();
			unbindEvents();
			inProgress = false;
		}

		function removeModal() {
			document.body.removeChild(frame);
			document.body.removeChild(overlay);
			document.getElementsByTagName('body')[0].className = document.getElementsByTagName('body')[0].className.split(' MasterPass_modal-open').join('');
		}

		// Unbind all events
		function unbindEvents() {
			if (window.removeEventListener) {
				window.removeEventListener('message', onMessage, false);
			} else if (window.detachEvent) {
				window.detachEvent('onmessage', onMessage);
			}
		}

		function register(options) {
			
			//Omniture Tagging when 3rd Party Registration Initialized
            tag3rdPartyRegistrationInitialized();
			
			executeFlow(getInitSettings('register', options));
		}
		function manage(options) {
			executeFlow(getInitSettings('manage', options));
		}
		function checkout(options) {
			
			executeFlow(getInitSettings('checkout', options));
		}
		function connect(options) {
			executeFlow(getInitSettings('connect', options));
		}
		function addPaymentMethod(options) {
			executeFlow(getInitSettings('add-payment-method', options));
		}
		function addShippingAddress(options) {
			executeFlow(getInitSettings('add-shipping-address', options));
		}
		function cardSecurity(options) {
			executeFlow(getInitSettings('card-security', options));
		}

		function checkoutButton(options) {
			// Create button
			var checkoutButton = buildCheckoutButton(options.element);

			// Call checkout on click
			checkoutButton.onclick = function (e) {
				checkout(options);
				e = e || window.event;
				e.preventDefault ? e.preventDefault() : e.returnValue = false;
			};

			var checkoutElement = document.getElementById(options.element);
			checkoutElement.appendChild(checkoutButton);
		}

		function buildCheckoutButton(elementId) {
			var element = document.createElement('div');
			var logoHTML = '<div><img src="' + buyWithMasterPassImage + '" alt="' + buyWithMasterPass + '"/></div>';
			element.innerHTML = '<a href="#">' + logoHTML + '</a>';

			return element;
		}

		function connectButton(options) {
			// Create button
			var connectButton = buildConnectButton(options.element);

			// Call connect on click
			connectButton.onclick = function (e) {
				connect(options);
				e = e || window.event;
				e.preventDefault ? e.preventDefault() : e.returnValue = false;
			};

			var connectElement = document.getElementById(options.element);
			connectElement.appendChild(connectButton);
		}

        function _getOrigin(event) {
            if (event.origin) {
                return event.origin;
            }
            if (event.originalEvent && event.originalEvent.origin) {
                return event.originalEvent.origin;
            }
            if (event.uri) {
                return getLocation(event.uri);
            }
            if (event.originalEvent && event.originalEvent.uri) {
                return event.originalEvent.uri;
            }
            if (event.domain) {
                return location.protocol + "//" + event.domain;
            }
            if (event.originalEvent && event.originalEvent.domain) {
                return location.protocol + "//" + event.originalEvent.domain;
            }
            //console.log("No origin available.");
            return "";
        }

		function buildConnectButton(elementId) {
			var element = document.createElement('div');
			var logoHTML = '<div><img src="' + connectWithMasterPassImage + '" alt="' + connectWithMasterPass + '"/></div>';
			element.innerHTML = '<a href="#">' + logoHTML + '</a>';

			return element;
		}
		
		function appendMetaTag(){
        	originalMetaTag = jQuery('meta[name=viewport]')[0];
			var cssElement = '<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">';
			jQuery(document).find('head').append(cssElement);
			jQuery('body').css('overflow-y','hidden');
		} 

        function removeMetaTag() {
			jQuery('meta[name=viewport]').remove();
			jQuery(document).find('head').append(originalMetaTag);
			jQuery('body').css('overflow-y','auto');
		}

		// If lightbox supported, receive and handle responses from switch
		if (lightbox) {
			function onMessage(event) {
                var origin = _getOrigin(event);
				if (origin === switchOrigin) {
					var message = JSON.parse(event.data);
                    var disposeWindow = true;
					if (message) {
                        if (message.mpstatus === 'success' && globalSettings.successCallback) {
                            globalSettings.successCallback(message);
                        } else if (message.mpstatus === 'failure') {
                            if (globalSettings.failureCallback) {
                                globalSettings.failureCallback(message);
                            } else {
                                delete globalSettings.callbackUrl;
                            }
                        } else if (message.mpstatus === 'cancel') {
                            delete globalSettings.callbackUrl;
                        } else if (message.mpstatus === 'originRequest') {
                            // Respond to a ping request for frame-busting protection
                            var eventSource = event.source;
                            if(self == top) {
                                // Only respond if we are the top window
                                setTimeout(function() {
                                    eventSource.postMessage(JSON.stringify({
                                        status: 'originResponse'
                                    }), origin);
                                }, 10);
                            }
                            disposeWindow = false;
						} else if (globalSettings.callbackUrl) {							
								var querystring = '';
								var parameters = [];
								var redirectUrl = globalSettings.callbackUrl;
								for (var key in message) {
									if (message.hasOwnProperty(key)) {
										parameters.push(encodeURIComponent(key) + '=' + encodeURIComponent(message[key]));
									}
								}
								querystring = parameters.join('&');
								redirectUrl += ((redirectUrl.indexOf('?') !== -1) ? '&' : '?') + querystring;
								window.location = redirectUrl;							
						}
					}
				}
                if(disposeWindow) {
                	removeMetaTag();
    				dispose();
                }
                else {
                	appendMetaTag();
                }
			}
		}
		
		// Public interface
		return {
			checkoutButton: checkoutButton,
			connectButton: connectButton,
			register: register,
			manage: manage,
			checkout: checkout,
			connect: connect,
			addPaymentMethod: addPaymentMethod,
			addShippingAddress: addShippingAddress,
			cardSecurity: cardSecurity
		};

	})();


}());