
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
 var widget = null;
 var pricescale= getParameterByName('pricescale');
     console.log(pricescale)
TradingView.onready(function () {
    var sym= getParameterByName('symbol');
    var style= getParameterByName('style');
    console.log(sym)
    console.log(style)
    widget = window.tvWidget = new TradingView.widget({
        debug: true, // uncomment this line to see Library errors and warnings in the console
        fullscreen: true,
         style: '2',
        symbol: getParameterByName('symbol'),
       //symbol: 'GOLD',
        interval: '1',
        container_id: "tv_chart_container",
        enable_publishing : false,
        hide_top_toolbar: false,
        hide_legend: false,
        datafeed: datafeed,
        library_path: "charting_library/",
        locale: getParameterByName('lang') || "en",
        preset: "mobile",
        drawings_access: { type: 'black', tools: [{ name: "Regression Trend" }] },
        disabled_features: ["use_localstorage_for_settings","volume_force_overlay"],
        enabled_features: ["study_templates"],
        charts_storage_url: 'http://saveload.tradingview.com',
        charts_storage_api_version: "1.1",
        client_id: 'tradingview.com',
        user_id: 'public_user_id',
        autosize: true,
        overrides: {
                        "mainSeriesProperties.style": 0,
                        "symbolWatermarkProperties.color": "#944",
                        "volumePaneSize": "tiny"

                    },
    });

widget.onChartReady(function () {

    widget.chart().setChartType(2);



            });

});


