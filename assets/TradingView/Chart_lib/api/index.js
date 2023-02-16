
var supportedResolutions = ["1", "5", "15", "30", "60", "300", "D","W","M"]
var exchange =[
    {
        "value": "stock",
        "name": "GOLD",
        "desc": "",
       },
       {
               "value": "stock",
               "name": "SILVER",
               "desc": "",
              }
]
var chart_style =[{"category":"Chart","value":"LINE"}]
var config = {
	supported_resolutions: supportedResolutions,
	exchanges : exchange
};

var datafeed = {};
var cookieName = 'vertex_currentAccountId'

var swtyaT;




datafeed.onReady = function (callback) {
	console.log('=====onReady running')
	setTimeout(function () {
		callback(config);
	}, 0);
}

datafeed.searchSymbols = function (userInput, exchange, symbolType, onResultReadyCallback) {

        setupWebViewJavascriptBridge(function(bridge) {
		var uniqueId = 1


		bridge.callHandler('UserInput', userInput, function(response) {
				console.log(response)
			})


bridge.registerHandler('Search_result', function(data, responseCallback) {
			console.log('JS receiving from ANDROID')


            var search_result = JSON.parse(data);
			onResultReadyCallback(search_result)
			var responseData = { 'Javascript Says':'got data!' }
			//log('JS responding with', responseData)
			responseCallback(responseData)
		})


	})


	console.log('====Search Symbols running')
}

datafeed.resolveSymbol = function (symbolName, onSymbolResolvedCallback, onResolveErrorCallback) {
	// expects a symbolInfo object in response
	console.log('======resolveSymbol running')

setupWebViewJavascriptBridge(function(bridge) {
		var uniqueId = 1

		bridge.callHandler('set_pricescale', symbolName, function(response) {
        				console.log(response)
        			})


	bridge.registerHandler('get_pricescale', function(data, responseCallback) {
                    /*var pricescale = data;*/
                    console.log(data)
                    	var symbol_stub = {
                    		name: symbolName,
                    		description: '',
                    		session: '0000-2400',
                    		timezone: 'America/New_York',
                    		ticker: symbolName,
                    		exchange: split_data[0],
                    		minmov: 1,
                    		minmov2:0,
                    		pricescale: parseInt(data),
                    		fractional:false,
                    		has_daily : true,
                            has_seconds :true,
                            has_intraday :true,
                    		has_weekly_and_monthly : true,
                            pointvalue : 1,
                            has_no_volume : false,
                            type : "stock",


                    }
                    onSymbolResolvedCallback(symbol_stub);
})

})
	// console.log('resolveSymbol:',{symbolName})
	var split_data = symbolName.split(/[:/]/)
	// console.log({split_data})



	/*if (split_data[2].match(/USD|EUR|JPY|AUD|GBP|KRW|CNY|GOLD/)) {
		symbol_stub.pricescale = 100
	}*/
	/*setTimeout(function () {
		onSymbolResolvedCallback(symbol_stub)
		console.log('Resolving that symbol....', symbol_stub)
	}, 0)*/


	// onResolveErrorCallback('Not feeling it today')

}

datafeed.getBars = function (symbolInfo, resolution, from, to, onHistoryCallback, onErrorCallback, firstDataRequest) {
	console.log('=====getBars running')

		setupWebViewJavascriptBridge(function (bridge) {
    		bridge.callHandler('getChartHistoryJava', {
    			symbolInfo: symbolInfo,
    			resolution: resolution,
    			from: from,
    			to: to,
    			firstDataRequest: firstDataRequest
    		}, function (response) {
    			console.log(response)
    		})
    		bridge.registerHandler('setChartHistoryJS', function (data, responseCallback) {
    			console.log('JS receiving from ANDROID')
    			console.log("History Bar from java : " + JSON.stringify(data))

    			var resp = data;
    			var bars = JSON.parse(resp);

    			if (bars.length > 0) {
    				console.log(JSON.stringify(bars));
    				if (firstDataRequest) {
    					var lastBar = bars[bars.length - 1]
    					history[symbolInfo.name] = { lastBar: lastBar }
    				}

    				if (bars.length) {
    					console.log('has data');
    					onHistoryCallback(bars, { noData: false })
    				} else {
    					console.log('no data');
    					onHistoryCallback(bars, { noData: true })
    				}

    			} else {
    				//return []
    				onHistoryCallback(bars, { noData: true })
    			}


    			//getStaticBars(symbolInfo, resolution, from, to, firstDataRequest, onHistoryCallback, onErrorCallback, data)
    			var responseData = { 'Javascript Says': 'got data!' }
    			//log('JS responding with', responseData)
    			responseCallback(responseData)
    		})






})

setupWebViewJavascriptBridge(function(bridge) {
    var uniqueId = 1
    alert("swtya Call001")
        symbolInfo["resolution"] = resolution;

		bridge.callHandler('testJavaCallback', {symbolInfo},function(response) {
            console.log(response)
            alert("swtya Call002")
			})


bridge.registerHandler('testJavascriptHandler', function(data, responseCallback) {
			console.log('JS receiving from ANDROID')
			console.log(JSON.stringify(data))
            console.log(from)
            console.log(to)

            var bars = JSON.parse(data);
            // var nt = bars[0]['time']/1000;
            // console.log(nt)
            	if (firstDataRequest) {
            					var lastBar = bars[bars.length - 1]
            					history[symbolInfo.name] = { lastBar: lastBar }
            				}
            				//return bars

            				if (bars.length) {
            				 console.log('has data');
            					onHistoryCallback(bars, { noData: false})
            				} else {
            				 console.log('no data');
            					onHistoryCallback(bars, { noData: true })
            				}


			//getBars(symbolInfo, resolution, from, to, firstDataRequest, onHistoryCallback, onErrorCallback,data)
			var responseData = { 'Javascript Says':'got data!' }
			//log('JS responding with', responseData)
			responseCallback(responseData)
		})


	})


}

function showAndroidToast(toast) {
	AndroidInterface.showToast(toast);
	console.log("Inside android Toast")
}

datafeed.subscribeBars = function (symbolInfo, resolution,onRealtimeCallback, subscribeUID, onResetCacheNeededCallback) {
	console.log('=====subscribeBars runnning')
	  setupWebViewJavascriptBridge(function(bridge) {
    		var uniqueId = 1





    bridge.registerHandler('Live_bar', function(data, responseCallback) {



                var new_bar = JSON.parse(data);
                console.log(JSON.stringify(data))
    			onRealtimeCallback(new_bar)
    			console.log('JS receiving from ANDROID')
    			var responseData = { 'Javascript Says':'got data!' }
    			//log('JS responding with', responseData)
    			responseCallback(responseData)

    		})


    	})
	//subscribeBars(symbolInfo, resolution, onRealtimeCallback, subscribeUID, onResetCacheNeededCallback)

		setupWebViewJavascriptBridge(function (bridge) {
    		bridge.callHandler('subscribeSymbol', {
    			symbolInfo: symbolInfo,
    			resolution: resolution,
    			subscribeUID: subscribeUID,
    		}, function (response) {
    			console.log(response)
    		})
    		bridge.registerHandler('getRealTimeChart', function (data, responseCallback) {
    			console.log('JS receiving from ANDROID')
    			console.log("History Bar from java : " + JSON.stringify(data))
    			var resp = data;
    			var bars = JSON.parse(resp);
    			onRealtimeCallback(bars)
    			var responseData = { 'Javascript Says': 'got data!' }
    			responseCallback(responseData)
    		})
    	})
}

datafeed.unsubscribeBars = subscriberUID => {
	console.log('=====unsubscribeBars running')
	//unsubscribeBars(subscriberUID)
}

datafeed.calculateHistoryDepth = function (resolution, resolutionBack, intervalBack) {
	//optional
	console.log('=====calculateHistoryDepth running')
	console.log(resolution)
	console.log(resolutionBack)
	console.log(intervalBack)
	// while optional, this makes sure we request 24 hours of minute data at a time
	// CryptoCompare's minute data endpoint will throw an error if we request data beyond 7 days in the past, and return no data
	return resolution < 60 ? { resolutionBack: 'D', intervalBack: '1' } : undefined
}

datafeed.getMarks = function (symbolInfo, startDate, endDate, onDataCallback, resolution) {
	//optional
	console.log('=====getMarks running')
}

datafeed.getTimeScaleMarks = function (symbolInfo, startDate, endDate, onDataCallback, resolution) {
	//optional
	console.log('=====getTimeScaleMarks running')
}

datafeed.getServerTime = function cb() {
	console.log('=====getServerTime running')


}

function login(symbolInfo, resolution, from, to, onHistoryCallback, onErrorCallback, firstDataRequest)
	{

	 var data="hello";
           $.get("http://173.249.35.43/webtrader/webservice.svc/Login?username=akram&password=1234", function(response) {
                data = response;
                console.log(JSON.stringify(response));
                setTimeout(function() { getClient(); }, 3000);
           }).error(function(){
          alert("Sorry could not proceed");
        });

           return data;
	/* var geturl;
	var api_root = 'http://173.249.35.43/webtrader/webservice.svc/'
	var url = "Login"
	var url_client = "GetClient"
	var cookie;
$.support.cors = true;
    	 geturl = $.ajax({


    		type: 'GET',
    		//url: `${api_root}${url}?e=${split_symbol[0]}&fsym=${split_symbol[1]}&tsym=${split_symbol[2]}&toTs=${to ? to : ''}&limit${limit ? limit : 2000}`,
    		url: `${api_root}${url}`,



    		data: {
    			username: 'akram',
    			password: '1234'

    			},
    		success: function(response, status, xhr) {
    		    var res = parseJSONorNot(response);
    		    var x = document.cookie;

    		    cookie=xhr.getResponseHeader('Set-Cookie');
    		    console.log(JSON.stringify(res.d));
    			//console.log(JSON.stringify(response));
    			//console.log(xhr.getAllResponseHeaders());
    			setTimeout(function() { getClient(); }, 3000);





}

    	})*/
	}


	function getClient()
	{


	var api_root = 'http://173.249.35.43/webtrader/webservice.svc/'
    	var url = "Login"
    	var url_client = "GetClient"
    	console.log(getAuthCookie());
    	var cookies;
    	                        $.support.cors = true;
	                            $.ajax({

                        		type: 'GET',
                                url: `${api_root}${url_client}`,
                                beforeSend: function(xhr) {
                                xhr.setRequestHeader("Authorization", getAuthCookie());
        },

                        		success: function (response,status, xhr) {
                        		    var res = parseJSONorNot(response);
                        			console.log(JSON.stringify(res.d));
                        			//cookies=xhr.getResponseHeader('Set-Cookie');
                                   // console.log(cookies);
                                   console.log(xhr.getAllResponseHeaders());
                                    //setTimeout(function() { getBars(symbolInfo, resolution, from, to, firstDataRequest, onHistoryCallback, onErrorCallback); }, 5000);

                    }

                        	})
	}

function getAuthCookie() {
   var cn = "Authorization=";
   var idx = document.cookie.indexOf(cn)

   if (idx != -1) {
       var end = document.cookie.indexOf(";", idx + 1);
       if (end == -1) end = document.cookie.length;
       return unescape(document.cookie.substring(idx + cn.length, end));
   } else {
       return "";
  }
}



