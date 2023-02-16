var history = {}
var history = history

var getBars = function (symbolInfo, resolution, from, to, first, onHistoryCallback, onErrorCallback,res) {
	var split_symbol = symbolInfo.name.split(/[:/]/)

    var resp = '[{"SymID":139,"OpenPrice":1326.75,"HighPrice":1326.77,"LowPrice":1326.3,"ClosePrice":1326.67,"Volume":0,"CandleSym":"GOLD","CandleDate":"1000"},{"SymID":139,"OpenPrice":1326.5,"HighPrice":1326.9,"LowPrice":1326.4,"ClosePrice":1326.8,"Volume":0,"CandleSym":"GOLD","CandleDate":"1500"},{"SymID":139,"OpenPrice":1326.9,"HighPrice":1326.95,"LowPrice":1326.6,"ClosePrice":1326.93,"Volume":0,"CandleSym":"GOLD","CandleDate":"3000"},{"SymID":139,"OpenPrice":1326.92,"HighPrice":1326.94,"LowPrice":1326.5,"ClosePrice":1326.81,"Volume":0,"CandleSym":"GOLD","CandleDate":"4500"},{"SymID":139,"OpenPrice":1326.7,"HighPrice":1327.04,"LowPrice":1326.7,"ClosePrice":1326.89,"Volume":0,"CandleSym":"GOLD","CandleDate":"6000"},{"SymID":139,"OpenPrice":1326.82,"HighPrice":1327.03,"LowPrice":1326.7,"ClosePrice":1326.8,"Volume":0,"CandleSym":"GOLD","CandleDate":"7500"},{"SymID":139,"OpenPrice":1326.8,"HighPrice":1327.06,"LowPrice":1326.6,"ClosePrice":1327,"Volume":0,"CandleSym":"GOLD","CandleDate":"9000"},{"SymID":139,"OpenPrice":1326.96,"HighPrice":1327.04,"LowPrice":1326.86,"ClosePrice":1327.04,"Volume":0,"CandleSym":"GOLD","CandleDate":"10500"},{"SymID":139,"OpenPrice":1327.04,"HighPrice":1327.41,"LowPrice":1326.8,"ClosePrice":1327.34,"Volume":0,"CandleSym":"GOLD","CandleDate":"13000"},{"SymID":139,"OpenPrice":1327.27,"HighPrice":1327.4,"LowPrice":1327.09,"ClosePrice":1327.4,"Volume":0,"CandleSym":"GOLD","CandleDate":"14500"}]';


    resp = '[{"SymID":14,"OpenPrice":1.1963,"HighPrice":1.197,"LowPrice":1.1951,"ClosePrice":1.1962,"Volume":0,"CandleSym":"GBP/CHF","CandleDate":1609173000000},{"SymID":14,"OpenPrice":1.1963,"HighPrice":1.1968,"LowPrice":1.1949,"ClosePrice":1.1959,"Volume":0,"CandleSym":"GBP/CHF","CandleDate":1609174800000}]';

    resp = '[{"SymID":14,"OpenPrice":1.1963,"HighPrice":1.197,"LowPrice":1.1951,"ClosePrice":1.1962,"Volume":0,"CandleSym":"GBP/CHF","CandleDate":1609173000},{"SymID":14,"OpenPrice":1.1963,"HighPrice":1.1968,"LowPrice":1.1949,"ClosePrice":1.1959,"Volume":0,"CandleSym":"GBP/CHF","CandleDate":1609174800}]';

    var resp = res;
    var bars = JSON.parse(resp);

    if (first) {
        var lastBar = bars[bars.length - 1]
        history[symbolInfo.name] = { lastBar: lastBar }
    }

    if (bars.length) {
        onHistoryCallback(bars, { noData: false })
    } else {
        onHistoryCallback(bars, { noData: true })
    }
}
