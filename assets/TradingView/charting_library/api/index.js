var supportedResolutions = ["1", "5", "15", "30", "60", "240", "D","W","M"]
var exchange =[]
var chart_style =[{"category":"Chart","value":"LINE"}]
var config = {
supported_resolutions: supportedResolutions,
    exchanges : exchange
};

var refreshT;
var refreshT2;
var liveRefreshT;
var symbolInfoGlobal;

var jsBridge;
var datafeed = {};

var cookieName = 'vertex_currentAccountId'

datafeed.onReady = function (callback) {
    setTimeout(function () {
               callback(config);
               }, 0);
}

datafeed.searchSymbols = function (userInput, exchange, symbolType, onResultReadyCallback) {
    var data = invokeCSharpAction('3', userInput, '')

    fromComapreSym = false;

    onResultReadyCallback(JSON.parse(data))

    setupWebViewJavascriptBridge(function(bridge) {
                                 var uniqueId = 1
                                 
                                 
                                 bridge.callHandler('UserInput', userInput, function(response) {
                                                    console.log(response)
                                                    })
                                 
                                 
                                 bridge.registerHandler('Search_result', function(data, responseCallback) {
                                                        console.log('JS receiving from Android')
                                                        
                                                        
                                                        var search_result = data;
                                                        onResultReadyCallback(search_result)
                                                        var responseData = { 'Javascript Says':'got data!' }
                                                        responseCallback(responseData)
                                                        })
                                 
                                 
                                 })
    
}

datafeed.resolveSymbol = function (symbolName, onSymbolResolvedCallback, onResolveErrorCallback) {
    
    var priceScale = invokeCSharpAction("1", symbolName, "")

    if (parseInt(priceScale) == 0)
        return;

    symbolName2 = symbolName;

        var symbol_stub = {
            name: symbolName,
            description: '',
            session: '24x7',
            ticker: symbolName,
            minmov: 1,
            minmov2: 0,
            pricescale: parseInt(priceScale),
            has_daily: true,
            has_seconds: true,
            has_intraday: true,
            has_weekly_and_monthly: true,
            pointvalue: 1,
            fractional: false,
            has_no_volume: true,
            type: "stock",
        }
        onSymbolResolvedCallback(symbol_stub);
    
    setupWebViewJavascriptBridge(function(bridge) {
        var uniqueId = 1
        jsBridge = bridge
                                 bridge.callHandler('set_pricescale', symbolName, function(response) {
                                                    console.log(response)
                                                    })
                                 
                                 
        bridge.registerHandler('get_pricescale', function (data, responseCallback) {
                                     
                                                        var symbol_stub = {
                                                        name: symbolName,
                                                        description: '',
                                                        session: '24x7',
                                                        ticker: symbolName,
                                                        minmov: 1,
                                                        minmov2:0,
                                                        pricescale: parseInt(data),
                                                        fractional:false,
                                                        has_daily : true,
                                                        has_seconds :true,
                                                        has_intraday :true,
                                                        has_weekly_and_monthly : true,
                                                        pointvalue : 1,
                                                        has_no_volume : true,
                                                        type : "stock",
                                                    }
                                                    onSymbolResolvedCallback(symbol_stub);
                                                })
                                 
                                 })
}


var historyCalled = false;
var isFreshCall = '1';
var fromComapreSym = false;

datafeed.getBars = function (symbolInfo, resolution, from, to, onHistoryCallback, onErrorCallback, firstDataRequest) {
    
    var getBarsData = invokeCSharpAction('2', symbolInfo["name"] + "#*#" + from + "#*#" + to + "#*#" + isFreshCall, resolution);

  

    if (getBarsData == '[]' || getBarsData == '\[\]' || getBarsData.length <= 0)
        onHistoryCallback([], { noData: true })
    else
        getBars(symbolInfo, resolution, from, to, firstDataRequest, onHistoryCallback, onErrorCallback, getBarsData)
   

    setupWebViewJavascriptBridge(function(bridge) {
                                 var uniqueId = 1
                                 symbolInfo["resolution"] = resolution;
                                 
                                 bridge.callHandler('testJavaCallback', {symbolInfo},function(response) {
                                                    console.log(response)
                                                    })
        

                                 
                                 
                                 bridge.registerHandler('testJavascriptHandler', function(data, responseCallback) {

                                                        getBars(symbolInfo, resolution, from, to, firstDataRequest, onHistoryCallback, onErrorCallback,JSON.stringify(data))

                                                        var responseData = { 'Javascript Says':'got data!' }
                                                        
                                                        responseCallback(responseData)
                                                        })
                                 
                                 
                                 })
}



function showAndroidToast(toast) {
    AndroidInterface.showToast(toast);
}

var originalSym;

datafeed.subscribeBars = function (symbolInfo, resolution,onRealtimeCallback, subscribeUID, onResetCacheNeededCallback) {

    if (isFreshCall == '0' & symbolInfo["name"] != originalSym) {
        fromComapreSym = true;
        datafeed.unsubscribeBars(subscribeUID)
    } else
        originalSym = symbolInfo["name"];

    isFreshCall = '0';

    liveRefreshT = setInterval(function () {
        var barData = invokeCSharpAction('4', symbolInfo["name"], resolution);
        onRealtimeCallback(JSON.parse(barData))
    }, 70);

    var ordersData = invokeCSharpAction("6", "", resolution);
    createHL("", JSON.parse(ordersData));

    var refreshTime = 60

    if (resolution == '1')
        refreshTime = 60
    else if (resolution == '5')
        refreshTime = 300;
    else if (resolution == '15')
        refreshTime = 900;
    else if (resolution == '30')
        refreshTime = 1800;
    else if (resolution == '60')
        refreshTime = 3600;
    else if (resolution == '240')
        refreshTime = 14400;
    else if (resolution == '1D')
        refreshTime = 24 * 3600;
    else if (resolution == '1W')
        refreshTime = 7 * 24 * 3600;
    else if (resolution == '1M')
        refreshTime = 30 * 24 * 3600;

    symbolInfo["refreshTime"] = refreshTime;

    symbolInfoGlobal = symbolInfo;

    var today = new Date();
    var time = today;

    if (resolution != '1M') {
        if (time.getSeconds() == 59) {
            refreshT = setInterval(function () {
                var barData = invokeCSharpAction('5', symbolInfo["name"], refreshTime);
                onRealtimeCallback(JSON.parse(barData))
            }, refreshTime * 1000);
        }
        else {

            refreshT2 = setInterval(function () {

                if (resolution == '1') {
                    var barData = invokeCSharpAction('5', symbolInfo["name"], refreshTime);
                    onRealtimeCallback(JSON.parse(barData))
                }
                clearInterval(refreshT2)

                refreshT = setInterval(function () {
                    var barData = invokeCSharpAction('5', symbolInfo["name"], refreshTime);
                    onRealtimeCallback(JSON.parse(barData))
                }, refreshTime * 1000);
            }, (60 - time.getSeconds()) * 1000);
        }
    }

    setupWebViewJavascriptBridge(function(bridge) {
                                 var uniqueId = 1
                                 
                                 bridge.registerHandler('Live_bar', function(data, responseCallback) {
                                                        
                                                        onRealtimeCallback(data)
                                                        var responseData = data
                                                        responseCallback(responseData)
                                                        
                                                        })
                                 
                                 
                                 })
}

datafeed.unsubscribeBars = subscriberUID => {
    

    if (fromComapreSym) {

        unsubscribeBars(subscriberUID)
    }
    else {
        historyCalled = false;
        isFreshCall = '1';
    }
}

datafeed.getMarks = function (symbolInfo, startDate, endDate, onDataCallback, resolution) {
}

datafeed.getTimeScaleMarks = function (symbolInfo, startDate, endDate, onDataCallback, resolution) {
}

datafeed.getServerTime = function cb() {
}