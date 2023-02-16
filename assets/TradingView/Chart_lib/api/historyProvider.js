
var api_root = 'http://173.249.35.43/webtrader/webservice.svc/'
var history = {}

var history = history

// var getBars = function (symbolInfo, resolution, from, to, first, limit) {
// 	var split_symbol = symbolInfo.name.split(/[:/]/)
// 	const url = resolution === 'D' ? '/data/histoday' : resolution >= 60 ? '/data/histohour' : '/data/histominute'
// 	const qs = {
// 		e: split_symbol[0],
// 		fsym: split_symbol[1],
// 		tsym: split_symbol[2],
// 		toTs: to ? to : '',
// 		limit: limit ? limit : 2000,
// 		// aggregate: 1//resolution 
// 	}
// 	// console.log({qs})

// 	return rp({
// 		url: `${api_root}${url}`,
// 		qs,
// 	})
// 		.then(data => {
// 			console.log({ data })
// 			if (data.Response && data.Response === 'Error') {
// 				console.log('CryptoCompare API error:', data.Message)
// 				return []
// 			}
// 			if (data.Data.length) {
// 				console.log(`Actually returned: ${new Date(data.TimeFrom * 1000).toISOString()} - ${new Date(data.TimeTo * 1000).toISOString()}`)
// 				var bars = data.Data.map(el => {
// 					return {
// 						time: el.time * 1000, //TradingView requires bar time in ms
// 						low: el.low,
// 						high: el.high,
// 						open: el.open,
// 						close: el.close,
// 						volume: el.volumefrom
// 					}
// 				})
// 				if (first) {
// 					var lastBar = bars[bars.length - 1]
// 					history[symbolInfo.name] = { lastBar: lastBar }
// 				}
// 				return bars
// 			} else {
// 				return []
// 			}
// 		})
// }

/*var getBars = function (symbolInfo, resolution, from, to, first, onHistoryCallback, onErrorCallback) {
	var split_symbol = symbolInfo.name.split(/[:/]/)
	//var url = resolution === 'D' ? '/data/histoday' : resolution >= 60 ? '/data/histohour' : '/data/histominute'
	var url = "GetChartScrollData"

	var response ="[{"SymID":139,"OpenPrice":1326.75,"HighPrice":1326.77,"LowPrice":1326.3,"ClosePrice":1326.67,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551129000000)/"},{"SymID":139,"OpenPrice":1326.5,"HighPrice":1326.9,"LowPrice":1326.4,"ClosePrice":1326.8,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551129300000)/"},{"SymID":139,"OpenPrice":1326.9,"HighPrice":1326.95,"LowPrice":1326.6,"ClosePrice":1326.93,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551129600000)/"},{"SymID":139,"OpenPrice":1326.92,"HighPrice":1326.94,"LowPrice":1326.5,"ClosePrice":1326.81,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551129900000)/"},{"SymID":139,"OpenPrice":1326.7,"HighPrice":1327.04,"LowPrice":1326.7,"ClosePrice":1326.89,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551130200000)/"},{"SymID":139,"OpenPrice":1326.82,"HighPrice":1327.03,"LowPrice":1326.7,"ClosePrice":1326.8,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551130500000)/"},{"SymID":139,"OpenPrice":1326.8,"HighPrice":1327.06,"LowPrice":1326.6,"ClosePrice":1327,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551130800000)/"},{"SymID":139,"OpenPrice":1326.96,"HighPrice":1327.04,"LowPrice":1326.86,"ClosePrice":1327.04,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551131100000)/"},{"SymID":139,"OpenPrice":1327.04,"HighPrice":1327.41,"LowPrice":1326.8,"ClosePrice":1327.34,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551131400000)/"},{"SymID":139,"OpenPrice":1327.27,"HighPrice":1327.4,"LowPrice":1327.09,"ClosePrice":1327.4,"Volume":0,"CandleSym":"GOLD","CandleDate":"/Date(1551131700000)/"}]";

    var obj = JSON.parse(response);
    var bars = obj.map(el => ( { time: 1 * 1000, //TradingView requires bar time in ms
                                low: el.LowPrice,
                                high: el.HighPrice,
                                open: el.OpenPrice,
                                close: el.ClosePrice,
                                volume: el.Volume }));
	*//*var bars = obj(el => {
    					return {
    						time: 1 * 1000, //TradingView requires bar time in ms
    						low: el.LowPrice,
    						high: el.HighPrice,
    						open: el.OpenPrice,
    						close: el.ClosePrice,
    						volume: el.Volume
    					}
    				})*//*
    				if (first) {
    					var lastBar = bars[bars.length - 1]
    					//history[symbolInfo.name] = { lastBar: lastBar }
    				}
    				//return bars

    				if (bars.length) {
    					onHistoryCallback(bars, { noData: false })
    				} else {
    					onHistoryCallback(bars, { noData: true })
    				}

    			*//*} else {
    				//return []
    				onHistoryCallback(bars, { noData: true })
    			}*//*

}*/
/*$.ajax({
		type: 'GET',
		//url: `${api_root}${url}?e=${split_symbol[0]}&fsym=${split_symbol[1]}&tsym=${split_symbol[2]}&toTs=${to ? to : ''}&limit${limit ? limit : 2000}`,
		url: `${api_root}${url}`,
		contentType: "application/json",
		dataType: 'json',
		data: {
			Symbol: 'EUR/USD',
			PeriodID: '2',
			BeforeDate: '26/02/2019',
			RowsNumber: '2'
			},
		success: function (response) {
		    var res = parseJSONorNot(response);
			console.log(JSON.stringify(response));

			if (response.d.length) {
				//console.log(`Actually returned: ${new Date(response.TimeFrom * 1000).toISOString()} - ${new Date(response.TimeTo * 1000).toISOString()}`)
				var bars = response.d(el => {
					return {
						time: 1 * 1000, //TradingView requires bar time in ms
						low: el.LowPrice,
						high: el.HighPrice,
						open: el.OpenPrice,
						close: el.ClosePrice,
						volume: el.Volume
					}
				})
				if (first) {
					var lastBar = bars[bars.length - 1]
					history[symbolInfo.name] = { lastBar: lastBar }
				}
				//return bars

				if (bars.length) {
					onHistoryCallback(bars, { noData: false })
				} else {
					onHistoryCallback(bars, { noData: true })
				}

			} else {
				//return []
				onHistoryCallback(bars, { noData: true })
			}

			//return response
		},
		error: function (error) {
			console.log(error);
			//return []
			//return error
			onErrorCallback(error)
		}
	})*/

var getBars = function (symbolInfo, resolution, from, to, first, onHistoryCallback, onErrorCallback,res) {
	var split_symbol = symbolInfo.name.split(/[:/]/)
	var url = "GetChartScrollData"

	$.ajax({
		type: 'GET',
		//url: `${api_root}${url}?e=${split_symbol[0]}&fsym=${split_symbol[1]}&tsym=${split_symbol[2]}&toTs=${to ? to : ''}&limit${limit ? limit : 2000}`,
		url: `${api_root}${url}`,
		contentType: "application/json",
		dataType: 'json',
		data: {
			Symbol: 'EUR/USD',
            			PeriodID: '2',
            			BeforeDate: '26/02/2019',
            			RowsNumber: '2'
		},
		success: function (response) {
			/*var resp = '[{"SymID":139,"OpenPrice":1326.75,"HighPrice":1326.77,"LowPrice":1326.3,"ClosePrice":1326.67,"Volume":0,"CandleSym":"GOLD","CandleDate":"1000"},{"SymID":139,"OpenPrice":1326.5,"HighPrice":1326.9,"LowPrice":1326.4,"ClosePrice":1326.8,"Volume":0,"CandleSym":"GOLD","CandleDate":"1500"},{"SymID":139,"OpenPrice":1326.9,"HighPrice":1326.95,"LowPrice":1326.6,"ClosePrice":1326.93,"Volume":0,"CandleSym":"GOLD","CandleDate":"3000"},{"SymID":139,"OpenPrice":1326.92,"HighPrice":1326.94,"LowPrice":1326.5,"ClosePrice":1326.81,"Volume":0,"CandleSym":"GOLD","CandleDate":"4500"},{"SymID":139,"OpenPrice":1326.7,"HighPrice":1327.04,"LowPrice":1326.7,"ClosePrice":1326.89,"Volume":0,"CandleSym":"GOLD","CandleDate":"6000"},{"SymID":139,"OpenPrice":1326.82,"HighPrice":1327.03,"LowPrice":1326.7,"ClosePrice":1326.8,"Volume":0,"CandleSym":"GOLD","CandleDate":"7500"},{"SymID":139,"OpenPrice":1326.8,"HighPrice":1327.06,"LowPrice":1326.6,"ClosePrice":1327,"Volume":0,"CandleSym":"GOLD","CandleDate":"9000"},{"SymID":139,"OpenPrice":1326.96,"HighPrice":1327.04,"LowPrice":1326.86,"ClosePrice":1327.04,"Volume":0,"CandleSym":"GOLD","CandleDate":"10500"},{"SymID":139,"OpenPrice":1327.04,"HighPrice":1327.41,"LowPrice":1326.8,"ClosePrice":1327.34,"Volume":0,"CandleSym":"GOLD","CandleDate":"13000"},{"SymID":139,"OpenPrice":1327.27,"HighPrice":1327.4,"LowPrice":1327.09,"ClosePrice":1327.4,"Volume":0,"CandleSym":"GOLD","CandleDate":"14500"}]';*/

			var resp=res;

 var bars = JSON.parse(resp);
 //var obj = JSON.parse(resp);
			if (bars.length>0) {

				/*var bars = obj.map(el => {
					return {
					     time: el.CandleDate,
						 low: el.LowPrice,
                         high: el.HighPrice,
                         open: el.OpenPrice,
                         close: el.ClosePrice,
                         volume: el.Volume,
					}
				})*/

                        console.log(JSON.stringify(bars));
				if (first) {
					var lastBar = bars[bars.length - 1]
					history[symbolInfo.name] = { lastBar: lastBar }
				}
				//return bars

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

			//return response
		},
		error: function (error) {
			console.log(error);
			//return []
			//return error
			onErrorCallback(error)
		}
	})

}